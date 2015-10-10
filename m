From: Shengjiu Wang <shengjiu.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH V3 0/2] Add SPDIF_GCLK clock in clock tree for imx6
Date: Sat, 10 Oct 2015 18:15:05 +0800
Message-ID: <cover.1444471684.git.shengjiu.wang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add SPDIF_GCLK clock in clock tree

Shengjiu Wang (2):
  clk: imx6: Add SPDIF_GCLK clock in clock tree
  ARM: dts: imx6: change the core clock of spdif

Changes in v3:
- refine the commit logs.

 arch/arm/boot/dts/imx6qdl.dtsi            | 12 ++++++------
 arch/arm/boot/dts/imx6sl.dtsi             | 16 ++++++++++++++++
 arch/arm/boot/dts/imx6sx.dtsi             |  2 +-
 drivers/clk/imx/clk-imx6q.c               |  4 +++-
 drivers/clk/imx/clk-imx6sl.c              |  4 +++-
 drivers/clk/imx/clk-imx6sx.c              |  1 +
 include/dt-bindings/clock/imx6qdl-clock.h |  3 ++-
 include/dt-bindings/clock/imx6sl-clock.h  |  3 ++-
 include/dt-bindings/clock/imx6sx-clock.h  |  3 ++-
 9 files changed, 36 insertions(+), 12 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
