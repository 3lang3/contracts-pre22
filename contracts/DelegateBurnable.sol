pragma solidity ^0.4.18;

// Interface implemented by BurnableTokens that are the *target* of
// delegation. That is, if we want to replace BurnableToken X by
// BurnableToken Y but for convenience we'd like users of X
// to be able to keep using it and it will just forward calls to Y,
// then X should extend CanDelegate and Y should extend DelegateBurnable.
// Most ERC20 calls use the value of msg.sender to figure out e.g. whose
// balance to update; since X becomes the msg.sender of all such calls
// that it forwards to Y, we add the origSender parameter to those calls.
// Delegation is intended as a convenience for legacy users of X since
// we do not expect all regular users to learn about Y and change accordingly,
// but we do require the *owner* of X to now use Y instead so ownerOnly
// functions are not delegated and should be disabled instead.
contract DelegateBurnable {
  function delegateTotalSupply() public view returns (uint256);
  function delegateBalanceOf(address who) public view returns (uint256);
  function delegateTransfer(address to, uint256 value, address origSender) public returns (bool);
  function delegateAllowance(address owner, address spender) public view returns (uint256);
  function delegateTransferFrom(address from, address to, uint256 value, address origSender) public returns (bool);
  function delegateApprove(address spender, uint256 value, address origSender) public returns (bool);
  function delegateIncreaseApproval(address spender, uint addedValue, address origSender) public returns (bool);
  function delegateDecreaseApproval(address spender, uint subtractedValue, address origSender) public returns (bool);
  function delegateBurn(uint256 value, address origSender) public;
}
