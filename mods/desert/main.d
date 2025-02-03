module mods.desert.main;

import mods.api;

// In this one I just kind of extend the initial mob so I don't have to define the
// mod in which they came from over and over.
class DesertMob : Mob {
    this() {
        this.modName = "desert";
    }
}

// It must follow your module name.
// So here desert becomes desertMain.
// This is basically symbolizing "void main" for your mod.
void desertMain() {

    // Why would you have a cactus as a mob?

    DesertMob cactus = new DesertMob();
    cactus.name = "cactus";

    Api.registerMob(cactus);

}
