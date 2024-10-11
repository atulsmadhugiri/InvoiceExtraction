import Foundation

struct GenerationConfig: Codable {
  let temperature: Double
  let maxOutputTokens: Int
  let topP: Double
  let seed: Int
}

struct SafetySetting: Codable {
  let category: String
  let threshold: String
}

struct InlineData: Codable {
  let mimeType: String
  let data: String
}

struct TextPrompt: Codable {
  let text: String
}

struct Part: Codable {
  let inlineData: InlineData?
  let text: String?
}

struct RequestContents: Codable {
  let role: String
  let parts: [Part]
}

struct Request: Codable {
  let contents: RequestContents
  let generationConfig: GenerationConfig
  let safetySettings: [SafetySetting]
}
