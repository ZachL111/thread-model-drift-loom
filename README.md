# thread-model-drift-loom

`thread-model-drift-loom` is a Haskell project for ML utilities. It turns create a Haskell reference implementation for drift workflows, centered on protocol validation, framed sample traffic, and bounds and ordering tests into a small local model with readable fixtures and a direct verification command.

## Reading Thread Model Drift Loom

Start with the README, then open `metadata/project.json` to check the constants behind the examples. After that, `fixtures/cases.csv` shows the compact path and `examples/extended_cases.csv` gives a wider look at the same rule.

## Purpose

The goal is to capture the core behavior in code and make the surrounding assumptions obvious. A reader should be able to run the verifier, open the fixtures, and understand why each decision was made.

## What It Does

- Models feature signals with deterministic scoring and explicit review decisions.
- Uses fixture data to keep metric checks changes visible in code review.
- Includes extended examples for windowed behavior, including `surge` and `degraded`.
- Documents explainable outputs tradeoffs in `docs/operations.md`.
- Runs locally with a single verification command and no external credentials.

## Design Sketch

The core is a scoring model over demand, capacity, latency, risk, and weight. That keeps feature signals, metric checks, and windowed behavior in one explicit decision path. The threshold is 183, with risk penalty 6, latency penalty 2, and weight bonus 5. The Haskell code keeps the pure scoring function isolated so tests can check it without setup.

## Files Worth Reading

- `src`: primary implementation
- `tests`: verification harness
- `fixtures`: compact golden scenarios
- `examples`: expanded scenario set
- `metadata`: project constants and verification metadata
- `docs`: operations and extension notes
- `scripts`: local verification and audit commands

## Setup

The only required setup is the local Haskell toolchain. After cloning, stay in the repo root so fixture paths resolve correctly.

## Usage

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

This runs the language-level build or test path against the compact fixture set.

## Verification

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/audit.ps1
```

The audit command checks repository structure and README constraints before it delegates to the verifier.

## Fixture Notes

The extended cases are not random smoke tests. `degraded` keeps pressure on the review path, while `surge` shows the model when capacity and weight are strong enough to clear the threshold.

## Limits

The fixture set is deliberately small. That keeps the review surface clear, but it also means the model should not be treated as a complete domain simulator.

## Next Directions

- Split the scoring constants into a typed configuration object and validate it before use.
- Add a comparison mode that shows how decisions change when one signal is adjusted.
- Add a loader for `examples/extended_cases.csv` and promote selected cases into the language test suite.
- Add one more ml utilities fixture that focuses on a malformed or borderline input.
