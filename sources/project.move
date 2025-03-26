module MyModule::LoyaltyNFT {

    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    /// Struct representing a Loyalty NFT.
    struct LoyaltyNFT has store, key {
        points: u64,  // Loyalty points accumulated by the user
    }

    /// Function to create a new loyalty NFT for a user with an initial point balance.
    public fun create_loyalty_nft(owner: &signer, initial_points: u64) {
        let nft = LoyaltyNFT {
            points: initial_points,
        };
        move_to(owner, nft);
    }

    /// Function to reward a user with loyalty points.
    public fun reward_loyalty_points(user: &signer, points: u64) acquires LoyaltyNFT {
        let nft = borrow_global_mut<LoyaltyNFT>(address_of(user));

        // Update the loyalty points for the user
        nft.points = nft.points + points;
    }
}
