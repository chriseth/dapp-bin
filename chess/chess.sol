contract ChessGame {
    enum Piece { None, King, Queen, Rook, Bishop, Knight, Pawn }
    enum Colour { White, Black }
    struct ChessMove {
        uint8 dep_file; uint8 dep_rank;
        uint8 target_file; uint8 target_rank;
        Piece promotion;
    }

    address[2] players;
    ChessMove[] moves;
    

    /**** Main playing interface ****/
    function ChessGame(address[2] _players) {
        players = _players;
    }
    function registerMove(
            uint8 dep_file, uint8 dep_rank, uint8 target_file, uint8 target_rank,
            Piece promotion) onlyCurrentPlayer {
        moves.length++;
        moves[moves.length - 1].dep_file = dep_file;
        moves[moves.length - 1].dep_rank = dep_rank;
        moves[moves.length - 1].target_file = target_file;
        moves[moves.length - 1].target_rank = target_rank;
        moves[moves.length - 1].promotion = promotion;
    }
    modifier onlyCurrentPlayer {
        address player = players[moves.length % 2];
        if (msg.sender == player) _
    }

    /**** Move verification functionality ****/
    Piece[8][8] pieces;
    Colour[8][8] colours;
    function initializeBoard() internal {
        
    }
}
