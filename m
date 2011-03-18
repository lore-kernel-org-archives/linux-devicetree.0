From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 1/6] arm/dts: babbage: add all available clock nodes
Date: Sat, 19 Mar 2011 02:24:27 +0800
Message-ID: <1300472672-13392-2-git-send-email-shawn.guo@linaro.org>
References: <1300472672-13392-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <1300472672-13392-1-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

The patch is to add all available dt clock nodes for babbage board.
It sticks to the clock name used in clock-mx51-mx53.c, so that
everything gets consistent to Reference Manual.  For example, the
numbering in clock name usually starts from 1, while 'reg' property
numbering starts from 0 to easy clock binding.

Besides the generally used clock bindings, the following clock
providers are proposed in this patch.

* src-clock
This clock provider is added to reflect the parent clock.

* dep-clock
The mxc 'struct clk' has the member 'secondary' to refer to the clock
that the 'clk' has dependency on.  This 'secondary' clock needs to be
turned on whenever the 'clk' is turned on.  This clock provider is
defined to reflect this 'secondary' clock.

Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/babbage.dts |  501 +++++++++++++++++++++++++++++++++++++++-
 1 files changed, 488 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/babbage.dts b/arch/arm/boot/dts/babbage.dts
index 8f9b47c..2028290 100644
--- a/arch/arm/boot/dts/babbage.dts
+++ b/arch/arm/boot/dts/babbage.dts
@@ -47,28 +47,503 @@
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
+			src-clock = <&osc_clk>, "osc-clk";
+		};
+
+		pll1_sw_clk: pll_switch@0 {
+			compatible = "fsl,mxc-clock";
+			reg = <0>;
+			clock-outputs = "pll1_sw";
+			src-clock = <&pll1_main_clk>, "pll-clk";
+		};
+
+		pll2_sw_clk: pll_switch@1 {
+			compatible = "fsl,mxc-clock";
+			reg = <1>;
+			clock-outputs = "pll2_sw";
+			src-clock = <&osc_clk>, "osc-clk";
+		};
+
+		pll3_sw_clk: pll_switch@2 {
+			compatible = "fsl,mxc-clock";
+			reg = <2>;
+			clock-outputs = "pll3_sw";
+			src-clock = <&osc_clk>, "osc-clk";
+		};
+
+		lp_apm_clk: lp_apm {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "lp_apm";
+			src-clock = <&osc_clk>, "osc-clk";
+		};
+
+		ipg_per_clk: ipg_per {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "ipg_per";
+			src-clock = <&lp_apm_clk>, "apm-clk";
+		};
+
+		periph_apm_clk: periph_apm {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "periph_apm";
+			src-clock = <&pll1_sw_clk>, "pll-clk";
+		};
+
+		cpu_clk: cpu {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "cpu";
+			src-clock = <&pll1_sw_clk>, "pll-clk";
+		};
+
+		ddr_hf_clk: ddr_hf {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "ddr_hf";
+			src-clock = <&pll1_sw_clk>, "pll-clk";
+		};
+
+		ddr_clk: ddr {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "ddr";
+			src-clock = <&ddr_hf_clk>, "ddr-hf-clk";
+		};
+
+		emi_fast_clk: emi_fast {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "emi_fast";
+			src-clock = <&ddr_clk>, "ddr-clk";
+		};
+
+		main_bus_clk: main_bus {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "main_bus";
+			src-clock = <&pll2_sw_clk>, "pll-clk";
+		};
+
+		emi_slow_clk: emi_slow {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "emi_slow";
+			src-clock = <&pll2_sw_clk>, "pll-clk";
+		};
+
+		ahb_clk: ahb {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "ahb";
+			src-clock = <&main_bus_clk>, "bus-clk";
+		};
+
+		ipg_clk: ipg {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "ipg";
+			src-clock = <&ahb_clk>, "ahb-clk";
+		};
+
+		spba_clk: spba {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "spba";
+			src-clock = <&ipg_clk>, "ipg-clk";
+		};
+
+		iim_clk: iim {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "iim";
+			src-clock = <&ipg_clk>, "ipg-clk";
+		};
+
+		ahb_max_clk: ahb_max {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "ahb_max";
+			src-clock = <&ahb_clk>, "ahb-clk";
+		};
+
+		aips_tz1_clk: aips_tz@0 {
+			compatible = "fsl,mxc-clock";
+			reg = <0>;
+			clock-outputs = "aips_tz1";
+			src-clock = <&ahb_clk>, "ahb-clk";
+			dep-clock = <&ahb_max_clk>, "max-clk";
+		};
+
+		aips_tz2_clk: aips_tz@1 {
+			compatible = "fsl,mxc-clock";
+			reg = <1>;
+			clock-outputs = "aips_tz2";
+			src-clock = <&ahb_clk>, "ahb-clk";
+			dep-clock = <&ahb_max_clk>, "max-clk";
+		};
+
+		ahbmux1_clk: ahbmux1 {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "ahbmux1";
+			src-clock = <&ahb_clk>, "ahb-clk";
+			dep-clock = <&ahb_max_clk>, "max-clk";
+		};
+
+		gpt_ipg_clk: gpt_ipg {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "gpt_ipg";
+			src-clock = <&ipg_clk>, "ipg-clk";
+		};
+
+		gpt_clk: gpt {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "gpt";
+			src-clock = <&ipg_clk>, "ipg-clk";
+			dep-clock = <&gpt_ipg_clk>, "gpt-ipg-clk";
+		};
+
+		gpt_32k_clk: gpt_32k {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "gpt_32k";
+			src-clock = <&ckil_clk>, "ckil-clk";
+		};
+
+		uart1_ipg_clk: uart_ipg@0 {
+			compatible = "fsl,mxc-clock";
+			reg = <0>;
+			clock-outputs = "uart1_ipg";
+			src-clock = <&ipg_clk>, "ipg-clk";
+			dep-clock = <&aips_tz1_clk>, "aips-clk";
+		};
+
+		uart2_ipg_clk: uart_ipg@1 {
+			compatible = "fsl,mxc-clock";
+			reg = <1>;
+			clock-outputs = "uart2_ipg";
+			src-clock = <&ipg_clk>, "ipg-clk";
+			dep-clock = <&aips_tz1_clk>, "aips-clk";
+		};
+
+		uart3_ipg_clk: uart_ipg@2 {
+			compatible = "fsl,mxc-clock";
+			reg = <2>;
+			clock-outputs = "uart3_ipg";
+			src-clock = <&ipg_clk>, "ipg-clk";
+			dep-clock = <&spba_clk>, "spba-clk";
+		};
+
+		uart_root_clk: uart_root {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "uart_root";
+			src-clock = <&pll2_sw_clk>, "pll-clk";
+		};
+
+		uart1_clk: uart@0 {
+			compatible = "fsl,mxc-clock";
+			reg = <0>;
 			clock-outputs = "imx-uart.0";
+			src-clock = <&uart_root_clk>, "uart-root-clk";
+			dep-clock = <&uart1_ipg_clk>, "uart-ipg-clk";
 		};
 
