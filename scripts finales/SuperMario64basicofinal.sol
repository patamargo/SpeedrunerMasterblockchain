// SPDX-Licence-identifier: MIT 
pragma solidity ^0.8;
import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
contract Mario64SpeedrunOraclized is ChainlinkClient{
    using Chainlink for Chainlink.Request;
    string public release_date;
    uint256 public platform;
    uint256 public regions;
    address private oracle;
    bytes32 private jobID;
    uint256 private fee;
// only the contract owner should be able to check the userId

   address  owner;
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    /**
     * Network: Kovan
     * Oracle: 0xc57B33452b4F7BB189bB5AfaE9cc4aBa1f7a4FD8 (Chainlink Devrel   
     * Node)
     * Job ID: d5270d1c311941d0b08bead21fea7747
     * Fee: 0.1 LINK
     */
    constructor() {
        setPublicChainlinkToken();
        oracle = 0xc57B33452b4F7BB189bB5AfaE9cc4aBa1f7a4FD8;
        jobID = "d5270d1c311941d0b08bead21fea7747";
        fee = 0.1 * 10 ** 18; // (Varies by network and job)
    }
    
    /**
     * Create a Chainlink request to retrieve API response, find the target
     * data, then multiply by 1000000000000000000 (to remove decimal places from data).
     */
    function requestreleasedate() public returns (bytes32 requestId) 
    {
        Chainlink.Request memory request = buildChainlinkRequest(jobID, address(this), this.fulfill.selector);
        
        
        // Set the URL to perform the GET request on
        request.add("get","https://www.speedrun.com/api/v1/games/o1y9wo6q");
     request.add("path","1996-06-23");
        request.add("path","w89rwelk&nzelreqp&v06dr394&7m6ylw9p");
       
        request.add("path","pr184lqn&e6lxy1dz&o316x197");
        

// Multiply the result by 1000000000000000000 to remove decimals
        int timesAmount = 10**18;
        request.addInt("times", timesAmount);
        
        // Sends the request
        return sendChainlinkRequestTo(oracle, request, fee);
    }
    
    /**
     * Receive the response in the form of uint256
     */ 
    function fulfill(bytes32 _requestId,  string calldata _release_date) public recordChainlinkFulfillment(_requestId)
    {
        release_date = _release_date;
    }
     } 

  