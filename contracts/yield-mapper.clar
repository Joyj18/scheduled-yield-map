;; Scheduled Yield Map
;; A smart contract for decentralized productivity tracking and reward optimization
;; This contract enables users to create, manage, and incentivize personal and community goals,
;; leveraging blockchain transparency and gamification principles.

;; Error Codes
(define-constant ERR-UNAUTHORIZED (err u100))
(define-constant ERR-GOAL-NOT-FOUND (err u101))
(define-constant ERR-INVALID-CADENCE (err u102))
(define-constant ERR-INVALID-COMPLEXITY (err u103))
(define-constant ERR-ALREADY-ACHIEVED-TODAY (err u104))
(define-constant ERR-GOAL-INACTIVE (err u105))
(define-constant ERR-EXPEDITION-NOT-FOUND (err u106))
(define-constant ERR-ALREADY-JOINED-EXPEDITION (err u107))
(define-constant ERR-NOT-EXPEDITION-MEMBER (err u108))
(define-constant ERR-BLUEPRINT-NOT-FOUND (err u109))
(define-constant ERR-INSUFFICIENT-REPUTATION (err u110))
(define-constant ERR-BLUEPRINT-NOT-TRADABLE (err u111))

;; System Constants
(define-constant CONTRACT-ADMIN tx-sender)
(define-constant CADENCE-DAILY u1)
(define-constant CADENCE-WEEKLY u2)
(define-constant CADENCE-MONTHLY u3)
(define-constant CADENCE-CUSTOM u4)

(define-constant COMPLEXITY-BASIC u1)
(define-constant COMPLEXITY-INTERMEDIATE u2)
(define-constant COMPLEXITY-ADVANCED u3)

;; Data Structures

;; Goal data structure
(define-map goals
  { goal-id: uint }
  {
    owner: principal,
    title: (string-ascii 50),
    description: (string-utf8 200),
    cadence: uint,
    custom-interval: (optional uint),
    complexity: uint,
    rewards: uint,
    active: bool,
    created-at: uint,
    blueprint-id: (optional uint)
  }
)

;; User profile data structure
(define-map user-profiles
  { user: principal }
  {
    reputation: uint,
    total-goals-achieved: uint,
    longest-streak: uint,
    current-streak: uint,
    last-active: uint
  }
)

;; Rest of the contract will follow the same pattern as the original, 
;; with renamed variables and functions to match the new context