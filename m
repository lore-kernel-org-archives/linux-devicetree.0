From: Adriana Reus <adriana.reus-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 0/2] Add support and documentation for UPISEMI us5182d als and proximity sensor
Date: Fri, 14 Aug 2015 12:29:38 +0300
Message-ID: <1439544580-21179-1-git-send-email-adriana.reus@intel.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Adriana Reus <adriana.reus-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds basic support for this als and proximity sensor and devicetree docs.

Resending the series because I forgot to cc devicetree. Sorry for the follow-up.

Adriana Reus (2):
  iio: light: Add support for UPISEMI uS5182d als and proximity sensor
  devicetree: Add documentation for UPISEMI us5182d ALS and Proximity
    sensor

 .../devicetree/bindings/i2c/trivial-devices.txt    |   1 +
 .../devicetree/bindings/iio/light/us5182d.txt      |  24 +
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/iio/light/Kconfig                          |  10 +
 drivers/iio/light/Makefile                         |   1 +
 drivers/iio/light/us5182d.c                        | 484 +++++++++++++++++++++
 6 files changed, 521 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/us5182d.txt
 create mode 100644 drivers/iio/light/us5182d.c

-- 
1.9.1
