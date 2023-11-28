import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract BadAirdrop {
    address token;
    uint256 public transfers;

    error InvalidLengths();

    constructor(address _token) {
        token = _token;
    }

    function airdropBad(address[] memory recipients, uint256[] memory amounts) public {
        if (recipients.length != amounts.length) revert InvalidLengths();

        for (uint256 i; i < recipients.length; i++) {
            IERC20(token).transferFrom(msg.sender, address(this), amounts[i]);
        }

        for (uint256 i; i < recipients.length; i++) {
            IERC20(token).transfer(recipients[i], amounts[i]);
            transfers++;
        }
    }
}
