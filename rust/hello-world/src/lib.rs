pub fn hello(maybe_name: Option<&'static str>) -> String {
    match maybe_name {
        Some(name) => format!("Hello, {}!", name),
        None => "Hello, World!".to_string()
    }
}
