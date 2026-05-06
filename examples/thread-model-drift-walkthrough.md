# Thread Model Drift Loom Walkthrough

This walk-through keeps the domain vocabulary close to the data instead of burying it in prose.

| Case | Focus | Score | Lane |
| --- | --- | ---: | --- |
| baseline | feature drift | 207 | ship |
| stress | window width | 128 | watch |
| edge | metric stability | 179 | ship |
| recovery | explainability | 148 | ship |
| stale | feature drift | 234 | ship |

Start with `stale` and `stress`. They create the widest contrast in this repository's fixture set, which makes them better review anchors than the middle cases.

`stale` is the optimistic case; use it to make sure the scoring path still rewards strong signal.
