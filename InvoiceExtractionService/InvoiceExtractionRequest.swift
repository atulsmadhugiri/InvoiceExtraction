import Foundation

struct GenerationConfig {
  let temperature: Double
  let maxOutputTokens: Int
  let topP: Double
  let seed: Int
}

struct SafetySetting {
  let category: String
  let threshold: String
}

struct InlineData {
  let mimeType: String
  let data: String
}

struct TextPrompt {
  let text: String
}

struct Part {
  let inlineData: InlineData?
  let text: String?
}

struct RequestContents {
  let role: String
  let parts: [Part]
}

struct Request {
  let contents: RequestContents
  let generationConfig: GenerationConfig
  let safetySettings: [SafetySetting]
}
