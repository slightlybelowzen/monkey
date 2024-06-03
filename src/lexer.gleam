import gleam/option.{type Option, None, Some}
import gleam/string
import tokens.{type Token, Token}

/// Type containing all the information we need to represent an immutable lexer
pub type Lexer {
  Lexer(input: String, position: Int, character: Option(String))
}

/// Initialise the lexer based on the length of the input
pub fn init_lexer(input: String) -> Lexer {
  // instead of pattern matching on the input simply use first
  let lexer = case string.first(input) {
    Ok(character) -> Lexer(input, 0, Some(character))
    _ -> Lexer(input, 0, None)
  }
  lexer
}

/// Return a new lexer with the position field incremented by 1, and the character at that index
pub fn advance(lexer: Lexer) -> Lexer {
  case lexer.position >= string.length(lexer.input) {
    // we're done, get outta here
    True -> {
      Lexer(lexer.input, lexer.position, None)
    }
    False -> {
      let position = lexer.position + 1
      Lexer(
        lexer.input,
        position,
        Some(string.slice(from: lexer.input, at_index: position, length: 1)),
      )
    }
  }
}

/// Return a pair of a new lexer (as returned by @advance) and an optional token 
pub fn next_token(lexer: Lexer) -> #(Lexer, Option(Token)) {
  case lexer.character {
    Some(ch) ->
      case ch {
        ";" -> #(advance(lexer), Some(Token(ch, tokens.Semicolon)))
        "=" -> #(advance(lexer), Some(Token(ch, tokens.Assign)))
        "+" -> #(advance(lexer), Some(Token(ch, tokens.Plus)))
        "," -> #(advance(lexer), Some(Token(ch, tokens.Comma)))
        ")" -> #(advance(lexer), Some(Token(ch, tokens.RParen)))
        "(" -> #(advance(lexer), Some(Token(ch, tokens.LParen)))
        "{" -> #(advance(lexer), Some(Token(ch, tokens.LBrace)))
        "}" -> #(advance(lexer), Some(Token(ch, tokens.RBrace)))
        _ -> #(advance(lexer), Some(Token(ch, tokens.EOF)))
      }
    None -> #(lexer, None)
  }
}
