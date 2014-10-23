From: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: dts: hip04: NAND controller support
Date: Thu, 23 Oct 2014 16:24:09 +0800
Message-ID: <1414052649-17868-1-git-send-email-wangzhou.bry@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Kevin Hilman <khilman-1D3HCaltpLuhEniVeURVKkEOCMrvLtNR@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds dts support of NAND flash controller for Hisilicon Soc Hip04.
The patch is based on v3.18-rc1. I have tested that NAND flash controller
works fine in Hip04 D01 board.

Signed-off-by: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/hip04.dtsi |   30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/hip04.dtsi b/arch/arm/boot/dts/hip04.dtsi
index 93b6c90..642a160 100644
--- a/arch/arm/boot/dts/hip04.dtsi
+++ b/arch/arm/boot/dts/hip04.dtsi
@@ -263,5 +263,35 @@
 			interrupts = <0 372 4>;
 		};
 
+		nand: nand@4020000 {
+			compatible = "hisilicon,504-nfc";
+			reg = <0x4020000 0x10000>, <0x5000000 0x1000>;
+			interrupts = <0 379 4>;
+			nand-bus-width = <8>;
+			nand-ecc-mode = "none";
+			hisi,nand-ecc-bits = <0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "nand_text";
+				reg = <0x00000000 0x00400000>;
+			};
+
+			partition@00400000 {
+				label = "nand_monitor";
+				reg = <0x00400000 0x00400000>;
+			};
+
+			partition@00800000 {
+				label = "nand_kernel";
+				reg = <0x00800000 0x00800000>;
+			};
+
+			partition@01000000 {
+				label = "nand_fs";
+				reg = <0x01000000 0x1f000000>;
+			};
+		};
 	};
 };
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
