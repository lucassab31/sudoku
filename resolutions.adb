package body resolutions is

   -----------------------
   -- estChiffreValable --
   -----------------------

   function estChiffreValable (g : in Type_Grille; v : Integer; c : Type_Coordonnee) return Boolean is
   begin
      if not caseVide(g, c) then
         raise CASE_NON_VIDE;
      end if;
      if not appartientChiffre(obtenirChiffresDUneLigne(g, obtenirLigne(c)), v) then
         if not appartientChiffre(obtenirChiffresDUneColonne(g, obtenirColonne(c)), v) then
            if not appartientChiffre(obtenirChiffresDUnCarre(g, obtenirCarre(c)), v) then
               return true;
            end if;
         end if;
      end if;
      return False;
   end estChiffreValable;

   -------------------------------
   -- obtenirSolutionsPossibles --
   -------------------------------

   function obtenirSolutionsPossibles (g : in Type_Grille; c : in Type_Coordonnee) return Type_Ensemble is
      solus : Type_Ensemble;
   begin
      if not caseVide(g, c) then
         raise CASE_NON_VIDE;
      end if;

      solus := construireEnsemble;
      for i in 1..9 loop
         if estChiffreValable(g, i, c) then
            if not appartientChiffre(solus, i) then
               ajouterChiffre(solus,i);
            end if;
         end if;
      end loop;
      return solus;
   end obtenirSolutionsPossibles;

   ------------------------------------------
   -- rechercherSolutionUniqueDansEnsemble --
   ------------------------------------------

   function rechercherSolutionUniqueDansEnsemble
     (resultats : in Type_Ensemble) return Integer
   is
   begin
      if nombreChiffres(resultats) > 1 then
         raise PLUS_DE_UN_CHIFFRE;
      elsif nombreChiffres(resultats) < 1 then
         raise ENSEMBLE_VIDE;
      end if;

      for i in 1..9 loop
         if appartientChiffre(resultats, i) then
            return i;
         end if;
      end loop;
      return 0;
   end rechercherSolutionUniqueDansEnsemble;

   --------------------
   -- resoudreSudoku --
   --------------------

   procedure resoudreSudoku (g : in out Type_Grille; trouve : out Boolean) is
      c : Type_Coordonnee;
      ens : Type_Ensemble;
   begin
      ens := construireEnsemble;
      trouve := False;
--        c := construireCoordonnees(1, 3);
--        if caseVide(g, c) then
--           ens := obtenirSolutionsPossibles(g, c);
--
--           if nombreChiffres(ens)=1 then
--              fixerChiffre(g, c, rechercherSolutionUniqueDansEnsemble(ens));
--              afficherGrille(g);
--           end if;
--        end if;
      while not trouve loop
         for i in 1..9 loop
            for j in 1..9 loop
               c := construireCoordonnees(i, j);
               if caseVide(g, c) then
                  ens := obtenirSolutionsPossibles(g, c);
                  if nombreChiffres(ens)=1 then
                     fixerChiffre(g, c, rechercherSolutionUniqueDansEnsemble(ens));
                  end if;
               end if;
            end loop;
         end loop;
         trouve := estRemplie(g);
      end loop;
      afficherGrille(g);
   end resoudreSudoku;

end resolutions;
