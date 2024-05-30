import gleeunit

import gleam/option.{None, Some}
import gleeunit/should
import lexer.{init_lexer, next_token}
import tokens.{type Token, Token}

pub fn main() {
  gleeunit.main()
}

pub fn get_tokens_from_input(input input: String) -> List(Token) {
  let lexer = init_lexer(input)
  let tokens = []
  let #(_lexer, token) = next_token(lexer)
  case token {
    Some(t) -> [t, ..tokens]
    None -> tokens
  }
  tokens
}

pub fn lexer_single_character_test() {
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
