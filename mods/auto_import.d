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

    string[] importList = [];

    foreach (filename; dirEntries("mods/", SpanMode.shallow)) {
        if (isDir!string(filename)) {
            // writeln("folder: ", filename);

            string target = filename ~ "/init.d";

            if (isFile!string(target)) {
                // Turn it into a module path and chop the [.d] off it.
                string thisImport = target.replace("/", ".");
                thisImport = thisImport[0 .. (thisImport.length) - 2];
                importList ~= thisImport;

                string thisFunctionName = thisImport;

                // Remove the [mods.]
                {
                    char[] temp = to!(char[])(thisFunctionName);
                    temp = temp.remove(0, 1, 2, 3, 4);
                    thisFunctionName = temp.idup;
                }

                // Take care of the periods.
                while (long x = thisFunctionName.indexOf(".")) {
                    if (x <= 0) {
                        break;
                    }
                    char[] temp = to!(char[])(thisFunctionName);
                    temp[x + 1 .. x + 2] = temp[x + 1 .. x + 2].toUpper();
                    temp = temp.remove(x);
                    thisFunctionName = temp.idup;
                }

                // Take care of the underscore.
                while (long x = thisFunctionName.indexOf("_")) {
                    if (x <= 0) {
                        break;
                    }
                    char[] temp = to!(char[])(thisFunctionName);
                    temp[x + 1 .. x + 2] = temp[x + 1 .. x + 2].toUpper();
                    temp = temp.remove(x);
                    thisFunctionName = temp.idup;
                }
                writeln(thisFunctionName);

            }
        }
    }
}
