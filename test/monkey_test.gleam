import gleeunit

import gleam/io.{debug}
import gleam/option.{Some}
import gleeunit/should
import lexer.{next_token}
import tokens.{Token}

pub fn main() {
  gleeunit.main()
}

pub fn lexer_single_character_test() {
  let lexer = lexer.init_lexer("=+(){},;")
  debug(lexer)
  // let expected_tokens = [
  //   Token(token_type: tokens.Assign, literal: "="),
  //   Token(token_type: tokens.Plus, literal: "+"),
  //   Token(token_type: tokens.LParen, literal: "("),
  //   Token(token_type: tokens.RParen, literal: ")"),
  //   Token(token_type: tokens.LBrace, literal: "{"),
  //   Token(token_type: tokens.RBrace, literal: "}"),
  //   Token(token_type: tokens.Comma, literal: ","),
  //   Token(token_type: tokens.Semicolon, literal: ";"),
  // ]
  let expected_token = Some(Token(token_type: tokens.Assign, literal: "="))
  let #(_, token) = next_token(lexer)
  should.equal(token, expected_token)
}
