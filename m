From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH] ARM: dts: imx53-tx53: fix interrupt flags
Date: Mon, 23 Oct 2017 16:56:40 +0200
Message-ID: <1508770600-28496-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

Some interrupts properties are given '0' as the flags argument or no
flags argument at all.
Change them to use the appropriate interrupt flags.

Signed-off-by: Lothar Waßmann <LW@KARO-electronics.de>
---
 arch/arm/boot/dts/imx53-tx53-x03x.dts | 2 +-
 arch/arm/boot/dts/imx53-tx53.dtsi     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/imx53-tx53-x03x.dts b/arch/arm/boot/dts/imx53-tx53-x03x.dts
index aa9ae84..eb5b452 100644
--- a/arch/arm/boot/dts/imx53-tx53-x03x.dts
+++ b/arch/arm/boot/dts/imx53-tx53-x03x.dts
@@ -254,7 +254,7 @@
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_tsc2007>;
 		interrupt-parent = <&gpio3>;
-		interrupts = <26 0>;
+		interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
 		gpios = <&gpio3 26 GPIO_ACTIVE_LOW>;
 		ti,x-plate-ohms = <660>;
 		wakeup-source;
diff --git a/arch/arm/boot/dts/imx53-tx53.dtsi b/arch/arm/boot/dts/imx53-tx53.dtsi
index 8e10c47..71b58b6 100644
--- a/arch/arm/boot/dts/imx53-tx53.dtsi
+++ b/arch/arm/boot/dts/imx53-tx53.dtsi
@@ -227,7 +227,7 @@
 
 	phy0: ethernet-phy@0 {
 		interrupt-parent = <&gpio2>;
-		interrupts = <4>;
+		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
 		device_type = "ethernet-phy";
 	};
 };
@@ -247,7 +247,7 @@
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_ds1339>;
 		interrupt-parent = <&gpio4>;
-		interrupts = <20 0>;
+		interrupts = <20 IRQ_TYPE_EDGE_FALLING>;
 		trickle-resistor-ohms = <250>;
 		trickle-diode-disable;
 	};
-- 
2.1.4
