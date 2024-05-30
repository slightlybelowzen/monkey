import gleam/option.{type Option, None, Some}
import gleam/string.{first}

pub type Lexer {
  Lexer(input: String, position: Int, character: Option(String))
}

pub fn init_lexer(input: String) -> Lexer {
  // instead of pattern matching on the input
  // simply use the fact that the first function can return an Err(Nil)
  let lexer = case first(input) {
    Ok(character) -> Lexer(input, 0, Some(character))
    _ -> Lexer(input, 0, None)
  }
  lexer
}

pub fn get_tokens(_lexer: Lexer) {
  []
}
