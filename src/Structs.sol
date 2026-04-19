1

// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
	enum Choices { Yes, No }

	Vote public vote;

	// TODO: create a vote struct and a public state variable
	struct Vote
	{
		Choices choice;
		address voter;
	}
	function createVote(Choices choice) external {
		// TODO: create a new vote
		vote = Vote(choice, msg.sender);
	}
}

2

// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
	enum Choices { Yes, No }

	struct Vote {
		Choices choice;
		address voter;
	}

	Vote public vote;
	
	// TODO: make a new createVote function
	function createVote (Choices choice) external returns(Vote memory){
		vote = Vote(choice, msg.sender);

		return vote;
	}
}

3

// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
	enum Choices { Yes, No }
	
	struct Vote {
		Choices choice;
		address voter;
	}
	
	// TODO: create a public state variable: an array of votes
	Vote[] public votes;
	
	function createVote(Choices choice) external {
		// TODO: add a new vote to the array of votes state variable
		votes.push(Vote(choice, msg.sender));
	}
}


4

// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
	enum Choices { Yes, No }
	
	struct Vote {
		Choices choice;
		address voter;
	}
	
	// TODO: create a public state variable: an array of votes
	Vote[] public votes;
	
	function createVote(Choices choice) external {
		// TODO: add a new vote to the array of votes state variable
		votes.push(Vote(choice, msg.sender));
	}

	function hasVoted(address _address) external returns (bool){
		for (uint256 i = 0 ; i < votes.length; i ++){
			if(votes[i].voter == _address){
				return true;
			}
		}
		return false;
	}

	function findChoice(address _address) external returns (Choices) {
		for (uint256 i = 0 ;  i < votes.length; i ++){
			if(votes[i].voter == _address){
				return votes[i].choice;
			}
		}
	}
}

5

// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
	enum Choices { Yes, No }
	
	struct Vote {
		Choices choice;
		address voter;
	}
	
	// TODO: create a public state variable: an array of votes
	Vote[] public votes;
	
	function createVote(Choices choice) external {
		// TODO: add a new vote to the array of votes state variable
		bool isDone = false;

		isDone = hasVoted(msg.sender);

		if(isDone == true){
			revert();
		}
		else
		{
			votes.push(Vote(choice, msg.sender));
		}
		
	}

	function hasVoted(address _address) public returns (bool){
		for (uint256 i = 0 ; i < votes.length; i ++){
			if(votes[i].voter == _address){
				return true;
			}
		}
		return false;
	}

	function findChoice(address _address) external returns (Choices) {
		for (uint256 i = 0 ;  i < votes.length; i ++){
			if(votes[i].voter == _address){
				return votes[i].choice;
			}
		}
	}
}

6

// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
	enum Choices { Yes, No }
	
	struct Vote {
		Choices choice;
		address voter;
	}
	
	// TODO: create a public state variable: an array of votes
	Vote[] public votes;
	
	function createVote(Choices choice) external {
		// TODO: add a new vote to the array of votes state variable
		bool isDone = false;

		isDone = hasVoted(msg.sender);

		if(isDone == true){
			revert();
		}
		else
		{
			votes.push(Vote(choice, msg.sender));
		}
		
	}

	function hasVoted(address _address) public returns (bool){
		for (uint256 i = 0 ; i < votes.length; i ++){
			if(votes[i].voter == _address){
				return true;
			}
		}
		return false;
	}

	function findChoice(address _address) external returns (Choices) {
		for (uint256 i = 0 ;  i < votes.length; i ++){
			if(votes[i].voter == _address){
				return votes[i].choice;
			}
		}
	}

	function changeVote(Choices choice) external {
		bool isDone = hasVoted(msg.sender);

		if(isDone == false){
			revert();
		}
		else
		{
			for (uint256 i = 0 ;  i < votes.length; i ++){
			if(votes[i].voter == msg.sender){
				votes[i].choice = choice;
			}
		}
		}
	}
}