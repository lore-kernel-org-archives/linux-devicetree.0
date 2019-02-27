Return-Path: <SRS0=iAyG=RC=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr30057.outbound.protection.outlook.com ([40.107.3.57]:42641
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726724AbfB0Iq5 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 27 Feb 2019 03:46:57 -0500
From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V10 4/4] arm64: dts: imx: add i.MX8QXP thermal support
Date: Wed, 27 Feb 2019 08:46:50 +0000
Message-ID: <1551256894-21954-4-git-send-email-Anson.Huang@nxp.com>
References: <1551256894-21954-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1551256894-21954-1-git-send-email-Anson.Huang@nxp.com>
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
Changes since V9:
	- change #thermal-sensor-cells value in to 1, since there are other
	  thermal sensors inside system controller, it is just because there are s=
till
	  some issue, so system controller does NOT expose them for now, they coul=
d
	  be exposed later, so it should be 1 from HW perspective.
---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 34 ++++++++++++++++++++++++++=
++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/d=
ts/freescale/imx8qxp.dtsi
index 4c3dd95..f532cba 100644
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
@@ -116,6 +117,12 @@
 		rtc: rtc {
 			compatible =3D "fsl,imx8qxp-sc-rtc";
 		};
+
+		tsens: thermal-sensor {
+			compatible =3D "fsl,imx8qxp-sc-thermal", "fsl,imx-sc-thermal";
+			#thermal-sensor-cells =3D <1>;
+			imx,sensor-resource-id =3D <IMX_SC_R_SYSTEM>;
+		};
 	};
=20
 	timer {
@@ -443,4 +450,31 @@
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
