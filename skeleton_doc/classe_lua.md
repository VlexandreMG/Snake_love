# Créer une classe en Lua (façon Java)

Lua n'a pas de mot-clé `class`. On imite une classe avec une **table** et une **métatable**.
Ce document donne un squelette prêt à copier, avec l'équivalent Java de chaque partie.

Le fichier modèle [`maclasse.lua`](maclasse.lua) se trouve dans ce dossier.

---

## 1. Le squelette

```lua
-- ===== public class MaClasse { =====
local MaClasse = {}
MaClasse.__index = MaClasse

-- ===== static int compteur = 0; (attribut statique) =====
MaClasse.compteur = 0

-- ===== private static (fonction/variable privée au fichier) =====
local function helperPrive(x)
    return x * 2
end

-- ===== public MaClasse(int a, String b) { ... } (constructeur) =====
function MaClasse.new(a, b)
    local self = setmetatable({}, MaClasse)   -- équivalent de "new"

    -- attributs (this.a = a;)
    self.a = a
    self.b = b

    MaClasse.compteur = MaClasse.compteur + 1
    return self
end

-- ===== public int getA() { return this.a; } (getter) =====
function MaClasse:getA()
    return self.a
end

-- ===== public void setA(int a) { this.a = a; } (setter) =====
function MaClasse:setA(a)
    self.a = a
end

-- ===== public void afficher() { ... } (méthode) =====
function MaClasse:afficher()
    print("a = " .. self.a .. ", b = " .. self.b)
end

-- ===== public static int getCompteur() (méthode statique, avec un point) =====
function MaClasse.getCompteur()
    return MaClasse.compteur
end

-- ===== } fin de la classe : on l'exporte =====
return MaClasse
```

---

## 2. Utiliser la classe

Dans `main.lua` (ou n'importe quel autre fichier) :

```lua
local MaClasse = require("maclasse")   -- import MaClasse;

local obj = MaClasse.new(5, "salut")   -- MaClasse obj = new MaClasse(5, "salut");
obj:afficher()                         -- obj.afficher();
obj:setA(10)                           -- obj.setA(10);
print(obj:getA())                      -- System.out.println(obj.getA());
print(MaClasse.getCompteur())          -- MaClasse.getCompteur();
```

> Si le fichier est dans un sous-dossier, on remplace les `/` par des points :
> `require("src.entities.snake")` charge `src/entities/snake.lua`.

---

## 3. Correspondance Java → Lua

| Java | Lua |
|---|---|
| `class X { }` | `local X = {}` + `X.__index = X` + `return X` |
| `new X(...)` | `X.new(...)` |
| `this` | `self` |
| méthode d'instance | `function X:methode()`, appelée avec `obj:methode()` |
| méthode `static` | `function X.methode()`, appelée avec `X.methode()` |
| attribut `static` | `X.attribut = valeur` (défini sur la classe) |
| `private` | `local` au niveau du fichier (pas de vrai `private` pour les attributs) |
| `import` | `require("nomfichier")`, sans le `.lua` |
| `null` | `nil` |

---

## 4. Comment ça marche

- **`MaClasse = {}`** : la table qui joue le rôle de la classe et contient les méthodes.
- **`setmetatable({}, MaClasse)`** : crée un objet vide lié à la classe.
- **`MaClasse.__index = MaClasse`** : quand on cherche une méthode absente de l'objet,
  Lua va la chercher dans `MaClasse`. C'est ce qui relie l'objet à sa classe.
- **`MaClasse.new`** : le constructeur. Il crée l'objet, remplit ses attributs et le renvoie.

---

## 5. Le piège : `.` contre `:`

| Écriture | Équivalent |
|---|---|
| `function X:methode()` | `function X.methode(self)` |
| `obj:methode()` | `obj.methode(obj)` |

Le `:` passe automatiquement l'objet dans `self`.

- **`.`** pour le constructeur et les méthodes statiques (il n'y a pas d'objet).
- **`:`** pour toutes les méthodes d'instance.

Écrire `obj.afficher()` avec un point au lieu de `obj:afficher()` fait que `self` vaut `nil`,
ce qui provoque l'erreur *« attempt to index a nil value (local 'self') »*.

---

## 6. À retenir

- **Pas de déclaration des attributs** : on les crée directement dans le constructeur avec `self.x = ...`.
- **Pas de typage** : ni `int` ni `String`, une variable peut contenir n'importe quoi.
- **Un fichier = une classe**, et le fichier se termine par `return NomClasse`.
- **Toujours `local`** pour éviter de créer des variables globales par accident.
