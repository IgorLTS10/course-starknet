#[starknet::contract]
pub mod myERC20{
    use starknet::{ContractAddress};
    use cours0::components::ERC20Component::ERC20Component;

    component!(path: ERC20Component, storage: ERC20Component, event: ERC20Event);

    #[abi(embed_v0)]
    impl ERC20Impl = ERC20Component::ERC20Component<ContractState>;

    #[storage]
    struct Storage {
        #[substorage(v0)]
        ERC20Component: ERC20Component::Storage,
    }

    #[event]
    #[derive(Drop, starknet::Event, Debug, PartialEq)]
    pub enum Event {
        ERC20Event: ERC20Component::Event,
    }

    impl ERC20Private = ERC20Component::ERC20Private<ContractState>;

    #[constructor]
    fn constructor(ref self: ContractState, owner: ContractAddress, name:felt252, symbol:felt252, decimals:u8, initial_supply:u256) {
        self.ERC20Component._init(owner, name, symbol, decimals, initial_supply);
    }
}