import argv
import gleam/io

import gleam/result
import gleam/string
import helpers.{get_tokens_from_input}
import simplifile.{type FileError, read}
import tokens.{type Token}

pub const version = "0.0.1-alpha1"

pub const help_message = "usage: gleam [-f | --file <path>] | [-i | --interactive]"

pub type ConsoleError {
  FileError
  InvalidArgError
}

pub fn get_tokens(filepath: String) -> Result(List(Token), ConsoleError) {
  let read_out = read(from: filepath)
  case read_out {
    // this isn't ideal since we're losing error information
    // but there's not much I can think of to satisfy the compiler
    Error(_) -> {
      io.println_error("could not open file" <> filepath <> "for reading")
      Error(FileError)
    }
    Ok(content) -> {
      let content = string.trim(content)
      let tokens = get_tokens_from_input(content)
      io.debug(result.unwrap(tokens, []))
      Ok(result.unwrap(tokens, []))
    }
  }
}

pub fn main() -> Result(List(Token), ConsoleError) {
  let welcome_message = "monkey v" <> version
  io.println(welcome_message)
  case argv.load().arguments {
    ["-f", filepath] | ["--file", filepath] -> get_tokens(filepath)
    _ -> {
      io.println(help_message)
      Error(InvalidArgError)
    }
  }
}
