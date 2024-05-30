import gleam/option.{type Option, None, Some}
import gleam/string
import tokens.{type Token, Token}

pub type Lexer {
  Lexer(input: String, position: Int, character: Option(String))
}

pub fn init_lexer(input: String) -> Lexer {
  // instead of pattern matching on the input
  // simply use the fact that the first function can return an Err(Nil)
  let lexer = case string.first(input) {
    Ok(character) -> Lexer(input, 0, Some(character))
    _ -> Lexer(input, 0, None)
  }
  lexer
}

pub fn advance(lexer: Lexer) -> Lexer {
  case lexer.position >= string.length(lexer.input) {
    True -> Lexer(lexer.input, lexer.position, None)
    False -> {
      let position = lexer.position + 1
      Lexer(
        lexer.input,
        position,
        Some(string.slice(lexer.input, position, position + 1)),
      )
    }
  }
}

pub fn next_token(lexer: Lexer) -> #(Lexer, Option(Token)) {
  case lexer.character {
    Some(ch) ->
      case ch {
        ";" -> #(advance(lexer), Some(Token(ch, tokens.Semicolon)))
        "=" -> #(advance(lexer), Some(Token(ch, tokens.Assign)))
        "(" -> #(advance(lexer), Some(Token(ch, tokens.RParen)))
        ")" -> #(advance(lexer), Some(Token(ch, tokens.RParen)))
        "," -> #(advance(lexer), Some(Token(ch, tokens.Comma)))
        "+" -> #(advance(lexer), Some(Token(ch, tokens.Plus)))
        "{" -> #(advance(lexer), Some(Token(ch, tokens.LBrace)))
        "}" -> #(advance(lexer), Some(Token(ch, tokens.RBrace)))
        _ -> #(advance(lexer), Some(Token(ch, tokens.EOF)))
      }
    None -> #(lexer, None)
  }
}
