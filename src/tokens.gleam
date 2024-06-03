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
  Minus
  Bang
  Asterisk
  Slash
  Lt
  Gt

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
