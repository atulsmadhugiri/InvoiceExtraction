import Foundation

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

let textPrompt: Part = Part(
  inlineData: nil,
  text: "Give me the sum of 5 and 10."
)

let requestContents: RequestContents = RequestContents(
  role: "user",
  parts: [textPrompt]
)

let request: Request = Request(
  contents: requestContents,
  generationConfig: generationConfig,
  safetySettings: safetySettings
)
