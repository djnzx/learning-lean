import Mathlib
import Module1

def m : Nat := 1       -- m is a natural number
def n : Nat := 0
def b1 : Bool := true  -- b1 is a Boolean
def b2 : Bool := false

#check m
#check n
#check n+0
#check n+1
#check m * (n + 0)
#check b1 && b2
#check b1 || b2
#check ¬ b1
#check true

#eval 5 * 4
#eval m + 2
#eval b1 && b2

#check Nat
#check Nat → Nat
#check Nat -> Nat
#check Nat × Nat
#check Prod Nat Nat -- haskell

#check Nat → Nat → Nat
#check Nat → (Nat → Nat) -- default order
#check (Nat → Nat) → Nat

#check Nat × Nat → Nat
#check (Nat × Nat) → Nat -- '×' has more priority than '→'
#check Nat × (Nat → Nat)

#check Nat.succ
#check (0, 1)
#check Nat.add
#check Nat.succ 2
#eval Nat.succ 2

#check (5, 9).1 -- tuple access
#check (5, 9).2 -- tuple access
-- #check (5, 9, 11).3 -- only 2

-- function definition
def add1 (x : ℕ) : ℕ := Nat.add x 1

def α : Type := Nat
def β : Type := Bool
def F : Type → Type := List
def G : Type → Type → Type := Prod

#check α
#check F
#check F α
#check F Nat
#check G α
#check G α β
#check G α Nat
#check List α
#check List ℕ

#check Prod α β
#check α × β
#check Prod Nat Nat
#check Nat × Nat

#check Type 0
#check Type 1
#check List -- List.{u} (α : Type u) : Type u
#check Prod -- Prod.{u, v} (α : Type u) (β : Type v) : Type (max u v)

universe u
def F1 (α : Type u) : Type u := Prod α α
#check F1

def F2.{v} (α : Type v) : Type v := Prod α α
#check F2

#check fun (x : Nat) => x + 5
#check λ (x : Nat) => x + 5
#check fun x => x + 5
#check λ x => x + 5

#eval (fun x : Nat => x + 5) 10

#check fun x : Nat => fun y : Bool => if not y then x + 1 else x + 2
#check fun (x : Nat) (y : Bool) => if not y then x + 1 else x + 2
#check fun x y => if not y then x + 1 else x + 2 -- types inferred from impl

-- new object declaration
def f (n : Nat) : String := toString n
def g (s : String) : Bool := s.length > 0

#check fun x : Nat ↦ x
#check fun x : α => x
#check fun x : Nat => true
#check fun x : Nat => g (f x)
#check fun x => g (f x)
#check fun (g : String → Bool) (f : Nat → String) (x : Nat) => g (f x)
#check fun (α β γ : Type) (g : β → γ) (f : α → β) (x : α) ↦ g (f x)

#check (fun x : Nat => x) 1
#check (fun _ : Nat => true) 1

#eval (fun x : Nat => x) 1
#eval (fun _ : Nat => true) 1

#check (fun (α β γ : Type) (u : β → γ) (v : α → β) (x : α) => u (v x)) Nat String Bool g f 0

def greater (x y : Nat) :=
  if x > y then x
  else y

def compose (α β γ : Type) (g : β → γ) (f : α → β) (x : α) : γ :=
  g (f x)
def double (x : Nat) : Nat :=
  x + x
def square (x : Nat) : Nat :=
  x * x

#eval compose Nat Nat Nat double square 3

#check let y := 2 + 2; y * y
#eval  let y := 2 + 2; y * y
def twice_double (x : Nat) : Nat :=
  let y := x + x; y * y

#eval twice_double 2

def foo := let a := Nat; fun x : a => x + 2

def doTwice (α : Type) (h : α → α) (x : α) : α := h (h x)

def doThrice (α : Type) (h : α → α) (x : α) : α := h (h (h x))


variable (α β γ : Type)
def compose1 (g : β → γ) (f : α → β) (x : α) : γ := g (f x)
def doTwice1 (h : α → α) (x : α) : α := h (h x)
def doThrice1 (h : α → α) (x : α) : α := h (h (h x))

variable (α β γ : Type)
variable (g : β → γ) (f : α → β) (h : α → α)
variable (x : α)

def compose2 := g (f x)
def doTwice2 := h (h x)
def doThrice2 := h (h (h x))

#print compose2
#print doTwice2
#print doThrice2

section useful
  variable (α β γ : Type)
  variable (g : β → γ) (f : α → β) (h : α → α)
  variable (x : α)

  -- name override doesn't work
  def compose3 := g (f x)
  def doTwice3 := h (h x)
  def doThrice3 := h (h (h x))
end useful

namespace Foo
  def a : Nat := 5
  def f1 (x : Nat) : Nat := x + 7

  def fa : Nat := f1 a
  def ffa : Nat := f1 (f1 a)

  #check a
  #check f1
  #check fa
  #check ffa
  #check Foo.fa
end Foo

-- #check a  -- error
-- #check f  -- error
#check Foo.a
#check Foo.f1
#check Foo.fa
#check Foo.ffa

open Foo -- open scope

#check a
#check f1
#check fa
#check Foo.fa

#check List.nil
#check List.cons

def cons (α : Type) (a : α) (as : List α) : List α :=
  List.cons a as

#check cons Nat
#check cons Bool
#check cons

#check List.cons
#check @List.cons

#check @List.nil
#check @List.length
#check @List.append

-- https://lean-lang.org/theorem_proving_in_lean4/Dependent-Type-Theory/#what-makes-dependent-type-theory-dependent
universe u3 v3

def f3 (α : Type u3) (β : α → Type v3) (a : α) (b : β a) : (a : α) × β a :=
  ⟨a, b⟩

def g3 (α : Type u3) (β : α → Type v3) (a : α) (b : β a) : Σ a : α, β a :=
  Sigma.mk a b

def h3 (x : Nat) : Nat := (f3 Type (fun α => α) Nat x).2

#eval h3 5

def h31 (x : Nat) : Nat := (g3 Type (fun α => α) Nat x).2

#eval h31 5

variable (a b : Prop)

-- De Morgan’s
--                   ¬ (a ∨ b) ↔ ¬ a ∧ ¬ b
theorem not_or_iff : ¬ (a ∨ b) ↔ ¬ a ∧ ¬ b := by
  constructor               -- splits the proof into two smaller proofs
  · intro h                 -- Suppose I have proof h that a ∨ b is impossible.
    constructor
    · intro ha
      exact h (Or.inl ha)
    · intro hb
      exact h (Or.inr hb)
  · intro h hab
    cases hab with
    | inl ha => exact h.left ha
    | inr hb => exact h.right hb

variable (a b : Prop)

theorem not_or_iff1 : ¬ (a ∨ b) ↔ ¬ a ∧ ¬ b := by simp

-- Bayes' Theorem and friends from Mathlib.
-- Ctrl/Cmd-click a name below to jump to its definition/source.
open ProbabilityTheory

#check @ProbabilityTheory.cond_eq_inv_mul_cond_mul  -- Bayes' Theorem: μ[t | s] = (μ s)⁻¹ * μ[s | t] * μ t
#check @ProbabilityTheory.cond_add_cond_compl_eq    -- law of total probability
#check @ProbabilityTheory.cond_mul_eq_inter         -- μ[t | s] * μ s = μ (s ∩ t)
#check @ProbabilityTheory.cond                       -- the conditional-probability operator  μ[· | ·]
