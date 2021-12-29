import StableHashMap "./StableHashMap";
import Text "mo:base/Text";

actor {

    stable var table : [var StableHashMap.KVs<Text, Nat>] = [var];
    stable var _count : Nat = 0;
    var stableHashMap = StableHashMap.HashMap<Text, Nat>(1, Text.equal, Text.hash);


    public func put(name : Text, value : Nat) : async Text {
        stableHashMap.put(name, value);
        return name;
    };

    public query func get(name : Text) : async ?Nat {
        return stableHashMap.get(name);
    }; 



    system func preupgrade() {
        table := stableHashMap.table;
        _count := stableHashMap._count;
    };

    system func postupgrade() {
        stableHashMap := StableHashMap.HashMap<Text, Nat>(1, Text.equal, Text.hash);
        stableHashMap.table := table;
        stableHashMap._count := _count;
    };
};
