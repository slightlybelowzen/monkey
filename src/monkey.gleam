import argv
import gleam/io
import gleam/string
import lexer.{init_lexer, next_token}
import simplifile.{read}

pub const version = "0.0.1-alpha1"

pub const help_message = "usage: gleam [-f | --file <path>] | [-i | --interactive]"

fn read_file(filepath: String) -> Nil {
  let read_out = read(from: filepath)
  case read_out {
    Error(_) ->
      io.println_error("could not open file" <> filepath <> "for reading")
    Ok(content) -> {
      let content = string.trim(content)
      io.println("contents: '" <> content <> "'")
      let lexer = init_lexer(content)
      let #(lexer, token) = next_token(lexer)
      io.debug(token)
      io.debug(lexer)
      Nil
    }
  }
}

fn run_interpreter() -> Nil {
  io.println("=>")
}

pub fn main() {
  let welcome_message = "monkey v" <> version
  io.println(welcome_message)
  case argv.load().arguments {
    ["-f", filepath] | ["--file", filepath] -> read_file(filepath)
    ["-i"] | ["--interactive"] -> run_interpreter()
    _ -> {
      io.println(help_message)
    }
  }
}
