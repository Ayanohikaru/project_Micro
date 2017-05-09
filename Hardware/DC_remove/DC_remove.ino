struct fifo_t {
  uint16_t rawIR;
  uint16_t rawRed;
};
dcFilter_t MAX30100::dcRemoval(float x, float prev_w, float alpha)
{
  dcFilter_t filtered;
  filtered.w = x + alpha * prev_w;
  filtered.result = filtered.w - prev_w;

  return filtered;
}
