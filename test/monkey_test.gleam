import gleeunit

import gleam/result
import gleeunit/should
import helpers.{get_tokens_from_input}
import tokens.{type Token, Token}

pub fn main() {
  gleeunit.main()
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
    Token(token_type: tokens.EOF, literal: ""),
  ]
  let tokens = result.unwrap(get_tokens_from_input(input: "=+(){},;"), [])
  should.equal(tokens, expected_tokens)
}

pub fn lexer_multiple_character_tokenise_test() {
  let expected_tokens = [
    Token(token_type: tokens.Let, literal: "let"),
    Token(token_type: tokens.Ident, literal: "five"),
    Token(token_type: tokens.Assign, literal: "="),
    Token(token_type: tokens.Int, literal: "5"),
    Token(token_type: tokens.Semicolon, literal: ";"),
    Token(token_type: tokens.Let, literal: "let"),
    Token(token_type: tokens.Ident, literal: "ten"),
    Token(token_type: tokens.Assign, literal: "="),
    Token(token_type: tokens.Int, literal: "10"),
    Token(token_type: tokens.Semicolon, literal: ";"),
    Token(token_type: tokens.Let, literal: "let"),
    Token(token_type: tokens.Ident, literal: "add"),
    Token(token_type: tokens.Assign, literal: "="),
    Token(token_type: tokens.Function, literal: "fn"),
    Token(token_type: tokens.LParen, literal: "("),
    Token(token_type: tokens.Ident, literal: "x"),
    Token(token_type: tokens.Comma, literal: ","),
    Token(token_type: tokens.Ident, literal: "y"),
    Token(token_type: tokens.RParen, literal: ")"),
    Token(token_type: tokens.LBrace, literal: "{"),
    Token(token_type: tokens.Ident, literal: "x"),
    Token(token_type: tokens.Plus, literal: "+"),
    Token(token_type: tokens.Ident, literal: "y"),
    Token(token_type: tokens.Let, literal: "let"),
    Token(token_type: tokens.Ident, literal: "result"),
    Token(token_type: tokens.Assign, literal: "="),
    Token(token_type: tokens.Ident, literal: "add"),
    Token(token_type: tokens.LParen, literal: "("),
    Token(token_type: tokens.Ident, literal: "five"),
    Token(token_type: tokens.Comma, literal: ","),
    Token(token_type: tokens.Ident, literal: "ten"),
    Token(token_type: tokens.RParen, literal: ")"),
    Token(token_type: tokens.Semicolon, literal: ";"),
    Token(token_type: tokens.EOF, literal: ""),
  ]
  let tokens =
    result.unwrap(
      get_tokens_from_input(
        input: "let five = 5;
let ten = 10;
   let add = fn(x, y) {
     x + y;
};
   let result = add(five, ten);",
      ),
      [],
    )
  should.equal(tokens, expected_tokens)
}
