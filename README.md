# Zond

Clarity smart contract project for issuing time-locked bonds backed by a local sBTC-style fungible token.

## Contracts

- `contracts/Zond.clar`
  - Stores bonds in the `bonds` map keyed by a nonce (`bond-id-nonce`).
  - `issue-bond(amount, lock-period)` validates inputs, transfers sBTC from the caller to the contract, records maturity (`burn-block-height + lock-period`), and returns a new bond ID.
  - `redeem(id)` requires the bond owner, checks maturity and redemption status, pays `amount + yield` from the contract, and marks the bond as redeemed.
  - Yield is fixed at `yield-bps = 500` (5%), with caps `max-amount = 1_000_000_000_000` and `max-lock-period = 52_500` blocks.

- `contracts/sbtc-token.clar`
  - Minimal fungible token (`sbtc`) with SIP-010-style `transfer`.
  - `mint` is restricted to the contract owner.
  - Basic non-zero amount checks on `mint` and `transfer`.

## Development

- Clarinet config is in `clarinet.toml` and includes both contracts.
- Run a local syntax check with:

```bash
clarinet check
```

## Tests

- `tests/Zond.test.ts` contains the default Clarinet JS test scaffold.
