From: Cory Tusar <cory.tusar@pid1solutions.com>
Subject: [PATCH] ARM: dts: vf610: Extend I2C support to all available buses.
Date: Sun, 14 Jun 2015 20:19:59 -0400
Message-ID: <1434327599-3739-1-git-send-email-cory.tusar@pid1solutions.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawn.guo@linaro.org, kernel@pengutronix.de, stefan@agner.ch
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, andrew@lunn.ch, Cory Tusar <cory.tusar@pid1solutions.com>
List-Id: devicetree@vger.kernel.org

This commit extends the existing Vybrid I2C support to cover buses i2c1,
i2c2, and i2c3.  Based in (very) large part on an initial patch by
Stefan Agner that was just lacking a couple of DMA assignments.

Signed-off-by: Cory Tusar <cory.tusar@pid1solutions.com>
---
 arch/arm/boot/dts/vfxxx.dtsi | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
index 4aa3351..25f2615 100644
--- a/arch/arm/boot/dts/vfxxx.dtsi
+++ b/arch/arm/boot/dts/vfxxx.dtsi
@@ -347,6 +347,20 @@
 				status = "disabled";
 			};
 
+			i2c1: i2c@40067000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,vf610-i2c";
+				reg = <0x40067000 0x1000>;
+				interrupts = <72 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks VF610_CLK_I2C1>;
+				clock-names = "ipg";
+				dmas = <&edma0 0 52>,
+					<&edma0 0 53>;
+				dma-names = "rx","tx";
+				status = "disabled";
+			};
+
 			clks: ccm@4006b000 {
 				compatible = "fsl,vf610-ccm";
 				reg = <0x4006b000 0x1000>;
@@ -520,6 +534,33 @@
 				status = "disabled";
 			};
 
+			i2c2: i2c@400e6000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,vf610-i2c";
+				reg = <0x400e6000 0x1000>;
+				interrupts = <73 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks VF610_CLK_I2C2>;
+				clock-names = "ipg";
+				dmas = <&edma0 1 36>,
+					<&edma0 1 37>;
+				dma-names = "rx","tx";
+				status = "disabled";
+			};
+
+			i2c3: i2c@400e7000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,vf610-i2c";
+				reg = <0x400e7000 0x1000>;
+				interrupts = <74 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks VF610_CLK_I2C3>;
+				clock-names = "ipg";
+				dmas = <&edma0 1 38>,
+					<&edma0 1 39>;
+				dma-names = "rx","tx";
+				status = "disabled";
+			};
 		};
 	};
 };
-- 
2.3.6
