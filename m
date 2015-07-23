From: <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCH 2/3] ARM: socfpga: dts: Fix gpio dts entry for the correct clock
Date: Wed, 22 Jul 2015 22:30:06 -0500
Message-ID: <1437622207-1760-2-git-send-email-dinguyen@opensource.altera.com>
References: <1437622207-1760-1-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437622207-1760-1-git-send-email-dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org
Cc: dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

The correct clock for the HPS gpio(s) should be the l4_mp_clk.

Signed-off-by: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
---
 arch/arm/boot/dts/socfpga.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index 7860935..b0acaec 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -565,7 +565,7 @@
 			#size-cells = <0>;
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff708000 0x1000>;
-			clocks = <&per_base_clk>;
+			clocks = <&l4_mp_clk>;
 			status = "disabled";
 
 			porta: gpio-controller@0 {
@@ -585,7 +585,7 @@
 			#size-cells = <0>;
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff709000 0x1000>;
-			clocks = <&per_base_clk>;
+			clocks = <&l4_mp_clk>;
 			status = "disabled";
 
 			portb: gpio-controller@0 {
@@ -605,7 +605,7 @@
 			#size-cells = <0>;
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff70a000 0x1000>;
-			clocks = <&per_base_clk>;
+			clocks = <&l4_mp_clk>;
 			status = "disabled";
 
 			portc: gpio-controller@0 {
-- 
2.4.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
