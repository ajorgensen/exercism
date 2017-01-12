pub fn hello(maybe_name: Option<&'static str>) -> String {
    format!("Hello, {0}!", maybe_name.unwrap_or("World"))
}
