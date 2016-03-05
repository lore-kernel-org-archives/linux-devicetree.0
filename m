From: Adam Baker <linux-u8Lxuz9p/S1csCcyGdaD/Q@public.gmane.org>
Subject: [PATCH v4 0/3] driver for the hardware monitoring chip in the Zyxel NSA320
Date: Sat,  5 Mar 2016 15:34:54 +0000
Message-ID: <1457192097-32538-1-git-send-email-linux@baker-net.org.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, carl.wolfgang-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
List-Id: devicetree@vger.kernel.org

 Documentation/devicetree/bindings/hwmon/nsa320-mcu.txt |  21 +++++
 Documentation/hwmon/nsa320                             |  53 +++++++++++
 arch/arm/boot/dts/kirkwood-nsa320.dts                  |  13 ++-
 drivers/hwmon/Kconfig                                  |  15 +++
 drivers/hwmon/Makefile                                 |   1 +
 drivers/hwmon/nsa320-hwmon.c                           | 216 ++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 317 insertions(+), 2 deletions(-)

Changes since v3
Use s32 as the return value from nsa320_hwmon_update

Changes since v2
Update patch 2/3 based on further review from Guenter Roeck, patches
1/3 and 3/3 are unchanged except for adding Rob's Ack to 1/3

Changes since v1
Update to reflect review comments from Guenter Roeck,
mainly changing it to be nsa320, not nsa3xx but also making it
return an errno on failure and various other tidy ups.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
