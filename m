From: <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCHv4 1/3] ARM: dts: socfpga: rename gpio nodes
Date: Wed, 22 Oct 2014 14:07:38 -0500
Message-ID: <1414004860-17645-2-git-send-email-dinguyen@opensource.altera.com>
References: <1414004860-17645-1-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414004860-17645-1-git-send-email-dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jh80-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

Since the Synopsys GPIO IP can support multiple ports of varying widths, it
would make more sense to have the GPIO node DTS entry as this:

gpio0: gpio@ff708000{
	porta{
	};
};

Also, this is documented in the snps-dwapb-gpio.txt.

Suggested-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
---
 arch/arm/boot/dts/socfpga.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index 45fce2c..4472fd9 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -547,7 +547,7 @@
 			status = "disabled";
 		};
 
-		gpio@ff708000 {
+		gpio0: gpio@ff708000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "snps,dw-apb-gpio";
@@ -555,7 +555,7 @@
 			clocks = <&per_base_clk>;
 			status = "disabled";
 
-			gpio0: gpio-controller@0 {
+			porta: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
@@ -567,7 +567,7 @@
 			};
 		};
 
-		gpio@ff709000 {
+		gpio1: gpio@ff709000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "snps,dw-apb-gpio";
@@ -575,7 +575,7 @@
 			clocks = <&per_base_clk>;
 			status = "disabled";
 
-			gpio1: gpio-controller@0 {
+			portb: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
@@ -587,7 +587,7 @@
 			};
 		};
 
-		gpio@ff70a000 {
+		gpio2: gpio@ff70a000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "snps,dw-apb-gpio";
@@ -595,7 +595,7 @@
 			clocks = <&per_base_clk>;
 			status = "disabled";
 
-			gpio2: gpio-controller@0 {
+			portc: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-- 
2.0.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
