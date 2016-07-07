From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 0/6] Add clock support for Armada 37xx SoCs
Date: Fri,  8 Jul 2016 00:37:45 +0200
Message-ID: <1467931071-31004-1-git-send-email-gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Victor Gu <xigu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Romain Perier <romain.perier-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Omri Itach <omrii-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Marcin Wojtas <mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, Wilson Ding <dingwei-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Hua Jing <jinghua-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Terry Zhou <bjzhou-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

eventually this is the second version of the series adding clock
support for the Armada 37xx SoCs.

The design of the drivers is as close as possible as the hardware is,
with some clocks made of several layers: muxing, divider and gating.

The device tree binding was written in a way that even if we discover
some change inside the clocks, the binding should not be
affected. Especially, there are some holes in the clocks, but we
should be able to add them seamless.

Since the firs version the main change is the use of clk_hw instead of
clk for the registration. I also removed the dt related patches as they
were already applied.

However the full series is available on the branch
Armada-3700-Clocks-v2 at
git-9UaJU3cA/F/QT0dZR+AlfA@public.gmane.org:MISL-EBU-System-SW/mainline-public.git

Thanks,

Changelog:

v1 -> v2

- Move to clk_hw based registration for the 3 clock driver as
  requested by Stephen Boyd
- Fixed typo noticed by Stephen Boyd
- Added const and static when they were missing: suggested by Stephen
  Boyd
- Allocated the driver variable during probe instead of using a global
  one as requested by Stephen Boyd
- Managed the failure of the of_clk_add_hw_provider call
- Added the Acked-by from Rob Herring on the dt binding patchs

Gregory CLEMENT (6):
  dt-bindings: clock: add DT binding for the Xtal clock on Armada 3700
  clk: mvebu: Add the xtal clock for Armada 3700 SoC
  dt-bindings: clock: add DT binding for the TBG clocks on Armada 3700
  clk: mvebu Add the time base generator clocks for Armada 3700
  dt-bindings: clock: add DT binding for the peripheral clocks on Armada
    3700
  clk: mvebu: Add the peripheral clock driver for Armada 3700

 .../bindings/clock/armada3700-periph-clock.txt     |  70 ++++
 .../bindings/clock/armada3700-tbg-clock.txt        |  27 ++
 .../bindings/clock/armada3700-xtal-clock.txt       |  28 ++
 drivers/clk/mvebu/Kconfig                          |   3 +
 drivers/clk/mvebu/Makefile                         |   3 +
 drivers/clk/mvebu/armada-37xx-periph.c             | 457 +++++++++++++++++++++
 drivers/clk/mvebu/armada-37xx-tbg.c                | 165 ++++++++
 drivers/clk/mvebu/armada-37xx-xtal.c               |  98 +++++
 8 files changed, 851 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/armada3700-tbg-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/armada3700-xtal-clock.txt
 create mode 100644 drivers/clk/mvebu/armada-37xx-periph.c
 create mode 100644 drivers/clk/mvebu/armada-37xx-tbg.c
 create mode 100644 drivers/clk/mvebu/armada-37xx-xtal.c

-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
