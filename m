From: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH v3 0/3] imx: add imx6ull support
Date: Mon, 14 Nov 2016 15:04:19 +0800
Message-ID: <1479107062-15365-1-git-send-email-peter.chen@nxp.com>
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
basic functions are tested at imx6ull 14x14 evk, and imx6ul 14x14 evk
is tested too to avoid regression.

Changes for v3:
- Keep imx6ul-14x14-evk.dts unchanging, and let imx6ull-14x14-evk.dts
  include it. [Patch 1/3]

Changes for v2:
- Keep imx6ul.dtsi unchanging, and using GPL/X11 dual license
  for new dts file. [Patch 1/3]
- Using IMX6ULL prefix for both imx6ull dedicated pin and clock name.
  [Patch 1/3, 3/3]
- Delete useless changes for patch 2/3.
- Delete blank line for patch 3/3.
- Using assigned-clocks for imx6ull 14x14 evk. [Patch 1/3, 3/3]

Bai Ping (1):
  clk: imx: clk-imx6ul: add clk support for imx6ull

Peter Chen (2):
  ARM: imx6ull: add imx6ull support
  ARM: imx: mach-imx6ul: add imx6ull support

 arch/arm/boot/dts/Makefile               |  3 +-
 arch/arm/boot/dts/imx6ull-14x14-evk.dts  | 52 +++++++++++++++++++++++
 arch/arm/boot/dts/imx6ull-pinfunc.h      | 56 +++++++++++++++++++++++++
 arch/arm/boot/dts/imx6ull.dtsi           | 43 +++++++++++++++++++
 arch/arm/mach-imx/mach-imx6ul.c          |  1 +
 drivers/clk/imx/clk-imx6ul.c             | 72 +++++++++++++++++++++++++++-----
 include/dt-bindings/clock/imx6ul-clock.h | 15 ++++++-
 7 files changed, 229 insertions(+), 13 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6ull-14x14-evk.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-pinfunc.h
 create mode 100644 arch/arm/boot/dts/imx6ull.dtsi

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
