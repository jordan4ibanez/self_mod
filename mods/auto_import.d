module mods.auto_import;

import std.algorithm.mutation;
import std.array;
import std.conv;
import std.file;
import std.stdio;
import std.string;

/*
This file literally just modified the api.d file.
*/

void main() {
    writeln("AUTO IMPORT: Automating imports.");

    // These do not have to be synchronized.
    string[] importList = [];
    string[] mainFunctionList = [];

    foreach (filename; dirEntries("mods/", SpanMode.shallow)) {
        if (isDir!string(filename)) {
            // writeln("folder: ", filename);

            string target = filename ~ "/init.d";

            // If your mod does not have an init file, it gets skipped.

            if (isFile!string(target)) {

                // Turn it into a module path and chop the [.d] off it.
                string thisImport = target.replace("/", ".");
                thisImport = thisImport[0 .. (thisImport.length) - 2];
                importList ~= thisImport;

                // Extract the "main" function for the mod.

                string thisFunctionName = thisImport;

                // Remove the [mods.] and the [.init]

                thisFunctionName = thisFunctionName.replace("mods.", "");
                thisFunctionName = thisFunctionName.replace(".init", "");

                // These could probably use a regex, but, dumb solution first.

                // Take care of the periods and following characters.
                while (long x = thisFunctionName.indexOf(".")) {
                    if (x <= 0) {
                        break;
                    }
                    char[] temp = to!(char[])(thisFunctionName);
                    temp[x + 1 .. x + 2] = temp[x + 1 .. x + 2].toUpper();
                    temp = temp.remove(x);
                    thisFunctionName = temp.idup;
                }

                // Take care of the underscores and following characters.
                while (long x = thisFunctionName.indexOf("_")) {
                    if (x <= 0) {
                        break;
                    }
                    char[] temp = to!(char[])(thisFunctionName);
                    temp[x + 1 .. x + 2] = temp[x + 1 .. x + 2].toUpper();
                    temp = temp.remove(x);
                    thisFunctionName = temp.idup;
                }

                mainFunctionList ~= thisFunctionName;
            }
        }
    }
}
