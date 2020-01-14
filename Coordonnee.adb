package body Coordonnee is

   ---------------------------
   -- construireCoordonnees --
   ---------------------------

   function construireCoordonnees(ligne : Integer; colonne : Integer) return Type_Coordonnee is
      coo : Type_Coordonnee;
   begin
      coo.ligne := ligne;
      coo.colonne := colonne;
      return coo;
   end construireCoordonnees;

   ------------------
   -- obtenirLigne --
   ------------------

   function obtenirLigne (c : Type_Coordonnee) return Integer is
   begin
      return c.ligne;
   end obtenirLigne;

   --------------------
   -- obtenirColonne --
   --------------------

   function obtenirColonne (c : Type_Coordonnee) return Integer is
   begin
      return c.colonne;
   end obtenirColonne;

   ------------------
   -- obtenirCarre --
   ------------------

   function obtenirCarre (c : Type_Coordonnee) return Integer is
      numCarre : Integer;
   begin
      if c.ligne <= 3 and c.colonne <= 3 then
         numCarre := 1;
      elsif c.ligne <= 3 and c.colonne >= 4 and c.colonne <= 6 then
         numCarre := 2;
      elsif c.ligne <= 3 and c.colonne >= 7 and c.colonne <= 9 then
         numCarre := 3;
      elsif c.ligne >= 4 and c.ligne <= 6 and c.colonne <= 3 then
         numCarre := 4;
      elsif c.ligne >= 4 and c.ligne <= 6 and c.colonne >= 4 and c.colonne <= 6 then
         numCarre := 5;
      elsif c.ligne >= 4 and c.ligne <= 6 and c.colonne >=7 and c.colonne <= 9 then
         numCarre := 6;
      elsif c.ligne >= 7 and c.ligne <= 9 and c.colonne <= 3 then
         numCarre := 7;
      elsif c.ligne >= 7 and c.ligne <= 9 and c.colonne >= 4 and c.colonne <= 6 then
         numCarre := 8;
      elsif c.ligne >= 7 and c.ligne <= 9 and c.colonne >= 7 and c.colonne <= 9 then
         numCarre := 9;
      end if;
      return numCarre;
   end obtenirCarre;

   ----------------------------
   -- obtenirCoordonneeCarre --
   ----------------------------

   function obtenirCoordonneeCarre(numCarre : Integer) return Type_Coordonnee is
      c : Type_Coordonnee;
   begin
      if numCarre = 1 then
         c.ligne := 1;
         c.colonne := 1;
      elsif numCarre = 2 then
         c.ligne := 1;
         c.colonne := 4;
      elsif numCarre = 3 then
         c.ligne := 1;
         c.colonne := 7;
      elsif numCarre = 4 then
         c.ligne := 4;
         c.colonne := 1;
      elsif numCarre = 5 then
         c.ligne := 4;
         c.colonne := 4;
      elsif numCarre = 6 then
         c.ligne := 4;
         c.colonne := 7;
      elsif numCarre = 7 then
         c.ligne := 7;
         c.colonne := 1;
      elsif numCarre = 8 then
         c.ligne := 7;
         c.colonne := 4;
      elsif numCarre = 9 then
         c.ligne := 7;
         c.colonne := 7;
      end if;
      return c;
   end obtenirCoordonneeCarre;

end Coordonnee;
