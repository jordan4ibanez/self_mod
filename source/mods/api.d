module mods.api;

// Do not modify the autos. :)

//# =-AUTO IMPORT BEGIN-=
import mods.my_cool_mod.init;
//# =-AUTO IMPORT END-=

//# =-AUTO FUNCTION BEGIN-=
void deployMainFunctions() {
    myCoolMod();
}
//# =-AUTO FUNCTION END-=

void initializeApi() {
    deployMainFunctions();
    // And other functions would get run in here.
    // This is why it looks kind of weird that I'm just wrapping one function
    // with another in this prototype thing.
}
