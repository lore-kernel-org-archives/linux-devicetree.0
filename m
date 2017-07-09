From: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/9] hts221: add new features and fix power-off procedure
Date: Sun,  9 Jul 2017 18:56:55 +0200
Message-ID: <20170709165704.26311-1-lorenzo.bianconi@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Patches 1-3: fix a bug in power-down/suspend procedure
Patch 4: avoid useless sample rate configurations
Patches 5-8: add active low and open drain support with corresponding
dt-binding
Patch 9: improve code readability

Lorenzo Bianconi (9):
  iio: humidity: hts221: refactor write_with_mask code
  iio: humidity: hts221: move BDU configuration in probe routine
  iio: humidity: hts221: do not overwrite reserved data during
    power-down
  iio: humidity: hts221: avoid useless ODR reconfiguration
  iio: humidity: hts221: support active-low interrupts
  dt-bindings: iio: humidity: hts221: support active-low interrupts
  iio: humidity: hts221: support open drain mode
  dt-bindings: iio: humidity: hts221: support open drain mode
  iio: humidity: hts221: move drdy enable logic in
    hts221_trig_set_state()

 .../devicetree/bindings/iio/humidity/hts221.txt    |  11 +-
 drivers/iio/humidity/hts221.h                      |   5 +-
 drivers/iio/humidity/hts221_buffer.c               |  43 ++++++-
 drivers/iio/humidity/hts221_core.c                 | 124 +++++++--------------
 4 files changed, 93 insertions(+), 90 deletions(-)

-- 
2.13.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
