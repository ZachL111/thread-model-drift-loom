# Review Journal

The repository goal stays the same: create a Haskell reference implementation for drift workflows, centered on protocol validation, framed sample traffic, and bounds and ordering tests. This note explains the added review angle.

The local checks classify each case as `ship`, `watch`, or `hold`. That gives the project a small review vocabulary that matches its ml utilities focus without claiming live deployment or external usage.

## Cases

- `baseline`: `feature drift`, score 207, lane `ship`
- `stress`: `window width`, score 128, lane `watch`
- `edge`: `metric stability`, score 179, lane `ship`
- `recovery`: `explainability`, score 148, lane `ship`
- `stale`: `feature drift`, score 234, lane `ship`

## Note

The useful failure mode here is a wrong decision on a named case, not a vague style disagreement.
