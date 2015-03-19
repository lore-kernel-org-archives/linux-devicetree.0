From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 4/4] ARM: bcm7445: add NAND to DTS
Date: Wed, 18 Mar 2015 19:49:18 -0700
Message-ID: <1426733358-15596-5-git-send-email-computersforpeace@gmail.com>
References: <1426733358-15596-1-git-send-email-computersforpeace@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426733358-15596-1-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazao <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Corneliu Doban <cdoban-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Dan Ehrenberg <dehrenberg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Light dependency on:
  http://lists.infradead.org/pipermail/linux-arm-kernel/2015-March/331921.html
for the surrounding text.

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
index 9eaeac8dce1b..c148dcf8c69b 100644
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
+			interrupts = <0x0 0x20 0x0>;
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
