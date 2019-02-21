Return-Path: <SRS0=TIRm=Q4=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr50077.outbound.protection.outlook.com ([40.107.5.77]:14792
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725986AbfBUGjD (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 21 Feb 2019 01:39:03 -0500
From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V8 4/4] arm64: dts: imx: add i.MX8QXP thermal support
Date: Thu, 21 Feb 2019 06:38:57 +0000
Message-ID: <1550730831-14995-4-git-send-email-Anson.Huang@nxp.com>
References: <1550730831-14995-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1550730831-14995-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "rui.zhang@intel.com" <rui.zhang@intel.com>, "edubezval@gmail.com" <edubezval@gmail.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "sboyd@kernel.org" <sboyd@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, Andy Gross <andy.gross@linaro.org>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, "arnd@arndb.de" <arnd@arndb.de>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "olof@lixom.net" <olof@lixom.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Add i.MX8QXP CPU thermal zone support.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V7:
	- move the "imx,sensor-resource-id" to scu tsens node;
	- correct #thermal-sensor-cells value to be 0 as there is ONLY one thermal=
 zone now;
	- add cooling map for passive mode.
---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 35 ++++++++++++++++++++++++++=
++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/d=
ts/freescale/imx8qxp.dtsi
index 4c3dd95..eccdf28 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/pinctrl/pads-imx8qxp.h>
+#include <dt-bindings/thermal/thermal.h>
=20
 / {
 	interrupt-parent =3D <&gic>;
@@ -34,6 +35,7 @@
 			reg =3D <0x0 0x0>;
 			enable-method =3D "psci";
 			next-level-cache =3D <&A35_L2>;
+			#cooling-cells =3D <2>;
 		};
=20
 		A35_1: cpu@1 {
@@ -116,6 +118,12 @@
 		rtc: rtc {
 			compatible =3D "fsl,imx8qxp-sc-rtc";
 		};
+
+		tsens: thermal-sensor {
+			compatible =3D "fsl,imx8qxp-sc-thermal", "fsl,imx-sc-thermal";
+			#thermal-sensor-cells =3D <0>;
+			imx,sensor-resource-id =3D <IMX_SC_R_SYSTEM>;
+		};
 	};
=20
 	timer {
@@ -443,4 +451,31 @@
 			power-domains =3D <&pd IMX_SC_R_GPIO_7>;
 		};
 	};
+
+	thermal_zones: thermal-zones {
+		cpu-thermal0 {
+			polling-delay-passive =3D <250>;
+			polling-delay =3D <2000>;
+			thermal-sensors =3D <&tsens 0>;
+			trips {
+				cpu_alert0: trip0 {
+					temperature =3D <107000>;
+					hysteresis =3D <2000>;
+					type =3D "passive";
+				};
+				cpu_crit0: trip1 {
+					temperature =3D <127000>;
+					hysteresis =3D <2000>;
+					type =3D "critical";
+				};
+			};
+			cooling-maps {
+				map0 {
+					trip =3D <&cpu_alert0>;
+					cooling-device =3D
+						<&A35_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
 };
--=20
2.7.4
