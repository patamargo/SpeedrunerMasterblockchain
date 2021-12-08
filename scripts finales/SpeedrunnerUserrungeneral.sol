//SPDX licence-identifier:MIT
pragma solidity ^0.8;
import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
// Chainlink example inherits from ChainlinkClient
contract ChainlinkSuperMario64speedrunner is ChainlinkClient {
  using Chainlink for Chainlink.Request;   
 // define state variables store on the block chainlink
 uint256 public runID;
 uint256 public gameID;
 uint256 public categoryID;
 uint256 public  UserID;
 uint256 public primary_t;
 uint256 public date;
  uint256 public realtime_t;
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
    
 
     //function below creates a Chainlink API request to get the runID
    //only the owner of the contract can call this function
    function requestrunID() public onlyOwner returns (bytes32 requestId)
    {
        //create a variable and store it temporarily in memory
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        //set the url to perform the GET request
        request.add("get", "https://www.speedrun.com/api/v1/runs?user=j42v61vx");
        //set the path to find the required data in the api response
         request.add("path", "z09go5jz");
         request.add("path", "k6q474zd");
         request.add ("path", "8240zynd");
         request.add ("path", "j42v61vx");
         request.add ("path", "23");
         request.add ("path", "2021-01-05");
         request.add ("path", "23");

        //multiply the results by 100 to remove decimals
        request.addInt("times", 100);
        //send the request
        return sendChainlinkRequestTo(Oracle, request, fee);
    }
    
    function fulfill(bytes32 _requestId, uint256 _runID) public recordChainlinkFulfillment(_requestId) 
    {
        runID = _runID;
    }
    
   
     }