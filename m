From: Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH] ARM: dts: ls1021a: split dcu reg into four parts
Date: Tue, 6 Sep 2016 17:07:46 +0800
Message-ID: <1473152866-42108-1-git-send-email-meng.yi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

split DCU reg memory map into four parts with reg-names "regs",
"palette", "gamma", "cursor". gamma area is little endian while
the orther areas are big endian.

Suggested-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Signed-off-by: Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
---
 arch/arm/boot/dts/ls1021a.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index 5ae8e92..42f71db 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -495,7 +495,11 @@
 
 		dcu: dcu@2ce0000 {
 			compatible = "fsl,ls1021a-dcu";
-			reg = <0x0 0x2ce0000 0x0 0x10000>;
+			reg = <0x0 0x2ce0000 0x0 0x2000>,
+			      <0x0 0x2ce2000 0x0 0x2000>,
+			      <0x0 0x2ce4000 0x0 0xc00>,
+			      <0x0 0x2ce4c00 0x0 0x400>;
+			reg-names = "regs", "palette", "gamma", "cursor";
 			interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&platform_clk 0>,
 				<&platform_clk 0>;
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
