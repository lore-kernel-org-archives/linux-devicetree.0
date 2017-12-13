From: Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] arm64: dts: stratix10: add USB ECC reset bit
Date: Wed, 13 Dec 2017 08:14:31 -0600
Message-ID: <1513174471-17567-1-git-send-email-dinguyen@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The USB IP on the Stratix10 SoC needs the USB OCP(ecc) bit to get de-asserted
as well for the USB IP to work properly.

Signed-off-by: Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index 11ce068..7366a58 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -327,8 +327,8 @@
 			compatible = "snps,dwc2";
 			reg = <0xffb00000 0x40000>;
 			interrupts = <0 93 4>;
-			resets = <&rst USB0_RESET>;
-			reset-names = "dwc2";
+			resets = <&rst USB0_RESET>, <&rst USB0_OCP_RESET>;
+			reset-names = "dwc2", "dwc2-ecc";
 			status = "disabled";
 		};
 
@@ -336,8 +336,8 @@
 			compatible = "snps,dwc2";
 			reg = <0xffb40000 0x40000>;
 			interrupts = <0 94 4>;
-			resets = <&rst USB1_RESET>;
-			reset-names = "dwc2";
+			resets = <&rst USB1_RESET>, <&rst USB1_OCP_RESET>;
+			reset-names = "dwc2", "dwc2-ecc";
 			status = "disabled";
 		};
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
