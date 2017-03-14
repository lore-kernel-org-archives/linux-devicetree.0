From: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v5 0/8] arm: dts: imx6q-icore: Add LVDS display nodes
Date: Tue, 14 Mar 2017 15:18:09 +0530
Message-ID: <1489484897-14933-1-git-send-email-jagan@openedev.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>

This series adds support for lvds display, touchscreen nodes on dts for
Engicam i.CoreM6 Quad boards along with selecting few touchscreen driver
configs to imx_v6_v7_defconfig so-that select by default.

Jagan Teki (8):
  ARM: dts: imx6qdl-icore: Add backlight support for lvds
  ARM: dts: imx6q: Add Engicam i.CoreM6 Quad/Dual OpenFrame Cap 10.1
    initial support
  ARM: dts: imx6q: Add Engicam i.CoreM6 Quad/Dual OpenFrame Cap 12.3
    initial support
  ARM: dts: imx6q-icore: Add LVDS support
  dt-bindings: input: touchscreen: Add max11801-ts binding
  ARM: dts: imx6q-icore: Add touchscreen node
  ARM: imx_v6_v7_defconfig: Select max11801_ts touchscreen driver
  ARM: imx_v6_v7_defconfig: Select hid-multitouchdriver

 .../bindings/input/touchscreen/max11801-ts.txt     | 18 +++++
 arch/arm/boot/dts/Makefile                         |  2 +
 arch/arm/boot/dts/imx6q-icore-ofcap10.dts          | 76 ++++++++++++++++++++++
 arch/arm/boot/dts/imx6q-icore-ofcap12.dts          | 76 ++++++++++++++++++++++
 arch/arm/boot/dts/imx6q-icore.dts                  | 34 ++++++++++
 arch/arm/boot/dts/imx6qdl-icore.dtsi               | 19 ++++++
 arch/arm/configs/imx_v6_v7_defconfig               |  2 +
 7 files changed, 227 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/max11801-ts.txt
 create mode 100644 arch/arm/boot/dts/imx6q-icore-ofcap10.dts
 create mode 100644 arch/arm/boot/dts/imx6q-icore-ofcap12.dts

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
