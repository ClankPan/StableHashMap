import StableHashMap "./StableHashMap";
import Text "mo:base/Text";

actor {

    stable var table : [var StableHashMap.KVs<Text, Nat>] = [var];
    stable var _count : Nat = 0;
    var stableHashMap = StableHashMap.HashMap<Text, Nat>(1, Text.equal, Text.hash, table, _count);


    public func put(name : Text, value : Nat) : async Text {
        stableHashMap.put(name, value);
        return name;
    };

    public query func get(name : Text) : async ?Nat {
        return stableHashMap.get(name);
    }; 



    system func preupgrade() {
    };

    system func postupgrade() {
    };
};
