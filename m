From: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH V2 2/3] arm/dt: add very basic dts file for babbage board
Date: Mon,  7 Mar 2011 21:05:59 +0800
Message-ID: <1299503160-9910-3-git-send-email-jason.hui@linaro.org>
References: <1299503160-9910-1-git-send-email-jason.hui@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1299503160-9910-1-git-send-email-jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Singed-off-by: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/babbage.dts |  110 +++++++++++++++++++++++++++++++++++++++++
 1 files changed, 110 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/babbage.dts b/arch/arm/boot/dts/babbage.dts
new file mode 100644
index 0000000..46a3071
--- /dev/null
+++ b/arch/arm/boot/dts/babbage.dts
@@ -0,0 +1,110 @@
+/dts-v1/;
+
+/ {
+	model = "Freescale i.MX51 Babbage";
+	compatible = "fsl,mx51-babbage";
+	#address-cells = <0x1>;
+	#size-cells = <0x1>;
+	#interrupt-cells = <0x1>;
+	interrupt-parent = <&tzic>;
+
+	memory {
+		reg = <0x90000000 0x20000000>;
+	};
+
+	chosen {
+		bootargs = "console=ttymxc1,115200n8 debug earlyprintk";
+	};
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		ranges;
+
+		tzic: tzic@0 {
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			reg = <0xe0000000 0x1000>;
+			compatible = "fsl,imx51-tzic";
+		};
+	};
+
+	clocks {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		uart0_clk: uart@0 {
+			compatible = "clock";
+			clock-outputs = "imx-uart.0";
+		};
+
+		uart1_clk: uart@1 {
+			compatible = "clock";
+			clock-outputs = "imx-uart.1";
+		};
+
+		uart2_clk: uart@2 {
+			compatible = "clock";
+			clock-outputs = "imx-uart.2";
+		};
+
+		fec_clk: fec@0 {
+			compatible = "clock";
+			clock-outputs = "fec.0";
+		};
+	};
+
+	spba@70000000 {
+		#address-cells = <0x1>;
+		#size-cells = <0x1>;
+		compatible = "simple-bus";
+		ranges = <0x0 0x70000000 0x100000>;
+
+		imx-uart@c000 {
+			compatible = "imx-uart";
+			reg = <0xc000 0x1000>;
+			interrupts = <0x21>;
+			rts-cts;
+			uart-clock = <&uart2_clk>, "uart";
+		};
+	};
+
+	aips@73f00000 {
+		#address-cells = <0x1>;
+		#size-cells = <0x1>;
+		compatible = "simple-bus";
+		ranges = <0x0 0x73f00000 0x100000>;
+
+		imx-uart@bc000 {
+			compatible = "imx-uart";
+			reg = <0xbc000 0x1000>;
+			interrupts = <0x1f>;
+			rts-cts;
+			uart-clock = <&uart0_clk>, "uart";
+		};
+
+		imx-uart@c0000 {
+			compatible = "imx-uart";
+			reg = <0xc0000 0x1000>;
+			interrupts = <0x20>;
+			rts-cts;
+			uart-clock = <&uart1_clk>, "uart";
+		};
+	};
+
+	aips@83f00000 {
+		#address-cells = <0x1>;
+		#size-cells = <0x1>;
+		compatible = "simple-bus";
+		ranges = <0x0 0x83f00000 0x100000>;
+
+		fec@ec000 {
+			compatible = "fec";
+			reg = <0xec000 0x1000>;
+			interrupts = <0x57>;
+			fec_clk-clock = <&fec_clk>, "fec";
+		};
+	};
+};
-- 
1.7.0.4
