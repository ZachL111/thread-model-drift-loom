# Field Notes

I would read this project from the data inward: cases first, implementation second.

The domain cases cover `feature drift`, `window width`, `metric stability`, and `explainability`. They sit beside the smaller starter fixture so the project has both a compact scoring check and a domain-flavored review check.

The widest spread is between `feature drift` and `window width`, so those are the first two cases I would preserve during a refactor.

The extra check gives the repository a behavior path that can fail for a domain reason, not only a syntax reason.
