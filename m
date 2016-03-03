From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 0/2] CREG clk driver for NXP LPC18xx family
Date: Thu,  3 Mar 2016 22:47:03 +0100
Message-ID: <1457041625-21163-1-git-send-email-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch set adds a clk driver for the low power clocks found in
the CREG block on lpc18xx. CREG is a collection of miscellaneous
configuration registers that can be accessed through a syscon
regmap interface. The clk driver makes it possible to setup and
enabled these two clocks.

This need to support peripherals like the internal RTC on the
lpc18xx platform.

The driver has one early init using CLK_OF_DECLARE and a standard
platform driver. The early init is used to register the 32KHZ clk
which may be needed early on. The other clock (1KHZ) is registered
when the platform driver probe runs.

This version splits clk array into clk_creg_early and clk_creg. I
think this will work as long as clk_creg_early is _not_ used after
the clk_creg is registered.

This seems to work, but I currently don't have a setup that requires
the 32khz clock early so that part isn't really tested.

The probe deferral seems to work for the RTC:
[    3.386861] lpc24xx-rtc 40046000.rtc: error getting rtc clock
[    6.737615] lpc24xx-rtc 40046000.rtc: rtc core: registered lpc24xx-rtc as rtc0

Changes since v4:
 - Use devm_clk_register in platform probe
 - Fix typo in dt doc
 - Add ack from Rob Herring on dt doc

Changes since v3:
 - Add .is_enabled function to both creg clks.
 - Remove unit address from bindings as requested by Rob Herring.

Changes since v2:
 - Use two clk arrays for registration.
 - Couple of minor cleanups.

Changes since v1:
 - Split driver with one early init and one platform driver
   probe.
 - Rebase on v4.5-rc1.

Joachim Eastwood (2):
  clk: add lpc18xx creg clk driver
  doc: dt: add documentation for lpc1850-creg-clk driver

 .../devicetree/bindings/clock/lpc1850-creg-clk.txt |  52 +++++
 drivers/clk/nxp/Makefile                           |   1 +
 drivers/clk/nxp/clk-lpc18xx-creg.c                 | 226 +++++++++++++++++++++
 3 files changed, 279 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/lpc1850-creg-clk.txt
 create mode 100644 drivers/clk/nxp/clk-lpc18xx-creg.c

-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
