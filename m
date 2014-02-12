From: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v7 0/2] AS3935 lightning sensor support
Date: Tue, 11 Feb 2014 20:31:13 -0800
Message-ID: <1392179475-2611-1-git-send-email-mranostay@gmail.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pantelis.antoniou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds support for the AMS AS3935 lightning sensor that allows
reporting back estimated storm distance and strike events.

Chagges from v6

* Revised binding documents to not use the term "interrupts mapping"
* Renamed tune-cap property to a more clear tuning-capacitor-pf

Changes from v5

* SPI write cache-aligned issues fixed
* Fixed mutex_unlock's being missed
* Reports distance in meters instead of kilometers (1km steps)
* tune_cap is now in picofarads and not a register value

Matt Ranostay (2):
  iio:as3935: Add DT binding docs for AS3935 driver
  iio: Add AS3935 lightning sensor support

 .../ABI/testing/sysfs-bus-iio-proximity-as3935     |  18 +
 .../devicetree/bindings/iio/proximity/as3935.txt   |  28 ++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/iio/Kconfig                                |   1 +
 drivers/iio/Makefile                               |   1 +
 drivers/iio/proximity/Kconfig                      |  19 +
 drivers/iio/proximity/Makefile                     |   6 +
 drivers/iio/proximity/as3935.c                     | 446 +++++++++++++++++++++
 8 files changed, 520 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-proximity-as3935
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/as3935.txt
 create mode 100644 drivers/iio/proximity/Kconfig
 create mode 100644 drivers/iio/proximity/Makefile
 create mode 100644 drivers/iio/proximity/as3935.c

-- 
1.8.3.2
