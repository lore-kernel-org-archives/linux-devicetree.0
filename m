From: Scott Branden <scott.branden@broadcom.com>
Subject: [PATCH 2/6] ARM: dts: cygnus: place v3d in proper address ordered location
Date: Tue, 15 Aug 2017 10:25:59 -0700
Message-ID: <1502817964-8221-3-git-send-email-scott.branden@broadcom.com>
References: <1502817964-8221-1-git-send-email-scott.branden@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502817964-8221-1-git-send-email-scott.branden@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@arm.linux.org.uk>, Ray Jui <ray.jui@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Scott Branden <scott.branden@broadcom.com>
List-Id: devicetree@vger.kernel.org

Move v3d devicetree node to proper address ordered location in Cygnus
dtsi.

Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 arch/arm/boot/dts/bcm-cygnus.dtsi | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
index e4d07f4..2077fee 100644
--- a/arch/arm/boot/dts/bcm-cygnus.dtsi
+++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
@@ -366,6 +366,19 @@
 			brcm,nand-has-wp;
 		};
 
+		v3d: v3d@180a2000 {
+			compatible = "brcm,cygnus-v3d";
+			reg = <0x180a2000 0x1000>;
+			clocks = <&mipipll BCM_CYGNUS_MIPIPLL_CH2_V3D>;
+			clock-names = "v3d_clk";
+			interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		vc4: gpu {
+			compatible = "brcm,cygnus-vc4";
+		};
+
 		gpio_asiu: gpio@180a5000 {
 			compatible = "brcm,cygnus-asiu-gpio";
 			reg = <0x180a5000 0x668>;
@@ -444,19 +457,6 @@
 			status = "disabled";
 		};
 
-		v3d: v3d@180a2000 {
-			compatible = "brcm,cygnus-v3d";
-			reg = <0x180a2000 0x1000>;
-			clocks = <&mipipll BCM_CYGNUS_MIPIPLL_CH2_V3D>;
-			clock-names = "v3d_clk";
-			interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>;
-			status = "disabled";
-		};
-
-		vc4: gpu {
-			compatible = "brcm,cygnus-vc4";
-		};
-
 		adc: adc@180a6000 {
 			compatible = "brcm,iproc-static-adc";
 			#io-channel-cells = <1>;
-- 
2.5.0
