From: Juergen Borleis <jbe@pengutronix.de>
Subject: [PATCH 8/9] ARM: dts: TQma53: move network phy reset GPIO where it belongs to
Date: Thu,  7 Sep 2017 11:05:29 +0200
Message-ID: <20170907090530.1241-9-jbe@pengutronix.de>
References: <20170907090530.1241-1-jbe@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170907090530.1241-1-jbe@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux@armlinux.org.uk
List-Id: devicetree@vger.kernel.org

Signal has an external pullup and works with weakest settings (driver
strength and speed).

Signed-off-by: Juergen Borleis <jbe@pengutronix.de>
---
 arch/arm/boot/dts/imx53-mba53.dts   | 7 +++++++
 arch/arm/boot/dts/imx53-tqma53.dtsi | 1 -
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx53-mba53.dts b/arch/arm/boot/dts/imx53-mba53.dts
index 5b9e9af14aa6c..fb50ed8cc8f47 100644
--- a/arch/arm/boot/dts/imx53-mba53.dts
+++ b/arch/arm/boot/dts/imx53-mba53.dts
@@ -139,6 +139,12 @@
 				MX53_PAD_EIM_DA15__IPU_DI1_PIN4	   0xe6
 			>;
 		};
+
+		pinctrl_fec_reset: fecreset-grp {
+			fsl,pins = <
+				MX53_PAD_PATA_DA_0__GPIO7_6	0x00000000
+			>;
+		};
 	};
 };
 
@@ -180,6 +186,7 @@
 };
 
 &fec {
+	pinctrl-0 = <&pinctrl_fec>, <&pinctrl_fec_reset>;
 	phy-reset-gpios = <&gpio7 6 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/imx53-tqma53.dtsi b/arch/arm/boot/dts/imx53-tqma53.dtsi
index 1c5cd103ed841..1ab5fbab1d728 100644
--- a/arch/arm/boot/dts/imx53-tqma53.dtsi
+++ b/arch/arm/boot/dts/imx53-tqma53.dtsi
@@ -78,7 +78,6 @@
 				 MX53_PAD_PATA_DATA15__GPIO2_15  0x80000000 /* CSI_PWDN */
 				 MX53_PAD_GPIO_19__GPIO4_5 	 0x80000000 /* #SYSTEM_DOWN */
 				 MX53_PAD_GPIO_3__GPIO1_3        0x80000000
-				 MX53_PAD_PATA_DA_0__GPIO7_6	 0x80000000 /* #PHY_RESET */
 				 MX53_PAD_GPIO_1__PWM2_PWMO	 0x80000000 /* LCD_CONTRAST */
 			>;
 		};
-- 
2.11.0
