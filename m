From: Adam Baker <linux-u8Lxuz9p/S1csCcyGdaD/Q@public.gmane.org>
Subject: [PATCH v3 0/3] driver for the hardware monitoring chip in the Zyxel NSA320
Date: Sun, 28 Feb 2016 22:30:11 +0000
Message-ID: <1456698614-15176-1-git-send-email-linux@baker-net.org.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, carl.wolfgang-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch series adds a driver to support the hardware monitoring MCU
that is present in the Zyxel NSA320. It is believed that this is
identical to the one used in the NSA325 and some variants of the NSA310.

 Documentation/devicetree/bindings/hwmon/nsa320-mcu.txt |  21 +++
 Documentation/hwmon/nsa320                             |  53 +++++++
 arch/arm/boot/dts/kirkwood-nsa320.dts                  |  13 +-
 drivers/hwmon/Kconfig                                  |  15 ++
 drivers/hwmon/Makefile                                 |   1 +
 drivers/hwmon/nsa320-hwmon.c                           | 215 ++++++++++++++++++++++++++++
 6 files changed, 316 insertions(+), 2 deletions(-)

---
Changes since v1
Update to reflect linux-0h96xk9xTtoC3MgbdEUNLxnkhkLA8VUH@public.gmane.org comments from Guenter Roeck,
mainly changing it to be nsa320, not nsa3xx but also making it
return an errno on failure and various other tidy ups.

Changes since v2
Update patch 2/3 based on further review from Guenter Roeck, patches
1/3 and 3/3 are unchanged except for adding Rob's Ack to 1/3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
