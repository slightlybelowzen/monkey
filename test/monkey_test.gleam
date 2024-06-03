import gleeunit

import gleam/list
import gleam/option.{None, Some}

import gleam/result
import gleeunit/should
import lexer.{type Lexer, init_lexer, next_token}
import tokens.{type Token, Token}

pub fn main() {
  gleeunit.main()
}

pub type LexError {
  NoToken
}

pub fn get_tokens(lexer: Lexer, tokens: List(Token)) -> List(Token) {
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
