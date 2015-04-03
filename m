From: <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCH 0/3] clk: socfpga: Add clock driver for Arria10
Date: Thu, 2 Apr 2015 23:40:52 -0500
Message-ID: <1428036055-27607-1-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

Hi,

This patch series add the clock driver for the Arria10 platform. Although the
Arria10 SoC's clock framework has some similarities the Cyclone/Arria 5, the
differences are enough to warrant it's own driver, rather than polluting the
existing driver with platform lookups.

Dinh Nguyen (3):
  clk: socfpga: update clk.h so for Arria10 platform to use
  clk: socfpga: add a clock driver for the Arria 10 platform
  ARM: socfpga: dts: add clocks to the Arria10 platform

 arch/arm/boot/dts/socfpga_arria10.dtsi | 298 ++++++++++++++++++++++++++++++++-
 drivers/clk/socfpga/Makefile           |   1 +
 drivers/clk/socfpga/clk-gate-a10.c     | 187 +++++++++++++++++++++
 drivers/clk/socfpga/clk-gate.c         |   4 -
 drivers/clk/socfpga/clk-periph-a10.c   | 131 +++++++++++++++
 drivers/clk/socfpga/clk-pll-a10.c      | 132 +++++++++++++++
 drivers/clk/socfpga/clk.c              |   7 +-
 drivers/clk/socfpga/clk.h              |  10 +-
 8 files changed, 760 insertions(+), 10 deletions(-)
 create mode 100644 drivers/clk/socfpga/clk-gate-a10.c
 create mode 100644 drivers/clk/socfpga/clk-periph-a10.c
 create mode 100644 drivers/clk/socfpga/clk-pll-a10.c

-- 
2.2.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
