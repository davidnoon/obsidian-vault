# OCR Pipeline — Current State & Recommendations

## Issues Identified (Pre-March 2026)

- Wrong date, or miss identifying some numbers such as the date.
- Doesn't find Litres of fuel!
- Price per litre issue?
- Doesn't capture location / address info. ABN number of petrol station.
- GST amount should be clear.
- Some kind of transaction ID.
- Payment processing info is getting lost.

**Core Problem:** OCR only captures a small subset of what is available on receipts.

---

## Architecture Change (Implemented March 2026)

**New Approach — Three-Layer Storage (Implemented 2026-03-01):**

1. **Image/Document** — The original receipt image is stored and linked to the database record.
2. **Full Text** — All OCR-extracted text is captured and stored separately.
3. **Key Fields** — The AI extracts relevant fields (date, amount, vendor, etc.) and stores them in dedicated columns.

**Why This Matters:**
- Allows for corrections (edit key fields without re-OCRing)
- Enables re-analysis with different models later
- Provides audit trail — always reference back to original image and full text
- Flexibility for future features (search full text, validate against known patterns, etc.)

---

## Recommendations from OpenAgentsControl Review (March 2026)

Based on analysis of OpenAgentsControl patterns, consider these structural adjustments for production:

### 1. Approval Gates for Low-Confidence Extractions
- **Current:** Automated IDP flows often auto-process 95-99% accuracy items
- **Recommendation:** Implement human-in-the-loop gates for fields below ~85% confidence threshold AND all handwritten signatures
- **Why:** Trades throughput for accuracy and auditability — critical for logistics docs where errors have downstream costs

### 2. DocumentScout (Context Pattern Loading)
- **Current:** OCR models likely load full document templates
- **Recommendation:** Identify document type first (delivery note vs bill of lading vs customs form vs fuel receipt), then load only relevant extraction patterns
- **Similar to OAC's MVI principle** — ~80% token reduction, faster processing

### 3. Specialized Sub-Agents
- **Current:** Monolithic OCR pipeline
- **Recommendation:** Delegate to specialists coordinated by an orchestrator:
  - `HeaderExtractionAgent` — vendor name, date, transaction ID, total
  - `LineItemAgent` — individual line items (fuel: litres, price per litre, grade)
  - `SignatureValidatorAgent` — signature presence/confirmation
  - `AddressCaptureAgent` — location, ABN

### 4. Validation Delegation
- Add explicit validation steps:
  - Extracted data → Cross-reference with shipment DB → Flag discrepancies → Human review gate

### 5. Pattern Versioning for Document Formats
- Store carrier/vendor-specific document layouts as versioned patterns
- When a new carrier format appears, add pattern via `/add-context` equivalent rather than retraining full model
- Enables rapid adaptation to new receipt types without model changes

---

## Other Notes

- **Map function:** Turn off for this version — not ready yet.
- **Beta disclaimer:** Add "Demo / Beta" notice on home page indicating this is for testing purposes.
- **Petrol station lookup:** Future consideration — DB table for quick lookup of petrol stations across Australia.

---

## Related
- [[OpenAgentsControl]] — Pattern-based AI coding framework
- [[RAILWAY_DEPLOY]] — Production deployment docs
- [[PHASE_2_PLAN_DRAFT]] — Current development roadmap