-		uart1_clk: uart1 {
-			compatible = "clock";
+		uart2_clk: uart@1 {
+			compatible = "fsl,mxc-clock";
+			reg = <1>;
 			clock-outputs = "imx-uart.1";
+			src-clock = <&uart_root_clk>, "uart-root-clk";
+			dep-clock = <&uart2_ipg_clk>, "uart-ipg-clk";
 		};
 
-		uart2_clk: uart2 {
-			compatible = "clock";
+		uart3_clk: uart@2 {
+			compatible = "fsl,mxc-clock";
+			reg = <2>;
 			clock-outputs = "imx-uart.2";
+			src-clock = <&uart_root_clk>, "uart-root-clk";
+			dep-clock = <&uart3_ipg_clk>, "uart-ipg-clk";
 		};
 
 		fec_clk: fec {
-			compatible = "clock";
+			compatible = "fsl,mxc-clock";
 			clock-outputs = "fec.0";
+			src-clock = <&ipg_clk>, "ipg-clk";
+		};
+
+		pwm1_clk: pwm@0 {
+			compatible = "fsl,mxc-clock";
+			reg = <0>;
+			clock-outputs = "mxc-pwm.0";
+			src-clock = <&ipg_clk>, "ipg-clk";
+		};
+
+		pwm2_clk: pwm@1 {
+			compatible = "fsl,mxc-clock";
+			reg = <1>;
+			clock-outputs = "mxc-pwm.1";
+			src-clock = <&ipg_clk>, "ipg-clk";
+		};
+
+		i2c1_clk: i2c@0 {
+			compatible = "fsl,mxc-clock";
+			reg = <0>;
+			clock-outputs = "imx-i2c.0";
+			src-clock = <&ipg_clk>, "ipg-clk";
+		};
+
+		i2c2_clk: i2c@1 {
+			compatible = "fsl,mxc-clock";
+			reg = <1>;
+			clock-outputs = "imx-i2c.1";
+			src-clock = <&ipg_clk>, "ipg-clk";
+		};
+
+		hsi2c_clk: i2c@2 {
+			compatible = "fsl,mxc-clock";
+			reg = <2>;
+			clock-outputs = "imx-i2c.2";
+			src-clock = <&ipg_clk>, "ipg-clk";
+		};
+
+		nfc_clk: nfc {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "mxs_nand";
+			src-clock = <&emi_slow_clk>, "emi-clk";
+		};
+
+		ssi1_ipg_clk: ssi_ipg@0 {
+			compatible = "fsl,mxc-clock";
+			reg = <0>;
+			clock-outputs = "ssi1_ipg";
+			src-clock = <&ipg_clk>, "ipg-clk";
+		};
+
+		ssi2_ipg_clk: ssi_ipg@1 {
+			compatible = "fsl,mxc-clock";
+			reg = <1>;
+			clock-outputs = "ssi2_ipg";
+			src-clock = <&ipg_clk>, "ipg-clk";
+		};
+
+		ssi3_ipg_clk: ssi_ipg@2 {
+			compatible = "fsl,mxc-clock";
+			reg = <2>;
+			clock-outputs = "ssi3_ipg";
+			src-clock = <&ipg_clk>, "ipg-clk";
+		};
+
+		ssi1_clk: ssi@0 {
+			compatible = "fsl,mxc-clock";
+			reg = <0>;
+			clock-outputs = "imx-ssi.0";
+			src-clock = <&pll3_sw_clk>, "pll-clk";
+			dep-clock = <&ssi1_ipg_clk>, "ssi-ipg-clk";
+		};
+
+		ssi2_clk: ssi@1 {
+			compatible = "fsl,mxc-clock";
+			reg = <1>;
+			clock-outputs = "imx-ssi.1";
+			src-clock = <&pll3_sw_clk>, "pll-clk";
+			dep-clock = <&ssi2_ipg_clk>, "ssi-ipg-clk";
+		};
+
+		ssi3_clk: ssi@2 {
+			compatible = "fsl,mxc-clock";
+			reg = <2>;
+			clock-outputs = "imx-ssi.2";
+			src-clock = <&pll3_sw_clk>, "pll-clk";
+			dep-clock = <&ssi3_ipg_clk>, "ssi-ipg-clk";
+		};
+
+		cspi_ipg_clk: cspi_ipg {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "cspi_ipg";
+			src-clock = <&ipg_clk>, "ipg-clk";
+			dep-clock = <&aips_tz2_clk>, "aips-clk";
+		};
+
+		cspi_clk: cspi {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "imx51-cspi.0";
+			src-clock = <&ipg_clk>, "ipg-clk";
+			dep-clock = <&cspi_ipg_clk>, "cspi-ipg-clk";
+		};
+
+		ecspi1_ipg_clk: ecspi_ipg@0 {
+			compatible = "fsl,mxc-clock";
+			reg = <0>;
+			clock-outputs = "ecspi1_ipg";
+			src-clock = <&ipg_clk>, "ipg-clk";
+			dep-clock = <&spba_clk>, "spba-clk";
+		};
+
+		ecspi2_ipg_clk: ecspi_ipg@1 {
+			compatible = "fsl,mxc-clock";
+			reg = <1>;
+			clock-outputs = "ecspi2_ipg";
+			src-clock = <&ipg_clk>, "ipg-clk";
+			dep-clock = <&aips_tz2_clk>, "aips-clk";
+		};
+
+		ecspi_main_clk: ecspi_main {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "ecspi_main";
+			src-clock = <&pll3_sw_clk>, "pll-clk";
+		};
+
+		ecspi1_clk: ecspi@0 {
+			compatible = "fsl,mxc-clock";
+			reg = <0>;
+			clock-outputs = "imx51-ecspi.0";
+			src-clock = <&ecspi_main_clk>, "ecspi-main-clk";
+			dep-clock = <&ecspi1_ipg_clk>, "ecspi-ipg-clk";
+		};
+
+		ecspi2_clk: ecspi@1 {
+			compatible = "fsl,mxc-clock";
+			reg = <1>;
+			clock-outputs = "imx51-ecspi.1";
+			src-clock = <&ecspi_main_clk>, "ecspi-main-clk";
+			dep-clock = <&ecspi2_ipg_clk>, "ecspi-ipg-clk";
+		};
+
+		sdma_clk: sdma {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "imx-sdma";
+			src-clock = <&ahb_clk>, "ahb-clk";
+		};
+
+		esdhc1_ipg_clk: esdhc_ipg@0 {
+			compatible = "fsl,mxc-clock";
+			reg = <0>;
+			clock-outputs = "esdhc1_ipg";
+			src-clock = <&ipg_clk>, "ipg-clk";
+		};
+
+		esdhc2_ipg_clk: esdhc_ipg@1 {
+			compatible = "fsl,mxc-clock";
+			reg = <1>;
+			clock-outputs = "esdhc2_ipg";
+			src-clock = <&ipg_clk>, "ipg-clk";
+		};
+
+		esdhc1_clk: esdhc@0 {
+			compatible = "fsl,mxc-clock";
+			reg = <0>;
+			clock-outputs = "sdhci-esdhc-imx.0";
+			src-clock = <&pll2_sw_clk>, "pll-clk";
+			dep-clock = <&esdhc1_ipg_clk>, "esdhc-ipg-clk";
+		};
+
+		esdhc2_clk: esdhc@1 {
+			compatible = "fsl,mxc-clock";
+			reg = <1>;
+			clock-outputs = "sdhci-esdhc-imx.1";
+			src-clock = <&pll2_sw_clk>, "pll-clk";
+			dep-clock = <&esdhc2_ipg_clk>, "esdhc-ipg-clk";
+		};
+
+		mipi_esc_clk: mipi_esc {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "mipi_esc";
+			dep-clock = <&pll2_sw_clk>, "pll-clk";
+		};
+
+		mipi_hsc1_clk: mipi_hsc@0 {
+			compatible = "fsl,mxc-clock";
+			reg = <0>;
+			clock-outputs = "mipi_hsc1";
+			src-clock = <&mipi_hsc2_clk>, "mipi-hsc-clk";
+			dep-clock = <&pll2_sw_clk>, "pll-clk";
+		};
+
+		mipi_hsc2_clk: mipi_hsc@1 {
+			compatible = "fsl,mxc-clock";
+			reg = <1>;
+			clock-outputs = "mipi_hsc2";
+			src-clock = <&mipi_esc_clk>, "mipi-esc-clk";
+			dep-clock = <&pll2_sw_clk>, "pll-clk";
+		};
+
+		ipu_sec_clk: ipu_sec {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "ipu_sec";
+			src-clock = <&emi_fast_clk>, "emi-clk";
+			dep-clock = <&ahbmux1_clk>, "ahbmux-clk";
+		};
+
+		ipu_clk: ipu {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "imx-ipuv3";
+			src-clock = <&ahb_clk>, "ahb-clk";
+			dep-clock = <&ipu_sec_clk>, "ipu-sec-clk";
+		};
+
+		ipu_di0_clk: ipu_di@0 {
+			compatible = "fsl,mxc-clock";
+			reg = <0>;
+			clock-outputs = "imx-ipuv3-di0";
+			src-clock = <&pll3_sw_clk>, "pll-clk";
+		};
+
+		ipu_di1_clk: ipu_di@1 {
+			compatible = "fsl,mxc-clock";
+			reg = <1>;
+			clock-outputs = "imx-ipuv3-di1";
+			src-clock = <&pll3_sw_clk>, "pll-clk";
+		};
+
+		mipi_hsp_clk: mipi_hsp {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "mipi_hsp";
+			src-clock = <&ipu_clk>, "ipu-clk";
+			dep-clock = <&mipi_hsc1_clk>, "mipi-hsc-clk";
+		};
+
+		usboh3_clk: usboh3 {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "mxc-ehci";
+			src-clock = <&pll2_sw_clk>, "pll-clk";
+		};
+
+		usb_ahb_clk: usb_ahb {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "mxc-ehci-ahb";
+			src-clock = <&ipg_clk>, "ipg-clk";
+		};
+
+		usb_phy1_clk: usb_phy1 {
+			compatible = "fsl,mxc-clock";
+			clock-outputs = "usb_phy1";
+			src-clock = <&pll3_sw_clk>, "pll-clk";
+		};
+
+		dummy_clk: dummy {
+			compatible = "fsl,mxc-clock";
 		};
 	};
 
-	aips@73f00000 {
+	aips1 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "simple-bus";
@@ -79,7 +554,7 @@
 			reg = <0xbc000 0x1000>;
 			interrupts = <0x1f>;
 			fsl,has-rts-cts;
-			uart-clock = <&uart0_clk>, "uart";
+			uart-clock = <&uart1_clk>, "uart";
 		};
 
 		imx-uart@c0000 {
@@ -87,11 +562,11 @@
 			reg = <0xc0000 0x1000>;
 			interrupts = <0x20>;
 			fsl,has-rts-cts;
-			uart-clock = <&uart1_clk>, "uart";
+			uart-clock = <&uart2_clk>, "uart";
 		};
 	};
 
-	spba@70000000 {
+	spba {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "simple-bus";
@@ -102,11 +577,11 @@
 			reg = <0xc000 0x1000>;
 			interrupts = <0x21>;
 			fsl,has-rts-cts;
-			uart-clock = <&uart2_clk>, "uart";
+			uart-clock = <&uart3_clk>, "uart";
 		};
 	};
 
-	aips@83f00000 {
+	aips2 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "simple-bus";
-- 
1.7.1
