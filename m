From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/5] arm/dts: babbage: add all available clock nodes
Date: Mon, 14 Mar 2011 21:18:38 +0800
Message-ID: <1300108722-3254-2-git-send-email-shawn.guo@linaro.org>
References: <1300108722-3254-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <1300108722-3254-1-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Cc: patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

The patch is to add all available dt clock nodes for babbage board.
It sticks to the clock name used in clock-mx51-mx53.c, so that
everything gets consistent to Reference Manual.  For example, the
numbering in clock name usually starts from 1, while 'reg' property
numbering starts from 0 to easy clock binding.

Besides the generally used clock bindings, the following properties
are proposed in this patch.

* clock-source
This property is added to reflect the parent clock.

* clock-depend
The mxc 'struct clk' has the member 'secondary' to refer to the clock
that the 'clk' has dependency on.  This 'secondary' clock needs to be
turned on whenever the 'clk' is turned on.  This clock-depend property
is defined to reflect this 'secondary' clock.

Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/babbage.dts |  495 ++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 485 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/babbage.dts b/arch/arm/boot/dts/babbage.dts
index ab87a1b..378cd7d 100644
--- a/arch/arm/boot/dts/babbage.dts
+++ b/arch/arm/boot/dts/babbage.dts
@@ -47,24 +47,499 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		uart0_clk: uart0 {
-			compatible = "clock";
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
+		ckih2_clk: ckih2 {
+			compatible = "fixed-clock";
+			#frequency-cells = <1>;
+			clock-outputs = "ckih2";
+			clock-frequency = <0>;
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
+			compatible = "fsl,mxc-clock";
+			reg = <0>;
+			clock-outputs = "pll1_main";
+			clock-source = <&osc_clk>;
+		};
+
+		pll1_sw_clk: pll_switch@0 {
+			compatible = "fsl,mxc-clock";
+			reg = <0>;
+			clock-outputs = "pll1_sw";
+			clock-source = <&pll1_main_clk>;
+		};
+
+		pll2_sw_clk: pll_switch@1 {
+			compatible = "fsl,mxc-clock";
+			reg = <1>;
+			clock-outputs = "pll2_sw";
+			clock-source = <&osc_clk>;
+		};
+
+		pll3_sw_clk: pll_switch@2 {
+			compatible = "fsl,mxc-clock";
+			reg = <2>;
+			clock-outputs = "pll3_sw";
+			clock-source = <&osc_clk>;
+		};
+
+		lp_apm_clk: lp_apm {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "lp_apm";
+			clock-source = <&osc_clk>;
+		};
+
+		ipg_per_clk: ipg_per {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "ipg_per";
+			clock-source = <&lp_apm_clk>;
+		};
+
+		periph_apm_clk: periph_apm {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "periph_apm";
+			clock-source = <&pll1_sw_clk>;
+		};
+
+		cpu_clk: cpu {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "cpu";
+			clock-source = <&pll1_sw_clk>;
+		};
+
+		ddr_hf_clk: ddr_hf {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "ddr_hf";
+			clock-source = <&pll1_sw_clk>;
+		};
+
+		ddr_clk: ddr {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "ddr";
+			clock-source = <&ddr_hf_clk>;
+		};
+
+		emi_fast_clk: emi_fast {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "emi_fast";
+			clock-source = <&ddr_clk>;
+		};
+
+		main_bus_clk: main_bus {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "main_bus";
+			clock-source = <&pll2_sw_clk>;
+		};
+
+		emi_slow_clk: emi_slow {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "emi_slow";
+			clock-source = <&pll2_sw_clk>;
+		};
+
+		ahb_clk: ahb {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "ahb";
+			clock-source = <&main_bus_clk>;
+		};
+
+		ipg_clk: ipg {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "ipg";
+			clock-source = <&ahb_clk>;
+		};
+
+		spba_clk: spba {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "spba";
+			clock-source = <&ipg_clk>;
+		};
+
+		iim_clk: iim {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "iim";
+			clock-source = <&ipg_clk>;
+		};
+
+		ahb_max_clk: ahb_max {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "ahb_max";
+			clock-source = <&ahb_clk>;
+		};
+
+		aips_tz1_clk: aips_tz@0 {
+			compatible = "fsl,mxc-clock";
+			reg = <0>;
+			clock-outputs = "aips_tz1";
+			clock-source = <&ahb_clk>;
+			clock-depend = <&ahb_max_clk>;
+		};
+
+		aips_tz2_clk: aips_tz@1 {
+			compatible = "fsl,mxc-clock";
+			reg = <1>;
+			clock-outputs = "aips_tz2";
+			clock-source = <&ahb_clk>;
+			clock-depend = <&ahb_max_clk>;
+		};
+
+		ahbmux1_clk: ahbmux1 {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "ahbmux1";
+			clock-source = <&ahb_clk>;
+			clock-depend = <&ahb_max_clk>;
+		};
+
+		gpt_ipg_clk: gpt_ipg {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "gpt_ipg";
+			clock-source = <&ipg_clk>;
+		};
+
+		gpt_clk: gpt {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "gpt";
+			clock-source = <&ipg_clk>;
+			clock-depend = <&gpt_ipg_clk>;
+		};
+
+		gpt_32k_clk: gpt_32k {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "gpt_32k";
+			clock-source = <&ckil_clk>;
+		};
+
+		uart1_ipg_clk: uart_ipg@0 {
+			compatible = "fsl,mxc-clock";
+			reg = <0>;
+			clock-outputs = "uart1_ipg";
+			clock-source = <&ipg_clk>;
+			clock-depend = <&aips_tz1_clk>;
+		};
+
+		uart2_ipg_clk: uart_ipg@1 {
+			compatible = "fsl,mxc-clock";
+			reg = <1>;
+			clock-outputs = "uart2_ipg";
+			clock-source = <&ipg_clk>;
+			clock-depend = <&aips_tz1_clk>;
+		};
+
+		uart3_ipg_clk: uart_ipg@2 {
+			compatible = "fsl,mxc-clock";
+			reg = <2>;
+			clock-outputs = "uart3_ipg";
+			clock-source = <&ipg_clk>;
+			clock-depend = <&spba_clk>;
+		};
+
+		uart_root_clk: uart_root {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "uart_root";
+			clock-source = <&pll2_sw_clk>;
+		};
+
+		uart1_clk: uart@0 {
+			compatible = "fsl,mxc-clock";
+			reg = <0>;
 			clock-outputs = "imx-uart.0";
+			clock-source = <&uart_root_clk>;
+			clock-depends = <&uart1_ipg_clk>;
 		};
 
-		uart1_clk: uart1 {
-			compatible = "clock";
+		uart2_clk: uart@1 {
+			compatible = "fsl,mxc-clock";
+			reg = <1>;
 			clock-outputs = "imx-uart.1";
+			clock-source = <&uart_root_clk>;
+			clock-depends = <&uart2_ipg_clk>;
 		};
 
-		uart2_clk: uart2 {
-			compatible = "clock";
+		uart3_clk: uart@2 {
+			compatible = "fsl,mxc-clock";
+			reg = <2>;
 			clock-outputs = "imx-uart.2";
+			clock-source = <&uart_root_clk>;
+			clock-depends = <&uart3_ipg_clk>;
 		};
 
 		fec_clk: fec {
-			compatible = "clock";
+			compatible = "fsl,mxc-clock";
 			clock-outputs = "fec.0";
+			clock-source = <&ipg_clk>;
+		};
+
+		pwm1_clk: pwm@0 {
+			compatible = "fsl,mxc-clock";
+			reg = <0>;
+			clock-outputs = "mxc-pwm.0";
+			clock-source = <&ipg_clk>;
+		};
+
+		pwm2_clk: pwm@1 {
+			compatible = "fsl,mxc-clock";
+			reg = <1>;
+			clock-outputs = "mxc-pwm.1";
+			clock-source = <&ipg_clk>;
+		};
+
+		i2c1_clk: i2c@0 {
+			compatible = "fsl,mxc-clock";
+			reg = <0>;
+			clock-outputs = "imx-i2c.0";
+			clock-source = <&ipg_clk>;
+		};
+
+		i2c2_clk: i2c@1 {
+			compatible = "fsl,mxc-clock";
+			reg = <1>;
+			clock-outputs = "imx-i2c.1";
+			clock-source = <&ipg_clk>;
+		};
+
+		hsi2c_clk: i2c@2 {
+			compatible = "fsl,mxc-clock";
+			reg = <2>;
+			clock-outputs = "imx-i2c.2";
+			clock-source = <&ipg_clk>;
+		};
+
+		nfc_clk: nfc {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "mxs_nand";
+			clock-source = <&emi_slow_clk>;
+		};
+
+		ssi1_ipg_clk: ssi_ipg@0 {
+			compatible = "fsl,mxc-clock";
+			reg = <0>;
+			clock-outputs = "ssi1_ipg";
+			clock-source = <&ipg_clk>;
+		};
+
+		ssi2_ipg_clk: ssi_ipg@1 {
+			compatible = "fsl,mxc-clock";
+			reg = <1>;
+			clock-outputs = "ssi2_ipg";
+			clock-source = <&ipg_clk>;
+		};
+
+		ssi3_ipg_clk: ssi_ipg@2 {
+			compatible = "fsl,mxc-clock";
+			reg = <2>;
+			clock-outputs = "ssi3_ipg";
+			clock-source = <&ipg_clk>;
+		};
+
+		ssi1_clk: ssi@0 {
+			compatible = "fsl,mxc-clock";
+			reg = <0>;
+			clock-outputs = "imx-ssi.0";
+			clock-source = <&pll3_sw_clk>;
+			clock-dpends = <&ssi1_ipg_clk>;
+		};
+
+		ssi2_clk: ssi@1 {
+			compatible = "fsl,mxc-clock";
+			reg = <1>;
+			clock-outputs = "imx-ssi.1";
+			clock-source = <&pll3_sw_clk>;
+			clock-dpends = <&ssi2_ipg_clk>;
+		};
+
+		ssi3_clk: ssi@2 {
+			compatible = "fsl,mxc-clock";
+			reg = <2>;
+			clock-outputs = "imx-ssi.2";
+			clock-source = <&pll3_sw_clk>;
+			clock-dpends = <&ssi3_ipg_clk>;
+		};
+
+		cspi_ipg_clk: cspi_ipg {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "cspi_ipg";
+			clock-source = <&ipg_clk>;
+			clock-dpends = <&aips_tz2_clk>;
+		};
+
+		cspi_clk: cspi {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "imx51-cspi.0";
+			clock-source = <&ipg_clk>;
+			clock-dpends = <&cspi_ipg_clk>;
+		};
+
+		ecspi1_ipg_clk: ecspi_ipg@0 {
+			compatible = "fsl,mxc-clock";
+			reg = <0>;
+			clock-outputs = "ecspi1_ipg";
+			clock-source = <&ipg_clk>;
+			clock-dpends = <&spba_clk>;
+		};
+
+		ecspi2_ipg_clk: ecspi_ipg@1 {
+			compatible = "fsl,mxc-clock";
+			reg = <1>;
+			clock-outputs = "ecspi2_ipg";
+			clock-source = <&ipg_clk>;
+			clock-dpends = <&aips_tz2_clk>;
+		};
+
+		ecspi_main_clk: ecspi_main {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "ecspi_main";
+			clock-source = <&pll3_sw_clk>;
+		};
+
+		ecspi1_clk: ecspi@0 {
+			compatible = "fsl,mxc-clock";
+			reg = <0>;
+			clock-outputs = "imx51-ecspi.0";
+			clock-source = <&ecspi_main_clk>;
+			clock-dpends = <&ecspi1_ipg_clk>;
+		};
+
+		ecspi2_clk: ecspi@1 {
+			compatible = "fsl,mxc-clock";
+			reg = <1>;
+			clock-outputs = "imx51-ecspi.1";
+			clock-source = <&ecspi_main_clk>;
+			clock-dpends = <&ecspi2_ipg_clk>;
+		};
+
+		sdma_clk: sdma {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "imx-sdma";
+			clock-source = <&ahb_clk>;
+		};
+
+		esdhc1_ipg_clk: esdhc_ipg@0 {
+			compatible = "fsl,mxc-clock";
+			reg = <0>;
+			clock-outputs = "esdhc1_ipg";
+			clock-source = <&ipg_clk>;
+		};
+
+		esdhc2_ipg_clk: esdhc_ipg@1 {
+			compatible = "fsl,mxc-clock";
+			reg = <1>;
+			clock-outputs = "esdhc2_ipg";
+			clock-source = <&ipg_clk>;
+		};
+
+		esdhc1_clk: esdhc@0 {
+			compatible = "fsl,mxc-clock";
+			reg = <0>;
+			clock-outputs = "sdhci-esdhc-imx.0";
+			clock-source = <&pll2_sw_clk>;
+			clock-dpends = <&esdhc1_ipg_clk>;
+		};
+
+		esdhc2_clk: esdhc@1 {
+			compatible = "fsl,mxc-clock";
+			reg = <1>;
+			clock-outputs = "sdhci-esdhc-imx.1";
+			clock-source = <&pll2_sw_clk>;
+			clock-dpends = <&esdhc2_ipg_clk>;
+		};
+
+		mipi_esc_clk: mipi_esc {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "mipi_esc";
+			clock-dpends = <&pll2_sw_clk>;
+		};
+
+		mipi_hsc1_clk: mipi_hsc@0 {
+			compatible = "fsl,mxc-clock";
+			reg = <0>;
+			clock-outputs = "mipi_hsc1";
+			clock-source = <&mipi_hsc2_clk>;
+			clock-dpends = <&pll2_sw_clk>;
+		};
+
+		mipi_hsc2_clk: mipi_hsc@1 {
+			compatible = "fsl,mxc-clock";
+			reg = <1>;
+			clock-outputs = "mipi_hsc2";
+			clock-source = <&mipi_esc_clk>;
+			clock-dpends = <&pll2_sw_clk>;
+		};
+
+		ipu_sec_clk: ipu_sec {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "ipu_sec";
+			clock-source = <&emi_fast_clk>;
+			clock-dpends = <&ahbmux1_clk>;
+		};
+
+		ipu_clk: ipu {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "imx-ipuv3";
+			clock-source = <&ahb_clk>;
+			clock-dpends = <&ipu_sec_clk>;
+		};
+
+		ipu_di0_clk: ipu_di@0 {
+			compatible = "fsl,mxc-clock";
+			reg = <0>;
+			clock-outputs = "imx-ipuv3-di0";
+			clock-source = <&pll3_sw_clk>;
+		};
+
+		ipu_di1_clk: ipu_di@1 {
+			compatible = "fsl,mxc-clock";
+			reg = <1>;
+			clock-outputs = "imx-ipuv3-di1";
+			clock-source = <&pll3_sw_clk>;
+		};
+
+		mipi_hsp_clk: mipi_hsp {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "mipi_hsp";
+			clock-source = <&ipu_clk>;
+			clock-dpends = <&mipi_hsc1_clk>;
+		};
+
+		usboh3_clk: usboh3 {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "mxc-ehci";
+			clock-source = <&pll2_sw_clk>;
+		};
+
+		usb_ahb_clk: usb_ahb {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "mxc-ehci-ahb";
+			clock-source = <&ipg_clk>;
+		};
+
+		usb_phy1_clk: usb_phy1 {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "usb_phy1";
+			clock-source = <&pll3_sw_clk>;
+		};
+
+		dummy_clk: dummy {
+			compatible = "fsl,mxc-clock";
 		};
 	};
 
@@ -79,7 +554,7 @@
 			reg = <0xbc000 0x1000>;
 			interrupts = <0x1f>;
 			fsl,has-rts-cts;
-			uart-clock = <&uart0_clk>, "uart";
+			uart-clock = <&uart1_clk>, "uart";
 		};
 
 		imx-uart@c0000 {
@@ -87,7 +562,7 @@
 			reg = <0xc0000 0x1000>;
 			interrupts = <0x20>;
 			fsl,has-rts-cts;
-			uart-clock = <&uart1_clk>, "uart";
+			uart-clock = <&uart2_clk>, "uart";
 		};
 	};
 
@@ -102,7 +577,7 @@
 			reg = <0xc000 0x1000>;
 			interrupts = <0x21>;
 			fsl,has-rts-cts;
-			uart-clock = <&uart2_clk>, "uart";
+			uart-clock = <&uart3_clk>, "uart";
 		};
 	};
 
-- 
1.7.1
