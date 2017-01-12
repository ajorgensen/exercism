pub fn is_leap_year(year: u16) -> bool {
    if year % 4 == 0 {
        !(year % 100 == 0 && year % 400 != 0)
    } else {
        false
    }
}
