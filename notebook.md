### 

https://lean-lang.org/theorem_proving_in_lean4/Dependent-Type-Theory/#what-makes-dependent-type-theory-dependent

### install

```shell
lean --version
elan --version

lake --version
lake env lean --version

elan show

which lean
which lake

lake +stable new lean_src math

--

cd lean_src

rm -rf ~/.cache/mathlib
rm -rf .lake

lake update
lake exe cache get!
lake build
```

### enter symbols

| type    | display |
|---------|:-------:|
| \to     |    →    |
| \r      |    →    |
| \times  |    ×    |
| \forall |    ∀    |
| \exists |    ∃    |
| \and    |    ∧    |
| \or     |    ∨    |
| \not    |    ¬    |
| \le     |    ≤    |
| \ge     |    ≥    |
| \N      |    ℕ    |
| \Z      |    ℤ    |
| \R      |    ℝ    |
| \Q      |    ℚ    |
| \mapsto |    ↦    |
| \ma     |    ↦    |
| \|\r-   |    ↦    |
| \|->    |    ↦    |
| \iff    |    ↔    | 


### 1. Download prebuild libraries `*.olean`. Don't skip!

get missing

```shell
lake exe cache get
```

get and override all required 

```shell
lake exe cache get!
```

### 2.1. Build default (Alex1)

running build without `lake exe cache get` could take hours
and occupies XX Gb

```shell
lake build
```

### 2.2. Build whole library target

```shell
lake build Alex1
```

### 2.3. Build the module `Playground`

```shell
lake build Playground
```

### 2.4. Build the module `Module1`

```shell
lake build Module1
```

### 3. Clean.

```shell
lake clean
```

### 4. Fix build/install issues.

```shell
rm -rf ~/.cache/mathlib
```
