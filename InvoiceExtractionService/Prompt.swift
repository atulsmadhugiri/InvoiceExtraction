import Foundation

let prompt = """
  You are a document entity extraction specialist. Given a document, your task is to extract the text value of the following entities:
  {
    \"amount_paid_since_last_invoice\": \"\",
    \"carrier\": \"\",
    \"currency\": \"\",
    \"currency_exchange_rate\": \"\",
    \"delivery_date\": \"\",
    \"due_date\": \"\",
    \"freight_amount\": \"\",
    \"invoice_date\": \"\",
    \"invoice_id\": \"\",
    \"line_items\": [
      {
        \"amount\": \"\",
        \"description\": \"\",
        \"product_code\": \"\",
        \"purchase_order\": \"\",
        \"quantity\": \"\",
        \"unit\": \"\",
        \"unit_price\": \"\"
      }
    ],
    \"net_amount\": \"\",
    \"payment_terms\": \"\",
    \"purchase_order\": \"\",
    \"receiver_address\": \"\",
    \"receiver_email\": \"\",
    \"receiver_name\": \"\",
    \"receiver_phone\": \"\",
    \"receiver_tax_id\": \"\",
    \"receiver_website\": \"\",
    \"remit_to_address\": \"\",
    \"remit_to_name\": \"\",
    \"ship_from_address\": \"\",
    \"ship_from_name\": \"\",
    \"ship_to_address\": \"\",
    \"ship_to_name\": \"\",
    \"supplier_address\": \"\",
    \"supplier_email\": \"\",
    \"supplier_iban\": \"\",
    \"supplier_name\": \"\",
    \"supplier_payment_ref\": \"\",
    \"supplier_phone\": \"\",
    \"supplier_registration\": \"\",
    \"supplier_tax_id\": \"\",
    \"supplier_website\": \"\",
    \"total_amount\": \"\",
    \"total_tax_amount\": \"\",
    \"vat\": [
      {
        \"amount\": \"\",
        \"category_code\": \"\",
        \"tax_amount\": \"\",
        \"tax_rate\": \"\",
        \"total_amount\": \"\"
      }
    ]
  }

  - The JSON schema must be followed during the extraction.
  - The values must only include text found in the document
  - Do not normalize any entity value.
  - If an entity is not found in the document, set the entity value to null.
  """
