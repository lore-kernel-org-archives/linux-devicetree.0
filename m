From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 5/5] ARM: dts: imx6q-icore-ofcap12: Switch LVDS timings from panel-simple
Date: Tue,  2 Jan 2018 14:32:18 +0530
Message-ID: <1514883738-16297-5-git-send-email-jagan@amarulasolutions.com>
References: <1514883738-16297-1-git-send-email-jagan@amarulasolutions.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1514883738-16297-1-git-send-email-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Matteo Lisi <matteo.lisi@engicam.com>, Michael Trimarchi <michael@amarulasolutions.com>, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Switch to use koe_tx31d200vm0baa LVDS timings from
panel-simple instead hard coding the same in dts.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm/boot/dts/imx6q-icore-ofcap12.dts | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/imx6q-icore-ofcap12.dts b/arch/arm/boot/dts/imx6q-icore-ofcap12.dts
index 9e230f5..6e27c81 100644
--- a/arch/arm/boot/dts/imx6q-icore-ofcap12.dts
+++ b/arch/arm/boot/dts/imx6q-icore-ofcap12.dts
@@ -48,28 +48,31 @@
 / {
 	model = "Engicam i.CoreM6 Quad/Dual OpenFrame Capacitive touch 12 Kit";
 	compatible = "engicam,imx6-icore", "fsl,imx6q";
+
+	panel {
+		compatible = "koe,tx31d200vm0baa";
+		backlight = <&backlight_lvds>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&lvds0_out>;
+			};
+		};
+	};
 };
 
 &ldb {
 	status = "okay";
 
 	lvds-channel@0 {
-		fsl,data-mapping = "spwg";
-		fsl,data-width = <18>;
+		reg = <0>;
 		status = "okay";
 
-		display-timings {
-			native-mode = <&timing0>;
-			timing0: timing0 {
-				clock-frequency = <46800000>;
-				hactive = <1280>;
-				vactive = <480>;
-				hback-porch = <353>;
-				hfront-porch = <47>;
-				vback-porch = <39>;
-				vfront-porch = <4>;
-				hsync-len = <8>;
-				vsync-len = <2>;
+		port@4 {
+			reg = <4>;
+
+			lvds0_out: endpoint {
+				remote-endpoint = <&panel_in>;
 			};
 		};
 	};
-- 
2.7.4
