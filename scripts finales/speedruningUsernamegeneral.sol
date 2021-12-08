//SPDX licence-identifier:MIT
pragma solidity ^0.8;
import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
// Chainlink example inherits from ChainlinkClient
contract ChainlinkSuperMario64speedrunner is ChainlinkClient {
  using Chainlink for Chainlink.Request;   
 // define state variables store on the block chainlink
 uint256 public UserID;
 string public name;
   uint256 public datesign;
  address public Oracle;
 bytes32 public jobId;
 uint256 public fee; 
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
        Oracle = 0xc57B33452b4F7BB189bB5AfaE9cc4aBa1f7a4FD8;
        jobId = "d5270d1c311941d0b08bead21fea7747";
        fee = 0.1 * 10 ** 18; // (Varies by network and job)
    }
    
   
    //function below creates a Chainlink API request to get a price
    //only the owner of the contract can call this function
    function requestUserIDdata() public onlyOwner returns (bytes32 requestId)
    {
        //create a variable and store it temporarily in memory
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        //set the url to perform the GET request
        request.add("get", "https://www.speedrun.com/api/v1/users?name=ab");
        //set the path to find the required data in the api response
         request.add("path", "data.0.j42v61vx");
         request.add("path", "data.0.___Abe___");
         request.add ("path", "data.0.""2021-01-05T23:07:15Z");
        //multiply the results by 100 to remove decimals
        request.addInt("times", 100);
        //send the request
        return sendChainlinkRequestTo(Oracle, request, fee);
    }
    
    function fulfill(bytes32 _requestId, uint256 _UserID) public recordChainlinkFulfillment(_requestId) 
    {
        UserID = _UserID;
    }
    
     
} 