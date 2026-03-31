// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title EvidenceStore
/// @notice Minimal contract that stores an evidence hash (emitted as an event).
/// Emitting the event is sufficient for legal timestamping / immutability.
contract EvidenceStore {
    event EvidenceStored(uint256 indexed incidentId, bytes32 evidenceHash, address indexed submitter, uint256 timestamp);

    /// @notice Store an evidence hash for an incident. Emits EvidenceStored event.
    /// @param incidentId Incident identifier from off-chain DB (not enforced on-chain)
    /// @param evidenceHash SHA-256 (32 bytes) hash of combined evidence
    function storeEvidence(bytes32 evidenceHash, uint256 incidentId) external returns (bool) {
        emit EvidenceStored(incidentId, evidenceHash, msg.sender, block.timestamp);
        return true;
    }
}