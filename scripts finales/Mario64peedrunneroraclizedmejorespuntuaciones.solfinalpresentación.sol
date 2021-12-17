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
    function requestUserID() public onlyOwner returns (bytes32 requestId)
    {
        //create a variable and store it temporarily in memory
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        //set the url to perform the GET request
        request.add("get", "https://www.speedrun.com/api/v1/games/o1y9wo6q/records?top=1");
        //set the path to find the required data in the api response
         request.add("path", "j2ylqn68");
         request.add("path", "2019-05-11");
         request.add ("path", "PT6M13.970S");
         request.add ("path", "PT6M13.970S");
         request.add ("path", "48gqo07j");
         request.add ("path", "PT3M26.970S");
         request.add ("path", "PT3M26.970S");
         request.add("path", "98rp5e6j");
         request.add("path", "2021-01-11");
         request.add("path", "PT5M33.600S");
         request.add ("path", "PT5M33.600S");
         request.add ("path", "kjpqrr4x");
         request.add ("path", "2020-01-18");
         request.add ("path", "PT4M39.510S");
         request.add ("path", "PT4M39.510S");
         request.add("path", "zxzvprjq");
         request.add("path", "2021-01-11");
         request.add("path", "PT5M33.600S");
         request.add ("path", "PT5M33.600S");
         request.add ("path", "zxzvprjq");
         request.add ("path", "2017-03-26");
         request.add ("path", "PT5M56.780S");
         request.add ("path", "PT5M56.780S");
         request.add("path", "zx76v0j7");
         request.add ("path", "2020-03-11");
         request.add ("path", "PT3M54.050S");
         request.add("path", "PT3M54.050S");
          request.add ("path", "98rp5e6j") ;
         request.add("path", "2021-09-30");
         request.add ("path", "PT5M12.440S");
         request.add ("path", "PT5M12.440S");
         request.add("path", "zxzk1q9x");
         request.add("path", "2018-12-29");
         request.add ("path", "PT6M8.200S");
         request.add ("path", "PT6M8.200S");
         request.add("path", "98rp5e6j");
         request.add("path", "2020-12-10");
         request.add("path","PT5M22.260S");
         request.add("path","PT5M22.260S");
         request.add("path", "48gqo07j");
         request.add("path","2021-10-29");
         request.add("path","PT3M24.400S");
         request.add("path","PT3M24.400S");
         request.add("path", "98rp5e6j");
         request.add ("path", "2020-12-10");
         request.add ("path", "PT5M41.710S");
         request.add("path", "PT5M41.710S");
         request.add("path", "kj9yz0wx");
         request.add ("path", "2021-11-07");
         request.add ("path", "PT1H37M53S");
         request.add("path", "PT1H37M53S");
         request.add("path", "kjprmwk8");
         request.add("path","2021-11-30");
         request.add("path","PT14M53.450S");
         request.add("path","PT14M53.450S");
         request.add("path","7j40gpw8");
         request.add("path","2021-12-08");
         request.add("path","PT7M7.320S");
         request.add("path","PT7M7.320S");
         request.add("path","7j40gpw8");
         request.add("path","2021-08-06");
         request.add("path","PT6M29.950S");
         request.add("path","PT6M29.950S");
         
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