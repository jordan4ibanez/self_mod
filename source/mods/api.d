module mods.api;

import std.stdio : writeln;

// Do not modify the autos. :)

//# =-AUTO IMPORT BEGIN-=
import mods.my_cool_mod.init;
//# =-AUTO IMPORT END-=

//# =-AUTO FUNCTION BEGIN-=
void deployMainFunctions() {
    myCoolMod();
}
//# =-AUTO FUNCTION END-=

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

    public void initializeApi() {
        deployMainFunctions();
        // And other functions would get run in here.
        // This is why it looks kind of weird that I'm just wrapping one function
        // with another in this prototype thing.
    }

    public void registerMob(Mob mob) {
        if (mob.name == "undefined") {
            throw new Error("You must name your mob.");
        }

        if (mob.modName == "undefined") {
            throw new Error("You must define the mod in which your mob comes from.");
        }

        if (mob.name in database) {
            throw new Error(
                "Mob name " ~ mob.name ~ " from mod " ~ database[mob.name].modName ~ " with other mod " ~ mob
                    .modName);
        }

        writeln("registered mob: [" ~ mob.name ~ "] from mod [" ~ mob.modName ~ "]");

        database[mob.name] = mob;
    }

}
