import Foundation

struct UsageMetadata: Codable {
  let promptTokenCount: Int
  let totalTokenCount: Int
  let candidatesTokenCount: Int
}

struct CandidateContentPart: Codable {
  let text: String
}

struct CandidateContent: Codable {
  let parts: [CandidateContentPart]
  let role: String
}

struct Candidate: Codable {
  let content: CandidateContent
  let finishReason: String
  let avgLogprobs: Double
}

struct Response: Codable {
  let usageMetadata: UsageMetadata
  let modelVersion: String
  let candidates: [Candidate]
}
