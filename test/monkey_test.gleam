import gleeunit

// import gleam/io.{debug}
import gleeunit/should
import lexer.{get_tokens}
import tokens.{Token}

pub fn main() {
  gleeunit.main()
}

pub fn lexer_single_character_test() {
  let lexer = lexer.init_lexer("=+(){},;")
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
  let tokens = get_tokens(lexer)
  should.equal(tokens, expected_tokens)
}
