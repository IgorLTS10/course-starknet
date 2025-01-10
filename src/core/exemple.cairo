#[starknet::contract]
mod Exemple {
    #[storage]
    struct Storage {
        counter: u256,
    }
    #[event]
    #[derive(Drop, starknet::Event)]
    enum Event {
        Update: Update,
        Send: Send,
    }

    #[derive(Drop, starknet::Event)]
    struct Update {
        #[key]
        value: u256,
        message: felt252,
    }

    #[derive(Drop, starknet::Event)]
    struct Send {
        #[key]
        message: felt252, 
    }

    #[constructor]
    fn constructor(ref self: ContractState, initial_value: u256) {
        self.counter.write(initial_value);
    }

    #[abi(embed_v0)]
    impl ExempleImpl of cours0::interfaces::exemple::IExemple<ContractState> {
        fn change_value(ref self: ContractState, value: u256) {
            self.counter.write(value);
            self.emit(Update { value: value, message: 'changer'.into() });
        }

        fn get_value(self: @ContractState) -> u256 {
            self.counter.read()
        }
    }

    #[generate_trait]
    impl ExempleHelper of ExempleHelperTrait {
        fn get_value_internal(self: @ContractState) -> u256 {
            self.counter.read()
        }
    }
}
