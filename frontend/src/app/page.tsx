"use client";

import { StarknetConfig, useAccount, useConnect, useDisconnect, publicProvider, cartridgeProvider } from "@starknet-react/core";
import { mainnet, devnet, sepolia } from "@starknet-react/chains";
import { InjectedConnector } from "@starknet-react/core";

// Définir les connecteurs (ArgentX, Braavos, etc.)
const connectors = [new InjectedConnector({ options: { id: "argentX" } })];

export default function Home() {
  const { address, isConnected } = useAccount();
  const { connect, connectors } = useConnect();
  const { disconnect } = useDisconnect();

  return (
    <StarknetConfig chains={[mainnet, sepolia]} provider={cartridgeProvider()}>
      <div className="flex flex-col items-center justify-center min-h-screen bg-gray-900 text-white">

        <div className="mt-6">
          {isConnected ? (
            <div className="flex flex-col items-center">
              <p className="text-sm text-gray-400">Connecté avec :</p>
              <p className="text-lg font-semibold">{address}</p>
              <button
                style={{
                  marginTop: "10px",
                  padding: "10px 20px",
                  backgroundColor: "red",
                  color: "white",
                  borderRadius: "5px",
                  border: "none",
                  cursor: "pointer",
                }}
              >
                Déconnecter
              </button>
            </div>
          ) : (
            <div>
              {connectors.map((connector) => (
                <button
                  key={connector.id}
                  onClick={() => connect({ connector })}
                  style={{
                    padding: "10px 20px",
                    backgroundColor: "blue",
                    color: "white",
                    borderRadius: "5px",
                    border: "none",
                    cursor: "pointer",
                    margin: "5px",
                  }}
                >
                  Se connecter avec {connector.name}
                </button>
              ))}
            </div>
          )}
        </div>
      </div>
    </StarknetConfig>
  );
}
