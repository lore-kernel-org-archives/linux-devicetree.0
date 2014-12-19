From: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>
Subject: [PATCH 3/3] ARM: at91/dt: add EBI (External Bus Interface) node in at91sam9263 dtsi
Date: Fri, 19 Dec 2014 09:51:40 +0100
Message-ID: <1418979100-13243-4-git-send-email-alexanders83@web.de>
References: <1418979100-13243-1-git-send-email-alexanders83@web.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418979100-13243-1-git-send-email-alexanders83-S0/GAf8tV78@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add EBI node to at91sam9263 dtsi.

Signed-off-by: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>
---
 arch/arm/boot/dts/at91sam9263.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/at91sam9263.dtsi b/arch/arm/boot/dts/at91sam9263.dtsi
index 914990b..9d9ab2a 100644
--- a/arch/arm/boot/dts/at91sam9263.dtsi
+++ b/arch/arm/boot/dts/at91sam9263.dtsi
@@ -994,6 +994,22 @@
 			status = "disabled";
 		};
 
+		ebi0: ebi0@10000000 {
+			compatible = "atmel,at91sam9263-ebi0", "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <1>;
+			atmel,smc = <&smc0>;
+			atmel,matrix = <&matrix>;
+			reg = <0x10000000 0x60000000>;
+			ranges = <0x0 0x0 0x10000000 0x10000000
+				  0x1 0x0 0x20000000 0x10000000
+				  0x2 0x0 0x30000000 0x10000000
+				  0x3 0x0 0x40000000 0x10000000
+				  0x4 0x0 0x50000000 0x10000000
+				  0x5 0x0 0x60000000 0x10000000>;
+			clocks = <&mck>;
+		};
+
 		nand0: nand@40000000 {
 			compatible = "atmel,at91rm9200-nand";
 			#address-cells = <1>;
@@ -1012,6 +1028,19 @@
 			status = "disabled";
 		};
 
+		ebi1: ebi1@70000000 {
+			compatible = "atmel,at91sam9263-ebi1", "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <1>;
+			atmel,smc = <&smc1>;
+			atmel,matrix = <&matrix>;
+			reg = <0x70000000 0x30000000>;
+			ranges = <0x0 0x0 0x70000000 0x10000000
+				  0x1 0x0 0x80000000 0x10000000
+				  0x2 0x0 0x90000000 0x10000000>;
+			clocks = <&mck>;
+		};
+
 		usb0: ohci@00a00000 {
 			compatible = "atmel,at91rm9200-ohci", "usb-ohci";
 			reg = <0x00a00000 0x100000>;
-- 
2.2.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
