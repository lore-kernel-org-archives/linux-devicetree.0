From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH] ARM: dts: imx28-tx28: fix interrupt flags
Date: Mon, 23 Oct 2017 14:36:26 +0200
Message-ID: <1508762186-17522-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

Some interrupts properties are given '0' as the flags argument.
Change them to use the appropriate interrupt flags.

Signed-off-by: Lothar Waßmann <LW@KARO-electronics.de>
---
 arch/arm/boot/dts/imx28-tx28.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx28-tx28.dts b/arch/arm/boot/dts/imx28-tx28.dts
index 211e67d..52d99b4 100644
--- a/arch/arm/boot/dts/imx28-tx28.dts
+++ b/arch/arm/boot/dts/imx28-tx28.dts
@@ -329,7 +329,7 @@
 		pinctrl-names = "default";
 		pinctrl-0 = <&tx28_pca9554_pins>;
 		interrupt-parent = <&gpio3>;
-		interrupts = <28 0>;
+		interrupts = <28 IRQ_TYPE_NONE>;
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-controller;
@@ -353,7 +353,7 @@
 		pinctrl-names = "default";
 		pinctrl-0 = <&tx28_tsc2007_pins>;
 		interrupt-parent = <&gpio3>;
-		interrupts = <20 0>;
+		interrupts = <20 IRQ_TYPE_EDGE_FALLING>;
 		pendown-gpio = <&gpio3 20 GPIO_ACTIVE_LOW>;
 		ti,x-plate-ohms = /bits/ 16 <660>;
 	};
-- 
2.1.4
