import std

fn f(x: u32) -> u32 {
  x
}

#[test]
fn test_f() {
  assert_eq(f(u32:2), u32:2)
}
