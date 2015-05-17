From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: [PATCH 7/7] ARM: BCM5301X: add NAND flash chip description
Date: Sun, 17 May 2015 17:41:06 +0200
Message-ID: <1431877266-28566-8-git-send-email-hauke@hauke-m.de>
References: <1431877266-28566-1-git-send-email-hauke@hauke-m.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431877266-28566-1-git-send-email-hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds the NAND flash chip description for a standard chip found
connected to this SoC. The IRQ is fetched from the device tree
definition of the axi bus for this core and the memory ranges are
automatically probed.

Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
---
 arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts | 12 +++++-------
 arch/arm/boot/dts/bcm5301x.dtsi              | 19 +++++++++++++++++++
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts b/arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts
index 946c728..0529682 100644
--- a/arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts
+++ b/arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts
@@ -25,13 +25,11 @@
 
 	axi@18000000 {
 		nand@28000 {
-			reg = <0x00028000 0x1000>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			partition@0 {
-				label = "ubi";
-				reg = <0x00000000 0x08000000>;
+			nandcs@0 {
+				partition@0 {
+					label = "ubi";
+					reg = <0x00000000 0x08000000>;
+				};
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/bcm5301x.dtsi b/arch/arm/boot/dts/bcm5301x.dtsi
index 78aec62..1bccb59 100644
--- a/arch/arm/boot/dts/bcm5301x.dtsi
+++ b/arch/arm/boot/dts/bcm5301x.dtsi
@@ -142,5 +142,24 @@
 			gpio-controller;
 			#gpio-cells = <2>;
 		};
+
+		nand: nand@28000 {
+			reg = <0x00028000 0x1000>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			brcm,nand-has-wp;
+
+			nandcs@0 {
+				compatible = "brcm,nandcs";
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				nand-ecc-strength = <8>;
+				nand-ecc-step-size = <512>;
+			};
+		};
 	};
 };
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
