(define-fungible-token sbtc)

(define-data-var contract-owner principal tx-sender)

(define-public (mint (amount uint) (recipient principal))
  (begin
    (asserts! (> amount u0) (err u101))
    (asserts! (is-eq tx-sender (var-get contract-owner)) (err u100))
    (ft-mint? sbtc amount recipient)
  )
)

(define-public (transfer (amount uint) (sender principal) (recipient principal) (memo (optional (buff 34))))
  (begin
    (asserts! (> amount u0) (err u102))
    (ft-transfer? sbtc amount sender recipient)
  )
)
