import gleam/io

pub const version = "0.0.1-alpha1"

pub const help_message = "usage: gleam []"

pub fn main() {
  let welcome_message = "monkey v" <> version
  io.println(welcome_message)
}
