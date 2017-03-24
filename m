From: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 00/15] ARM: dts: i.MX6: Add lcdif/sound nodes on Engicam SOMs
Date: Fri, 24 Mar 2017 21:48:35 +0530
Message-ID: <1490372330-5611-1-git-send-email-jagan@openedev.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>

This patchset, add support for backlight, lcdif, touchscreen,
sound card and related codec and can nodes all Engicam SOM's
which are supporting mainline as of now.

Jagan Teki (15):
  ARM: dts: imx6ul-geam: Add backlight support for lcdif
  ARM: dts: imx6ul-isiot: Add backlight support for lcdif
  ARM: dts: imx6ul-isiot: Add imx6ul-isiot-common.dtsi
  ARM: dts: imx6ul-isiot: Add i2c nodes
  ARM: dts: imx6ul-isiot-common: Add touchscreen node
  ARM: dts: imx6ul-[geam|isiot]: Add sai2 node
  ARM: dts: imx6ul-isiot: Add Sound card with codec node
  ARM: dts: imx6ul-geam: Add Sound card with codec node
  ARM: dts: imx6qdl-icore: Add Sound card with codec node
  ARM: dts: imx6dl-icore-rqs: Add sgtl5000 codec node
  ARM: dts: imx6qdl-icore-rqs: Replace codec 'lable: node@addr'
  ARM: dts: imx6dl-icore: Add LVDS support
  ARM: dts: imx6dl-icore: Add touchscreen node
  ARM: dts: imx6qdl-icore-rqs: Add CAN nodes
  ARM: dts: imx6ul-isiot: Add FEC node support

 arch/arm/boot/dts/imx6dl-icore-rqs.dts     |  19 ++++
 arch/arm/boot/dts/imx6dl-icore.dts         |  45 +++++++++
 arch/arm/boot/dts/imx6q-icore-ofcap10.dts  |  11 +++
 arch/arm/boot/dts/imx6q-icore-ofcap12.dts  |  11 +++
 arch/arm/boot/dts/imx6q-icore-rqs.dts      |  21 ++--
 arch/arm/boot/dts/imx6q-icore.dts          |  11 +++
 arch/arm/boot/dts/imx6qdl-icore-rqs.dtsi   |  39 ++++++++
 arch/arm/boot/dts/imx6qdl-icore.dtsi       |  37 +++++++
 arch/arm/boot/dts/imx6ul-geam-kit.dts      |  12 +++
 arch/arm/boot/dts/imx6ul-geam.dtsi         |  56 +++++++++++
 arch/arm/boot/dts/imx6ul-isiot-common.dtsi | 151 +++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx6ul-isiot-emmc.dts    |   1 +
 arch/arm/boot/dts/imx6ul-isiot-nand.dts    |   1 +
 arch/arm/boot/dts/imx6ul-isiot.dtsi        | 135 ++++++++++++++++++++++++++
 14 files changed, 537 insertions(+), 13 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6ul-isiot-common.dtsi

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
