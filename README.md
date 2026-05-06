# thread-model-drift-loom

`thread-model-drift-loom` is a Haskell project in ml utilities. Its focus is to create a Haskell reference implementation for drift workflows, centered on protocol validation, framed sample traffic, and bounds and ordering tests.

## Why I Keep It Small

The point is to make a small domain rule concrete enough that a reader can change it and immediately see what broke.

## Thread Model Drift Loom Review Notes

Start with `feature drift` and `window width`. Those cases create the widest score spread in this repo, so they are the best quick check when the model changes.

## Included Behavior

- `fixtures/domain_review.csv` adds cases for feature drift and window width.
- `metadata/domain-review.json` records the same cases in structured form.
- `config/review-profile.json` captures the read order and the two review questions.
- `examples/thread-model-drift-walkthrough.md` walks through the case spread.
- The Haskell code includes a review path for `feature drift` and `window width`.
- `docs/field-notes.md` explains the strongest and weakest cases.

## Internal Model

The core code exposes a scoring path and the added review layer uses `signal`, `slack`, `drag`, and `confidence`. The domain terms are `feature drift`, `window width`, `metric stability`, and `explainability`.

The Haskell implementation avoids hidden state so fixture changes are easy to reason about.

## Try It Locally

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

## Validation

That command is also the regression path. It verifies the domain cases and catches mismatches between the CSV, metadata, and code.

## Scope

The fixture set is small enough to audit by hand. The next useful expansion is malformed input coverage, not extra surface area.
