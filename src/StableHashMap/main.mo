import StableHashMap "./StableHashMap";
import Text "mo:base/Text";

actor {

    var stableHashMap = StableHashMap.HashMap<Text, Nat>(1, Text.equal, Text.hash);
    stable var stableVars = stableHashMap.initStableVars();


    public func put(name : Text, value : Nat) : async Text {
        stableHashMap.put(name, value);
        return name;
    };

    public query func geet(name : Text) : async ?Nat {
        return stableHashMap.get(name);
    }; 



    system func preupgrade() {
        stableVars := stableHashMap.exportVars();
    };

    system func postupgrade() {
        stableHashMap := StableHashMap.HashMap<Text, Nat>(1, Text.equal, Text.hash);
        stableHashMap.importVars(stableVars);
    };
};
