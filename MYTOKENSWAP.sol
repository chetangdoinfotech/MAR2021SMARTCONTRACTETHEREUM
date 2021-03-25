// TOKEN SWAP CONTRACT
pragma solidity ^0.6.6;
import 'https://github.com/Uniswap/uniswap-v2-periphery/blob/master/contracts/UniswapV2Router02.sol';

contract MYSWAPCONTRACT{
    //UniswapV2Router02 public UniswapV2;
    IUniswapV2Router02 public uswapRouter;
    
    address internal constant UniSwapContractAddr = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;   
    
    constructor() public {
        uswapRouter = IUniswapV2Router02(UniSwapContractAddr);
    }
  
    function swaptokens(uint amountIn, uint amountOutMin, address pathAddr1, address pathAddr2, address to) public returns (uint[] memory amounts){
        address[] memory myp = new address[](2);
        uint deadline = block.timestamp + 15;
        myp[0] = address(pathAddr1);
        myp[1] = address(pathAddr2);
                            
       return uswapRouter.swapTokensForExactTokens(amountIn, amountOutMin, myp, to, deadline);
       // return UniswapV2.swapExactTokensForTokens(amountIn, amountOutMin, myp, to, deadline);
    }
}
