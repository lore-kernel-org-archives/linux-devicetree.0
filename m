From: Jagan Teki <jagan@openedev.com>
Subject: [PATCH v3 6/9] ARM: dts: imx6dl-icore: Add LVDS support
Date: Thu,  6 Apr 2017 23:32:12 +0530
Message-ID: <1491501735-1649-7-git-send-email-jagan@openedev.com>
References: <1491501735-1649-1-git-send-email-jagan@openedev.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1491501735-1649-1-git-send-email-jagan@openedev.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Matteo Lisi <matteo.lisi@engicam.com>, Michael Trimarchi <michael@amarulasolutions.com>, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

From: Jagan Teki <jagan@amarulasolutions.com>

Add LVDS display support for OpenFrame Capacitive touch 7 inc
display which is supported by Engicam i.CoreM6 DualLite/Solo Starter Kit.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Matteo Lisi <matteo.lisi@engicam.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3,v2:
- none

 arch/arm/boot/dts/imx6dl-icore.dts | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/imx6dl-icore.dts b/arch/arm/boot/dts/imx6dl-icore.dts
index 0562ce4..ea9ab05 100644
--- a/arch/arm/boot/dts/imx6dl-icore.dts
+++ b/arch/arm/boot/dts/imx6dl-icore.dts
@@ -68,3 +68,28 @@
 		VDDD-supply = <&reg_1p8v>;
 	};
 };
+
+&ldb {
+	status = "okay";
+
+	lvds-channel@0 {
+		fsl,data-mapping = "spwg";
+		fsl,data-width = <18>;
+		status = "okay";
+
+		display-timings {
+			native-mode = <&timing0>;
+			timing0: timing0 {
+				clock-frequency = <60000000>;
+				hactive = <800>;
+				vactive = <480>;
+				hback-porch = <30>;
+				hfront-porch = <30>;
+				vback-porch = <5>;
+				vfront-porch = <5>;
+				hsync-len = <64>;
+				vsync-len = <20>;
+			};
+		};
+	};
+};
-- 
1.9.1
