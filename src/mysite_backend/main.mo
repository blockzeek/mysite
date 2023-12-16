import Iter "mo:base/Iter";

actor {
  // 作业1：实现快排函数（顺序从小到大）quicksort : [var Int] -> ()
  func quicksort(arr : [var Int]) : () {
    func partition(low : Nat, high : Nat) : Nat {
      let pivot = arr[high];
      var i : Nat = low;

      for (j in Iter.range(low, high)) {
        if (arr[j] < pivot) {
          if (i != j) {
            let temp = arr[i];
            arr[i] := arr[j];
            arr[j] := temp;
          };
          i += 1;
        };
      };

      if (i != high) {
        let temp = arr[i];
        arr[i] := arr[high];
        arr[high] := temp;
      };

      return i;
    };

    func quicksortHelper(low : Nat, high : Nat) : () {
      if (low < high) {
        let pi = partition(low, high);
        if (pi > 0) {
          quicksortHelper(low, pi - 1);
        };
        quicksortHelper(pi + 1, high);
      };
    };

    quicksortHelper(0, arr.size() - 1);
  };

  public query func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };
};
