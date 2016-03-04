From: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
Subject: [PATCH 1/1] arm64: dts: Enable GPIO for Broadcom NS2 SoC
Date: Fri,  4 Mar 2016 05:23:30 -0500
Message-ID: <1457087010-26306-1-git-send-email-yendapally.reddy@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
List-Id: devicetree@vger.kernel.org

This enables the GPIO support for Broadcom NS2 SoC

Signed-off-by: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/ns2.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi b/arch/arm64/boot/dts/broadcom/ns2.dtsi
index a510d3a..dbe89d7 100644
--- a/arch/arm64/boot/dts/broadcom/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi
@@ -246,6 +246,15 @@
 			mask = <0xfffffffd>;
 		};
 
+		gpio_aon: gpio@65024800 {
+			compatible = "brcm,iproc-gpio";
+			reg = <0x65024800 0x50>,
+			      <0x65024008 0x18>;
+			ngpios = <6>;
+			#gpio-cells = <2>;
+			gpio-controller;
+		};
+
 		gic: interrupt-controller@65210000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
@@ -266,6 +275,16 @@
 			status = "disabled";
 		};
 
+		gpio_g: gpio@660a0000 {
+			compatible = "brcm,iproc-gpio";
+			reg = <0x660a0000 0x50>;
+			ngpios = <32>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			interrupt-controller;
+			interrupts = <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		i2c1: i2c@660b0000 {
 			compatible = "brcm,iproc-i2c";
 			reg = <0x660b0000 0x100>;
-- 
2.1.0
