package com.app.demo.integration.google;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Component
public class GoogleGenerativeAiClient {

    private static final String DEFAULT_MODEL = "gemini-2.0-flash";
    private static final String BASE_URL = "https://generativelanguage.googleapis.com/v1beta/models/%s:generateContent?key=%s";

    private final RestTemplate restTemplate;
    private final String model;
    private final String apiKey;

    public GoogleGenerativeAiClient(
            RestTemplateBuilder restTemplateBuilder,
            @Value("${google.ai.api-key:}") String apiKey,
            @Value("${google.ai.model:}") String model) {
        this.restTemplate = restTemplateBuilder.build();
        this.apiKey = apiKey;
        this.model = StringUtils.hasText(model) ? model : DEFAULT_MODEL;
    }

    public String generateText(String prompt) {
        if (!StringUtils.hasText(apiKey)) {
            throw new IllegalStateException(
                    "Google AI API key is not configured. Set google.ai.api-key or GOOGLE_AI_API_KEY.");
        }

        String endpoint = BASE_URL.formatted(model, apiKey);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        GenerateContentRequest requestBody = GenerateContentRequest.fromPrompt(prompt);
        HttpEntity<GenerateContentRequest> requestEntity = new HttpEntity<>(requestBody, headers);

        try {
            ResponseEntity<GenerateContentResponse> response = restTemplate.exchange(
                    endpoint,
                    HttpMethod.POST,
                    requestEntity,
                    GenerateContentResponse.class);

            GenerateContentResponse body = response.getBody();
            if (body == null) {
                throw new IllegalStateException("Empty response from Google Generative AI API");
            }

            return body.firstCandidateText()
                    .orElseThrow(
                            () -> new IllegalStateException("No candidate text returned by Google Generative AI API"));
        } catch (HttpStatusCodeException ex) {
            throw new IllegalStateException("Google Generative AI API error: " + ex.getResponseBodyAsString(), ex);
        } catch (Exception ex) {
            throw new IllegalStateException("Error invoking Google Generative AI API", ex);
        }
    }

    private record GenerateContentRequest(List<Content> contents) {

        static GenerateContentRequest fromPrompt(String prompt) {
            Content content = new Content("user", List.of(new Part(prompt)));
            return new GenerateContentRequest(List.of(content));
        }
    }

    private record Content(String role, List<Part> parts) {
    }

    private record Part(String text) {
    }

    @JsonIgnoreProperties(ignoreUnknown = true)
    private static class GenerateContentResponse {
        private List<Candidate> candidates;

        public Optional<String> firstCandidateText() {
            if (candidates == null) {
                return Optional.empty();
            }
            return candidates.stream()
                    .map(Candidate::firstText)
                    .filter(Optional::isPresent)
                    .map(Optional::get)
                    .findFirst();
        }

        @SuppressWarnings("unused")
        public void setCandidates(List<Candidate> candidates) {
            this.candidates = candidates;
        }
    }

    @JsonIgnoreProperties(ignoreUnknown = true)
    private static class Candidate {
        private CandidateContent content;

        @SuppressWarnings("unused")
        public void setContent(CandidateContent content) {
            this.content = content;
        }

        public Optional<String> firstText() {
            if (content == null) {
                return Optional.empty();
            }
            return content.firstText();
        }
    }

    @JsonIgnoreProperties(ignoreUnknown = true)
    private static class CandidateContent {
        private List<Part> parts;

        @SuppressWarnings("unused")
        public void setParts(List<Part> parts) {
            this.parts = parts;
        }

        public Optional<String> firstText() {
            if (parts == null) {
                return Optional.empty();
            }
            return parts.stream()
                    .map(Part::text)
                    .filter(StringUtils::hasText)
                    .findFirst();
        }
    }

}
