extern crate chrono;
use chrono::*;

pub fn after<T: TimeZone>(date: DateTime<T>) -> DateTime<T> {
    date + Duration::seconds(1_000_000_000)
}
