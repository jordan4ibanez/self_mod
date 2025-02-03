module mods.api;

// Do not modify this part :)
//# BEGIN
//# END

class Mob {
    string modName = "undefined";
    string name = "undefined";
    int hp = 0;
}

static final const class Api {
static:
private:

    // In this sample, we would be creating mobs for this imaginary game.

    Mob[string] database;

    public void registerMob(Mob mob) {
        if (mob.name == "undefined") {
            throw new Error("You must name your mob.");
        }

        if (mob.modName == "undefined") {
            throw new Error("You must define the mod in which your mob comes from.");
        }

        if (mob.name in database) {
            throw new Error(
                "Mob name " ~ conflicts ~ " from mod " ~ database[mob.name].modName ~ " with other mod " ~ mob
                    .modName);
        }

        database[mob.name] = mob;
    }

}
