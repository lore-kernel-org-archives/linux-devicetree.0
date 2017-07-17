From: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 00/10] hts221: add new features and fix power-off procedure
Date: Mon, 17 Jul 2017 19:38:55 +0200
Message-ID: <20170717173905.8209-1-lorenzo.bianconi@st.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Patches 1-3: fix a bug in power-down/suspend procedure
Patch 4-5: avoid useless sample rate configurations
Patches 6-9: add active low and open drain support with corresponding
dt-binding
Patch 10: improve code readability

Changes since v1:
- simplify hts221_avg_list table management
- split patch 4 in two separate patches
- improve commit log in patch 3

Lorenzo Bianconi (10):
  iio: humidity: hts221: refactor write_with_mask code
  iio: humidity: hts221: move BDU configuration in probe routine
  iio: humidity: hts221: do not overwrite reserved data during
    power-down
  iio: humidity: hts221: avoid useless ODR reconfiguration
  iio: humidity: hts221: squash hts221_power_on/off in hts221_set_enable
  iio: humidity: hts221: support active-low interrupts
  dt-bindings: iio: humidity: hts221: support active-low interrupts
  iio: humidity: hts221: support open drain mode
  dt-bindings: iio: humidity: hts221: support open drain mode
  iio: humidity: hts221: move drdy enable logic in
    hts221_trig_set_state()

 .../devicetree/bindings/iio/humidity/hts221.txt    |  11 +-
 drivers/iio/humidity/hts221.h                      |  11 +-
 drivers/iio/humidity/hts221_buffer.c               |  43 +++++-
 drivers/iio/humidity/hts221_core.c                 | 144 ++++++++-------------
 4 files changed, 103 insertions(+), 106 deletions(-)

-- 
2.13.2
