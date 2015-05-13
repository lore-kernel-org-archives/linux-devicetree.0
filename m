From: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v4 04/11] ARM: bcm7445: add NAND to DTS
Date: Tue, 12 May 2015 17:53:37 -0700
Message-ID: <1431478424-29230-5-git-send-email-computersforpeace@gmail.com>
References: <1431478424-29230-1-git-send-email-computersforpeace@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431478424-29230-1-git-send-email-computersforpeace@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: Brian Norris <computersforpeace@gmail.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Dan Ehrenberg <dehrenberg@chromium.org>, Gregory Fong <gregory.0xf0@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---
v4: no change

 arch/arm/boot/dts/bcm7445-bcm97445svmb.dts | 23 +++++++++++++++++++++++
 arch/arm/boot/dts/bcm7445.dtsi             | 22 ++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/bcm7445-bcm97445svmb.dts b/arch/arm/boot/dts/bcm7445-bcm97445svmb.dts
index 9eec2ac1112f..0bb8d17e4c2d 100644
--- a/arch/arm/boot/dts/bcm7445-bcm97445svmb.dts
+++ b/arch/arm/boot/dts/bcm7445-bcm97445svmb.dts
@@ -12,3 +12,26 @@
 		      <0x00 0x80000000 0x00 0x40000000>;
 	};
 };
+
+&nand {
+	status = "okay";
+
+	nandcs@1 {
+		compatible = "brcm,nandcs";
+		reg = <1>;
+		nand-ecc-step-size = <512>;
+		nand-ecc-strength = <8>;
+		nand-on-flash-bbt;
+
+		#size-cells = <2>;
+		#address-cells = <2>;
+
+		flash1.rootfs0@0 {
+			reg = <0x0 0x0 0x0 0x80000000>;
+		};
+
+		flash1.rootfs1@80000000 {
+			reg = <0x0 0x80000000 0x0 0x80000000>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/bcm7445.dtsi b/arch/arm/boot/dts/bcm7445.dtsi
index 39ac7840d7ee..33447d82b7cf 100644
--- a/arch/arm/boot/dts/bcm7445.dtsi
+++ b/arch/arm/boot/dts/bcm7445.dtsi
@@ -108,6 +108,28 @@
 			brcm,int-map-mask = <0x25c>, <0x7000000>;
 			brcm,int-fwd-mask = <0x70000>;
 		};
+
+		hif_intr2_intc: interrupt-controller@3e1000 {
+			compatible = "brcm,l2-intc";
+			reg = <0x3e1000 0x30>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			interrupts = <GIC_SPI 0x20 0x0>;
+			interrupt-parent = <&gic>;
+			interrupt-names = "hif";
+		};
+
+		nand: nand@3e2800 {
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,brcmnand-v7.1", "brcm,brcmnand";
+			reg-names = "nand", "flash-dma";
+			reg = <0x3e2800 0x600>, <0x3e3000 0x2c>;
+			interrupt-parent = <&hif_intr2_intc>;
+			interrupts = <24>, <4>;
+			interrupt-names = "nand_ctlrdy", "flash_dma_done";
+		};
 	};
 
 	smpboot {
-- 
1.9.1
