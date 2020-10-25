class Console {
  static void clear() {
    print("\x1B[2J\x1B[0;0H");
  }
}