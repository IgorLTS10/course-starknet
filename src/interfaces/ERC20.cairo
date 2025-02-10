use starknet::ContractAddress;

#[starknet::interface]
pub trait ERC20<TContractState>{
    fn getName(self: @TContractState) -> felt252;
    fn getSymbol(self: @TContractState) -> felt252;
    fn getDecimals(self: @TContractState) -> u8;
    fn getSupply(self: @TContractState) -> u256;
    fn balanceOf(self: @TContractState, address:ContractAddress) -> u256;
    fn allowance(self: @TContractState, owner: ContractAddress, spender: ContractAddress) -> u256;
    fn approve(ref self: TContractState, amount:u256, to:ContractAddress);
    fn transferFrom(ref self: TContractState, from:ContractAddress, amount:u256, to:ContractAddress);
    fn transfer(ref self: TContractState, amount:u256, to:ContractAddress);
}
