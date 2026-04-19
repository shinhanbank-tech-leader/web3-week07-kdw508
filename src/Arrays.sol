1

// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
    function sum(uint256[5] memory arr) external returns (uint256) {
        uint tot = 0;

        for (uint i = 0; i < 5; i++) {
            tot += arr[i];
        }

        return tot;
    }
}

2

// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
    
    function sum(uint256[] calldata  arr) external returns (uint256) {
        uint tot = 0;

        for (uint i = 0; i < arr.length; i++) {
            tot += arr[i];
        }

        return tot;
    }
}

3


// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {

    uint256[] public evenNumbers;

    function filterEven(uint256[] calldata  arr) external returns (uint256) {

        for (uint i = 0; i < arr.length; i++) {
            if(arr[i] % 2 == 0)
            {
                evenNumbers.push(arr[i]);
            }
        }

    }

}


4


// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
    function filterEven(uint[] calldata arr) 
        external 
        pure 
        returns(uint[] memory) 
    {
        
		uint elements;
		for(uint i = 0; i < arr.length; i++) {
			if(arr[i] % 2 == 0 ) {
                elements++;
            }
		}


		uint[] memory filtered = new uint[](elements);

		uint filledIndex = 0;

		for(uint i = 0; i < arr.length; i++) {
			if(arr[i] % 2 == 0 ) {
                filtered[filledIndex] = arr[i];
				filledIndex++;
            }
		}
		return filtered;
	}
}

5


// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract StackClub {

	address[] public Members;
    function addMember(address member) 
        external  
    {
		Members.push(member);
	}

    function isMember(address member) 
        external 
        returns (bool)
    {
		for (uint i = 0; i < Members.length; i++) {
            if(Members[i]  == member)
            {
                return true;
            }
        }

        return false;
	}
}

6

// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract StackClub {
    address public owner;

    constructor() {
        owner = msg.sender; 
    }
    
	address[] public Members;
    function addMember(address member) 
        external  
    {
        if(msg.sender == owner)
        {
            Members.push(member);
        }
        else
        {
            revert();
        }
		
	}

    function isMember(address member) 
        external 
        returns (bool)
    {
		for (uint i = 0; i < Members.length; i++) {
            if(Members[i]  == member)
            {
                return true;
            }
        }

        return false;
	}

    function removeLastMember() 
        external 
    {
        if(msg.sender == owner)
        {
            Members.pop();
        }
        else
        {
            revert();
        }
		
	}
}