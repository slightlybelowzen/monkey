pub type TokenType {
  // special tokens
  Illegal
  EOF

  // types
  Ident
  Int

  // operators
  Assign
  Plus

  // charcters
  Comma
  Semicolon

  // delimiters
  LParen
  RParen
  LBrace
  RBrace

  // keywords
  Function
  Let
}

pub type Token {
  Token(literal: String, token_type: TokenType)
}
