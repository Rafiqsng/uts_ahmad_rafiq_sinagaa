String rupiah(int value) {
  final s = value.toString();
  final buf = StringBuffer();
  int count = 0;
  for (int i = s.length - 1; i >= 0; i--) {
    buf.write(s[i]);
    count++;
    if (count == 3 && i != 0) {
      buf.write('.');
      count = 0;
    }
  }
  return 'Rp ${buf.toString().split('').reversed.join()}';
}
