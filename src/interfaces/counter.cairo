#[starknet::interface]
trait ICounter<TState> {
    /// Incrémente le compteur de 1.
    fn increment(ref self: TState);

    /// Décrémente le compteur de 1.
    fn decrement(ref self: TState);

    /// Augmente le compteur d'une valeur donnée.
    fn increase_count_by(ref self: TState, number: u64);

    /// Retourne la valeur actuelle du compteur.
    fn get_current_count(self: @TState) -> u64;
}
