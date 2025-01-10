#[starknet::interface]
trait ICounter<TState> {
    fn increment(ref self: TState);
    fn decrement(ref self: TState);
    fn increase_count_by(ref self: TState, number: u64);
    fn get_current_count(self: @TState) -> u64;
}

#[starknet::contract]
mod Counter {
    #[storage]
    struct Storage {
        _count: u64,
    }

    #[constructor]
    fn constructor(ref self: ContractState) { 
        self._count.write(1);
    }

    #[abi(embed_v0)]
    impl CounterImpl of super::ICounter<ContractState> {
        
        fn increment(ref self: ContractState,) {
            let current_count = self._count.read();
            self._count.write(current_count + 1);
        }
        fn decrement(ref self: ContractState,) {
            let current_count = self._count.read();
            self._count.write(current_count -1);
        }
        fn increase_count_by(ref self: ContractState, number: u64) {
            let current_count = self._count.read();
            self._count.write(current_count + number);
        }

        fn get_current_count(self: @ContractState) -> u64 {
            self._count.read()
        }
    }
}
