1

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    mapping(address => bool) public members;

    function addMember(address _address) external{
        members[_address] = true;
    }
    
}

2

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    mapping(address => bool) public members;

    function addMember(address _address) external{
        members[_address] = true;
    }

    function isMember(address _address) external returns (bool){
        return members[_address];
    }
    
}

3

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    mapping(address => bool) public members;

    function addMember(address _address) external{
        members[_address] = true;
    }

    function isMember(address _address) external returns (bool){
        return members[_address];
    }
    
    function removeMember(address _address) external {
        members[_address] = false;
    }
}

4

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
	struct User {
		uint balance;
		bool isActive;
	}

	mapping(address => User) public users;

	function createUser() external {
		if(users[msg.sender].isActive == true){
			revert();
		}
		users[msg.sender] = User(100, true);
	}

}

5

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
	struct User {
		uint balance;
		bool isActive;
	}

	mapping(address => User) public users;

	function createUser() external {
		
		if(users[msg.sender].isActive == true){
			revert();
		}

		users[msg.sender] = User(100, true);
	}

	function transfer(address _address, uint _amount) external{
		
		if(users[msg.sender].isActive == false || users[_address].isActive == false){
			revert();
		}
		
		uint afterBalnce = users[msg.sender].balance - _amount;

		if(afterBalnce < 0){
			revert();
		}

		users[msg.sender].balance -= _amount;
		users[_address].balance += _amount;
	}

}

6


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
	enum ConnectionTypes { 
		Unacquainted,
		Friend,
		Family
	}
	
	// TODO: create a public nested mapping `connections` 
	mapping (address => mapping (address => ConnectionTypes)) public connections;
	
	function connectWith(address other, ConnectionTypes connectionType) external {
        // TODO: make the connection from msg.sender => other => connectionType
		connections[msg.sender][other] = connectionType;
		
	}
}
