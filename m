From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] CREG clk driver for NXP LPC18xx family
Date: Sat, 11 Jul 2015 23:48:25 +0200
Message-ID: <1436651307-24098-1-git-send-email-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch set adds a clk driver for the low power clocks found in
the CREG block on lpc18xx. CREG is a collection of miscellaneous
configuration registers that can be accessed through a syscon
regmap interface. The clk driver makes it possible to setup and
enabled these two clocks.

This need to support peripherals like the internal RTC on the
lpc18xx platform.

Based on v4.2-rc1.

Joachim Eastwood (2):
  clk: add lpc18xx creg clk driver
  doc: dt: add documentation for lpc1850-creg-clk driver

 .../devicetree/bindings/clock/lpc1850-creg-clk.txt |  52 +++++++
 drivers/clk/nxp/Makefile                           |   1 +
 drivers/clk/nxp/clk-lpc18xx-creg.c                 | 173 +++++++++++++++++++++
 3 files changed, 226 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/lpc1850-creg-clk.txt
 create mode 100644 drivers/clk/nxp/clk-lpc18xx-creg.c

-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
