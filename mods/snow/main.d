module mods.snow.main;

import mods.api;
import std.stdio;

void snowMain() {
    Mob snowman = new Mob();

    snowman.modName = "snow";
    snowman.name = "snowman";

    Api.registerMob(snowman);
}
