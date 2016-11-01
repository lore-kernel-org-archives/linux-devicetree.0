From: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 0/3] imx: add imx6ull support
Date: Tue, 1 Nov 2016 11:02:20 +0800
Message-ID: <1477969343-19887-1-git-send-email-peter.chen@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Shawn,

In this series, it adds support for imx6ull SoC which is a derived SoC
from imx6ul, and imx6ull is pin-to-pin compatible with imx6ul, the
basic functions are tested at imx6ull evk.

Bai Ping (1):
  clk: imx: clk-imx6ul: add clk support for imx6ull

Peter Chen (2):
  ARM: imx6u: add imx6ull support
  ARM: imx: mach-imx6ul: add imx6ull support

 arch/arm/boot/dts/Makefile               |   3 +-
 arch/arm/boot/dts/imx6u-14x14-evk.dts    | 475 ++++++++++++++++
 arch/arm/boot/dts/imx6u-14x14-evk.dtsi   | 487 ++++++++++++++++
 arch/arm/boot/dts/imx6u.dtsi             | 942 +++++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx6ul-14x14-evk.dts   | 479 +---------------
 arch/arm/boot/dts/imx6ul.dtsi            | 936 +-----------------------------
 arch/arm/boot/dts/imx6ull-14x14-evk.dts  |  17 +
 arch/arm/boot/dts/imx6ull-pinfunc.h      |  57 ++
 arch/arm/boot/dts/imx6ull.dtsi           |  10 +
 arch/arm/mach-imx/mach-imx6ul.c          |   3 +-
 drivers/clk/imx/clk-imx6ul.c             |  74 ++-
 include/dt-bindings/clock/imx6ul-clock.h |  15 +-
 12 files changed, 2072 insertions(+), 1426 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6u-14x14-evk.dts
 create mode 100644 arch/arm/boot/dts/imx6u-14x14-evk.dtsi
 create mode 100644 arch/arm/boot/dts/imx6u.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ull-14x14-evk.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-pinfunc.h
 create mode 100644 arch/arm/boot/dts/imx6ull.dtsi

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
