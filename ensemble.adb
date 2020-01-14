pragma Ada_2012;
package body ensemble is

   ------------------------
   -- construireEnsemble --
   ------------------------

   function construireEnsemble return Type_Ensemble is
      ens : Type_Ensemble;
   begin
      ens := (others=>False);
      return ens;
   end construireEnsemble;

   ------------------
   -- ensembleVide --
   ------------------

   function ensembleVide (e : in Type_Ensemble) return Boolean is
   begin
      for i in 1..9 loop
         if e(i) then
            return False;
         end if;
      end loop;
      return True;
   end ensembleVide;

   -----------------------
   -- appartientChiffre --
   -----------------------

   function appartientChiffre
     (e : in Type_Ensemble; v : Integer) return Boolean is
   begin
      if e(v) then
         return True;
      else
         return False;
      end if;
   end appartientChiffre;

   --------------------
   -- nombreChiffres --
   --------------------

   function nombreChiffres(e : in Type_Ensemble) return Integer is
      c : Integer := 0;
   begin
      for i in 1..9 loop
         if e(i) then
            c := c + 1;
         end if;
      end loop;
      return c;
   end nombreChiffres;

   --------------------
   -- ajouterChiffre --
   --------------------

   procedure ajouterChiffre (e : in out Type_Ensemble; v : in Integer) is
   begin
      if e(v) then
         raise APPARTIENT_ENSEMBLE;
      else
         e(v) := True;
      end if;
   end ajouterChiffre;

   --------------------
   -- retirerChiffre --
   --------------------

   procedure retirerChiffre (e : in out Type_Ensemble; v : in Integer) is
   begin
      if not e(v) then
         raise NON_APPARTIENT_ENSEMBLE;
      else
         e(v) := false;
      end if;
   end retirerChiffre;

end ensemble;
