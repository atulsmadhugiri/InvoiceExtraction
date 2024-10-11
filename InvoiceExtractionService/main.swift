import Foundation

guard CommandLine.arguments.count > 1 else {
  print("Usage: \(CommandLine.arguments[0]) <file-path>")
  exit(1)
}

let filePath = CommandLine.arguments[1]

print("File path provided: \(filePath)")

let safetySettings: [SafetySetting] = [
  SafetySetting(
    category: "HARM_CATEGORY_HATE_SPEECH",
    threshold: "OFF"
  ),
  SafetySetting(
    category: "HARM_CATEGORY_DANGEROUS_CONTENT",
    threshold: "OFF"
  ),
  SafetySetting(
    category: "HARM_CATEGORY_SEXUALLY_EXPLICIT",
    threshold: "OFF"
  ),
  SafetySetting(
    category: "HARM_CATEGORY_HARASSMENT",
    threshold: "OFF"
  ),
]

let generationConfig: GenerationConfig = GenerationConfig(
  temperature: 0,
  maxOutputTokens: 8192,
  topP: 0.95,
  seed: 0
)

let fileContents = try! Data(contentsOf: URL(fileURLWithPath: filePath))
let base64String = fileContents.base64EncodedString()

let inlineData: InlineData = InlineData(
  mimeType: "application/pdf", data: base64String)

let partOne: Part = Part(
  inlineData: inlineData,
  text: nil
)

let partTwo: Part = Part(
  inlineData: nil,
  text: "Summarize this PDF."
)

let requestContents: RequestContents = RequestContents(
  role: "user",
  parts: [partOne, partTwo]
)

let request: Request = Request(
  contents: requestContents,
  generationConfig: generationConfig,
  safetySettings: safetySettings
)

let endpoint =
  URL(
    string:
      "https://\(Secrets.API_ENDPOINT)/v1/projects/\(Secrets.PROJECT_ID)/locations/\(Secrets.LOCATION_ID)/publishers/google/models/\(Secrets.MODEL_ID):generateContent"
  )!

func main() async {
  do {
    let response = try await NetworkManager.sendGeminiRequest(
      to: endpoint,
      with: request
    )
    let jsonDecoder = JSONDecoder()
    let generationResponse = try jsonDecoder.decode(
      Response.self,
      from: response
    )
    print(generationResponse.candidates.first!.content.parts.first!.text)
  } catch {
    print("Request to Gemini failed.")
  }
}

Task {
  await main()
  exit(EXIT_SUCCESS)
}

RunLoop.main.run()
