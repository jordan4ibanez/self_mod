module mods.sky_mod.main;

import mods.api;

void skyModMain() {
    Mob bird = new Mob();

    bird.name = "bird";
    bird.modName = "sky_mod";

    Api.registerMob(bird);
}
