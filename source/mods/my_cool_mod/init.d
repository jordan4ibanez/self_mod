module mods.my_cool_mod.init;

import std.stdio;

import mods.api;

// It must follow your module name.
// So here my_cool_mod becomes myCoolMod.
// This is basically symbolizing "void main" for your mod.
void myCoolMod() {

    Mob flarpMonster = new Mob();

    flarpMonster.name = "flarp monster";
    flarpMonster.modName = "my_cool_mod";

    Api.registerMob(flarpMonster);
}
