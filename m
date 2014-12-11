From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [RFC 3/3] ARM: dts: socfpga: Add AXI bridges
Date: Thu, 11 Dec 2014 21:21:42 +0100
Message-ID: <1418329302-20813-4-git-send-email-s.trumtrar@pengutronix.de>
References: <1418329302-20813-1-git-send-email-s.trumtrar@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418329302-20813-1-git-send-email-s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm/boot/dts/socfpga.dtsi | 48 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index 12e4e437050f..bfbdb326f531 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -67,6 +67,54 @@
 		interrupt-parent = <&intc>;
 		ranges;
 
+		lwhps2fpga: axibridge@ff400000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "altr,lwhps2fpga-axi-bridge";
+			reg = <0xff400000 0x100000>,
+			      <0xff200000 0x200000>;
+			reg-names = "gpv", "data";
+			clocks = <&l4_mp_clk>;
+			resets = <&rst LWHPS2FPGA_RESET>;
+			reset-names = "lwhps2fpga";
+			altr,l3-gpv = <&l3regs>;
+			status = "disabled";
+			ranges;
+		};
+
+		hps2fpga: axibridge@ff500000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "altr,hps2fpga-axi-bridge";
+			reg = <0xff500000 0x100000>,
+			      <0xc0000000 0x3c000000>;
+			reg-names = "gpv", "data";
+			clocks = <&l4_mp_clk>, <&l3_main_clk>;
+			clock-names = "gpv_clk", "data_clk";
+			resets = <&rst HPS2FPGA_RESET>;
+			reset-names = "hps2fpga";
+			altr,bridge-gpv = <&lwhps2fpga>;
+			altr,l3-gpv = <&l3regs>;
+			bus-width = <64>;
+			status = "disabled";
+			ranges;
+		};
+
+		fpga2hps: axibridge@ff600000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "altr,fpga2hps-axi-bridge";
+			reg = <0xff600000 0x100000>;
+			reg-names = "gpv";
+			clocks = <&l4_mp_clk>, <&l3_main_clk>;
+			clock-names = "gpv_clk", "data_clk";
+			resets = <&rst FPGA2HPS_RESET>;
+			reset-names = "fpga2hps";
+			altr,bridge-gpv = <&lwhps2fpga>;
+			bus-width = <64>;
+			status = "disabled";
+		};
+
 		amba {
 			compatible = "arm,amba-bus";
 			#address-cells = <1>;
-- 
2.1.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
