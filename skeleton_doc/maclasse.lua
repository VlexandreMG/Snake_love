-- Modèle de classe Lua : copie ce fichier et renomme "MaClasse"

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
