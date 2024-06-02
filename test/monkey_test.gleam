import gleeunit

// import gleam/io
// import gleam/list
// import gleam/option.{None, Some}

import gleeunit/should
import lexer.{init_lexer, next_token}
import tokens.{type Token, Token}

pub fn main() {
  gleeunit.main()
}

/// Get all tokens from the provided input string 
pub fn get_tokens_from_input(input input: String) -> List(Token) {
  let lexer = init_lexer(input)
  let #(_, _) = next_token(lexer)
  // this needs to be changed so that we can update the tokens, 
  // so we need to describe a helper function that passes the tokens
  // and the new lexer everytime we call next_token and then returns tokens when 
  // next_token returns None (we've reached the end of the input)
  []
}

pub fn lexer_single_character_tokenise_test() {
  let expected_tokens = [
    Token(token_type: tokens.Assign, literal: "="),
    Token(token_type: tokens.Plus, literal: "+"),
    Token(token_type: tokens.LParen, literal: "("),
    Token(token_type: tokens.RParen, literal: ")"),
    Token(token_type: tokens.LBrace, literal: "{"),
    Token(token_type: tokens.RBrace, literal: "}"),
    Token(token_type: tokens.Comma, literal: ","),
    Token(token_type: tokens.Semicolon, literal: ";"),
  ]
  let tokens = get_tokens_from_input(input: "=+(){},;")
  should.equal(tokens, expected_tokens)
}
