import argv
import gleam/io

// import gleam/option.{type Option, None}
// import gleam/string
// import lexer.{init_lexer, next_token}
// import simplifile.{type FileError, read}
// import tokens.{type Token}

pub const version = "0.0.1-alpha1"

pub const help_message = "usage: gleam [-f | --file <path>] | [-i | --interactive]"

// fn get_tokens(filepath: String) -> Result(List(Token), FileError) {
//   let read_out = read(from: filepath)
//   case read_out {
//     Error(err) -> {
//       io.println_error("could not open file" <> filepath <> "for reading")
//       Error(err)
//     }
//     Ok(content) -> {
//       let content = string.trim(content)
//       io.println("contents: '" <> content <> "'")
//       let lexer = init_lexer(content)
//       let #(lexer, token) = next_token(lexer)
//       io.debug(token)
//       io.debug(lexer)
//       Ok(token)
//     }
//   }
// }

// fn run_interpreter() -> Result(Option(Token), _) {
//   io.println("=>")
//   Ok(None)
// }

pub fn main() {
  let welcome_message = "monkey v" <> version
  io.println(welcome_message)
  case argv.load().arguments {
    // ["-f", filepath] | ["--file", filepath] -> get_tokens(filepath)
    // ["-i"] | ["--interactive"] -> run_interpreter()
    _ -> {
      io.println(help_message)
      // Ok(None)
    }
  }
}
