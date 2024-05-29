import gleam/io

pub const version = "0.1"

pub const help_message = "usage: gleam []"

pub fn main() {
  let welcome_message = "gleam v" <> version
  io.println(welcome_message)
}
