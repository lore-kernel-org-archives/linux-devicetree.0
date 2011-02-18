From: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 2/3] arm/dt: add very basic dts file for babbage board
Date: Fri, 18 Feb 2011 16:12:09 +0800
Message-ID: <1298016730-22761-3-git-send-email-r64343@freescale.com>
References: <1298016730-22761-1-git-send-email-r64343@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <1298016730-22761-1-git-send-email-r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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

Signed-off-by: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/babbage.dts |  117 +++++++++++++++++++++++++++++++++++++++++
 1 files changed, 117 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/babbage.dts b/arch/arm/boot/dts/babbage.dts
new file mode 100644
index 0000000..7ee26f1
--- /dev/null
+++ b/arch/arm/boot/dts/babbage.dts
@@ -0,0 +1,117 @@
+/dts-v1/;
+
+/ {
+	model = "mx51_babbage";
+	compatible = "fsl,mx51_babbage";
+	#address-cells = <0x1>;
+	#size-cells = <0x1>;
+	#interrupt-cells = <0x1>;
+	interrupt-parent = <0x1>;
+
+	memory {
+		device_type = "memory";
+		reg = <0x90000000 0x20000000>;
+	};
+
+	chosen {
+		bootargs = "console=ttymxc1,115200n8 debug earlyprintk";
+	};
+
+	soc {
+		#address-cells = <0x1>;
+		#size-cells = <0x1>;
+		device_type = "soc";
+		compatible = "simple-bus";
+		ranges = <0x0 0x0 0xffffffff>;
+
+		tzic {
+			#address-cells = <0x0>;
+			#interrupt-cells = <0x1>;
+			interrupt-controller;
+			reg = <0xe0000000 0x1000>;
+			compatible = "fsl,tzic";
+			device_type = "tzic";
+			phandle = <0x1>;
+		};
+	};
+
+	clocks {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		uart_clk0: uart@0 {
+			compatible = "clock";
+			clock-outputs = "imx-uart.0";
+		};
+
+		uart_clk1: uart@1{
+			compatible = "clock";
+			clock-outputs = "imx-uart.1";
+		};
+
+		uart_clk2: uart@2{
+			compatible = "clock";
+			clock-outputs = "imx-uart.2";
+		};
+
+		fec_clk: @0{
+			compatible = "clock";
+			clock-outputs = "fec.0";
+		};
+	};
+
+	spba@70000000 {
+		#address-cells = <0x1>;
+		#size-cells = <0x1>;
+		device_type = "soc";
+		compatible = "simple-bus";
+		ranges = <0x0 0x70000000 0x100000>;
+
+		imx-uart@C000 {
+			compatible = "imx-uart";
+			reg = <0xc000 0x1000>;
+			interrupts = <0x21>;
+			rts-cts;
+			uart-clock = < &uart_clk2 >, "uart";
+		};
+	};
+
+	aips@73f00000 {
+		#address-cells = <0x1>;
+		#size-cells = <0x1>;
+		device_type = "soc";
+		compatible = "simple-bus";
+		ranges = <0x0 0x73f00000 0x100000>;
+
+		imx-uart@BC000 {
+			compatible = "imx-uart";
+			reg = <0xbc000 0x1000>;
+			interrupts = <0x1f>;
+			rts-cts;
+			uart-clock = < &uart_clk0 >, "uart";
+		};
+
+		imx-uart@C0000 {
+			compatible = "imx-uart";
+			reg = <0xc0000 0x1000>;
+			interrupts = <0x20>;
+			rts-cts;
+			uart-clock = <&uart_clk1>, "uart";
+		};
+	};
+
+	aips@83f00000 {
+		#address-cells = <0x1>;
+		#size-cells = <0x1>;
+		device_type = "soc";
+		compatible = "simple-bus";
+		ranges = <0x0 0x83f00000 0x100000>;
+
+		fec@EC000 {
+			compatible = "fec";
+			reg = <0xec000 0x1000>;
+			interrupts = <0x57>;
+			fec_clk-clock = < &fec_clk >, "fec";
+		};
+	};
+};
-- 
1.7.0.4
