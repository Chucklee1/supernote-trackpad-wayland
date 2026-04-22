#include <fstream>
#include <iostream>
#include <linux/input.h>

using namespace std;

#define TOUCH_IDX 5
#define TRACK_IDX 9
#define EV_SIZE 24

void decode(input_event ev) {
  int idx = ev.type;
  // I only need 0-4 event types
  static int prev_ev[5] = {-1, -1, -1, -1};

  if (prev_ev[idx] != ev.value) {
    cout << " type: " << ev.type << " code: " << ev.code
         << " value: " << ev.value;
    prev_ev[idx] = ev.value;
  }
}

int main(int argc, char *argv[]) {
  string event_path = "/dev/input/event" + to_string(TOUCH_IDX);

  ifstream file(event_path, ios::binary);

  input_event ev;
  while (file.read(reinterpret_cast<char *>(&ev), sizeof(ev))) {
    cout << "time: " << ev.time.tv_sec << "." << ev.time.tv_usec;
    decode(ev);
    cout << endl;
  }
}
