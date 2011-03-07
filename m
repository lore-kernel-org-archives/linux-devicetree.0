From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/5] arm/dts: babbage: add gpt and uart related clock nodes
Date: Tue,  8 Mar 2011 00:22:08 +0800
Message-ID: <1299514932-13558-2-git-send-email-shawn.guo@linaro.org>
References: <1299514932-13558-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1299514932-13558-1-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

The patch is to add all gpt, uart related dt clock nodes for babbage.
It sticks to the clock name used in clock-mx51-mx53.c, so that
everything gets consistent to Reference Manual.  For example, the
numbering in clock name usually starts from 1, while 'reg' property
numbering starts from 0 to easy clock binding.

Besides the generally used clock bindings, the following properties
are proposed in this patch.

* clock-alias
Like clock-outputs to reflect cl->dev_id, property clock-alias is
defined to reflect cl->con_id.

* clock-depend
The mxc 'struct clk' has the member 'secondary' to refer to the clock
that the 'clk' has dependency on.  This 'secondary' clock needs to be
on whenever the 'clk' is set to on.  This clock-depend property is
defined to reflect this 'secondary' clock.

Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/babbage.dts |  162 +++++++++++++++++++++++++++++++++++++++--
 1 files changed, 156 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/babbage.dts b/arch/arm/boot/dts/babbage.dts
index 46a3071..1774cec 100644
--- a/arch/arm/boot/dts/babbage.dts
+++ b/arch/arm/boot/dts/babbage.dts
@@ -35,19 +35,169 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		uart0_clk: uart@0 {
+		ckil_clk: clkil {
+			compatible = "fixed-clock";
+			#frequency-cells = <1>;
+			clock-outputs = "clil";
+			clock-frequency = <32768>;
+		};
+
+		ckih_clk: ckih {
+			compatible = "fixed-clock";
+			#frequency-cells = <1>;
+			clock-outputs = "ckih";
+			clock-frequency = <22579200>;
+		};
+
+		osc_clk: soc {
+			compatible = "fixed-clock";
+			#frequency-cells = <1>;
+			clock-outputs = "osc";
+			clock-frequency = <24000000>;
+		};
+
+		pll1_main_clk: pll1_main {
+			compatible = "clock";
+			reg = <0>;
+			clock-outputs = "pll1_main";
+			clock-source = <&osc_clk>;
+		};
+
+		pll1_sw_clk: pll_switch@0 {
+			compatible = "clock";
+			reg = <0>;
+			clock-outputs = "pll1_sw";
+			clock-source = <&pll1_main_clk>;
+		};
+
+		pll2_sw_clk: pll_switch@1 {
+			compatible = "clock";
+			reg = <1>;
+			clock-outputs = "pll2_sw";
+			clock-source = <&osc_clk>;
+		};
+
+		pll3_sw_clk: pll_switch@2 {
+			compatible = "clock";
+			reg = <2>;
+			clock-outputs = "pll3_sw";
+			clock-source = <&osc_clk>;
+		};
+
+		lp_apm_clk: lp_apm {
+			compatible = "clock";
+			clock-outputs = "lp_apm";
+			clock-source = <&osc_clk>;
+		};
+
+		main_bus_clk: main_bus {
+			compatible = "clock";
+			clock-outputs = "main_bus";
+			clock-source = <&pll2_sw_clk>;
+		};
+
+		ahb_clk: ahb {
+			compatible = "clock";
+			clock-outputs = "ahb";
+			clock-source = <&main_bus_clk>;
+		};
+
+		ipg_clk: ipg {
+			compatible = "clock";
+			clock-outputs = "ipg";
+			clock-source = <&ahb_clk>;
+		};
+
+		spba_clk: spba {
+			compatible = "clock";
+			clock-outputs = "spba";
+			clock-source = <&ipg_clk>;
+		};
+
+		ahb_max_clk: ahb_max {
+			compatible = "clock";
+			clock-outputs = "ahb_max";
+			clock-source = <&ahb_clk>;
+		};
+
+		aips_tz1_clk: aips_tz@0 {
+			compatible = "clock";
+			reg = <0>;
+			clock-outputs = "aips_tz1";
+			clock-source = <&ahb_clk>;
+			clock-depend = <&ahb_max_clk>;
+		};
+
+		aips_tz2_clk: aips_tz@1 {
+			compatible = "clock";
+			reg = <1>;
+			clock-outputs = "aips_tz2";
+			clock-source = <&ahb_clk>;
+			clock-depend = <&ahb_max_clk>;
+		};
+
+		gpt_ipg_clk: gpt_ipg {
+			compatible = "clock";
+			clock-outputs = "gpt_ipg";
+			clock-source = <&ipg_clk>;
+		};
+
+		gpt_clk: gpt {
+			compatible = "clock";
+			clock-outputs = "gpt";
+			clock-source = <&ipg_clk>;
+			clock-depend = <&gpt_ipg_clk>;
+		};
+
+		uart1_ipg_clk: uart_ipg@0 {
 			compatible = "clock";
+			reg = <0>;
+			clock-outputs = "uart1_ipg";
+			clock-source = <&ipg_clk>;
+			clock-depend = <&aips_tz1_clk>;
+		};
+
+		uart2_ipg_clk: uart_ipg@1 {
+			compatible = "clock";
+			reg = <1>;
+			clock-outputs = "uart2_ipg";
+			clock-source = <&ipg_clk>;
+			clock-depend = <&aips_tz1_clk>;
+		};
+
+		uart3_ipg_clk: uart_ipg@2 {
+			compatible = "clock";
+			reg = <2>;
+			clock-outputs = "uart3_ipg";
+			clock-source = <&ipg_clk>;
+			clock-depend = <&spba_clk>;
+		};
+
+		uart_root_clk: uart_root {
+			compatible = "clock";
+			clock-outputs = "uart_root";
+			clock-source = <&pll2_sw_clk>;
+		};
+
+		uart1_clk: uart@0 {
+			compatible = "clock";
+			reg = <0>;
 			clock-outputs = "imx-uart.0";
+			clock-source = <&uart_root_clk>;
 		};
 
-		uart1_clk: uart@1 {
+		uart2_clk: uart@1 {
 			compatible = "clock";
+			reg = <1>;
 			clock-outputs = "imx-uart.1";
+			clock-source = <&uart_root_clk>;
 		};
 
-		uart2_clk: uart@2 {
+		uart3_clk: uart@2 {
 			compatible = "clock";
+			reg = <2>;
 			clock-outputs = "imx-uart.2";
+			clock-source = <&uart_root_clk>;
 		};
 
 		fec_clk: fec@0 {
@@ -67,7 +217,7 @@
 			reg = <0xc000 0x1000>;
 			interrupts = <0x21>;
 			rts-cts;
-			uart-clock = <&uart2_clk>, "uart";
+			uart-clock = <&uart3_clk>, "uart";
 		};
 	};
 
@@ -82,7 +232,7 @@
 			reg = <0xbc000 0x1000>;
 			interrupts = <0x1f>;
 			rts-cts;
-			uart-clock = <&uart0_clk>, "uart";
+			uart-clock = <&uart1_clk>, "uart";
 		};
 
 		imx-uart@c0000 {
@@ -90,7 +240,7 @@
 			reg = <0xc0000 0x1000>;
 			interrupts = <0x20>;
 			rts-cts;
-			uart-clock = <&uart1_clk>, "uart";
+			uart-clock = <&uart2_clk>, "uart";
 		};
 	};
 
-- 
1.7.1
