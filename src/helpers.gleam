import gleam/list
import gleam/option.{None, Some}
import lexer.{type Lexer, init_lexer, next_token}
import tokens.{type Token, Token}

pub type LexError {
  NoToken
}

/// Helper function to recursively get all the tokens till the end of the input
fn get_tokens(lexer: Lexer, tokens: List(Token)) -> List(Token) {
  let #(lexer, token) = next_token(lexer)
  case token {
    Some(t) -> {
      get_tokens(lexer, [t, ..tokens])
    }
    None -> list.reverse(tokens)
  }
}

/// Get all tokens from the provided input string 
pub fn get_tokens_from_input(
  input input: String,
) -> Result(List(Token), LexError) {
  let lexer = init_lexer(input)
  let #(lexer, token) = next_token(lexer)
  case token {
    Some(t) -> {
      Ok(get_tokens(lexer, [t]))
    }
    None -> Error(NoToken)
  }
}
