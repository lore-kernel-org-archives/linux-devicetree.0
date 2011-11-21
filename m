From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [RFC PATCH] arm/imx6: convert clock to device tree
Date: Tue, 22 Nov 2011 00:47:49 +0800
Message-ID: <1321894069-32220-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

It converts imx6 clock code to common clock frame and device tree.

Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
As I promised to Arnd, I will convert imx6 clock code to common clock
frame and in turn device tree.  Here it is.

It's based on Mike's common-clk pre-v3 and Grant's clock device tree
binding series.

Along with the conversion to device tree, I feel it's a great idea to
introduce '#clock-cells'.  With adopting it, I'm using 70 nodes to
describe 110 clocks (~35% nodes reduced).  However, the current design
of '#clock-cells' makes the user a little difficult.  For example, when
a consumer node references to provider node which is a blob of 4 clocks,
it has to fill 4 parameters into the phandle.

usdhc@02198000 { /* uSDHC3 */
	compatible = "fsl,imx6q-usdhc";
	reg = <0x02198000 0x4000>;
	interrupts = <0 24 0x04>;
	clock-input = <&usdhc_clk 2 0 0 0>; <--
	clock-input-name = "usdhc3";
};

But we actually need to pass only one parameter to point out the index
of the clock in the blob.  It's a little silly to put a number of
meaningless 0 there to fill the length of the phandle parameters.  Can
we rework the dt core code to make the following one work?

usdhc@02198000 { /* uSDHC3 */
	compatible = "fsl,imx6q-usdhc";
	reg = <0x02198000 0x4000>;
	interrupts = <0 24 0x04>;
	clock-input = <&usdhc_clk 2>; <--
	clock-input-name = "usdhc3";
};

Regards,
Shawn

 .../devicetree/bindings/clock/clock-imx.txt        |  124 ++
 arch/arm/boot/dts/imx6q.dtsi                       |  943 +++++++++-
 arch/arm/mach-imx/Kconfig                          |    5 +
 arch/arm/mach-imx/Makefile                         |    1 +
 arch/arm/mach-imx/clock-imx6q.c                    | 2135 ++++----------------
 arch/arm/mach-imx/clock.c                          |  222 ++
 arch/arm/mach-imx/clock.h                          |   64 +
 7 files changed, 1734 insertions(+), 1760 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/clock-imx.txt
 create mode 100644 arch/arm/mach-imx/clock.c
 create mode 100644 arch/arm/mach-imx/clock.h

diff --git a/Documentation/devicetree/bindings/clock/clock-imx.txt b/Documentation/devicetree/bindings/clock/clock-imx.txt
new file mode 100644
index 0000000..5c597d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/clock-imx.txt
@@ -0,0 +1,124 @@
+* Device Tree Bindings for Freescale i.MX Clock
+
+== Clock Gate ==
+
+Required properties:
+- imx,clock-gate:  It's a two 32-bit integers array.  The first
+  integer specifies the offset of the gate register, and the second
+  one specifies the bit mask of the gate for this clock.
+
+== Clock Divider ==
+
+Required properties:
+- imx,clock-divider:  It's a five 32-bit integers array.  The first
+  integer specifies the offset of the divider register.  The second
+  and the third one specify the shift and width of the pre-divider
+  bits for the clock, which is not necessarily present and the values
+  can just be 0.  The last two specify the shift and width of the
+  post-divider bits.
+
+Optional properties:
+- imx,busy-divider:  Some imx clocks needs to wait for a busy status
+  cleared when the clock rate gets changed.  This property is a two
+  32-bit integers array.  The first integer specifies the offset of
+  the busy register, and the second one specifies the busy bit mask.
+
+== Clock Multiplexer ==
+
+Required properties:
+- imx,clock-multiplexer:  It's a three 32-bit integers array.  The
+  first integer specifies the offset of the multiplexer register.
+  The second and the third one specify the shift and width of the
+  multiplexer bits for this clock.
+
+Optional properties:
+- imx,busy-multiplexer:  Some imx clocks needs to wait for a busy
+  status cleared when the parent gets changed.  This property is a two
+  32-bit integers array.  The first integer specifies the offset of
+  the busy register, and the second one specifies the busy bit mask.
+
+A typical imx clock could have gate, divider, multiplexer, but it's
+also very true that a imx clock just has the subset of these three
+properties.
+
+When #clock-cells > 1, this single clock node actually describes
+multiple clocks.  Thus all the properties under the node should
+contains the description for all of the clocks, except properties
+clock-input and clock-input-name which are used to describe the
+parents of the clock.  That means only the clocks sharing the exactly
+same parents could possible described by single node.
+
+Examples:
+
+pll2_pfd_clk: pll2-pfd {
+	compatible = "fsl,imx6q-pfd";
+	#clock-cells = <3>;
+	imx,clock-gate = <0x100 0x80>,
+			 <0x100 0x8000>,
+			 <0x100 0x800000>;
+	imx,clock-divider = <0x100 0 0 0 6>,
+			    <0x100 0 0 8 6>,
+			    <0x100 0 0 16 6>;
+	clock-input = <&pll_bus_clk 0>;
+	clock-input-name = "pll2-bus";
+	clock-output-name = "pll2-pfd-352m",
+			    "pll2-pfd-594m",
+			    "pll2-pfd-400m";
+};
+
+usdhc_clk: usdhc {
+	compatible = "fsl,imx6q-clock";
+	#clock-cells = <4>;
+	imx,clock-gate = <0x80 0xc>,
+			 <0x80 0x30>,
+			 <0x80 0xc0>,
+			 <0x80 0x300>;
+	imx,clock-divider = <0x24 0 0 11 3>,
+			    <0x24 0 0 16 3>,
+			    <0x24 0 0 19 3>,
+			    <0x24 0 0 22 3>;
+	imx,clock-multiplexer = <0x1c 16 1>,
+				<0x1c 17 1>,
+				<0x1c 18 1>,
+				<0x1c 19 1>;
+	clock-input = <&pll2_pfd_clk 2 0 0>,
+		      <&pll2_pfd_clk 0 0 0>;
+	clock-input-name = "pll2-pfd-400m",
+			   "pll2-pfd-352m";
+	clock-output-name = "usdhc1",
+			    "usdhc2",
+			    "usdhc3",
+			    "usdhc3";
+};
+
+usdhc@02190000 { /* uSDHC1 */
+	compatible = "fsl,imx6q-usdhc";
+	reg = <0x02190000 0x4000>;
+	interrupts = <0 22 0x04>;
+	clock-input = <&usdhc_clk 0 0 0 0>;
+	clock-input-name = "usdhc1";
+};
+
+usdhc@02194000 { /* uSDHC2 */
+	compatible = "fsl,imx6q-usdhc";
+	reg = <0x02194000 0x4000>;
+	interrupts = <0 23 0x04>;
+	clock-input = <&usdhc_clk 1 0 0 0>;
+	clock-input-name = "usdhc2";
+};
+
+usdhc@02198000 { /* uSDHC3 */
+	compatible = "fsl,imx6q-usdhc";
+	reg = <0x02198000 0x4000>;
+	interrupts = <0 24 0x04>;
+	clock-input = <&usdhc_clk 2 0 0 0>;
+	clock-input-name = "usdhc3";
+};
+
+usdhc@0219c000 { /* uSDHC4 */
+	compatible = "fsl,imx6q-usdhc";
+	reg = <0x0219c000 0x4000>;
+	interrupts = <0 25 0x04>;
+	clock-input = <&usdhc_clk 3 0 0 0>;
+	clock-input-name = "usdhc4";
+};
diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
index 7dda599..a5b9c5e 100644
--- a/arch/arm/boot/dts/imx6q.dtsi
+++ b/arch/arm/boot/dts/imx6q.dtsi
@@ -64,19 +64,922 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		ckil {
-			compatible = "fsl,imx-ckil", "fixed-clock";
-			clock-frequency = <32768>;
+		dummy_clk: dummy {
+			compatible = "dummy-clock";
+			#clock-cells = <1>;
+			clock-output-name = "dummy";
 		};
 
-		ckih1 {
-			compatible = "fsl,imx-ckih1", "fixed-clock";
-			clock-frequency = <0>;
+		ref_clk: ref {
+			compatible = "fixed-clock";
+			#clock-cells = <3>;
+			clock-frequency = <24000000 32768 0>;
+			clock-output-name = "osc",
+					    "ckil",
+					    "ckih";
 		};
 
-		osc {
-			compatible = "fsl,imx-osc", "fixed-clock";
-			clock-frequency = <24000000>;
+		pll_sys_clk: pll-sys {
+			compatible = "fsl,imx6q-pll-sys";
+			#clock-cells = <1>;
+			imx,clock-gate = <0x0 0x2000>;
+			imx,clock-divider = <0x0 0 0 0 7>;
+			clock-input = <&ref_clk 0 0 0>;
+			clock-input-name = "osc";
+			clock-output-name = "pll1-sys";
+		};
+
+		pll_bus_clk: pll-bus {
+			compatible = "fsl,imx6q-pll";
+			#clock-cells = <1>;
+			imx,clock-gate = <0x30 0x2000>;
+			imx,clock-divider = <0x30 0 0 0 1>;
+			clock-input = <&ref_clk 0 0 0>;
+			clock-input-name = "osc";
+			clock-output-name = "pll2-bus";
+		};
+
+		pll_usb_clk: pll-usb {
+			compatible = "fsl,imx6q-pll-usb";
+			#clock-cells = <2>;
+			imx,clock-gate = <0x10 0x2000>,
+					 <0x20 0x2000>;
+			imx,clock-divider = <0x10 0 0 0 2>,
+					    <0x20 0 0 0 2>;
+			clock-input = <&ref_clk 0 0 0>;
+			clock-input-name = "osc";
+			clock-output-name = "pll3-usb-otg",
+					    "pll7-usb-host";
+		};
+
+		pll_av_clk: pll-av {
+			compatible = "fsl,imx6q-pll-av";
+			#clock-cells = <2>;
+			imx,clock-gate = <0x70 0x2000>,
+					 <0xa0 0x2000>;
+			imx,clock-divider = <0x70 0 0 0 7>,
+					    <0xa0 0 0 0 7>;
+			clock-input = <&ref_clk 0 0 0>;
+			clock-input-name = "osc";
+			clock-output-name = "pll4-audio",
+					    "pll5-video";
+		};
+
+		pll_mlb_clk: pll-mlb {
+			compatible = "fsl,imx6q-pll";
+			#clock-cells = <1>;
+			imx,clock-gate = <0xd0 0x2000>;
+			clock-input = <&ref_clk 0 0 0>;
+			clock-input-name = "osc";
+			clock-output-name = "pll6-mlb";
+		};
+
+		pll_enet_clk: pll-enet {
+			compatible = "fsl,imx6q-pll-enet";
+			#clock-cells = <1>;
+			imx,clock-gate = <0xe0 0x182000>;
+			imx,clock-divider = <0xe0 0 0 0 2>;
+			clock-input = <&ref_clk 0 0 0>;
+			clock-input-name = "osc";
+			clock-output-name = "pll8-enet";
+		};
+
+		pll2_pfd_clk: pll2-pfd {
+			compatible = "fsl,imx6q-pfd";
+			#clock-cells = <3>;
+			imx,clock-gate = <0x100 0x80>,
+					 <0x100 0x8000>,
+					 <0x100 0x800000>;
+			imx,clock-divider = <0x100 0 0 0 6>,
+					    <0x100 0 0 8 6>,
+					    <0x100 0 0 16 6>;
+			clock-input = <&pll_bus_clk 0>;
+			clock-input-name = "pll2-bus";
+			clock-output-name = "pll2-pfd-352m",
+					    "pll2-pfd-594m",
+					    "pll2-pfd-400m";
+		};
+
+		pll3_pfd_clk: pll3-pfd {
+			compatible = "fsl,imx6q-pfd";
+			#clock-cells = <4>;
+			imx,clock-gate = <0xf0 0x80>,
+					 <0xf0 0x8000>,
+					 <0xf0 0x800000>,
+					 <0xf0 0x80000000>;
+			imx,clock-divider = <0xf0 0 0 0 6>,
+					    <0xf0 0 0 8 6>,
+					    <0xf0 0 0 16 6>,
+					    <0xf0 0 0 24 6>;
+			clock-input = <&pll_usb_clk 0 0>;
+			clock-input-name = "pll3-usb-otg";
+			clock-output-name = "pll3-pfd-720m",
+					    "pll3-pfd-540m",
+					    "pll3-pfd-508m",
+					    "pll3-pfd-454m";
+		};
+
+		pll2_div_clk: pll2-200m {
+			compatible = "divider-fixed-clock";
+			#clock-cells = <1>;
+			clock-divider = <2>;
+			clock-input = <&pll2_pfd_clk 2 0 0>;
+			clock-input-name = "pll2-pfd-400m";
+			clock-output-name = "pll2-200m";
+		};
+
+		pll3_div_clk: pll3-div {
+			compatible = "divider-fixed-clock";
+			#clock-cells = <3>;
+			clock-divider = <4 6 8>;
+			clock-input = <&pll_usb_clk 0 0>;
+			clock-input-name = "pll3-usb";
+			clock-output-name = "pll3-120m",
+					    "pll3-80m",
+					    "pll3-60m";
+		};
+
+		step_clk: step {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-multiplexer = <0xc 8 1>;
+			clock-input = <&ref_clk 0 0 0>,
+				      <&pll2_pfd_clk 2 0 0>;
+			clock-input-name = "osc",
+					   "pll2-pfd-400m";
+			clock-output-name = "step";
+		};
+
+		pll1_sw_clk: pll1-sw {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-multiplexer = <0xc 2 1>;
+			clock-input = <&pll_sys_clk 0>,
+				      <&step_clk 0>;
+			clock-input-name = "pll1-sys",
+					   "step";
+			clock-output-name = "pll1-sw";
+		};
+
+		periph_pre_clk: periph-pre {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <2>;
+			imx,clock-multiplexer = <0x18 18 2>,
+						<0x18 21 2>;
+			clock-input = <&pll_bus_clk 0>,
+				      <&pll2_pfd_clk 2 0 0>,
+				      <&pll2_pfd_clk 0 0 0>,
+				      <&pll2_div_clk 0>;
+			clock-input-name = "pll2-bus",
+					   "pll2-pfd-400m",
+					   "pll2-pfd-352m",
+					   "pll2-200m";
+			clock-output-name = "periph-pre",
+					    "periph2-pre";
+		};
+
+		periph_clk2_clk: periph-clk2 {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <2>;
+			imx,clock-divider = <0x14 0 0 27 3>,
+					    <0x14 0 0 0 3>;
+			imx,clock-multiplexer = <0x18 12 1>,
+						<0x18 20 1>;
+			clock-input = <&pll_usb_clk 0 0>,
+				      <&ref_clk 0 0 0>;
+			clock-input-name = "pll3-usb-otg",
+					   "osc";
+			clock-output-name = "periph-clk2",
+					    "periph2-clk2";
+		};
+
+		periph_clk: periph {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-multiplexer = <0x14 25 1>;
+			imx,busy-multiplexer = <0x48 0x20>;
+			clock-input = <&periph_pre_clk 0 0>,
+				      <&periph_clk2_clk 0 0>;
+			clock-input-name = "periph-pre",
+					   "periph-clk2";
+			clock-output-name = "periph";
+		};
+
+		periph2_clk: periph2 {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-multiplexer = <0x14 26 1>;
+			imx,busy-multiplexer = <0x48 0x8>;
+			clock-input = <&periph_pre_clk 1 0>,
+				      <&periph_clk2_clk 1 0>;
+			clock-input-name = "periph2-pre",
+					   "periph2-clk2";
+			clock-output-name = "periph2";
+		};
+
+		axi_clk: axi {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-divider = <0x14 0 0 16 3>;
+			imx,busy-divider = <0x48 0x1>;
+			imx,clock-multiplexer = <0x14 6 2>;
+			clock-input = <&periph_clk 0>,
+				      <&pll2_pfd_clk 2 0 0>,
+				      <&pll3_pfd_clk 1 0 0 0>;
+			clock-input-name = "periph",
+					   "pll2-pfd-400m",
+					   "pll3-pfd-540m";
+			clock-output-name = "axi";
+		};
+
+		mmdc_ch0_axi_clk: mmdc-ch0-axi {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-gate = <0x74 0x300000>;
+			imx,clock-divider = <0x14 0 0 19 3>;
+			imx,busy-divider = <0x48 0x10>;
+			clock-input = <&periph_clk 0>;
+			clock-input-name = "periph";
+			clock-output-name = "mmdc-ch0-axi";
+		};
+
+		mmdc_ch1_axi_clk: mmdc-ch1-axi {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-gate = <0x74 0xc00000>;
+			imx,clock-divider = <0x14 0 0 3 3>;
+			imx,busy-divider = <0x48 0x4>;
+			clock-input = <&periph2_clk 0>;
+			clock-input-name = "periph2";
+			clock-output-name = "mmdc-ch1-axi";
+		};
+
+		arm_clk: arm {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-divider = <0x10 0 0 0 3>;
+			imx,busy-divider = <0x48 0x10000>;
+			clock-input = <&pll1_sw_clk 0>;
+			clock-input-name = "pll1-sw";
+			clock-output-name = "arm";
+		};
+
+		ahb_clk: ahb {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-divider = <0x14 0 0 10 3>;
+			imx,busy-divider = <0x48 0x2>;
+			clock-input = <&periph_clk 0>;
+			clock-input-name = "periph";
+			clock-output-name = "ahb";
+		};
+
+		ipg_clk: ipg {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-divider = <0x14 0 0 8 2>;
+			clock-input = <&ahb_clk 0>;
+			clock-input-name = "ahb";
+			clock-output-name = "ipg";
+		};
+
+		ipg_per_clk: ipg-per {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-divider = <0x1c 0 0 0 6>;
+			clock-input = <&ipg_clk 0>;
+			clock-input-name = "ipg";
+			clock-output-name = "ipg-per";
+		};
+
+		aips_tz_clk: aips-tz {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <2>;
+			imx,clock-gate = <0x68 0x3>,
+					 <0x68 0xc>;
+			clock-input = <&ahb_clk 0>;
+			clock-input-name = "ahb";
+			clock-output-name = "aips-tz1",
+					    "aips-tz2";
+		};
+
+		apbh_dma_clk: apbh-dma {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-gate = <0x68 0x30>;
+			clock-input = <&ahb_clk 0>;
+			clock-input-name = "ahb";
+			clock-output-name = "apbh-dma";
+		};
+
+		audio_clk: audio {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <3>;
+			imx,clock-gate = <0x6c 0x30000>,
+					 <0x68 0xc0>,
+					 <0x7c 0xc000>;
+			imx,clock-divider = <0x28 9 3 25 3>,
+					    <0x30 12 3 9 3>,
+					    <0x30 25 3 22 3>;
+			imx,clock-multiplexer = <0x20 19 2>,
+						<0x30 7 2>,
+						<0x30 20 2>;
+			clock-input = <&pll_av_clk 0 0>,
+				      <&pll3_pfd_clk 2 0 0 0>,
+				      <&pll3_pfd_clk 3 0 0 0>,
+				      <&pll_usb_clk 0 0>;
+			clock-input-name = "pll4-audio",
+					   "pll3-pfd-508m",
+					   "pll3-pfd-454m",
+					   "pll3-usb-otg";
+			clock-output-name = "esai",
+					    "asrc",
+					    "spdif";
+		};
+
+		can_root_clk: can-root {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-divider = <0x20 0 0 2 6>;
+			clock-input = <&pll_usb_clk 0 0>;
+			clock-input-name = "pll3-usb-otg";
+			clock-output-name = "can-root";
+		};
+
+		can_clk: can {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <4>;
+			imx,clock-gate = <0x68 0xc000>,
+					 <0x68 0x30000>,
+					 <0x68 0xc0000>,
+					 <0x68 0x300000>;
+			clock-input = <&can_root_clk 0>;
+			clock-input-name = "can-root";
+			clock-output-name = "can1",
+					    "can1-serial",
+					    "can2",
+					    "can2-serial";
+		};
+
+		ecspi_root_clk: ecspi-root {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-divider = <0x38 0 0 19 6>;
+			clock-input = <&pll3_div_clk 2 0 0>;
+			clock-input-name = "pll3-60m";
+			clock-output-name = "ecspi-root";
+		};
+
+		ecspi_clk: ecspi {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <5>;
+			imx,clock-gate = <0x6c 0x3>,
+					 <0x6c 0xc>,
+					 <0x6c 0x30>,
+					 <0x6c 0xc0>,
+					 <0x6c 0x300>;
+			clock-input = <&ecspi_root_clk 0>;
+			clock-input-name = "ecspi-root";
+			clock-output-name = "ecspi1",
+					    "ecspi2",
+					    "ecspi3",
+					    "ecspi4",
+					    "ecspi5";
+		};
+
+		enet_clk: enet {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-gate = <0x6c 0xc00>;
+			clock-input = <&ipg_clk 0>;
+			clock-input-name = "ipg";
+			clock-output-name = "enet";
+		};
+
+		gpt_clk: gpt {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <2>;
+			imx,clock-gate = <0x6c 0x300000>,
+					 <0x6c 0xc00000>;
+			clock-input = <&ipg_per_clk 0>;
+			clock-input-name = "ipg-per";
+			clock-output-name = "gpt",
+					    "gpt-serial";
+		};
+
+		gpu_axi_clk: gpu-axi {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <2>;
+			imx,clock-multiplexer = <0x18 0 1>,
+						<0x18 1 1>;
+			clock-input = <&axi_clk 0>,
+				      <&ahb_clk 0>;
+			clock-input-name = "axi",
+					   "ahb";
+			clock-output-name = "gpu2d-axi",
+					    "gpu3d-axi";
+		};
+
+		gpu2d_core_clk: gpu2d-core {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-gate = <0x6c 0x3000000>;
+			imx,clock-divider = <0x18 0 0 23 3>;
+			imx,clock-multiplexer = <0x18 16 2>;
+			clock-input = <&axi_clk 0>,
+				      <&pll_usb_clk 0 0>,
+				      <&pll2_pfd_clk 0 0 0>,
+				      <&pll2_pfd_clk 2 0 0>;
+			clock-input-name = "axi",
+					   "pll3-usb-otg",
+					   "pll2-pfd-352m",
+					   "pll2-pfd-400m";
+			clock-output-name = "gpu2d-core";
+		};
+
+		gpu3d_core_clk: gpu3d-core {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-gate = <0x6c 0xc000000>;
+			imx,clock-divider = <0x18 0 0 26 3>;
+			imx,clock-multiplexer = <0x18 4 2>;
+			clock-input = <&mmdc_ch0_axi_clk 0>,
+				      <&pll_usb_clk 0 0>,
+				      <&pll2_pfd_clk 1 0 0>,
+				      <&pll2_pfd_clk 2 0 0>;
+			clock-input-name = "mmdc-ch0-axi",
+					   "pll3-usb-otg",
+					   "pll2-pfd-594m",
+					   "pll2-pfd-400m";
+			clock-output-name = "gpu3d-core";
+		};
+
+		gpu3d_shader_clk: gpu3d-shader {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-divider = <0x18 0 0 29 3>;
+			imx,clock-multiplexer = <0x18 8 2>;
+			clock-input = <&mmdc_ch0_axi_clk 0>,
+				      <&pll_usb_clk 0 0>,
+				      <&pll2_pfd_clk 1 0 0>,
+				      <&pll3_pfd_clk 0 0 0 0>;
+			clock-input-name = "mmdc-ch0-axi",
+					   "pll3-usb-otg",
+					   "pll2-pfd-594m",
+					   "pll3-pfd-720m";
+			clock-output-name = "gpu3d-shader";
+		};
+
+		hdmi_iahb_clk: hdmi-iahb {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-gate = <0x70 0x3>;
+			clock-input = <&ahb_clk 0>;
+			clock-input-name = "ahb";
+			clock-output-name = "hdmi-iahb";
+		};
+
+		hdmi_isfr_clk: hdmi-isfr {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-gate = <0x70 0x3>;
+			clock-input = <&pll3_pfd_clk 1 0 0 0>;
+			clock-input-name = "pll3-pfd-540m";
+			clock-output-name = "hdmi-isfr";
+		};
+
+		i2c_clk: i2c {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <3>;
+			imx,clock-gate = <0x70 0xc0>,
+					 <0x70 0x300>,
+					 <0x70 0xc00>;
+			clock-input = <&ipg_per_clk 0>;
+			clock-input-name = "ipg-per";
+			clock-output-name = "i2c1",
+					    "i2c2",
+					    "i2c3";
+		};
+
+		iim_clk: iim {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-gate = <0x70 0x3000>;
+			clock-input = <&ipg_clk 0>;
+			clock-input-name = "ipg";
+			clock-output-name = "iim";
+		};
+
+		ipu_clk: ipu {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <2>;
+			imx,clock-gate = <0x74 0x3>,
+					 <0x74 0xc0>;
+			imx,clock-divider = <0x3c 0 0 11 3>,
+					    <0x3c 0 0 16 3>;
+			imx,clock-multiplexer = <0x3c 9 2>,
+						<0x3c 14 2>;
+			clock-input = <&mmdc_ch0_axi_clk 0>,
+				      <&pll2_pfd_clk 2 0 0>,
+				      <&pll3_div_clk 0 0 0>,
+				      <&pll3_pfd_clk 1 0 0 0>;
+			clock-input-name = "mmdc-ch0-axi",
+					   "pll2-pfd-400m",
+					   "pll3-120m",
+					   "pll3-pfd-540m";
+			clock-output-name = "ipu1",
+					    "ipu2";
+		};
+
+		ldb_di_clk: ldb-di {
+			compatible = "fsl,imx6q-ldb-di-clock";
+			#clock-cells = <2>;
+			imx,clock-gate = <0x74 0x3000>,
+					 <0x74 0xc000>;
+			imx,clock-divider = <0x20 0 0 10 1>,
+					    <0x20 0 0 11 1>;
+			imx,clock-multiplexer = <0x2c 9 3>,
+						<0x2c 12 3>;
+			clock-input = <&pll_av_clk 1 0>,
+				      <&pll2_pfd_clk 0 0 0>,
+				      <&pll2_pfd_clk 2 0 0>,
+				      <&pll3_pfd_clk 1 0 0 0>,
+				      <&pll_usb_clk 0 0>;
+			clock-input-name = "pll5-video",
+					   "pll2-pfd-352m",
+					   "pll2-pfd-400m",
+					   "pll3-pfd-540m",
+					   "pll3-usb-otg";
+			clock-output-name = "ldb-di0",
+					    "ldb-di1";
+		};
+
+		ipu_di_pre_clk: ipu-di-pre {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <4>;
+			imx,clock-divider = <0x34 0 0 3 3>,
+					    <0x34 0 0 12 3>,
+					    <0x38 0 0 3 3>,
+					    <0x38 0 0 12 3>;
+			imx,clock-multiplexer = <0x34 6 3>,
+						<0x34 15 3>,
+						<0x38 6 3>,
+						<0x38 15 3>;
+			clock-input = <&mmdc_ch0_axi_clk 0>,
+				      <&pll_usb_clk 0 0>,
+				      <&pll_av_clk 1 0>,
+				      <&pll2_pfd_clk 0 0 0>,
+				      <&pll2_pfd_clk 2 0 0>,
+				      <&pll3_pfd_clk 1 0 0 0>;
+			clock-input-name = "mmdc-ch0-axi",
+					   "pll3-usb-otg",
+					   "pll5-video",
+					   "pll2-pfd-352m",
+					   "pll2-pfd-400m",
+					   "pll3-pfd-540m";
+			clock-output-name = "ipu1-di0-pre",
+					    "ipu1-di1-pre",
+					    "ipu2-di0-pre",
+					    "ipu2-di1-pre";
+		};
+
+		ipu1_di0_clk: ipu1-di0 {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-gate = <0x74 0xc>;
+			imx,clock-multiplexer = <0x34 0 3>;
+			clock-input = <&ipu_di_pre_clk 0 0 0 0>,
+				      <&dummy_clk 0>,
+				      <&dummy_clk 0>,
+				      <&ldb_di_clk 0 0>,
+				      <&ldb_di_clk 1 0>;
+			clock-input-name = "ipu1-di0-pre",
+					   "dummy",
+					   "dummy",
+					   "ldb-di0",
+					   "ldb-di1";
+			clock-output-name = "ipu1-di0";
+		};
+
+		ipu1_di1_clk: ipu1-di1 {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-gate = <0x74 0x30>;
+			imx,clock-multiplexer = <0x34 9 3>;
+			clock-input = <&ipu_di_pre_clk 1 0 0 0>,
+				      <&dummy_clk 0>,
+				      <&dummy_clk 0>,
+				      <&ldb_di_clk 0 0>,
+				      <&ldb_di_clk 1 0>;
+			clock-input-name = "ipu1-di1-pre",
+					   "dummy",
+					   "dummy",
+					   "ldb-di0",
+					   "ldb-di1";
+			clock-output-name = "ipu1-di1";
+		};
+
+		ipu2_di0_clk: ipu2-di0 {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-gate = <0x74 0x300>;
+			imx,clock-multiplexer = <0x38 0 3>;
+			clock-input = <&ipu_di_pre_clk 2 0 0 0>,
+				      <&dummy_clk 0>,
+				      <&dummy_clk 0>,
+				      <&ldb_di_clk 0 0>,
+				      <&ldb_di_clk 1 0>;
+			clock-input-name = "ipu2-di0-pre",
+					   "dummy",
+					   "dummy",
+					   "ldb-di0",
+					   "ldb-di1";
+			clock-output-name = "ipu2-di0";
+		};
+
+		ipu2_di1_clk: ipu2-di1 {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-gate = <0x74 0xc00>;
+			imx,clock-multiplexer = <0x38 9 3>;
+			clock-input = <&ipu_di_pre_clk 3 0 0 0>,
+				      <&dummy_clk 0>,
+				      <&dummy_clk 0>,
+				      <&ldb_di_clk 0 0>,
+				      <&ldb_di_clk 1 0>;
+			clock-input-name = "ipu2-di1-pre",
+					   "dummy",
+					   "dummy",
+					   "ldb-di0",
+					   "ldb-di1";
+			clock-output-name = "ipu2-di1";
+		};
+
+		hsi_tx_clk: hsi-tx {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-gate = <0x74 0x30000>;
+			imx,clock-divider = <0x30 0 0 29 3>;
+			imx,clock-multiplexer = <0x30 28 1>;
+			clock-input = <&pll3_div_clk 0 0 0>,
+				      <&pll2_pfd_clk 2 0 0>;
+			clock-input-name = "pll3-120m",
+					   "pll2-pfd-400m";
+			clock-output-name = "hsi-tx";
+		};
+
+		mlb_clk: mlb {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-gate = <0x74 0xc0000>;
+			clock-input = <&pll_mlb_clk 0>;
+			clock-input-name = "pll6-mlb";
+			clock-output-name = "mlb";
+		};
+
+		mmdc_ipg_clk: mmdc-ipg {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <2>;
+			imx,clock-gate = <0x74 0x3000000>,
+					 <0x74 0xc000000>;
+			clock-input = <&ipg_clk 0>;
+			clock-input-name = "ipg";
+			clock-output-name = "mmdc-ch0-ipg",
+					    "mmdc-ch1-ipg";
+		};
+
+		openvg_axi_clk: openvg-axi {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-gate = <0x74 0xc000000>;
+			clock-input = <&axi_clk 0>;
+			clock-input-name = "axi";
+			clock-output-name = "openvg-axi";
+		};
+
+		pcie_axi_clk: pcie-axi {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-gate = <0x78 0x3>;
+			imx,clock-multiplexer = <0x18 10 1>;
+			clock-input = <&axi_clk 0>,
+				      <&ahb_clk 0>;
+			clock-input-name = "axi",
+					   "ahb";
+			clock-output-name = "pcie-axi";
+		};
+
+		pwm_clk: pwm {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <4>;
+			imx,clock-gate = <0x78 0x30000>,
+					 <0x78 0xc0000>,
+					 <0x78 0x300000>,
+					 <0x78 0xc00000>;
+			clock-input = <&ipg_per_clk 0>;
+			clock-input-name = "ipg-per";
+			clock-output-name = "pwm1",
+					    "pwm2",
+					    "pwm3",
+					    "pwm4";
+		};
+
+		sata_clk: sata {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-gate = <0x7c 0x30>;
+			clock-input = <&ipg_clk 0>;
+			clock-input-name = "ipg";
+			clock-output-name = "sata";
+		};
+
+		sdma_clk: sdma {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-gate = <0x7c 0xc0>;
+			clock-input = <&ahb_clk 0>;
+			clock-input-name = "ahb";
+			clock-output-name = "sdma";
+		};
+
+		spba_clk: spba {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-gate = <0x7c 0x3000>;
+			clock-input = <&ipg_clk 0>;
+			clock-input-name = "ipg";
+			clock-output-name = "spba";
+		};
+
+		ssi_clk: ssi {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <3>;
+			imx,clock-gate = <0x7c 0xc0000>,
+					 <0x7c 0x300000>,
+					 <0x7c 0xc00000>;
+			imx,clock-divider = <0x28 6 3 0 6>,
+					    <0x2c 6 3 0 6>,
+					    <0x28 6 3 0 6>;
+			imx,clock-multiplexer = <0x1c 10 2>,
+						<0x1c 12 2>,
+						<0x1c 14 2>;
+			clock-input = <&pll3_pfd_clk 2 0 0 0>,
+				      <&pll3_pfd_clk 3 0 0 0>,
+				      <&pll_av_clk 0 0>;
+			clock-input-name = "pll3-pfd-508m",
+					   "pll3-pfd-454m",
+					   "pll4-audio";
+			clock-output-name = "ssi1",
+					    "ssi2",
+					    "ssi3";
+		};
+
+		uart_clk: uart {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <2>;
+			imx,clock-gate = <0x7c 0x3000000>,
+					 <0x7c 0xc000000>;
+			imx,clock-divider = <0x24 0 0 0 6>,
+					    <0x24 0 0 0 6>;
+			clock-input = <&pll3_div_clk 1 0 0>;
+			clock-input-name = "pll3-80m";
+			clock-output-name = "uart",
+					    "uart-serial";
+		};
+
+		usboh3_clk: usboh3 {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-gate = <0x80 0x3>;
+			clock-input = <&ipg_clk 0>;
+			clock-input-name = "ipg";
+			clock-output-name = "usboh3";
+		};
+
+		usdhc_clk: usdhc {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <4>;
+			imx,clock-gate = <0x80 0xc>,
+					 <0x80 0x30>,
+					 <0x80 0xc0>,
+					 <0x80 0x300>;
+			imx,clock-divider = <0x24 0 0 11 3>,
+					    <0x24 0 0 16 3>,
+					    <0x24 0 0 19 3>,
+					    <0x24 0 0 22 3>;
+			imx,clock-multiplexer = <0x1c 16 1>,
+						<0x1c 17 1>,
+						<0x1c 18 1>,
+						<0x1c 19 1>;
+			clock-input = <&pll2_pfd_clk 2 0 0>,
+				      <&pll2_pfd_clk 0 0 0>;
+			clock-input-name = "pll2-pfd-400m",
+					   "pll2-pfd-352m";
+			clock-output-name = "usdhc1",
+					    "usdhc2",
+					    "usdhc3",
+					    "usdhc3";
+		};
+
+		enfc_clk: enfc {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-gate = <0x70 0xc000>;
+			imx,clock-divider = <0x2c 18 3 21 6>;
+			imx,clock-multiplexer = <0x2c 16 2>;
+			clock-input = <&pll2_pfd_clk 0 0 0>,
+				      <&pll_bus_clk 0>,
+				      <&pll_usb_clk 0 0>,
+				      <&pll2_pfd_clk 2 0 0>;
+			clock-input-name = "pll2-pfd-352m",
+					   "pll2-bus",
+					   "pll3-usb-otg",
+					   "pll2-pfd-400m";
+			clock-output-name = "enfc";
+		};
+
+		gpmi_bch_apb_clk: gpmi-bch-apb {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-gate = <0x78 0x3000000>;
+			clock-input = <&usdhc_clk 2 0 0 0>;
+			clock-input-name = "usdhc3";
+			clock-output-name = "gpmi-bch-apb";
+		};
+
+		gpmi_bch_clk: gpmi-bch {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-gate = <0x78 0xc000000>;
+			clock-input = <&usdhc_clk 3 0 0 0>;
+			clock-input-name = "usdhc4";
+			clock-output-name = "gpmi-bch";
+		};
+
+		gpmi_io_clk: gpmi-io {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-gate = <0x78 0x30000000>;
+			clock-input = <&enfc_clk 0>;
+			clock-input-name = "enfc";
+			clock-output-name = "gpmi-io";
+		};
+
+		gpmi_apb_clk: gpmi-apb {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-gate = <0x78 0xc0000000>;
+			clock-input = <&usdhc_clk 2 0 0 0>;
+			clock-input-name = "usdhc3";
+			clock-output-name = "gpmi-apb";
+		};
+
+		emi_clk: emi {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <2>;
+			imx,clock-gate = <0x80 0xc00>,
+					 <0x80 0xc00>;
+			imx,clock-divider = <0x1c 0 0 20 3>,
+					    <0x1c 0 0 23 3>;
+			imx,clock-multiplexer = <0x1c 27 2>,
+						<0x1c 29 2>;
+			clock-input = <&axi_clk 0>,
+				      <&pll_usb_clk 0 0>,
+				      <&pll2_pfd_clk 2 0 0>,
+				      <&pll2_pfd_clk 0 0 0>;
+			clock-input-name = "axi",
+					   "pll3-usb-otg",
+					   "pll2-pfd-400m",
+					   "pll2-pfd-352m";
+			clock-output-name = "emi",
+					    "emi-slow";
+		};
+
+		vdo_axi_clk: vdo-axi {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-gate = <0x80 0x3000>;
+			imx,clock-multiplexer = <0x18 11 1>;
+			clock-input = <&axi_clk 0>,
+				      <&ahb_clk 0>;
+			clock-input-name = "axi",
+					   "ahb";
+			clock-output-name = "vdo-axi";
+		};
+
+		vpu_axi_clk: vpu-axi {
+			compatible = "fsl,imx6q-clock";
+			#clock-cells = <1>;
+			imx,clock-gate = <0x80 0xc000>;
+			imx,clock-divider = <0x24 0 0 25 3>;
+			imx,clock-multiplexer = <0x18 14 2>;
+			clock-input = <&axi_clk 0>,
+				      <&pll2_pfd_clk 2 0 0>,
+				      <&pll2_pfd_clk 0 0 0>;
+			clock-input-name = "axi",
+					   "pll2-pfd-400m",
+					   "pll2-pfd-352m";
+			clock-output-name = "vpu-axi";
 		};
 	};
 
@@ -169,6 +1072,8 @@
 					compatible = "fsl,imx6q-uart", "fsl,imx21-uart";
 					reg = <0x02020000 0x4000>;
 					interrupts = <0 26 0x04>;
+					clock-input = <&uart_clk 0 0>;
+					clock-input-name = "uart";
 					status = "disabled";
 				};
 
@@ -245,6 +1150,8 @@
 				compatible = "fsl,imx6q-gpt";
 				reg = <0x02098000 0x4000>;
 				interrupts = <0 55 0x04>;
+				clock-input = <&gpt_clk 0 0>,
+					      <&gpt_clk 1 0>;
 			};
 
 			gpio0: gpio@0209c000 { /* GPIO1 */
@@ -426,6 +1333,8 @@
 				compatible = "fsl,imx6q-fec";
 				reg = <0x02188000 0x4000>;
 				interrupts = <0 118 0x04 0 119 0x04>;
+				clock-input = <&enet_clk 0>;
+				clock-input-name = "enet";
 				status = "disabled";
 			};
 
@@ -438,6 +1347,8 @@
 				compatible = "fsl,imx6q-usdhc";
 				reg = <0x02190000 0x4000>;
 				interrupts = <0 22 0x04>;
+				clock-input = <&usdhc_clk 0 0 0 0>;
+				clock-input-name = "usdhc1";
 				status = "disabled";
 			};
 
@@ -445,6 +1356,8 @@
 				compatible = "fsl,imx6q-usdhc";
 				reg = <0x02194000 0x4000>;
 				interrupts = <0 23 0x04>;
+				clock-input = <&usdhc_clk 1 0 0 0>;
+				clock-input-name = "usdhc2";
 				status = "disabled";
 			};
 
@@ -452,6 +1365,8 @@
 				compatible = "fsl,imx6q-usdhc";
 				reg = <0x02198000 0x4000>;
 				interrupts = <0 24 0x04>;
+				clock-input = <&usdhc_clk 2 0 0 0>;
+				clock-input-name = "usdhc3";
 				status = "disabled";
 			};
 
@@ -459,6 +1374,8 @@
 				compatible = "fsl,imx6q-usdhc";
 				reg = <0x0219c000 0x4000>;
 				interrupts = <0 25 0x04>;
+				clock-input = <&usdhc_clk 3 0 0 0>;
+				clock-input-name = "usdhc4";
 				status = "disabled";
 			};
 
@@ -547,6 +1464,8 @@
 				compatible = "fsl,imx6q-uart", "fsl,imx21-uart";
 				reg = <0x021e8000 0x4000>;
 				interrupts = <0 27 0x04>;
+				clock-input = <&uart_clk 0 0>;
+				clock-input-name = "uart";
 				status = "disabled";
 			};
 
@@ -554,6 +1473,8 @@
 				compatible = "fsl,imx6q-uart", "fsl,imx21-uart";
 				reg = <0x021ec000 0x4000>;
 				interrupts = <0 28 0x04>;
+				clock-input = <&uart_clk 0 0>;
+				clock-input-name = "uart";
 				status = "disabled";
 			};
 
@@ -561,6 +1482,8 @@
 				compatible = "fsl,imx6q-uart", "fsl,imx21-uart";
 				reg = <0x021f0000 0x4000>;
 				interrupts = <0 29 0x04>;
+				clock-input = <&uart_clk 0 0>;
+				clock-input-name = "uart";
 				status = "disabled";
 			};
 
@@ -568,6 +1491,8 @@
 				compatible = "fsl,imx6q-uart", "fsl,imx21-uart";
 				reg = <0x021f4000 0x4000>;
 				interrupts = <0 30 0x04>;
+				clock-input = <&uart_clk 0 0>;
+				clock-input-name = "uart";
 				status = "disabled";
 			};
 		};
diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index d281035..d30501a 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -1,6 +1,9 @@
 config IMX_HAVE_DMA_V1
 	bool
 
+config HAVE_IMX_CLOCK
+	bool
+
 config HAVE_IMX_GPC
 	bool
 
@@ -614,7 +617,9 @@ config SOC_IMX6Q
 	select GENERIC_CLK
 	select GENERIC_CLK_DUMMY
 	select GENERIC_CLK_FIXED
+	select GENERIC_CLK_DIVIDER_FIXED
 	select HAVE_ARM_SCU
+	select HAVE_IMX_CLOCK
 	select HAVE_IMX_GPC
 	select HAVE_IMX_MMDC
 	select HAVE_IMX_SRC
diff --git a/arch/arm/mach-imx/Makefile b/arch/arm/mach-imx/Makefile
index aba7321..efd18b9 100644
--- a/arch/arm/mach-imx/Makefile
+++ b/arch/arm/mach-imx/Makefile
@@ -62,6 +62,7 @@ obj-$(CONFIG_MACH_EUKREA_MBIMXSD35_BASEBOARD) += eukrea_mbimxsd35-baseboard.o
 obj-$(CONFIG_MACH_VPR200) += mach-vpr200.o
 
 obj-$(CONFIG_DEBUG_LL) += lluart.o
+obj-$(CONFIG_HAVE_IMX_CLOCK) += clock.o
 obj-$(CONFIG_HAVE_IMX_GPC) += gpc.o
 obj-$(CONFIG_HAVE_IMX_MMDC) += mmdc.o
 obj-$(CONFIG_HAVE_IMX_SRC) += src.o
diff --git a/arch/arm/mach-imx/clock-imx6q.c b/arch/arm/mach-imx/clock-imx6q.c
index 4bcaa3e..79d5bf3 100644
--- a/arch/arm/mach-imx/clock-imx6q.c
+++ b/arch/arm/mach-imx/clock-imx6q.c
@@ -18,493 +18,69 @@
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_clk.h>
 #include <linux/of_irq.h>
 #include <asm/div64.h>
-#include <asm/mach/map.h>
 #include <mach/common.h>
-#include <mach/hardware.h>
-
-#define PLL_BASE		IMX_IO_ADDRESS(MX6Q_ANATOP_BASE_ADDR)
-#define PLL1_SYS		(PLL_BASE + 0x000)
-#define PLL2_BUS		(PLL_BASE + 0x030)
-#define PLL3_USB_OTG		(PLL_BASE + 0x010)
-#define PLL4_AUDIO		(PLL_BASE + 0x070)
-#define PLL5_VIDEO		(PLL_BASE + 0x0a0)
-#define PLL6_MLB		(PLL_BASE + 0x0d0)
-#define PLL7_USB_HOST		(PLL_BASE + 0x020)
-#define PLL8_ENET		(PLL_BASE + 0x0e0)
-#define PFD_480			(PLL_BASE + 0x0f0)
-#define PFD_528			(PLL_BASE + 0x100)
-#define PLL_NUM_OFFSET		0x010
-#define PLL_DENOM_OFFSET	0x020
-
-#define PFD0			7
-#define PFD1			15
-#define PFD2			23
-#define PFD3			31
-#define PFD_FRAC_MASK		0x3f
+#include "clock.h"
 
+#define PLL_NUM_OFFSET			0x010
+#define PLL_DENOM_OFFSET		0x020
 #define BM_PLL_BYPASS			(0x1 << 16)
-#define BM_PLL_ENABLE			(0x1 << 13)
-#define BM_PLL_POWER_DOWN		(0x1 << 12)
+#define BM_PLL_POWER			(0x1 << 12)
 #define BM_PLL_LOCK			(0x1 << 31)
-#define BP_PLL_SYS_DIV_SELECT		0
-#define BM_PLL_SYS_DIV_SELECT		(0x7f << 0)
-#define BP_PLL_BUS_DIV_SELECT		0
-#define BM_PLL_BUS_DIV_SELECT		(0x1 << 0)
-#define BP_PLL_USB_DIV_SELECT		0
-#define BM_PLL_USB_DIV_SELECT		(0x3 << 0)
-#define BP_PLL_AV_DIV_SELECT		0
-#define BM_PLL_AV_DIV_SELECT		(0x7f << 0)
-#define BP_PLL_ENET_DIV_SELECT		0
-#define BM_PLL_ENET_DIV_SELECT		(0x3 << 0)
-#define BM_PLL_ENET_EN_PCIE		(0x1 << 19)
-#define BM_PLL_ENET_EN_SATA		(0x1 << 20)
-
-#define CCM_BASE	IMX_IO_ADDRESS(MX6Q_CCM_BASE_ADDR)
-#define CCR		(CCM_BASE + 0x00)
-#define CCDR		(CCM_BASE + 0x04)
-#define CSR		(CCM_BASE + 0x08)
-#define CCSR		(CCM_BASE + 0x0c)
-#define CACRR		(CCM_BASE + 0x10)
-#define CBCDR		(CCM_BASE + 0x14)
-#define CBCMR		(CCM_BASE + 0x18)
-#define CSCMR1		(CCM_BASE + 0x1c)
-#define CSCMR2		(CCM_BASE + 0x20)
-#define CSCDR1		(CCM_BASE + 0x24)
-#define CS1CDR		(CCM_BASE + 0x28)
-#define CS2CDR		(CCM_BASE + 0x2c)
-#define CDCDR		(CCM_BASE + 0x30)
-#define CHSCCDR		(CCM_BASE + 0x34)
-#define CSCDR2		(CCM_BASE + 0x38)
-#define CSCDR3		(CCM_BASE + 0x3c)
-#define CSCDR4		(CCM_BASE + 0x40)
-#define CWDR		(CCM_BASE + 0x44)
-#define CDHIPR		(CCM_BASE + 0x48)
-#define CDCR		(CCM_BASE + 0x4c)
-#define CTOR		(CCM_BASE + 0x50)
-#define CLPCR		(CCM_BASE + 0x54)
-#define CISR		(CCM_BASE + 0x58)
-#define CIMR		(CCM_BASE + 0x5c)
-#define CCOSR		(CCM_BASE + 0x60)
-#define CGPR		(CCM_BASE + 0x64)
-#define CCGR0		(CCM_BASE + 0x68)
-#define CCGR1		(CCM_BASE + 0x6c)
-#define CCGR2		(CCM_BASE + 0x70)
-#define CCGR3		(CCM_BASE + 0x74)
-#define CCGR4		(CCM_BASE + 0x78)
-#define CCGR5		(CCM_BASE + 0x7c)
-#define CCGR6		(CCM_BASE + 0x80)
-#define CCGR7		(CCM_BASE + 0x84)
-#define CMEOR		(CCM_BASE + 0x88)
-
-#define CG0		0
-#define CG1		2
-#define CG2		4
-#define CG3		6
-#define CG4		8
-#define CG5		10
-#define CG6		12
-#define CG7		14
-#define CG8		16
-#define CG9		18
-#define CG10		20
-#define CG11		22
-#define CG12		24
-#define CG13		26
-#define CG14		28
-#define CG15		30
-
-#define BP_CCSR_PLL1_SW_CLK_SEL		2
-#define BM_CCSR_PLL1_SW_CLK_SEL		(0x1 << 2)
-#define BP_CCSR_STEP_SEL		8
-#define BM_CCSR_STEP_SEL		(0x1 << 8)
-
-#define BP_CACRR_ARM_PODF		0
-#define BM_CACRR_ARM_PODF		(0x7 << 0)
-
-#define BP_CBCDR_PERIPH2_CLK2_PODF	0
-#define BM_CBCDR_PERIPH2_CLK2_PODF	(0x7 << 0)
-#define BP_CBCDR_MMDC_CH1_AXI_PODF	3
-#define BM_CBCDR_MMDC_CH1_AXI_PODF	(0x7 << 3)
-#define BP_CBCDR_AXI_SEL		6
-#define BM_CBCDR_AXI_SEL		(0x3 << 6)
-#define BP_CBCDR_IPG_PODF		8
-#define BM_CBCDR_IPG_PODF		(0x3 << 8)
-#define BP_CBCDR_AHB_PODF		10
-#define BM_CBCDR_AHB_PODF		(0x7 << 10)
-#define BP_CBCDR_AXI_PODF		16
-#define BM_CBCDR_AXI_PODF		(0x7 << 16)
-#define BP_CBCDR_MMDC_CH0_AXI_PODF	19
-#define BM_CBCDR_MMDC_CH0_AXI_PODF	(0x7 << 19)
-#define BP_CBCDR_PERIPH_CLK_SEL		25
-#define BM_CBCDR_PERIPH_CLK_SEL		(0x1 << 25)
-#define BP_CBCDR_PERIPH2_CLK_SEL	26
-#define BM_CBCDR_PERIPH2_CLK_SEL	(0x1 << 26)
-#define BP_CBCDR_PERIPH_CLK2_PODF	27
-#define BM_CBCDR_PERIPH_CLK2_PODF	(0x7 << 27)
-
-#define BP_CBCMR_GPU2D_AXI_SEL		0
-#define BM_CBCMR_GPU2D_AXI_SEL		(0x1 << 0)
-#define BP_CBCMR_GPU3D_AXI_SEL		1
-#define BM_CBCMR_GPU3D_AXI_SEL		(0x1 << 1)
-#define BP_CBCMR_GPU3D_CORE_SEL		4
-#define BM_CBCMR_GPU3D_CORE_SEL		(0x3 << 4)
-#define BP_CBCMR_GPU3D_SHADER_SEL	8
-#define BM_CBCMR_GPU3D_SHADER_SEL	(0x3 << 8)
-#define BP_CBCMR_PCIE_AXI_SEL		10
-#define BM_CBCMR_PCIE_AXI_SEL		(0x1 << 10)
-#define BP_CBCMR_VDO_AXI_SEL		11
-#define BM_CBCMR_VDO_AXI_SEL		(0x1 << 11)
-#define BP_CBCMR_PERIPH_CLK2_SEL	12
-#define BM_CBCMR_PERIPH_CLK2_SEL	(0x3 << 12)
-#define BP_CBCMR_VPU_AXI_SEL		14
-#define BM_CBCMR_VPU_AXI_SEL		(0x3 << 14)
-#define BP_CBCMR_GPU2D_CORE_SEL		16
-#define BM_CBCMR_GPU2D_CORE_SEL		(0x3 << 16)
-#define BP_CBCMR_PRE_PERIPH_CLK_SEL	18
-#define BM_CBCMR_PRE_PERIPH_CLK_SEL	(0x3 << 18)
-#define BP_CBCMR_PERIPH2_CLK2_SEL	20
-#define BM_CBCMR_PERIPH2_CLK2_SEL	(0x1 << 20)
-#define BP_CBCMR_PRE_PERIPH2_CLK_SEL	21
-#define BM_CBCMR_PRE_PERIPH2_CLK_SEL	(0x3 << 21)
-#define BP_CBCMR_GPU2D_CORE_PODF	23
-#define BM_CBCMR_GPU2D_CORE_PODF	(0x7 << 23)
-#define BP_CBCMR_GPU3D_CORE_PODF	26
-#define BM_CBCMR_GPU3D_CORE_PODF	(0x7 << 26)
-#define BP_CBCMR_GPU3D_SHADER_PODF	29
-#define BM_CBCMR_GPU3D_SHADER_PODF	(0x7 << 29)
-
-#define BP_CSCMR1_PERCLK_PODF		0
-#define BM_CSCMR1_PERCLK_PODF		(0x3f << 0)
-#define BP_CSCMR1_SSI1_SEL		10
-#define BM_CSCMR1_SSI1_SEL		(0x3 << 10)
-#define BP_CSCMR1_SSI2_SEL		12
-#define BM_CSCMR1_SSI2_SEL		(0x3 << 12)
-#define BP_CSCMR1_SSI3_SEL		14
-#define BM_CSCMR1_SSI3_SEL		(0x3 << 14)
-#define BP_CSCMR1_USDHC1_SEL		16
-#define BM_CSCMR1_USDHC1_SEL		(0x1 << 16)
-#define BP_CSCMR1_USDHC2_SEL		17
-#define BM_CSCMR1_USDHC2_SEL		(0x1 << 17)
-#define BP_CSCMR1_USDHC3_SEL		18
-#define BM_CSCMR1_USDHC3_SEL		(0x1 << 18)
-#define BP_CSCMR1_USDHC4_SEL		19
-#define BM_CSCMR1_USDHC4_SEL		(0x1 << 19)
-#define BP_CSCMR1_EMI_PODF		20
-#define BM_CSCMR1_EMI_PODF		(0x7 << 20)
-#define BP_CSCMR1_EMI_SLOW_PODF		23
-#define BM_CSCMR1_EMI_SLOW_PODF		(0x7 << 23)
-#define BP_CSCMR1_EMI_SEL		27
-#define BM_CSCMR1_EMI_SEL		(0x3 << 27)
-#define BP_CSCMR1_EMI_SLOW_SEL		29
-#define BM_CSCMR1_EMI_SLOW_SEL		(0x3 << 29)
-
-#define BP_CSCMR2_CAN_PODF		2
-#define BM_CSCMR2_CAN_PODF		(0x3f << 2)
-#define BM_CSCMR2_LDB_DI0_IPU_DIV	(0x1 << 10)
-#define BM_CSCMR2_LDB_DI1_IPU_DIV	(0x1 << 11)
-#define BP_CSCMR2_ESAI_SEL		19
-#define BM_CSCMR2_ESAI_SEL		(0x3 << 19)
-
-#define BP_CSCDR1_UART_PODF		0
-#define BM_CSCDR1_UART_PODF		(0x3f << 0)
-#define BP_CSCDR1_USDHC1_PODF		11
-#define BM_CSCDR1_USDHC1_PODF		(0x7 << 11)
-#define BP_CSCDR1_USDHC2_PODF		16
-#define BM_CSCDR1_USDHC2_PODF		(0x7 << 16)
-#define BP_CSCDR1_USDHC3_PODF		19
-#define BM_CSCDR1_USDHC3_PODF		(0x7 << 19)
-#define BP_CSCDR1_USDHC4_PODF		22
-#define BM_CSCDR1_USDHC4_PODF		(0x7 << 22)
-#define BP_CSCDR1_VPU_AXI_PODF		25
-#define BM_CSCDR1_VPU_AXI_PODF		(0x7 << 25)
-
-#define BP_CS1CDR_SSI1_PODF		0
-#define BM_CS1CDR_SSI1_PODF		(0x3f << 0)
-#define BP_CS1CDR_SSI1_PRED		6
-#define BM_CS1CDR_SSI1_PRED		(0x7 << 6)
-#define BP_CS1CDR_ESAI_PRED		9
-#define BM_CS1CDR_ESAI_PRED		(0x7 << 9)
-#define BP_CS1CDR_SSI3_PODF		16
-#define BM_CS1CDR_SSI3_PODF		(0x3f << 16)
-#define BP_CS1CDR_SSI3_PRED		22
-#define BM_CS1CDR_SSI3_PRED		(0x7 << 22)
-#define BP_CS1CDR_ESAI_PODF		25
-#define BM_CS1CDR_ESAI_PODF		(0x7 << 25)
-
-#define BP_CS2CDR_SSI2_PODF		0
-#define BM_CS2CDR_SSI2_PODF		(0x3f << 0)
-#define BP_CS2CDR_SSI2_PRED		6
-#define BM_CS2CDR_SSI2_PRED		(0x7 << 6)
-#define BP_CS2CDR_LDB_DI0_SEL		9
-#define BM_CS2CDR_LDB_DI0_SEL		(0x7 << 9)
-#define BP_CS2CDR_LDB_DI1_SEL		12
-#define BM_CS2CDR_LDB_DI1_SEL		(0x7 << 12)
-#define BP_CS2CDR_ENFC_SEL		16
-#define BM_CS2CDR_ENFC_SEL		(0x3 << 16)
-#define BP_CS2CDR_ENFC_PRED		18
-#define BM_CS2CDR_ENFC_PRED		(0x7 << 18)
-#define BP_CS2CDR_ENFC_PODF		21
-#define BM_CS2CDR_ENFC_PODF		(0x3f << 21)
-
-#define BP_CDCDR_ASRC_SERIAL_SEL	7
-#define BM_CDCDR_ASRC_SERIAL_SEL	(0x3 << 7)
-#define BP_CDCDR_ASRC_SERIAL_PODF	9
-#define BM_CDCDR_ASRC_SERIAL_PODF	(0x7 << 9)
-#define BP_CDCDR_ASRC_SERIAL_PRED	12
-#define BM_CDCDR_ASRC_SERIAL_PRED	(0x7 << 12)
-#define BP_CDCDR_SPDIF_SEL		20
-#define BM_CDCDR_SPDIF_SEL		(0x3 << 20)
-#define BP_CDCDR_SPDIF_PODF		22
-#define BM_CDCDR_SPDIF_PODF		(0x7 << 22)
-#define BP_CDCDR_SPDIF_PRED		25
-#define BM_CDCDR_SPDIF_PRED		(0x7 << 25)
-#define BP_CDCDR_HSI_TX_PODF		29
-#define BM_CDCDR_HSI_TX_PODF		(0x7 << 29)
-#define BP_CDCDR_HSI_TX_SEL		28
-#define BM_CDCDR_HSI_TX_SEL		(0x1 << 28)
-
-#define BP_CHSCCDR_IPU1_DI0_SEL		0
-#define BM_CHSCCDR_IPU1_DI0_SEL		(0x7 << 0)
-#define BP_CHSCCDR_IPU1_DI0_PRE_PODF	3
-#define BM_CHSCCDR_IPU1_DI0_PRE_PODF	(0x7 << 3)
-#define BP_CHSCCDR_IPU1_DI0_PRE_SEL	6
-#define BM_CHSCCDR_IPU1_DI0_PRE_SEL	(0x7 << 6)
-#define BP_CHSCCDR_IPU1_DI1_SEL		9
-#define BM_CHSCCDR_IPU1_DI1_SEL		(0x7 << 9)
-#define BP_CHSCCDR_IPU1_DI1_PRE_PODF	12
-#define BM_CHSCCDR_IPU1_DI1_PRE_PODF	(0x7 << 12)
-#define BP_CHSCCDR_IPU1_DI1_PRE_SEL	15
-#define BM_CHSCCDR_IPU1_DI1_PRE_SEL	(0x7 << 15)
-
-#define BP_CSCDR2_IPU2_DI0_SEL		0
-#define BM_CSCDR2_IPU2_DI0_SEL		(0x7)
-#define BP_CSCDR2_IPU2_DI0_PRE_PODF	3
-#define BM_CSCDR2_IPU2_DI0_PRE_PODF	(0x7 << 3)
-#define BP_CSCDR2_IPU2_DI0_PRE_SEL	6
-#define BM_CSCDR2_IPU2_DI0_PRE_SEL	(0x7 << 6)
-#define BP_CSCDR2_IPU2_DI1_SEL		9
-#define BM_CSCDR2_IPU2_DI1_SEL		(0x7 << 9)
-#define BP_CSCDR2_IPU2_DI1_PRE_PODF	12
-#define BM_CSCDR2_IPU2_DI1_PRE_PODF	(0x7 << 12)
-#define BP_CSCDR2_IPU2_DI1_PRE_SEL	15
-#define BM_CSCDR2_IPU2_DI1_PRE_SEL	(0x7 << 15)
-#define BP_CSCDR2_ECSPI_CLK_PODF	19
-#define BM_CSCDR2_ECSPI_CLK_PODF	(0x3f << 19)
-
-#define BP_CSCDR3_IPU1_HSP_SEL		9
-#define BM_CSCDR3_IPU1_HSP_SEL		(0x3 << 9)
-#define BP_CSCDR3_IPU1_HSP_PODF		11
-#define BM_CSCDR3_IPU1_HSP_PODF		(0x7 << 11)
-#define BP_CSCDR3_IPU2_HSP_SEL		14
-#define BM_CSCDR3_IPU2_HSP_SEL		(0x3 << 14)
-#define BP_CSCDR3_IPU2_HSP_PODF		16
-#define BM_CSCDR3_IPU2_HSP_PODF		(0x7 << 16)
-
-#define BM_CDHIPR_AXI_PODF_BUSY		(0x1 << 0)
-#define BM_CDHIPR_AHB_PODF_BUSY		(0x1 << 1)
-#define BM_CDHIPR_MMDC_CH1_PODF_BUSY	(0x1 << 2)
-#define BM_CDHIPR_PERIPH2_SEL_BUSY	(0x1 << 3)
-#define BM_CDHIPR_MMDC_CH0_PODF_BUSY	(0x1 << 4)
-#define BM_CDHIPR_PERIPH_SEL_BUSY	(0x1 << 5)
-#define BM_CDHIPR_ARM_PODF_BUSY		(0x1 << 16)
-
-#define BP_CLPCR_LPM			0
-#define BM_CLPCR_LPM			(0x3 << 0)
-#define BM_CLPCR_BYPASS_PMIC_READY	(0x1 << 2)
-#define BM_CLPCR_ARM_CLK_DIS_ON_LPM	(0x1 << 5)
-#define BM_CLPCR_SBYOS			(0x1 << 6)
-#define BM_CLPCR_DIS_REF_OSC		(0x1 << 7)
-#define BM_CLPCR_VSTBY			(0x1 << 8)
-#define BP_CLPCR_STBY_COUNT		9
-#define BM_CLPCR_STBY_COUNT		(0x3 << 9)
-#define BM_CLPCR_COSC_PWRDOWN		(0x1 << 11)
-#define BM_CLPCR_WB_PER_AT_LPM		(0x1 << 16)
-#define BM_CLPCR_WB_CORE_AT_LPM		(0x1 << 17)
-#define BM_CLPCR_BYP_MMDC_CH0_LPM_HS	(0x1 << 19)
-#define BM_CLPCR_BYP_MMDC_CH1_LPM_HS	(0x1 << 21)
-#define BM_CLPCR_MASK_CORE0_WFI		(0x1 << 22)
-#define BM_CLPCR_MASK_CORE1_WFI		(0x1 << 23)
-#define BM_CLPCR_MASK_CORE2_WFI		(0x1 << 24)
-#define BM_CLPCR_MASK_CORE3_WFI		(0x1 << 25)
-#define BM_CLPCR_MASK_SCU_IDLE		(0x1 << 26)
-#define BM_CLPCR_MASK_L2CC_IDLE		(0x1 << 27)
-
-#define FREQ_480M	480000000
-#define FREQ_528M	528000000
-#define FREQ_594M	594000000
-#define FREQ_650M	650000000
-#define FREQ_1300M	1300000000
-
-struct clk_gate {
-	void __iomem *reg;
-	u32 bm;
-};
-
-struct clk_div {
-	void __iomem *reg;
-	u32 bp_pred;
-	u32 bm_pred;
-	u32 bp_podf;
-	u32 bm_podf;
-};
-
-struct clk_mux {
-	void __iomem *reg;
-	u32 bp;
-	u32 bm;
-	struct clk_hw **parents;
-};
-
-struct clk_hw_imx {
-	const char *name;
-	struct clk_hw hw;
-	struct clk_gate *gate;
-	struct clk_div *div;
-	struct clk_mux *mux;
-	struct clk_hw *parent;
-	const struct clk_hw_ops *ops;
-};
-
-#define to_clk_imx(c) container_of(c, struct clk_hw_imx, hw)
-
-/* Declaration */
-static struct clk_hw_imx step_clk;
-static struct clk_hw_imx pll1_sw_clk;
-static struct clk_hw_imx arm_clk;
-static struct clk_hw_imx ahb_clk;
-static struct clk_hw_imx axi_clk;
-static struct clk_hw_imx ipg_clk;
-static struct clk_hw_imx ipg_perclk;
-static struct clk_hw_imx mmdc_ch0_axi_clk;
-static struct clk_hw_imx periph_clk;
-static struct clk_hw_imx periph_pre_clk;
-static struct clk_hw_imx periph_clk2_clk;
-static struct clk_hw_imx periph2_pre_clk;
-static struct clk_hw_imx periph2_clk2_clk;
-static struct clk_hw_imx ldb_di0_clk;
-static struct clk_hw_imx ldb_di1_clk;
-static struct clk_hw_imx ipu1_di0_pre_clk;
-static struct clk_hw_imx ipu1_di1_pre_clk;
-static struct clk_hw_imx ipu2_di0_pre_clk;
-static struct clk_hw_imx ipu2_di1_pre_clk;
-static struct clk_hw_imx usdhc3_clk;
-static struct clk_hw_imx usdhc4_clk;
-static struct clk_hw_imx enfc_clk;
-
-/* Dummy clock */
-static struct clk_dummy dummy_clk;
-
-/* Fixed clocks */
-static struct clk_hw_fixed ckil_clk;
-static struct clk_hw_fixed ckih_clk;
-static struct clk_hw_fixed osc_clk;
-
-/*
- * Common functions
- */
-static struct clk *_clk_get_parent(struct clk_hw *hw)
-{
-	struct clk_mux *m = to_clk_imx(hw)->mux;
-	u32 i;
-
-	if (!m)
-		return to_clk_imx(hw)->parent->clk;
-
-	i = (readl_relaxed(m->reg) & m->bm) >> m->bp;
-
-	return m->parents[i]->clk;
-}
-
-/*
-static int _clk_set_parent(struct clk_hw *hw, struct clk *parent)
-{
-	struct clk_mux *m = to_clk_imx(hw)->mux;
-	struct clk_hw **parents = m->parents;
-	int i = 0;
-	u32 val;
-
-	while (parents[i]) {
-		if (parent == parents[i]->clk)
-			break;
-		i++;
-	}
-	if (!parents[i])
-		return -EINVAL;
-
-	val = readl_relaxed(m->reg);
-	val &= ~m->bm;
-	val |= i << m->bp;
-	writel_relaxed(val, m->reg);
-
-	if (hw == &periph_clk.hw)
-		return clk_busy_wait(hw);
-
-	return 0;
-}
-*/
-
-static unsigned long _clk_recalc_rate(struct clk_hw *hw)
-{
-	struct clk_div *d = to_clk_imx(hw)->div;
-	u32 val, pred, podf;
-
-	if (!d)
-		return clk_get_rate(clk_get_parent(hw->clk));
-
-	val = readl_relaxed(d->reg);
-	pred = ((val & d->bm_pred) >> d->bp_pred) + 1;
-	podf = ((val & d->bm_podf) >> d->bp_podf) + 1;
-
-	return clk_get_rate(clk_get_parent(hw->clk)) / (pred * podf);
-}
-
-/*
- * PLL
- */
-#define DEF_PLL_GATE(c, r)			\
-static struct clk_gate c##_gate = {		\
-	.reg = r,				\
-	.bm = BM_PLL_ENABLE,			\
-}
 
-DEF_PLL_GATE(pll1_sys,		PLL1_SYS);
-DEF_PLL_GATE(pll2_bus,		PLL2_BUS);
-DEF_PLL_GATE(pll3_usb_otg,	PLL3_USB_OTG);
-DEF_PLL_GATE(pll4_audio,	PLL4_AUDIO);
-DEF_PLL_GATE(pll5_video,	PLL5_VIDEO);
-DEF_PLL_GATE(pll6_mlb,		PLL6_MLB);
-DEF_PLL_GATE(pll7_usb_host,	PLL7_USB_HOST);
-DEF_PLL_GATE(pll8_enet,		PLL8_ENET);
-
-#define DEF_PLL_DIV(c, r, b)			\
-static struct clk_div c##_div = {		\
-	.reg = r,				\
-	.bp_podf = BP_PLL_##b##_DIV_SELECT,	\
-	.bm_podf = BM_PLL_##b##_DIV_SELECT,	\
-}
-
-DEF_PLL_DIV(pll1_sys,		PLL1_SYS,	SYS);
-DEF_PLL_DIV(pll2_bus,		PLL2_BUS,	BUS);
-DEF_PLL_DIV(pll3_usb_otg,	PLL3_USB_OTG,	USB);
-DEF_PLL_DIV(pll4_audio,		PLL4_AUDIO,	AV);
-DEF_PLL_DIV(pll5_video,		PLL5_VIDEO,	AV);
-DEF_PLL_DIV(pll7_usb_host,	PLL7_USB_HOST,	AV);
-DEF_PLL_DIV(pll8_enet,		PLL8_ENET,	ENET);
+#define CLPCR				0x54
+#define  BP_CLPCR_LPM			0
+#define  BM_CLPCR_LPM			(0x3 << 0)
+#define  BM_CLPCR_BYPASS_PMIC_READY	(0x1 << 2)
+#define  BM_CLPCR_ARM_CLK_DIS_ON_LPM	(0x1 << 5)
+#define  BM_CLPCR_SBYOS			(0x1 << 6)
+#define  BM_CLPCR_DIS_REF_OSC		(0x1 << 7)
+#define  BM_CLPCR_VSTBY			(0x1 << 8)
+#define  BP_CLPCR_STBY_COUNT		9
+#define  BM_CLPCR_STBY_COUNT		(0x3 << 9)
+#define  BM_CLPCR_COSC_PWRDOWN		(0x1 << 11)
+#define  BM_CLPCR_WB_PER_AT_LPM		(0x1 << 16)
+#define  BM_CLPCR_WB_CORE_AT_LPM	(0x1 << 17)
+#define  BM_CLPCR_BYP_MMDC_CH0_LPM_HS	(0x1 << 19)
+#define  BM_CLPCR_BYP_MMDC_CH1_LPM_HS	(0x1 << 21)
+#define  BM_CLPCR_MASK_CORE0_WFI	(0x1 << 22)
+#define  BM_CLPCR_MASK_CORE1_WFI	(0x1 << 23)
+#define  BM_CLPCR_MASK_CORE2_WFI	(0x1 << 24)
+#define  BM_CLPCR_MASK_CORE3_WFI	(0x1 << 25)
+#define  BM_CLPCR_MASK_SCU_IDLE		(0x1 << 26)
+#define  BM_CLPCR_MASK_L2CC_IDLE	(0x1 << 27)
+#define CCGR0				0x68
+#define CCGR1				0x6c
+#define CCGR2				0x70
+#define CCGR3				0x74
+#define CCGR4				0x78
+#define CCGR5				0x7c
+#define CCGR6				0x80
+#define CCGR7				0x84
+
+#define FREQ_480M			480000000
+#define FREQ_528M			528000000
+#define FREQ_594M			594000000
+#define FREQ_650M			650000000
+#define FREQ_1300M			1300000000
+
+static void __iomem *ccm_base;
+static void __iomem *anatop_base;
 
 static int pll_enable(struct clk_hw *hw)
 {
-	struct clk_gate *g = to_clk_imx(hw)->gate;
+	struct clk_imx_gate *g = to_clk_imx(hw)->gate;
 	int timeout = 0x100000;
 	u32 val;
 
 	val = readl_relaxed(g->reg);
 	val &= ~BM_PLL_BYPASS;
-	val &= ~BM_PLL_POWER_DOWN;
-	/* 480MHz PLLs have the opposite definition for power bit */
-	if (g->reg == PLL3_USB_OTG || g->reg == PLL7_USB_HOST)
-		val |= BM_PLL_POWER_DOWN;
+	if (g->powerup_set_bit)
+		val |= BM_PLL_POWER;
+	else
+		val &= ~BM_PLL_POWER;
 	writel_relaxed(val, g->reg);
 
 	/* Wait for PLL to lock */
@@ -516,7 +92,7 @@ static int pll_enable(struct clk_hw *hw)
 
 	/* Enable the PLL output now */
 	val = readl_relaxed(g->reg);
-	val |= g->bm;
+	val |= g->mask;
 	writel_relaxed(val, g->reg);
 
 	return 0;
@@ -524,102 +100,110 @@ static int pll_enable(struct clk_hw *hw)
 
 static void pll_disable(struct clk_hw *hw)
 {
-	struct clk_gate *g = to_clk_imx(hw)->gate;
+	struct clk_imx_gate *g = to_clk_imx(hw)->gate;
 	u32 val;
 
 	val = readl_relaxed(g->reg);
-	val &= ~g->bm;
+	val &= ~g->mask;
 	val |= BM_PLL_BYPASS;
-	val |= BM_PLL_POWER_DOWN;
-	if (g->reg == PLL3_USB_OTG || g->reg == PLL7_USB_HOST)
-		val &= ~BM_PLL_POWER_DOWN;
+	if (g->powerup_set_bit)
+		val &= ~BM_PLL_POWER;
+	else
+		val |= BM_PLL_POWER;
 	writel_relaxed(val, g->reg);
 }
 
-static unsigned long pll1_sys_recalc_rate(struct clk_hw *hw)
+static unsigned long pll_recalc_rate(struct clk_hw *hw)
 {
-	struct clk_div *d = to_clk_imx(hw)->div;
-	u32 div = (readl_relaxed(d->reg) & d->bm_podf) >> d->bp_podf;
+	struct clk_imx_div *d = to_clk_imx(hw)->div;
+	u32 div;
 
-	return clk_get_rate(clk_get_parent(hw->clk)) * div / 2;
+	if (!d)
+		return clk_get_rate(clk_get_parent(hw->clk));
+
+	div = readl_relaxed(d->reg) >> d->shift_podf &
+	      ((1 << d->width_podf) - 1);
+
+	return (div == 1) ? clk_get_rate(clk_get_parent(hw->clk)) * 22 :
+			    clk_get_rate(clk_get_parent(hw->clk)) * 20;
 }
 
-static int pll1_sys_set_rate(struct clk_hw *hw, unsigned long rate,
-			     unsigned long *parent_rate)
+static int pll_set_rate(struct clk_hw *hw, unsigned long rate,
+			unsigned long *parent_rate)
 {
-	struct clk_div *d = to_clk_imx(hw)->div;
+	struct clk_imx_div *d = to_clk_imx(hw)->div;
 	u32 val, div;
 
-	if (rate < FREQ_650M || rate > FREQ_1300M)
+	if (!d)
+		return -EINVAL;
+
+	if (rate == FREQ_528M)
+		div = 1;
+	else if (rate == FREQ_480M)
+		div = 0;
+	else
 		return -EINVAL;
 
-	*parent_rate = clk_get_rate(clk_get_parent(hw->clk));
-	div = rate * 2 / *parent_rate;
 	val = readl_relaxed(d->reg);
-	val &= ~d->bm_podf;
-	val |= div << d->bp_podf;
+	val &= ~(((1 << d->width_podf) - 1) << d->shift_podf);
+	val |= div << d->shift_podf;
 	writel_relaxed(val, d->reg);
 
 	return 0;
 }
 
-static unsigned long pll8_enet_recalc_rate(struct clk_hw *hw)
-{
-	struct clk_div *d = to_clk_imx(hw)->div;
-	u32 div = (readl_relaxed(d->reg) & d->bm_podf) >> d->bp_podf;
+static const struct clk_hw_ops pll_ops = {
+	.enable		= pll_enable,
+	.disable	= pll_disable,
+	.recalc_rate	= pll_recalc_rate,
+	.set_rate	= pll_set_rate,
+	.get_parent	= clk_imx_get_parent,
+};
 
-	switch (div) {
-	case 0:
-		return 25000000;
-	case 1:
-		return 50000000;
-	case 2:
-		return 100000000;
-	case 3:
-		return 125000000;
-	}
+static unsigned long pll_sys_recalc_rate(struct clk_hw *hw)
+{
+	struct clk_imx_div *d = to_clk_imx(hw)->div;
+	u32 div = readl_relaxed(d->reg) >> d->shift_podf &
+		  ((1 << d->width_podf) - 1);
 
-	return 0;
+	return clk_get_rate(clk_get_parent(hw->clk)) * div / 2;
 }
 
-static int pll8_enet_set_rate(struct clk_hw *hw, unsigned long rate,
-			      unsigned long *parent_rate)
+static int pll_sys_set_rate(struct clk_hw *hw, unsigned long rate,
+			     unsigned long *parent_rate)
 {
-	struct clk_div *d = to_clk_imx(hw)->div;
+	struct clk_imx_div *d = to_clk_imx(hw)->div;
 	u32 val, div;
 
-	switch (rate) {
-	case 25000000:
-		div = 0;
-		break;
-	case 50000000:
-		div = 1;
-		break;
-	case 100000000:
-		div = 2;
-		break;
-	case 125000000:
-		div = 3;
-		break;
-	default:
+	if (rate < FREQ_650M || rate > FREQ_1300M)
 		return -EINVAL;
-	}
 
+	*parent_rate = clk_get_rate(clk_get_parent(hw->clk));
+	div = rate * 2 / *parent_rate;
 	val = readl_relaxed(d->reg);
-	val &= ~d->bm_podf;
-	val |= div << d->bp_podf;
+	val &= ~(((1 << d->width_podf) - 1) << d->shift_podf);
+	val |= div << d->shift_podf;
 	writel_relaxed(val, d->reg);
 
 	return 0;
 }
 
+static const struct clk_hw_ops pll_sys_ops = {
+	.enable		= pll_enable,
+	.disable	= pll_disable,
+	.recalc_rate	= pll_sys_recalc_rate,
+	.set_rate	= pll_sys_set_rate,
+	.get_parent	= clk_imx_get_parent,
+};
+
 static unsigned long pll_av_recalc_rate(struct clk_hw *hw)
 {
-	struct clk_div *d = to_clk_imx(hw)->div;
+	struct clk_imx_div *d = to_clk_imx(hw)->div;
 	unsigned long parent_rate = clk_get_rate(clk_get_parent(hw->clk));
 	u32 mfn = readl_relaxed(d->reg + PLL_NUM_OFFSET);
 	u32 mfd = readl_relaxed(d->reg + PLL_DENOM_OFFSET);
-	u32 div = (readl_relaxed(d->reg) & d->bm_podf) >> d->bp_podf;
+	u32 div = readl_relaxed(d->reg) >> d->shift_podf &
+		  ((1 << d->width_podf) - 1);
 
 	return (parent_rate * div) + ((parent_rate / mfd) * mfn);
 }
@@ -627,7 +211,7 @@ static unsigned long pll_av_recalc_rate(struct clk_hw *hw)
 static int pll_av_set_rate(struct clk_hw *hw, unsigned long rate,
 			   unsigned long *parent_rate)
 {
-	struct clk_div *d = to_clk_imx(hw)->div;
+	struct clk_imx_div *d = to_clk_imx(hw)->div;
 	u32 val, div;
 	u32 mfn, mfd = 1000000;
 	s64 temp64;
@@ -644,8 +228,8 @@ static int pll_av_set_rate(struct clk_hw *hw, unsigned long rate,
 	mfn = temp64;
 
 	val = readl_relaxed(d->reg);
-	val &= ~d->bm_podf;
-	val |= div << d->bp_podf;
+	val &= ~(((1 << d->width_podf) - 1) << d->shift_podf);
+	val |= div << d->shift_podf;
 	writel_relaxed(val, d->reg);
 	writel_relaxed(mfn, d->reg + PLL_NUM_OFFSET);
 	writel_relaxed(mfd, d->reg + PLL_DENOM_OFFSET);
@@ -653,154 +237,80 @@ static int pll_av_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static unsigned long pll_recalc_rate(struct clk_hw *hw)
-{
-	struct clk_div *d = to_clk_imx(hw)->div;
-	u32 div;
+static const struct clk_hw_ops pll_av_ops = {
+	.enable		= pll_enable,
+	.disable	= pll_disable,
+	.recalc_rate	= pll_av_recalc_rate,
+	.set_rate	= pll_av_set_rate,
+	.get_parent	= clk_imx_get_parent,
+};
 
-	if (d->reg == PLL1_SYS)
-		return pll1_sys_recalc_rate(hw);
-	else if (d->reg == PLL4_AUDIO || d->reg == PLL5_VIDEO)
-		return pll_av_recalc_rate(hw);
-	else if (d->reg == PLL8_ENET)
-		return pll8_enet_recalc_rate(hw);
+static unsigned long pll_enet_recalc_rate(struct clk_hw *hw)
+{
+	struct clk_imx_div *d = to_clk_imx(hw)->div;
+	u32 div = readl_relaxed(d->reg) >> d->shift_podf &
+		  ((1 << d->width_podf) - 1);
 
-	/* fall into generic case */
-	div = (readl_relaxed(d->reg) & d->bm_podf) >> d->bp_podf;
+	switch (div) {
+	case 0:
+		return 25000000;
+	case 1:
+		return 50000000;
+	case 2:
+		return 100000000;
+	case 3:
+		return 125000000;
+	}
 
-	return (div == 1) ? clk_get_rate(clk_get_parent(hw->clk)) * 22 :
-			    clk_get_rate(clk_get_parent(hw->clk)) * 20;
+	return 0;
 }
 
-static int pll_set_rate(struct clk_hw *hw, unsigned long rate,
-			unsigned long *parent_rate)
+static int pll_enet_set_rate(struct clk_hw *hw, unsigned long rate,
+			      unsigned long *parent_rate)
 {
-	struct clk_div *d = to_clk_imx(hw)->div;
+	struct clk_imx_div *d = to_clk_imx(hw)->div;
 	u32 val, div;
 
-	if (d->reg == PLL1_SYS)
-		return pll1_sys_set_rate(hw, rate, parent_rate);
-	else if (d->reg == PLL4_AUDIO || d->reg == PLL5_VIDEO)
-		return pll_av_set_rate(hw, rate, parent_rate);
-	else if (d->reg == PLL8_ENET)
-		return pll8_enet_set_rate(hw, rate, parent_rate);
-
-	/* fall into generic case */
-	if (rate == FREQ_528M)
-		div = 1;
-	else if (rate == FREQ_480M)
+	switch (rate) {
+	case 25000000:
 		div = 0;
-	else
+		break;
+	case 50000000:
+		div = 1;
+		break;
+	case 100000000:
+		div = 2;
+		break;
+	case 125000000:
+		div = 3;
+		break;
+	default:
 		return -EINVAL;
+	}
 
 	val = readl_relaxed(d->reg);
-	val &= ~d->bm_podf;
-	val |= div << d->bp_podf;
+	val &= ~(((1 << d->width_podf) - 1) << d->shift_podf);
+	val |= div << d->shift_podf;
 	writel_relaxed(val, d->reg);
 
 	return 0;
 }
 
-static const struct clk_hw_ops clk_pll_ops = {
+static const struct clk_hw_ops pll_enet_ops = {
 	.enable		= pll_enable,
 	.disable	= pll_disable,
-	.recalc_rate	= pll_recalc_rate,
-	.set_rate	= pll_set_rate,
-	.get_parent	= _clk_get_parent,
-};
-
-#define DEF_PLL(c)			\
-static struct clk_hw_imx c = {		\
-	.name = #c,			\
-	.gate = &c##_gate,		\
-	.div = &c##_div,		\
-	.parent = &osc_clk.hw,		\
-	.ops = &clk_pll_ops,		\
-}
-
-DEF_PLL(pll1_sys);
-DEF_PLL(pll2_bus);
-DEF_PLL(pll3_usb_otg);
-DEF_PLL(pll4_audio);
-DEF_PLL(pll5_video);
-DEF_PLL(pll7_usb_host);
-DEF_PLL(pll8_enet);
-
-/* pll6_mlb: no divider */
-static const struct clk_hw_ops pll6_mlb_ops = {
-	.enable		= pll_enable,
-	.disable	= pll_disable,
-	.recalc_rate	= _clk_recalc_rate,
-	.get_parent	= _clk_get_parent,
-};
-
-static struct clk_hw_imx pll6_mlb = {
-	.gate		= &pll6_mlb_gate,
-	.parent		= &osc_clk.hw,
-	.ops		= &pll6_mlb_ops,
+	.recalc_rate	= pll_enet_recalc_rate,
+	.set_rate	= pll_enet_set_rate,
+	.get_parent	= clk_imx_get_parent,
 };
 
-/*
- * PFD
- */
-#define DEF_PFD_GATE(c, r, bp)			\
-static struct clk_gate c##_gate = {		\
-	.reg = r,				\
-	.bm = 1 << bp,				\
-}
-
-DEF_PFD_GATE(pll2_pfd_352m, PFD_528, PFD0);
-DEF_PFD_GATE(pll2_pfd_594m, PFD_528, PFD1);
-DEF_PFD_GATE(pll2_pfd_400m, PFD_528, PFD2);
-DEF_PFD_GATE(pll3_pfd_720m, PFD_480, PFD0);
-DEF_PFD_GATE(pll3_pfd_540m, PFD_480, PFD1);
-DEF_PFD_GATE(pll3_pfd_508m, PFD_480, PFD2);
-DEF_PFD_GATE(pll3_pfd_454m, PFD_480, PFD3);
-
-#define DEF_PFD_DIV(c, r, bp)			\
-static struct clk_div c##_div = {		\
-	.reg = r,				\
-	.bp_podf = bp - 7,			\
-	.bm_podf = PFD_FRAC_MASK << (bp - 7),	\
-}
-
-DEF_PFD_DIV(pll2_pfd_352m, PFD_528, PFD0);
-DEF_PFD_DIV(pll2_pfd_594m, PFD_528, PFD1);
-DEF_PFD_DIV(pll2_pfd_400m, PFD_528, PFD2);
-DEF_PFD_DIV(pll3_pfd_720m, PFD_480, PFD0);
-DEF_PFD_DIV(pll3_pfd_540m, PFD_480, PFD1);
-DEF_PFD_DIV(pll3_pfd_508m, PFD_480, PFD2);
-DEF_PFD_DIV(pll3_pfd_454m, PFD_480, PFD3);
-
-static int pfd_enable(struct clk_hw *hw)
-{
-	struct clk_gate *g = to_clk_imx(hw)->gate;
-	u32 val;
-
-	val = readl_relaxed(g->reg);
-	val &= ~g->bm;
-	writel_relaxed(val, g->reg);
-
-	return 0;
-}
-
-static void pfd_disable(struct clk_hw *hw)
-{
-	struct clk_gate *g = to_clk_imx(hw)->gate;
-	u32 val;
-
-	val = readl_relaxed(g->reg);
-	val |= g->bm;
-	writel_relaxed(val, g->reg);
-}
-
 static unsigned long pfd_recalc_rate(struct clk_hw *hw)
 {
-	struct clk_div *d = to_clk_imx(hw)->div;
+	struct clk_imx_div *d = to_clk_imx(hw)->div;
 	u64 tmp = (u64) clk_get_rate(clk_get_parent(hw->clk)) * 18;
-	u32 frac;
+	u32 frac = readl_relaxed(d->reg) >> d->shift_podf &
+		   ((1 << d->width_podf) - 1);
 
-	frac = (readl_relaxed(d->reg) & d->bm_podf) >> d->bp_podf;
 	do_div(tmp, frac);
 
 	return tmp;
@@ -809,7 +319,7 @@ static unsigned long pfd_recalc_rate(struct clk_hw *hw)
 static int pfd_set_rate(struct clk_hw *hw, unsigned long rate,
 			unsigned long *pprate)
 {
-	struct clk_div *d = to_clk_imx(hw)->div;
+	struct clk_imx_div *d = to_clk_imx(hw)->div;
 	u64 tmp = (u64) clk_get_rate(clk_get_parent(hw->clk)) * 18;
 	u32 val, frac;
 
@@ -824,8 +334,8 @@ static int pfd_set_rate(struct clk_hw *hw, unsigned long rate,
 	frac = (frac > 35) ? 35 : frac;
 
 	val = readl_relaxed(d->reg);
-	val &= ~d->bm_podf;
-	val |= frac << d->bp_podf;
+	val &= ~(((1 << d->width_podf) - 1) << d->shift_podf);
+	val |= frac << d->shift_podf;
 	writel_relaxed(val, d->reg);
 
 	tmp = (u64) clk_get_rate(clk_get_parent(hw->clk)) * 18;
@@ -851,815 +361,22 @@ static long pfd_round_rate(struct clk_hw *hw, unsigned long rate)
 	return tmp;
 }
 
-static const struct clk_hw_ops clk_pfd_ops = {
-	.enable		= pfd_enable,
-	.disable	= pfd_disable,
+static const struct clk_hw_ops pfd_ops = {
+	.enable		= clk_imx_enable,
+	.disable	= clk_imx_disable,
 	.recalc_rate	= pfd_recalc_rate,
 	.round_rate	= pfd_round_rate,
 	.set_rate	= pfd_set_rate,
-	.get_parent	= _clk_get_parent,
-};
-
-#define DEF_PFD(c, p)			\
-static struct clk_hw_imx c = {		\
-	.name = #c,			\
-	.gate = &c##_gate,		\
-	.div = &c##_div,		\
-	.parent = p,			\
-	.ops = &clk_pfd_ops,		\
-}
-
-DEF_PFD(pll2_pfd_352m, &pll2_bus.hw);
-DEF_PFD(pll2_pfd_594m, &pll2_bus.hw);
-DEF_PFD(pll2_pfd_400m, &pll2_bus.hw);
-DEF_PFD(pll3_pfd_720m, &pll3_usb_otg.hw);
-DEF_PFD(pll3_pfd_540m, &pll3_usb_otg.hw);
-DEF_PFD(pll3_pfd_508m, &pll3_usb_otg.hw);
-DEF_PFD(pll3_pfd_454m, &pll3_usb_otg.hw);
-
-/*
- * Clocks with only fixed divider
- */
-struct clk_div_fixed {
-	struct clk_hw hw;
-	unsigned int div;
-	struct clk_hw *parent;
+	.get_parent	= clk_imx_get_parent,
 };
 
-#define to_clk_div_fixed(c) container_of(c, struct clk_div_fixed, hw)
-
-#define DEF_CLK_DIV_FIXED(c, d, p)		\
-static struct clk_div_fixed c = {		\
-	.div = d,				\
-	.parent = p,				\
-}
-
-DEF_CLK_DIV_FIXED(pll2_200m, 2, &pll2_pfd_400m.hw);
-DEF_CLK_DIV_FIXED(pll3_120m, 4, &pll3_usb_otg.hw);
-DEF_CLK_DIV_FIXED(pll3_80m,  6, &pll3_usb_otg.hw);
-DEF_CLK_DIV_FIXED(pll3_60m,  8, &pll3_usb_otg.hw);
-
-static unsigned long clk_div_fixed_recalc_rate(struct clk_hw *hw)
-{
-	return clk_get_rate(clk_get_parent(hw->clk)) /
-			to_clk_div_fixed(hw)->div;
-}
-
-static struct clk *clk_div_fixed_get_parent(struct clk_hw *hw)
-{
-	return to_clk_div_fixed(hw)->parent->clk;
-}
-
-static const struct clk_hw_ops clk_div_fixed_ops = {
-	.recalc_rate = clk_div_fixed_recalc_rate,
-	.get_parent = clk_div_fixed_get_parent,
-};
-
-/*
- * Generic clocks
- */
-#define DEF_CLK_GATE(c, r, bp)			\
-static struct clk_gate c##_gate = {		\
-	.reg = r,				\
-	.bm = 0x3 << bp,			\
-}
-
-DEF_CLK_GATE(aips_tz1_clk,	CCGR0, CG0);
-DEF_CLK_GATE(aips_tz2_clk,	CCGR0, CG1);
-DEF_CLK_GATE(apbh_dma_clk,	CCGR0, CG2);
-DEF_CLK_GATE(asrc_clk,	 	CCGR0, CG3);
-DEF_CLK_GATE(can1_serial_clk,	CCGR0, CG8);
-DEF_CLK_GATE(can1_clk,	  	CCGR0, CG7);
-DEF_CLK_GATE(can2_serial_clk,	CCGR0, CG10);
-DEF_CLK_GATE(can2_clk,	  	CCGR0, CG9);
-DEF_CLK_GATE(ecspi1_clk,	CCGR1, CG0);
-DEF_CLK_GATE(ecspi2_clk,	CCGR1, CG1);
-DEF_CLK_GATE(ecspi3_clk,	CCGR1, CG2);
-DEF_CLK_GATE(ecspi4_clk,	CCGR1, CG3);
-DEF_CLK_GATE(ecspi5_clk,	CCGR1, CG4);
-DEF_CLK_GATE(enet_clk,		CCGR1, CG5);
-DEF_CLK_GATE(esai_clk,		CCGR1, CG8);
-DEF_CLK_GATE(gpt_serial_clk,	CCGR1, CG11);
-DEF_CLK_GATE(gpt_clk,		CCGR1, CG10);
-DEF_CLK_GATE(gpu2d_core_clk,	CCGR1, CG12);
-DEF_CLK_GATE(gpu3d_core_clk,	CCGR1, CG13);
-DEF_CLK_GATE(gpu3d_shader_clk,	CCGR1, CG13);
-DEF_CLK_GATE(hdmi_iahb_clk,	CCGR2, CG0);
-DEF_CLK_GATE(hdmi_isfr_clk,	CCGR2, CG2);
-DEF_CLK_GATE(i2c1_clk,		CCGR2, CG3);
-DEF_CLK_GATE(i2c2_clk,		CCGR2, CG4);
-DEF_CLK_GATE(i2c3_clk,		CCGR2, CG5);
-DEF_CLK_GATE(iim_clk,		CCGR2, CG6);
-DEF_CLK_GATE(enfc_clk,		CCGR2, CG7);
-DEF_CLK_GATE(ipu1_clk,		CCGR3, CG0);
-DEF_CLK_GATE(ipu1_di0_clk,	CCGR3, CG1);
-DEF_CLK_GATE(ipu1_di1_clk,	CCGR3, CG2);
-DEF_CLK_GATE(ipu2_clk,		CCGR3, CG3);
-DEF_CLK_GATE(ipu2_di0_clk,	CCGR3, CG4);
-DEF_CLK_GATE(ipu2_di1_clk,	CCGR3, CG5);
-DEF_CLK_GATE(ldb_di0_clk,	CCGR3, CG6);
-DEF_CLK_GATE(ldb_di1_clk,	CCGR3, CG7);
-DEF_CLK_GATE(hsi_tx_clk,	CCGR3, CG8);
-DEF_CLK_GATE(mlb_clk,		CCGR3, CG9);
-DEF_CLK_GATE(mmdc_ch0_ipg_clk,	CCGR3, CG12);
-DEF_CLK_GATE(mmdc_ch0_axi_clk,	CCGR3, CG10);
-DEF_CLK_GATE(mmdc_ch1_ipg_clk,	CCGR3, CG13);
-DEF_CLK_GATE(mmdc_ch1_axi_clk,	CCGR3, CG11);
-DEF_CLK_GATE(openvg_axi_clk,	CCGR3, CG13);
-DEF_CLK_GATE(pcie_axi_clk,	CCGR4, CG0);
-DEF_CLK_GATE(pwm1_clk,		CCGR4, CG8);
-DEF_CLK_GATE(pwm2_clk,		CCGR4, CG9);
-DEF_CLK_GATE(pwm3_clk,		CCGR4, CG10);
-DEF_CLK_GATE(pwm4_clk,		CCGR4, CG11);
-DEF_CLK_GATE(gpmi_bch_apb_clk,	CCGR4, CG12);
-DEF_CLK_GATE(gpmi_bch_clk,	CCGR4, CG13);
-DEF_CLK_GATE(gpmi_apb_clk,	CCGR4, CG15);
-DEF_CLK_GATE(gpmi_io_clk,	CCGR4, CG14);
-DEF_CLK_GATE(sata_clk,		CCGR5, CG2);
-DEF_CLK_GATE(sdma_clk,		CCGR5, CG3);
-DEF_CLK_GATE(spba_clk,		CCGR5, CG6);
-DEF_CLK_GATE(spdif_clk,		CCGR5, CG7);
-DEF_CLK_GATE(ssi1_clk,		CCGR5, CG9);
-DEF_CLK_GATE(ssi2_clk,		CCGR5, CG10);
-DEF_CLK_GATE(ssi3_clk,		CCGR5, CG11);
-DEF_CLK_GATE(uart_serial_clk,	CCGR5, CG13);
-DEF_CLK_GATE(uart_clk,		CCGR5, CG12);
-DEF_CLK_GATE(usboh3_clk,	CCGR6, CG0);
-DEF_CLK_GATE(usdhc1_clk,	CCGR6, CG1);
-DEF_CLK_GATE(usdhc2_clk,	CCGR6, CG2);
-DEF_CLK_GATE(usdhc3_clk,	CCGR6, CG3);
-DEF_CLK_GATE(usdhc4_clk,	CCGR6, CG4);
-DEF_CLK_GATE(emi_slow_clk,	CCGR6, CG5);
-DEF_CLK_GATE(vdo_axi_clk,	CCGR6, CG6);
-DEF_CLK_GATE(vpu_axi_clk,	CCGR6, CG7);
-
-#define DEF_CLK_DIV1(c, r, b)			\
-static struct clk_div c##_div = {		\
-	.reg = r,				\
-	.bp_podf = BP_##r##_##b##_PODF,		\
-	.bm_podf = BM_##r##_##b##_PODF,		\
-}
-
-DEF_CLK_DIV1(arm_clk,		CACRR,		ARM);
-DEF_CLK_DIV1(ipg_clk,		CBCDR,		IPG);
-DEF_CLK_DIV1(ahb_clk,		CBCDR,		AHB);
-DEF_CLK_DIV1(axi_clk,		CBCDR,		AXI);
-DEF_CLK_DIV1(mmdc_ch0_axi_clk,	CBCDR,		MMDC_CH0_AXI);
-DEF_CLK_DIV1(mmdc_ch1_axi_clk,	CBCDR,		MMDC_CH1_AXI);
-DEF_CLK_DIV1(periph_clk2_clk,	CBCDR,		PERIPH_CLK2);
-DEF_CLK_DIV1(periph2_clk2_clk,	CBCDR,		PERIPH2_CLK2);
-DEF_CLK_DIV1(gpu2d_core_clk,	CBCMR,		GPU2D_CORE);
-DEF_CLK_DIV1(gpu3d_core_clk,	CBCMR,		GPU3D_CORE);
-DEF_CLK_DIV1(gpu3d_shader_clk,	CBCMR,		GPU3D_SHADER);
-DEF_CLK_DIV1(ipg_perclk,	CSCMR1,		PERCLK);
-DEF_CLK_DIV1(emi_clk,		CSCMR1,		EMI);
-DEF_CLK_DIV1(emi_slow_clk,	CSCMR1,		EMI_SLOW);
-DEF_CLK_DIV1(can1_clk,		CSCMR2,		CAN);
-DEF_CLK_DIV1(uart_clk,		CSCDR1,		UART);
-DEF_CLK_DIV1(usdhc1_clk,	CSCDR1,		USDHC1);
-DEF_CLK_DIV1(usdhc2_clk,	CSCDR1,		USDHC2);
-DEF_CLK_DIV1(usdhc3_clk,	CSCDR1,		USDHC3);
-DEF_CLK_DIV1(usdhc4_clk,	CSCDR1,		USDHC4);
-DEF_CLK_DIV1(vpu_axi_clk,	CSCDR1,		VPU_AXI);
-DEF_CLK_DIV1(hsi_tx_clk,	CDCDR,		HSI_TX);
-DEF_CLK_DIV1(ipu1_di0_pre_clk,	CHSCCDR,	IPU1_DI0_PRE);
-DEF_CLK_DIV1(ipu1_di1_pre_clk,	CHSCCDR,	IPU1_DI1_PRE);
-DEF_CLK_DIV1(ipu2_di0_pre_clk,	CSCDR2,		IPU2_DI0_PRE);
-DEF_CLK_DIV1(ipu2_di1_pre_clk,	CSCDR2,		IPU2_DI1_PRE);
-DEF_CLK_DIV1(ipu1_clk,		CSCDR3,		IPU1_HSP);
-DEF_CLK_DIV1(ipu2_clk,		CSCDR3,		IPU2_HSP);
-
-#define DEF_CLK_DIV2(c, r, b)			\
-static struct clk_div c##_div = {		\
-	.reg = r,				\
-	.bp_pred = BP_##r##_##b##_PRED,		\
-	.bm_pred = BM_##r##_##b##_PRED,		\
-	.bp_podf = BP_##r##_##b##_PODF,		\
-	.bm_podf = BM_##r##_##b##_PODF,		\
-}
-
-DEF_CLK_DIV2(ssi1_clk,		CS1CDR,	SSI1);
-DEF_CLK_DIV2(ssi3_clk,		CS1CDR,	SSI3);
-DEF_CLK_DIV2(esai_clk,		CS1CDR,	ESAI);
-DEF_CLK_DIV2(ssi2_clk,		CS2CDR,	SSI2);
-DEF_CLK_DIV2(enfc_clk,		CS2CDR,	ENFC);
-DEF_CLK_DIV2(spdif_clk,		CDCDR,	SPDIF);
-DEF_CLK_DIV2(asrc_serial_clk,	CDCDR,	ASRC_SERIAL);
-
-static struct clk_hw *step_clk_parents[] = {
-	&osc_clk.hw,
-	&pll2_pfd_400m.hw,
-	NULL
-};
-
-static struct clk_hw *pll1_sw_clk_parents[] = {
-	&pll1_sys.hw,
-	&step_clk.hw,
-	NULL
-};
-
-static struct clk_hw *axi_clk_parents[] = {
-	&periph_clk.hw,
-	&pll2_pfd_400m.hw,
-	&pll3_pfd_540m.hw,
-	NULL
-};
-
-static struct clk_hw *periph_clk_parents[] = {
-	&periph_pre_clk.hw,
-	&periph_clk2_clk.hw,
-	NULL
-};
-
-static struct clk_hw *periph_pre_clk_parents[] = {
-	&pll2_bus.hw,
-	&pll2_pfd_400m.hw,
-	&pll2_pfd_352m.hw,
-	&pll2_200m.hw,
-	NULL
-};
-
-static struct clk_hw *periph_clk2_clk_parents[] = {
-	&pll3_usb_otg.hw,
-	&osc_clk.hw,
-	NULL
-};
-
-static struct clk_hw *periph2_clk_parents[] = {
-	&periph2_pre_clk.hw,
-	&periph2_clk2_clk.hw,
-	NULL
-};
-
-static struct clk_hw *periph2_pre_clk_parents[] = {
-	&pll2_bus.hw,
-	&pll2_pfd_400m.hw,
-	&pll2_pfd_352m.hw,
-	&pll2_200m.hw,
-	NULL
-};
-
-static struct clk_hw *periph2_clk2_clk_parents[] = {
-	&pll3_usb_otg.hw,
-	&osc_clk.hw,
-	NULL
-};
-
-static struct clk_hw *gpu2d_axi_clk_parents[] = {
-	&axi_clk.hw,
-	&ahb_clk.hw,
-	NULL
-};
-
-#define gpu3d_axi_clk_parents gpu2d_axi_clk_parents
-#define pcie_axi_clk_parents gpu2d_axi_clk_parents
-#define vdo_axi_clk_parents gpu2d_axi_clk_parents
-
-static struct clk_hw *gpu3d_core_clk_parents[] = {
-	&mmdc_ch0_axi_clk.hw,
-	&pll3_usb_otg.hw,
-	&pll2_pfd_594m.hw,
-	&pll2_pfd_400m.hw,
-	NULL
-};
-
-static struct clk_hw *gpu3d_shader_clk_parents[] = {
-	&mmdc_ch0_axi_clk.hw,
-	&pll3_usb_otg.hw,
-	&pll2_pfd_594m.hw,
-	&pll3_pfd_720m.hw,
-	NULL
-};
-
-static struct clk_hw *vpu_axi_clk_parents[] = {
-	&axi_clk.hw,
-	&pll2_pfd_400m.hw,
-	&pll2_pfd_352m.hw,
-	NULL
-};
-
-static struct clk_hw *gpu2d_core_clk_parents[] = {
-	&axi_clk.hw,
-	&pll3_usb_otg.hw,
-	&pll2_pfd_352m.hw,
-	&pll2_pfd_400m.hw,
-	NULL
-};
-
-static struct clk_hw *ssi1_clk_parents[] = {
-	&pll3_pfd_508m.hw,
-	&pll3_pfd_454m.hw,
-	&pll4_audio.hw,
-	NULL
-};
-
-#define ssi2_clk_parents ssi1_clk_parents
-#define ssi3_clk_parents ssi1_clk_parents
-
-static struct clk_hw *usdhc1_clk_parents[] = {
-	&pll2_pfd_400m.hw,
-	&pll2_pfd_352m.hw,
-	NULL
-};
-
-#define usdhc2_clk_parents usdhc1_clk_parents
-#define usdhc3_clk_parents usdhc1_clk_parents
-#define usdhc4_clk_parents usdhc1_clk_parents
-
-static struct clk_hw *emi_clk_parents[] = {
-	&axi_clk.hw,
-	&pll3_usb_otg.hw,
-	&pll2_pfd_400m.hw,
-	&pll2_pfd_352m.hw,
-	NULL
-};
-
-#define emi_slow_clk_parents emi_clk_parents
-
-static struct clk_hw *esai_clk_parents[] = {
-	&pll4_audio.hw,
-	&pll3_pfd_508m.hw,
-	&pll3_pfd_454m.hw,
-	&pll3_usb_otg.hw,
-	NULL
-};
-
-#define spdif_clk_parents esai_clk_parents
-#define asrc_serial_clk_parents esai_clk_parents
-
-static struct clk_hw *ldb_di0_clk_parents[] = {
-	&pll5_video.hw,
-	&pll2_pfd_352m.hw,
-	&pll2_pfd_400m.hw,
-	&pll3_pfd_540m.hw,
-	&pll3_usb_otg.hw,
-	NULL
-};
-
-#define ldb_di1_clk_parents ldb_di0_clk_parents
-
-static struct clk_hw *enfc_clk_parents[] = {
-	&pll2_pfd_352m.hw,
-	&pll2_bus.hw,
-	&pll3_usb_otg.hw,
-	&pll2_pfd_400m.hw,
-	NULL
-};
-
-static struct clk_hw *hsi_tx_clk_parents[] = {
-	&pll3_120m.hw,
-	&pll2_pfd_400m.hw,
-	NULL
-};
-
-static struct clk_hw *ipu1_di0_pre_clk_parents[] = {
-	&mmdc_ch0_axi_clk.hw,
-	&pll3_usb_otg.hw,
-	&pll5_video.hw,
-	&pll2_pfd_352m.hw,
-	&pll2_pfd_400m.hw,
-	&pll3_pfd_540m.hw,
-	NULL
-};
-
-#define ipu1_di1_pre_clk_parents ipu1_di0_pre_clk_parents
-#define ipu2_di0_pre_clk_parents ipu1_di0_pre_clk_parents
-#define ipu2_di1_pre_clk_parents ipu1_di0_pre_clk_parents
-
-#define DEF_IPU_DI_PARENTS(i, d)				\
-static struct clk_hw *ipu##i##_di##d##_clk_parents[] = {	\
-	&ipu##i##_di##d##_pre_clk.hw,				\
-	&dummy_clk.hw,						\
-	&dummy_clk.hw,						\
-	&ldb_di0_clk.hw,					\
-	&ldb_di1_clk.hw,					\
-	NULL							\
-}
-
-DEF_IPU_DI_PARENTS(1, 0);
-DEF_IPU_DI_PARENTS(1, 1);
-DEF_IPU_DI_PARENTS(2, 0);
-DEF_IPU_DI_PARENTS(2, 1);
-
-static struct clk_hw *ipu1_clk_parents[] = {
-	&mmdc_ch0_axi_clk.hw,
-	&pll2_pfd_400m.hw,
-	&pll3_120m.hw,
-	&pll3_pfd_540m.hw,
-	NULL
-};
-
-#define ipu2_clk_parents ipu1_clk_parents
-
-#define DEF_CLK_MUX(c, r, b)			\
-static struct clk_mux c##_mux = {		\
-	.reg = r,				\
-	.bp = BP_##r##_##b##_SEL,		\
-	.bm = BM_##r##_##b##_SEL,		\
-	.parents = &c##_parents[0],		\
-}
-
-DEF_CLK_MUX(step_clk,		CCSR,		STEP);
-DEF_CLK_MUX(pll1_sw_clk,	CCSR,		PLL1_SW_CLK);
-DEF_CLK_MUX(axi_clk,		CBCDR,		AXI);
-DEF_CLK_MUX(periph_clk,		CBCDR,		PERIPH_CLK);
-DEF_CLK_MUX(periph_pre_clk,	CBCMR,		PRE_PERIPH_CLK);
-DEF_CLK_MUX(periph_clk2_clk,	CBCMR,		PERIPH_CLK2);
-DEF_CLK_MUX(periph2_clk,	CBCDR,		PERIPH2_CLK);
-DEF_CLK_MUX(periph2_pre_clk,	CBCMR,		PRE_PERIPH2_CLK);
-DEF_CLK_MUX(periph2_clk2_clk,	CBCMR,		PERIPH2_CLK2);
-DEF_CLK_MUX(gpu2d_axi_clk,	CBCMR,		GPU2D_AXI);
-DEF_CLK_MUX(gpu3d_axi_clk,	CBCMR,		GPU3D_AXI);
-DEF_CLK_MUX(gpu3d_core_clk,	CBCMR,		GPU3D_CORE);
-DEF_CLK_MUX(gpu3d_shader_clk,	CBCMR,		GPU3D_SHADER);
-DEF_CLK_MUX(pcie_axi_clk,	CBCMR,		PCIE_AXI);
-DEF_CLK_MUX(vdo_axi_clk,	CBCMR,		VDO_AXI);
-DEF_CLK_MUX(vpu_axi_clk,	CBCMR,		VPU_AXI);
-DEF_CLK_MUX(gpu2d_core_clk,	CBCMR,		GPU2D_CORE);
-DEF_CLK_MUX(ssi1_clk,		CSCMR1,		SSI1);
-DEF_CLK_MUX(ssi2_clk,		CSCMR1,		SSI2);
-DEF_CLK_MUX(ssi3_clk,		CSCMR1,		SSI3);
-DEF_CLK_MUX(usdhc1_clk,		CSCMR1,		USDHC1);
-DEF_CLK_MUX(usdhc2_clk,		CSCMR1,		USDHC2);
-DEF_CLK_MUX(usdhc3_clk,		CSCMR1,		USDHC3);
-DEF_CLK_MUX(usdhc4_clk,		CSCMR1,		USDHC4);
-DEF_CLK_MUX(emi_clk,		CSCMR1,		EMI);
-DEF_CLK_MUX(emi_slow_clk,	CSCMR1,		EMI_SLOW);
-DEF_CLK_MUX(esai_clk,		CSCMR2,		ESAI);
-DEF_CLK_MUX(ldb_di0_clk,	CS2CDR,		LDB_DI0);
-DEF_CLK_MUX(ldb_di1_clk,	CS2CDR,		LDB_DI1);
-DEF_CLK_MUX(enfc_clk,		CS2CDR,		ENFC);
-DEF_CLK_MUX(spdif_clk,		CDCDR,		SPDIF);
-DEF_CLK_MUX(asrc_serial_clk,	CDCDR,		ASRC_SERIAL);
-DEF_CLK_MUX(hsi_tx_clk,		CDCDR,		HSI_TX);
-DEF_CLK_MUX(ipu1_di0_pre_clk,	CHSCCDR,	IPU1_DI0_PRE);
-DEF_CLK_MUX(ipu1_di1_pre_clk,	CHSCCDR,	IPU1_DI1_PRE);
-DEF_CLK_MUX(ipu2_di0_pre_clk,	CSCDR2,		IPU2_DI0_PRE);
-DEF_CLK_MUX(ipu2_di1_pre_clk,	CSCDR2,		IPU2_DI1_PRE);
-DEF_CLK_MUX(ipu1_di0_clk,	CHSCCDR,	IPU1_DI0);
-DEF_CLK_MUX(ipu1_di1_clk,	CHSCCDR,	IPU1_DI1);
-DEF_CLK_MUX(ipu2_di0_clk,	CSCDR2,		IPU2_DI0);
-DEF_CLK_MUX(ipu2_di1_clk,	CSCDR2,		IPU2_DI1);
-DEF_CLK_MUX(ipu1_clk,		CSCDR3,		IPU1_HSP);
-DEF_CLK_MUX(ipu2_clk,		CSCDR3,		IPU2_HSP);
-
-static int _clk_enable(struct clk_hw *hw)
-{
-	struct clk_gate *g = to_clk_imx(hw)->gate;
-	u32 val;
-
-	val = readl_relaxed(g->reg);
-	val |= g->bm;
-	writel_relaxed(val, g->reg);
-
-	return 0;
-}
-
-static void _clk_disable(struct clk_hw *hw)
-{
-	struct clk_gate *g = to_clk_imx(hw)->gate;
-	u32 val;
-
-	val = readl_relaxed(g->reg);
-	val &= ~g->bm;
-	writel_relaxed(val, g->reg);
-}
-
-static void calc_pred_podf_dividers(u32 div, u32 *pred, u32 *podf)
-{
-	u32 min_pred, temp_pred, old_err, err;
-
-	if (div >= 512) {
-		*pred = 8;
-		*podf = 64;
-	} else if (div >= 8) {
-		min_pred = (div - 1) / 64 + 1;
-		old_err = 8;
-		for (temp_pred = 8; temp_pred >= min_pred; temp_pred--) {
-			err = div % temp_pred;
-			if (err == 0) {
-				*pred = temp_pred;
-				break;
-			}
-			err = temp_pred - err;
-			if (err < old_err) {
-				old_err = err;
-				*pred = temp_pred;
-			}
-		}
-		*podf = (div + *pred - 1) / *pred;
-	} else if (div < 8) {
-		*pred = div;
-		*podf = 1;
-	}
-}
-
-static int clk_busy_wait(struct clk_hw *hw)
-{
-	int timeout = 0x100000;
-	u32 bm;
-
-	if (hw == &axi_clk.hw)
-		bm = BM_CDHIPR_AXI_PODF_BUSY;
-	else if (hw == &ahb_clk.hw)
-		bm = BM_CDHIPR_AHB_PODF_BUSY;
-	else if (hw == &mmdc_ch0_axi_clk.hw)
-		bm = BM_CDHIPR_MMDC_CH0_PODF_BUSY;
-	else if (hw == &periph_clk.hw)
-		bm = BM_CDHIPR_PERIPH_SEL_BUSY;
-	else if (hw == &arm_clk.hw)
-		bm = BM_CDHIPR_ARM_PODF_BUSY;
-	else
-		return -EINVAL;
-
-	while ((readl_relaxed(CDHIPR) & bm) && --timeout)
-		cpu_relax();
-
-	if (unlikely(!timeout))
-		return -EBUSY;
-
-	return 0;
-}
-
-static int _clk_set_rate(struct clk_hw *hw, unsigned long rate,
-			 unsigned long *parent_rate)
-{
-	struct clk_div *d = to_clk_imx(hw)->div;
-	u32 max_div = ((d->bm_pred >> d->bp_pred) + 1) *
-		      ((d->bm_podf >> d->bp_podf) + 1);
-	u32 val, div, pred = 0, podf;
-
-	*parent_rate = clk_get_rate(clk_get_parent(hw->clk));
-
-	div = *parent_rate / rate;
-	if (div == 0)
-		div++;
-
-	if ((*parent_rate / div != rate) || div > max_div)
-		return -EINVAL;
-
-	if (d->bm_pred) {
-		calc_pred_podf_dividers(div, &pred, &podf);
-	} else {
-		pred = 1;
-		podf = div;
-	}
-
-	val = readl_relaxed(d->reg);
-	val &= ~(d->bm_pred | d->bm_podf);
-	val |= (pred - 1) << d->bp_pred | (podf - 1) << d->bp_podf;
-	writel_relaxed(val, d->reg);
-
-	if (hw == &axi_clk.hw || hw == &ahb_clk.hw ||
-	    hw == &mmdc_ch0_axi_clk.hw || hw == &arm_clk.hw)
-		return clk_busy_wait(hw);
-
-	return 0;
-}
-
-static long _clk_round_rate(struct clk_hw *hw, unsigned long rate)
-{
-	struct clk_div *d = to_clk_imx(hw)->div;
-	u32 div, div_max, pred = 0, podf;
-	unsigned long parent_rate = clk_get_rate(clk_get_parent(hw->clk));
-
-	div = parent_rate / rate;
-	if (div == 0 || parent_rate % rate)
-		div++;
-
-	if (d->bm_pred) {
-		calc_pred_podf_dividers(div, &pred, &podf);
-		div = pred * podf;
-	} else {
-		div_max = (d->bm_podf >> d->bp_podf) + 1;
-		if (div > div_max)
-			div = div_max;
-	}
-
-	return parent_rate / div;
-}
-
-/* Clocks with only gate */
-static const struct clk_hw_ops clk_og_imx_ops = {
-	.enable		= _clk_enable,
-	.disable	= _clk_disable,
-	.recalc_rate	= _clk_recalc_rate,
-	.get_parent	= _clk_get_parent,
-};
-
-#define DEF_OG_CLK(c, p)		\
-static struct clk_hw_imx c = {		\
-	.name = #c,			\
-	.gate = &c##_gate,		\
-	.parent = p,			\
-	.ops = &clk_og_imx_ops,		\
-}
-
-DEF_OG_CLK(aips_tz1_clk,	&ahb_clk.hw);
-DEF_OG_CLK(aips_tz2_clk,	&ahb_clk.hw);
-DEF_OG_CLK(apbh_dma_clk,	&ahb_clk.hw);
-DEF_OG_CLK(asrc_clk,		&pll4_audio.hw);
-DEF_OG_CLK(can1_serial_clk,	&pll3_usb_otg.hw);
-DEF_OG_CLK(can2_serial_clk,	&pll3_usb_otg.hw);
-DEF_OG_CLK(can2_clk,		&pll3_usb_otg.hw);
-DEF_OG_CLK(ecspi1_clk,		&pll3_60m.hw);
-DEF_OG_CLK(ecspi2_clk,		&pll3_60m.hw);
-DEF_OG_CLK(ecspi3_clk,		&pll3_60m.hw);
-DEF_OG_CLK(ecspi4_clk,		&pll3_60m.hw);
-DEF_OG_CLK(ecspi5_clk,		&pll3_60m.hw);
-DEF_OG_CLK(enet_clk,		&ipg_clk.hw);
-DEF_OG_CLK(gpt_serial_clk,	&ipg_perclk.hw);
-DEF_OG_CLK(gpt_clk,		&ipg_perclk.hw);
-DEF_OG_CLK(hdmi_iahb_clk,	&ahb_clk.hw);
-DEF_OG_CLK(hdmi_isfr_clk,	&pll3_pfd_540m.hw);
-DEF_OG_CLK(i2c1_clk,		&ipg_perclk.hw);
-DEF_OG_CLK(i2c2_clk,		&ipg_perclk.hw);
-DEF_OG_CLK(i2c3_clk,		&ipg_perclk.hw);
-DEF_OG_CLK(iim_clk,		&ipg_clk.hw);
-DEF_OG_CLK(mlb_clk,		&pll6_mlb.hw);
-DEF_OG_CLK(mmdc_ch0_ipg_clk,	&ipg_clk.hw);
-DEF_OG_CLK(mmdc_ch1_ipg_clk,	&ipg_clk.hw);
-DEF_OG_CLK(openvg_axi_clk,	&axi_clk.hw);
-DEF_OG_CLK(pwm1_clk,		&ipg_perclk.hw);
-DEF_OG_CLK(pwm2_clk,		&ipg_perclk.hw);
-DEF_OG_CLK(pwm3_clk,		&ipg_perclk.hw);
-DEF_OG_CLK(pwm4_clk,		&ipg_perclk.hw);
-DEF_OG_CLK(gpmi_bch_apb_clk,	&usdhc3_clk.hw);
-DEF_OG_CLK(gpmi_bch_clk,	&usdhc4_clk.hw);
-DEF_OG_CLK(gpmi_apb_clk,	&usdhc3_clk.hw);
-DEF_OG_CLK(gpmi_io_clk,		&enfc_clk.hw);
-DEF_OG_CLK(sdma_clk,		&ahb_clk.hw);
-DEF_OG_CLK(spba_clk,		&ipg_clk.hw);
-DEF_OG_CLK(uart_serial_clk,	&pll3_usb_otg.hw);
-DEF_OG_CLK(usboh3_clk,		&ipg_clk.hw);
-
-/* Clocks with only divider */
-static const struct clk_hw_ops clk_od_imx_ops = {
-	.recalc_rate	= _clk_recalc_rate,
-	.round_rate	= _clk_round_rate,
-	.set_rate	= _clk_set_rate,
-	.get_parent	= _clk_get_parent,
-};
-
-#define DEF_OD_CLK(c, p)		\
-static struct clk_hw_imx c = {		\
-	.name = #c,			\
-	.div = &c##_div,		\
-	.parent = p,			\
-	.ops = &clk_od_imx_ops,		\
-}
-
-DEF_OD_CLK(arm_clk,		&pll1_sw_clk.hw);
-DEF_OD_CLK(ahb_clk,		&periph_clk.hw);
-DEF_OD_CLK(ipg_clk,		&ahb_clk.hw);
-DEF_OD_CLK(ipg_perclk,		&ipg_clk.hw);
-
-/* Clocks with only multiplexer */
-static const struct clk_hw_ops clk_om_imx_ops = {
-	.recalc_rate	= _clk_recalc_rate,
-	.get_parent	= _clk_get_parent,
-	/* .set_parent	= _clk_set_parent, */
-};
-
-#define DEF_OM_CLK(c)			\
-static struct clk_hw_imx c = {		\
-	.name = #c,			\
-	.mux = &c##_mux,		\
-	.ops = &clk_om_imx_ops,		\
-}
-
-DEF_OM_CLK(step_clk);
-DEF_OM_CLK(pll1_sw_clk);
-DEF_OM_CLK(periph_pre_clk);
-DEF_OM_CLK(periph2_pre_clk);
-DEF_OM_CLK(periph2_clk);
-DEF_OM_CLK(periph_clk);
-DEF_OM_CLK(gpu2d_axi_clk);
-DEF_OM_CLK(gpu3d_axi_clk);
-
-/* Clocks without gate */
-static const struct clk_hw_ops clk_ng_imx_ops = {
-	.recalc_rate	= _clk_recalc_rate,
-	.round_rate	= _clk_round_rate,
-	.set_rate	= _clk_set_rate,
-	.get_parent	= _clk_get_parent,
-	/* .set_parent	= _clk_set_parent, */
-};
-
-#define DEF_NG_CLK(c)			\
-static struct clk_hw_imx c = {		\
-	.name = #c,			\
-	.div = &c##_div,		\
-	.mux = &c##_mux,		\
-	.ops = &clk_ng_imx_ops,		\
-}
-
-DEF_NG_CLK(periph_clk2_clk);
-DEF_NG_CLK(periph2_clk2_clk);
-DEF_NG_CLK(axi_clk);
-DEF_NG_CLK(emi_clk);
-DEF_NG_CLK(ipu1_di0_pre_clk);
-DEF_NG_CLK(ipu1_di1_pre_clk);
-DEF_NG_CLK(ipu2_di0_pre_clk);
-DEF_NG_CLK(ipu2_di1_pre_clk);
-DEF_NG_CLK(asrc_serial_clk);
-
-/* Clocks without divider */
-static const struct clk_hw_ops clk_nd_imx_ops = {
-	.enable		= _clk_enable,
-	.disable	= _clk_disable,
-	.recalc_rate	= _clk_recalc_rate,
-	.get_parent	= _clk_get_parent,
-	/* .set_parent	= _clk_set_parent, */
-};
-
-#define DEF_ND_CLK(c)			\
-static struct clk_hw_imx c = {		\
-	.name = #c,			\
-	.gate = &c##_gate,		\
-	.mux = &c##_mux,		\
-	.ops = &clk_nd_imx_ops,		\
-}
-
-DEF_ND_CLK(ipu1_di0_clk);
-DEF_ND_CLK(ipu1_di1_clk);
-DEF_ND_CLK(ipu2_di0_clk);
-DEF_ND_CLK(ipu2_di1_clk);
-DEF_ND_CLK(vdo_axi_clk);
-
-/* Clocks without multiplexer */
-static const struct clk_hw_ops clk_nm_imx_ops = {
-	.enable		= _clk_enable,
-	.disable	= _clk_disable,
-	.recalc_rate	= _clk_recalc_rate,
-	.round_rate	= _clk_round_rate,
-	.set_rate	= _clk_set_rate,
-	.get_parent	= _clk_get_parent,
-};
-
-#define DEF_NM_CLK(c, p)		\
-static struct clk_hw_imx c = {		\
-	.name = #c,			\
-	.gate = &c##_gate,		\
-	.div = &c##_div,		\
-	.parent = p,			\
-	.ops = &clk_nm_imx_ops,		\
-}
-
-DEF_NM_CLK(can1_clk,		&pll3_usb_otg.hw);
-DEF_NM_CLK(mmdc_ch0_axi_clk,	&periph_clk.hw);
-DEF_NM_CLK(mmdc_ch1_axi_clk,	&periph2_clk.hw);
-DEF_NM_CLK(uart_clk,		&pll3_80m.hw);
-
-/* Clocks with all of gate, divider and multiplexer */
-static const struct clk_hw_ops clk_imx_ops = {
-	.enable		= _clk_enable,
-	.disable	= _clk_disable,
-	.recalc_rate	= _clk_recalc_rate,
-	.round_rate	= _clk_round_rate,
-	.set_rate	= _clk_set_rate,
-	.get_parent	= _clk_get_parent,
-	/* .set_parent	= _clk_set_parent, */
-};
-
-#define DEF_CLK(c)			\
-static struct clk_hw_imx c = {		\
-	.name = #c,			\
-	.gate = &c##_gate,		\
-	.div = &c##_div,		\
-	.mux = &c##_mux,		\
-	.ops = &clk_imx_ops,		\
-}
-
-DEF_CLK(esai_clk);
-DEF_CLK(gpu2d_core_clk);
-DEF_CLK(gpu3d_core_clk);
-DEF_CLK(gpu3d_shader_clk);
-DEF_CLK(enfc_clk);
-DEF_CLK(ipu1_clk);
-DEF_CLK(ipu2_clk);
-DEF_CLK(hsi_tx_clk);
-DEF_CLK(spdif_clk);
-DEF_CLK(ssi1_clk);
-DEF_CLK(ssi2_clk);
-DEF_CLK(ssi3_clk);
-DEF_CLK(usdhc1_clk);
-DEF_CLK(usdhc2_clk);
-DEF_CLK(usdhc3_clk);
-DEF_CLK(usdhc4_clk);
-DEF_CLK(emi_slow_clk);
-DEF_CLK(vpu_axi_clk);
-
-/*
- * ldb_di_clk
- */
 static unsigned long ldb_di_clk_recalc_rate(struct clk_hw *hw)
 {
-	u32 val = readl_relaxed(CSCMR2);
+	struct clk_imx_div *d = to_clk_imx(hw)->div;
+	u32 mask = ((1 << d->width_podf) - 1) << d->shift_podf;
+	u32 val = readl_relaxed(d->reg);
 
-	val &= (hw == &ldb_di0_clk.hw) ? BM_CSCMR2_LDB_DI0_IPU_DIV :
-					 BM_CSCMR2_LDB_DI1_IPU_DIV;
-	if (val)
+	if (val & mask)
 		return clk_get_rate(clk_get_parent(hw->clk)) / 7;
 	else
 		return clk_get_rate(clk_get_parent(hw->clk)) * 2 / 7;
@@ -1668,16 +385,18 @@ static unsigned long ldb_di_clk_recalc_rate(struct clk_hw *hw)
 static int ldb_di_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 			       unsigned long *parent_rate)
 {
-	u32 val = readl_relaxed(CSCMR2);
+	struct clk_imx_div *d = to_clk_imx(hw)->div;
+	u32 mask = ((1 << d->width_podf) - 1) << d->shift_podf;
+	u32 val = readl_relaxed(d->reg);
 
 	*parent_rate = clk_get_rate(clk_get_parent(hw->clk));
 
 	if (rate * 7 <= *parent_rate + *parent_rate / 20)
-		val |= BM_CSCMR2_LDB_DI0_IPU_DIV;
+		val |= mask;
 	else
-		val &= ~BM_CSCMR2_LDB_DI0_IPU_DIV;
+		val &= ~mask;
 
-	writel_relaxed(val, CSCMR2);
+	writel_relaxed(val, d->reg);
 
 	return 0;
 }
@@ -1693,218 +412,17 @@ static long ldb_di_clk_round_rate(struct clk_hw *hw, unsigned long rate)
 }
 
 static const struct clk_hw_ops ldb_di_clk_ops = {
-	.enable		= _clk_enable,
-	.disable	= _clk_disable,
+	.enable		= clk_imx_enable,
+	.disable	= clk_imx_disable,
 	.recalc_rate	= ldb_di_clk_recalc_rate,
 	.round_rate	= ldb_di_clk_round_rate,
 	.set_rate	= ldb_di_clk_set_rate,
-	.get_parent	= _clk_get_parent,
-};
-
-#define DEF_LDB_DI_CLK(c)		\
-static struct clk_hw_imx c = {		\
-	.name = #c,			\
-	.gate = &c##_gate,		\
-	.mux = &c##_mux,		\
-	.ops = &ldb_di_clk_ops,		\
-}
-
-DEF_LDB_DI_CLK(ldb_di0_clk);
-DEF_LDB_DI_CLK(ldb_di1_clk);
-
-/*
- * pcie_axi_clk
- */
-static int pcie_axi_clk_enable(struct clk_hw *hw)
-{
-	u32 val;
-
-	val = readl_relaxed(PLL8_ENET);
-	val |= BM_PLL_ENET_EN_PCIE;
-	writel_relaxed(val, PLL8_ENET);
-
-	return _clk_enable(hw);
-}
-
-static void pcie_axi_clk_disable(struct clk_hw *hw)
-{
-	u32 val;
-
-	_clk_disable(hw);
-
-	val = readl_relaxed(PLL8_ENET);
-	val &= BM_PLL_ENET_EN_PCIE;
-	writel_relaxed(val, PLL8_ENET);
-}
-
-static const struct clk_hw_ops pcie_axi_clk_ops = {
-	.enable		= pcie_axi_clk_enable,
-	.disable	= pcie_axi_clk_disable,
-	.recalc_rate	= _clk_recalc_rate,
-	.get_parent	= _clk_get_parent,
-};
-
-static struct clk_hw_imx pcie_axi_clk = {
-	.name = "pcie_axi_clk",
-	.gate = &pcie_axi_clk_gate,
-	.mux = &pcie_axi_clk_mux,
-	.ops = &pcie_axi_clk_ops,
-};
-
-/*
- * pcie_axi_clk
- */
-static int sata_clk_enable(struct clk_hw *hw)
-{
-	u32 val;
-
-	val = readl_relaxed(PLL8_ENET);
-	val |= BM_PLL_ENET_EN_SATA;
-	writel_relaxed(val, PLL8_ENET);
-
-	return _clk_enable(hw);
-}
-
-static void sata_clk_disable(struct clk_hw *hw)
-{
-	u32 val;
-
-	_clk_disable(hw);
-
-	val = readl_relaxed(PLL8_ENET);
-	val &= BM_PLL_ENET_EN_SATA;
-	writel_relaxed(val, PLL8_ENET);
-}
-
-static const struct clk_hw_ops sata_clk_ops = {
-	.enable		= sata_clk_enable,
-	.disable	= sata_clk_disable,
-	.recalc_rate	= _clk_recalc_rate,
-	.get_parent	= _clk_get_parent,
-};
-
-static struct clk_hw_imx sata_clk = {
-	.name = "sata_clk",
-	.gate = &sata_clk_gate,
-	.ops = &sata_clk_ops,
-	.parent = &ipg_clk.hw,
-};
-
-/*
- * clk_hw_imx arrays
- */
-static struct clk_hw_imx *imx_clks_1[] = {
-	&pll1_sys,
-	&pll2_bus,
-	&pll3_usb_otg,
-	&pll4_audio,
-	&pll5_video,
-	&pll7_usb_host,
-	&pll8_enet,
-	&pll2_pfd_352m,
-	&pll2_pfd_594m,
-	&pll2_pfd_400m,
-	&pll3_pfd_720m,
-	&pll3_pfd_540m,
-	&pll3_pfd_508m,
-	&pll3_pfd_454m,
-	&step_clk,
-	&pll1_sw_clk,
-};
-
-static struct clk_hw_imx *imx_clks_2[] = {
-	&arm_clk,
-	&periph_pre_clk,
-	&periph_clk2_clk,
-	&periph2_pre_clk,
-	&periph2_clk2_clk,
-	&periph_clk,
-	&periph2_clk,
-	&ahb_clk,
-	&ipg_clk,
-	&ipg_perclk,
-	&axi_clk,
-	&emi_clk,
-	&emi_slow_clk,
-	&mmdc_ch0_axi_clk,
-	&mmdc_ch1_axi_clk,
-	&mmdc_ch0_ipg_clk,
-	&mmdc_ch1_ipg_clk,
-	&gpu2d_axi_clk,
-	&gpu3d_axi_clk,
-	&openvg_axi_clk,
-	&gpu2d_core_clk,
-	&gpu3d_core_clk,
-	&gpu3d_shader_clk,
-	&vdo_axi_clk,
-	&vpu_axi_clk,
-	&pcie_axi_clk,
-	&aips_tz1_clk,
-	&aips_tz2_clk,
-	&apbh_dma_clk,
-	&can1_serial_clk,
-	&can2_serial_clk,
-	&can1_clk,
-	&can2_clk,
-	&ecspi1_clk,
-	&ecspi2_clk,
-	&ecspi3_clk,
-	&ecspi4_clk,
-	&ecspi5_clk,
-	&enet_clk,
-	&gpt_serial_clk,
-	&gpt_clk,
-	&i2c1_clk,
-	&i2c2_clk,
-	&i2c3_clk,
-	&iim_clk,
-	&mlb_clk,
-	&pwm1_clk,
-	&pwm2_clk,
-	&pwm3_clk,
-	&pwm4_clk,
-	&sdma_clk,
-	&spba_clk,
-	&uart_serial_clk,
-	&usboh3_clk,
-	&ldb_di0_clk,
-	&ldb_di1_clk,
-	&ipu1_di0_pre_clk,
-	&ipu1_di1_pre_clk,
-	&ipu2_di0_pre_clk,
-	&ipu2_di1_pre_clk,
-	&ipu1_di0_clk,
-	&ipu1_di1_clk,
-	&ipu2_di0_clk,
-	&ipu2_di1_clk,
-	&ipu1_clk,
-	&ipu2_clk,
-	&hdmi_iahb_clk,
-	&hdmi_isfr_clk,
-	&uart_clk,
-	&hsi_tx_clk,
-	&ssi1_clk,
-	&ssi2_clk,
-	&ssi3_clk,
-	&esai_clk,
-	&spdif_clk,
-	&asrc_serial_clk,
-	&asrc_clk,
-	&enfc_clk,
-	&usdhc1_clk,
-	&usdhc2_clk,
-	&usdhc3_clk,
-	&usdhc4_clk,
-	&gpmi_bch_apb_clk,
-	&gpmi_bch_clk,
-	&gpmi_apb_clk,
-	&gpmi_io_clk,
-	&sata_clk,
+	.get_parent	= clk_imx_get_parent,
 };
 
 int imx6q_set_lpm(enum mxc_cpu_pwr_mode mode)
 {
-	u32 val = readl_relaxed(CLPCR);
+	u32 val = readl_relaxed(ccm_base + CLPCR);
 
 	val &= ~BM_CLPCR_LPM;
 	switch (mode) {
@@ -1932,94 +450,211 @@ int imx6q_set_lpm(enum mxc_cpu_pwr_mode mode)
 	default:
 		return -EINVAL;
 	}
-	writel_relaxed(val, CLPCR);
+	writel_relaxed(val, ccm_base + CLPCR);
 
 	return 0;
 }
 
-static struct map_desc imx6q_clock_desc[] = {
-	imx_map_entry(MX6Q, CCM, MT_DEVICE),
-	imx_map_entry(MX6Q, ANATOP, MT_DEVICE),
+struct clk_imx_data {
+	void *ptr;
+	int size;
 };
 
-int __init mx6q_clocks_init(void)
+static struct clk *clk_hw_imx_get(struct of_phandle_args *a, void *data)
+{
+	struct clk_imx_data *d = data;
+	struct clk_hw_imx *p = d->ptr + d->size * a->args[0];
+	return p->hw.clk;
+}
+
+int of_clk_imx6q_register(struct device_node *np)
 {
-	struct device_node *np;
-	void __iomem *base;
-	int i, irq;
-
-	iotable_init(imx6q_clock_desc, ARRAY_SIZE(imx6q_clock_desc));
-
-	/* retrieve the freqency of fixed clocks from device tree */
-	for_each_compatible_node(np, NULL, "fixed-clock") {
-		u32 rate;
-		if (of_property_read_u32(np, "clock-frequency", &rate))
-			continue;
-
-		if (of_device_is_compatible(np, "fsl,imx-ckil"))
-			ckil_clk.rate = rate;
-		else if (of_device_is_compatible(np, "fsl,imx-ckih1"))
-			ckih_clk.rate = rate;
-		else if (of_device_is_compatible(np, "fsl,imx-osc"))
-			osc_clk.rate = rate;
+	const struct clk_hw_ops *ops = &clk_imx_ops;
+	void __iomem *base = ccm_base;
+	struct clk_imx_data *data;
+	struct clk_hw_imx *p;
+	void *q;
+	const char *name;
+	size_t size = sizeof(struct clk_hw_imx);
+	bool has_gate, has_div, has_mux, has_div_busy, has_mux_busy;
+	int gate_set_bit, powerup_set_bit;
+	u32 num, len;
+	int i, j, num_parents = 1;
+
+	has_gate = has_div = has_mux = has_div_busy = has_mux_busy = false;
+	gate_set_bit = powerup_set_bit = 0;
+
+	if (of_property_read_u32(np, "#clock-cells", &num))
+		return -EINVAL;
+
+	if (of_find_property(np, "imx,clock-gate", &len)) {
+		size += sizeof(struct clk_imx_gate);
+		has_gate = true;
+	}
+
+	if (of_find_property(np, "imx,clock-divider", &len)) {
+		size += sizeof(struct clk_imx_div);
+		has_div = true;
+		if (of_find_property(np, "imx,busy-divider", &len)) {
+			size += sizeof(struct clk_imx_busy);
+			has_div_busy = true;
+		}
+	}
+
+	if (of_find_property(np, "imx,clock-multiplexer", &len)) {
+		struct device_node *inp;
+		i = num_parents = 0;
+		do {
+			inp = of_parse_phandle(np, "clock-input", i);
+			if (!inp)
+				break;
+			of_property_read_u32(inp, "#clock-cells", &j);
+			i += j + 1;
+			num_parents++;
+		} while (1);
+		size += sizeof(struct clk_imx_mux) + num_parents * sizeof(q);
+		has_mux = true;
+		if (of_find_property(np, "imx,busy-multiplexer", &len)) {
+			size += sizeof(struct clk_imx_busy);
+			has_mux_busy = true;
+		}
 	}
 
-	clk_register(NULL, &clk_dummy_ops, &dummy_clk.hw, "dummy_clk", 0);
-	clk_register(NULL, &clk_fixed_ops, &ckil_clk.hw, "ckil_clk", CLK_IS_ROOT);
-	clk_register(NULL, &clk_fixed_ops, &ckih_clk.hw, "ckih_clk", CLK_IS_ROOT);
-	clk_register(NULL, &clk_fixed_ops, &osc_clk.hw, "osc_clk", CLK_IS_ROOT);
-
-	for (i = 0; i < ARRAY_SIZE(imx_clks_1); i++)
-		clk_register(NULL, imx_clks_1[i]->ops, &imx_clks_1[i]->hw,
-			     imx_clks_1[i]->name, 0);
-
-	clk_register(NULL, &clk_div_fixed_ops, &pll2_200m.hw, "pll2_200m", 0);
-	clk_register(NULL, &clk_div_fixed_ops, &pll3_120m.hw, "pll3_120m", 0);
-	clk_register(NULL, &clk_div_fixed_ops, &pll3_80m.hw, "pll3_80m", 0);
-	clk_register(NULL, &clk_div_fixed_ops, &pll3_60m.hw, "pll3_60m", 0);
-
-	for (i = 0; i < ARRAY_SIZE(imx_clks_2); i++)
-		clk_register(NULL, imx_clks_2[i]->ops, &imx_clks_2[i]->hw,
-			     imx_clks_2[i]->name, 0);
-
-	clkdev_add(clkdev_alloc(uart_clk.hw.clk, NULL, "2020000.uart"));
-	clkdev_add(clkdev_alloc(uart_clk.hw.clk, NULL, "21e8000.uart"));
-	clkdev_add(clkdev_alloc(uart_clk.hw.clk, NULL, "21ec000.uart"));
-	clkdev_add(clkdev_alloc(uart_clk.hw.clk, NULL, "21f0000.uart"));
-	clkdev_add(clkdev_alloc(uart_clk.hw.clk, NULL, "21f4000.uart"));
-	clkdev_add(clkdev_alloc(enet_clk.hw.clk, NULL, "2188000.enet"));
-	clkdev_add(clkdev_alloc(usdhc1_clk.hw.clk, NULL, "2190000.usdhc"));
-	clkdev_add(clkdev_alloc(usdhc2_clk.hw.clk, NULL, "2194000.usdhc"));
-	clkdev_add(clkdev_alloc(usdhc3_clk.hw.clk, NULL, "2198000.usdhc"));
-	clkdev_add(clkdev_alloc(usdhc4_clk.hw.clk, NULL, "219c000.usdhc"));
-	clkdev_add(clkdev_alloc(i2c1_clk.hw.clk, NULL, "21a0000.i2c"));
-	clkdev_add(clkdev_alloc(i2c2_clk.hw.clk, NULL, "21a4000.i2c"));
-	clkdev_add(clkdev_alloc(i2c3_clk.hw.clk, NULL, "21a8000.i2c"));
-	clkdev_add(clkdev_alloc(ecspi1_clk.hw.clk, NULL, "2008000.ecspi"));
-	clkdev_add(clkdev_alloc(ecspi2_clk.hw.clk, NULL, "200c000.ecspi"));
-	clkdev_add(clkdev_alloc(ecspi3_clk.hw.clk, NULL, "2010000.ecspi"));
-	clkdev_add(clkdev_alloc(ecspi4_clk.hw.clk, NULL, "2014000.ecspi"));
-	clkdev_add(clkdev_alloc(ecspi5_clk.hw.clk, NULL, "2018000.ecspi"));
-	clkdev_add(clkdev_alloc(sdma_clk.hw.clk, NULL, "20ec000.sdma"));
-	clkdev_add(clkdev_alloc(dummy_clk.hw.clk, NULL, "20bc000.wdog"));
-	clkdev_add(clkdev_alloc(dummy_clk.hw.clk, NULL, "20c0000.wdog"));
+	q = kzalloc(size * num + sizeof(data), GFP_KERNEL);
+	if (!q)
+		return -ENOMEM;
+	data = q + size * num;
+	data->ptr = p = q;
+	data->size = size;
+
+	if (of_device_is_compatible(np, "fsl,imx6q-pll-sys")) {
+		base = anatop_base;
+		ops = &pll_sys_ops;
+	} else if (of_device_is_compatible(np, "fsl,imx6q-pll-usb")) {
+		base = anatop_base;
+		ops = &pll_ops;
+		powerup_set_bit = true;
+	} else if (of_device_is_compatible(np, "fsl,imx6q-pll-av")) {
+		base = anatop_base;
+		ops = &pll_av_ops;
+	} else if (of_device_is_compatible(np, "fsl,imx6q-pll-enet")) {
+		base = anatop_base;
+		ops = &pll_enet_ops;
+	} else if (of_device_is_compatible(np, "fsl,imx6q-pll")) {
+		base = anatop_base;
+		ops = &pll_ops;
+	} else if (of_device_is_compatible(np, "fsl,imx6q-pfd")) {
+		base = anatop_base;
+		ops = &pfd_ops;
+		gate_set_bit = true;
+	} else if (of_device_is_compatible(np, "fsl,imx6q-ldb-di-clock")) {
+		base = ccm_base;
+		ops = &ldb_di_clk_ops;
+	}
+
+	for (i = 0; i < num; i++) {
+		q = p + 1;
+		if (has_gate) {
+			u32 val[2];
+			of_property_read_u32_array_index(np, "imx,clock-gate",
+							 val, i * 2, 2);
+			p->gate = q;
+			p->gate->reg = base + val[0];
+			p->gate->mask = val[1];
+			p->gate->gate_set_bit = gate_set_bit;
+			p->gate->powerup_set_bit = powerup_set_bit;
+			q += sizeof(*p->gate);
+		}
+
+		if (has_div) {
+			u32 val[5];
+			of_property_read_u32_array_index(np,
+					"imx,clock-divider", val, i * 5, 5);
+			p->div = q;
+			p->div->reg = base + val[0];
+			p->div->shift_pred = val[1];
+			p->div->width_pred = val[2];
+			p->div->shift_podf = val[3];
+			p->div->width_podf = val[4];
+			q += sizeof(*p->div);
+
+			if (has_div_busy) {
+				of_property_read_u32_array_index(np,
+					"imx,busy-divider", val, i * 2, 2);
+				p->div->busy = q;
+				p->div->busy->reg = base + val[0];
+				p->div->busy->mask = val[1];
+				q += sizeof(*p->div->busy);
+			}
+		}
+
+		if (has_mux) {
+			u32 val[3];
+			of_property_read_u32_array_index(np,
+					"imx,clock-multiplexer", val, i * 3, 3);
+			p->mux = q;
+			p->mux->reg = base + val[0];
+			p->mux->shift = val[1];
+			p->mux->width = val[2];
+			q += sizeof(*p->mux);
+
+			if (has_mux_busy) {
+				of_property_read_u32_array_index(np,
+					"imx,busy-multiplexer", val, i * 2, 2);
+				p->mux->busy = q;
+				p->mux->busy->reg = base + val[0];
+				p->mux->busy->mask = val[1];
+				q += sizeof(*p->mux->busy);
+			}
+
+			p->mux->parents = q;
+			for (j = 0; j < num_parents; j++)
+				p->mux->parents[j] = of_clk_get(np, j)->hw;
+			p->mux->num_parents = num_parents;
+		} else {
+			p->parent = of_clk_get(np, 0)->hw;
+		}
+
+		of_property_read_string_index(np, "clock-output-name",
+					      i, &name);
+		clk_register(NULL, ops, &p->hw, name, 0);
+		p = (void *) p + size;
+	}
+
+	return of_clk_add_provider(np, clk_hw_imx_get, data);
+}
+
+int __init mx6q_clocks_init(void)
+{
+	struct device_node *np, *from;
+	struct clk *clk;
+
+	np = of_find_compatible_node(NULL, NULL, "fsl,imx6q-ccm");
+	ccm_base = of_iomap(np, 0);
+	np = of_find_compatible_node(NULL, NULL, "fsl,imx6q-anatop");
+	anatop_base = of_iomap(np, 0);
+	WARN_ON(!ccm_base || !anatop_base);
+
+	from = of_find_node_by_name(NULL, "clocks");
+	for_each_child_of_node(from, np)
+		if (of_device_is_compatible(np, "dummy-clock"))
+			of_clk_dummy_register(np);
+		else if (of_device_is_compatible(np, "fixed-clock"))
+			of_clk_fixed_register(np);
+		else if (of_device_is_compatible(np, "divider-fixed-clock"))
+			of_clk_divider_fixed_register(np);
+		else
+			of_clk_imx6q_register(np);
 
 	/* only keep necessary clocks on */
-	writel_relaxed(0x3 << CG0  | 0x3 << CG1  | 0x3 << CG2,	CCGR0);
-	writel_relaxed(0,					CCGR1);
-	writel_relaxed(0x3 << CG8  | 0x3 << CG9  | 0x3 << CG10,	CCGR2);
-	writel_relaxed(0x3 << CG10 | 0x3 << CG12,		CCGR3);
-	writel_relaxed(0x3 << CG4  | 0x3 << CG6  | 0x3 << CG7,	CCGR4);
-	writel_relaxed(0x3 << CG0,				CCGR5);
-	writel_relaxed(0,					CCGR6);
-	writel_relaxed(0,					CCGR7);
-
-	clk_prepare(uart_serial_clk.hw.clk);
-	clk_enable(uart_serial_clk.hw.clk);
-	clk_prepare(uart_clk.hw.clk);
-	clk_enable(uart_clk.hw.clk);
-	clk_prepare(gpt_serial_clk.hw.clk);
-	clk_enable(gpt_serial_clk.hw.clk);
+	writel_relaxed(0x0000003f, ccm_base + CCGR0);
+	writel_relaxed(0x00f00000, ccm_base + CCGR1);
+	writel_relaxed(0x003f0000, ccm_base + CCGR2);
+	writel_relaxed(0x03300000, ccm_base + CCGR3);
+	writel_relaxed(0x0000f300, ccm_base + CCGR4);
+	writel_relaxed(0x0f000003, ccm_base + CCGR5);
+	writel_relaxed(0x0,	   ccm_base + CCGR6);
+	writel_relaxed(0x0,	   ccm_base + CCGR7);
 
 	/*
 	 * Before pinctrl API is available, we have to rely on the pad
@@ -2031,16 +666,14 @@ int __init mx6q_clocks_init(void)
 	 * At that time, usdhc driver can call pinctrl API to change pad
 	 * configuration dynamically per different usdhc clock settings.
 	 */
-	clk_set_rate(usdhc1_clk.hw.clk, 49500000);
-	clk_set_rate(usdhc2_clk.hw.clk, 49500000);
-	clk_set_rate(usdhc3_clk.hw.clk, 49500000);
-	clk_set_rate(usdhc4_clk.hw.clk, 49500000);
+	for_each_compatible_node(np, NULL, "fsl,imx6q-usdhc") {
+		clk = of_clk_get(np, 0);
+		clk_set_rate(clk, 49500000);
+	}
 
 	np = of_find_compatible_node(NULL, NULL, "fsl,imx6q-gpt");
-	base = of_iomap(np, 0);
-	WARN_ON(!base);
-	irq = irq_of_parse_and_map(np, 0);
-	mxc_timer_init(gpt_clk.hw.clk, base, irq);
+	mxc_timer_init(of_clk_get(np, 0), of_iomap(np, 0),
+		       irq_of_parse_and_map(np, 0));
 
 	return 0;
 }
diff --git a/arch/arm/mach-imx/clock.c b/arch/arm/mach-imx/clock.c
new file mode 100644
index 0000000..6243622
--- /dev/null
+++ b/arch/arm/mach-imx/clock.c
@@ -0,0 +1,222 @@
+/*
+ * Copyright 2011 Freescale Semiconductor, Inc.
+ * Copyright 2011 Linaro Ltd.
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+#include <linux/init.h>
+#include <linux/types.h>
+#include <linux/err.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <asm/processor.h>
+#include "clock.h"
+
+int clk_imx_enable(struct clk_hw *hw)
+{
+	struct clk_imx_gate *g = to_clk_imx(hw)->gate;
+	u32 val;
+
+	if (!g)
+		return 0;
+
+	val = readl_relaxed(g->reg);
+	if (g->gate_set_bit)
+		val &= ~g->mask;
+	else
+		val |= g->mask;
+	writel_relaxed(val, g->reg);
+
+	return 0;
+}
+
+void clk_imx_disable(struct clk_hw *hw)
+{
+	struct clk_imx_gate *g = to_clk_imx(hw)->gate;
+	u32 val;
+
+	if (!g)
+		return;
+
+	val = readl_relaxed(g->reg);
+	if (g->gate_set_bit)
+		val |= g->mask;
+	else
+		val &= ~g->mask;
+	writel_relaxed(val, g->reg);
+}
+
+struct clk *clk_imx_get_parent(struct clk_hw *hw)
+{
+	struct clk_imx_mux *m = to_clk_imx(hw)->mux;
+	u32 i;
+
+	if (!m)
+		return to_clk_imx(hw)->parent->clk;
+
+	i = readl_relaxed(m->reg) >> m->shift;
+	i &= (1 << m->width) - 1;
+
+	if (i >= m->num_parents)
+		return ERR_PTR(-EINVAL);
+
+	return m->parents[i]->clk;
+}
+
+static int clk_imx_busy_wait(struct clk_imx_busy *b)
+{
+	int timeout = 0x100000;
+
+	while ((readl_relaxed(b->reg) & b->mask) && --timeout)
+		cpu_relax();
+
+	if (unlikely(!timeout))
+		return -EBUSY;
+
+	return 0;
+}
+
+static int clk_imx_set_parent(struct clk_hw *hw, struct clk *parent)
+{
+	struct clk_imx_mux *m = to_clk_imx(hw)->mux;
+	int i;
+	u32 val;
+
+	if (!m)
+		return -EINVAL;
+
+	for (i = 0; i < m->num_parents; i++)
+		if (parent == m->parents[i]->clk)
+			break;
+
+	if (i == m->num_parents)
+		return -EINVAL;
+
+	val = readl_relaxed(m->reg);
+	val &= ~(((1 << m->width) - 1) << m->shift);
+	val |= i << m->shift;
+	writel_relaxed(val, m->reg);
+
+	return (m->busy) ? clk_imx_busy_wait(m->busy) : 0;
+}
+
+static unsigned long clk_imx_recalc_rate(struct clk_hw *hw)
+{
+	struct clk_imx_div *d = to_clk_imx(hw)->div;
+	u32 val, pred, podf;
+
+	if (!d)
+		return clk_get_rate(clk_get_parent(hw->clk));
+
+	val = readl_relaxed(d->reg);
+	pred = (val >> d->shift_pred & ((1 << d->width_pred) - 1)) + 1;
+	podf = (val >> d->shift_podf & ((1 << d->width_podf) - 1)) + 1;
+
+	return clk_get_rate(clk_get_parent(hw->clk)) / (pred * podf);
+}
+
+static void calc_pred_podf_dividers(u32 div, u32 *pred, u32 *podf)
+{
+	u32 min_pred, temp_pred, old_err, err;
+
+	if (div >= 512) {
+		*pred = 8;
+		*podf = 64;
+	} else if (div >= 8) {
+		min_pred = (div - 1) / 64 + 1;
+		old_err = 8;
+		for (temp_pred = 8; temp_pred >= min_pred; temp_pred--) {
+			err = div % temp_pred;
+			if (err == 0) {
+				*pred = temp_pred;
+				break;
+			}
+			err = temp_pred - err;
+			if (err < old_err) {
+				old_err = err;
+				*pred = temp_pred;
+			}
+		}
+		*podf = (div + *pred - 1) / *pred;
+	} else if (div < 8) {
+		*pred = div;
+		*podf = 1;
+	}
+}
+
+static long clk_imx_round_rate(struct clk_hw *hw, unsigned long rate)
+{
+	struct clk_imx_div *d = to_clk_imx(hw)->div;
+	u32 div, div_max, pred = 0, podf;
+	unsigned long parent_rate = clk_get_rate(clk_get_parent(hw->clk));
+
+	if (!d)
+		return -EINVAL;
+
+	div = parent_rate / rate;
+	if (div == 0 || parent_rate % rate)
+		div++;
+
+	if (d->width_pred) {
+		calc_pred_podf_dividers(div, &pred, &podf);
+		div = pred * podf;
+	} else {
+		div_max = 1 << d->width_podf;
+		if (div > div_max)
+			div = div_max;
+	}
+
+	return parent_rate / div;
+}
+
+static int clk_imx_set_rate(struct clk_hw *hw, unsigned long rate,
+			    unsigned long *parent_rate)
+{
+	struct clk_imx_div *d = to_clk_imx(hw)->div;
+	u32 val, div, pred = 0, podf;
+
+	if (!d)
+		return -EINVAL;
+
+	*parent_rate = clk_get_rate(clk_get_parent(hw->clk));
+
+	div = *parent_rate / rate;
+	if (div == 0)
+		div++;
+
+	if ((*parent_rate / div != rate) || div >
+	    (1 << d->width_pred) * (1 << d->width_podf))
+		return -EINVAL;
+
+	if (d->width_pred) {
+		calc_pred_podf_dividers(div, &pred, &podf);
+	} else {
+		pred = 1;
+		podf = div;
+	}
+
+	val = readl_relaxed(d->reg);
+	val &= ~(((1 << d->width_pred) - 1) << d->shift_pred);
+	val &= ~(((1 << d->width_podf) - 1) << d->shift_podf);
+	val |= (pred - 1) << d->shift_pred;
+	val |= (podf - 1) << d->shift_podf;
+	writel_relaxed(val, d->reg);
+
+	return (d->busy) ? clk_imx_busy_wait(d->busy) : 0;
+}
+
+const struct clk_hw_ops clk_imx_ops = {
+	.enable		= clk_imx_enable,
+	.disable	= clk_imx_disable,
+	.recalc_rate	= clk_imx_recalc_rate,
+	.round_rate	= clk_imx_round_rate,
+	.set_rate	= clk_imx_set_rate,
+	.get_parent	= clk_imx_get_parent,
+	.set_parent	= clk_imx_set_parent,
+};
diff --git a/arch/arm/mach-imx/clock.h b/arch/arm/mach-imx/clock.h
new file mode 100644
index 0000000..49e42b9
--- /dev/null
+++ b/arch/arm/mach-imx/clock.h
@@ -0,0 +1,64 @@
+/*
+ * Copyright 2011 Freescale Semiconductor, Inc.
+ * Copyright 2011 Linaro Ltd.
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+#ifndef __MACH_IMX_CLK_H
+#define __MACH_IMX_CLK_H
+
+#include <linux/types.h>
+#include <linux/clk.h>
+
+struct clk_imx_busy {
+	void __iomem *reg;
+	u32 mask;
+};
+
+struct clk_imx_gate {
+	void __iomem *reg;
+	u32 mask;
+	int gate_set_bit;
+	int powerup_set_bit;
+};
+
+struct clk_imx_div {
+	void __iomem *reg;
+	u32 shift_pred;
+	u32 width_pred;
+	u32 shift_podf;
+	u32 width_podf;
+	struct clk_imx_busy *busy;
+};
+
+struct clk_imx_mux {
+	void __iomem *reg;
+	u32 shift;
+	u32 width;
+	struct clk_imx_busy *busy;
+	struct clk_hw **parents;
+	int num_parents;
+};
+
+struct clk_hw_imx {
+	struct clk_hw hw;
+	struct clk_imx_gate *gate;
+	struct clk_imx_div *div;
+	struct clk_imx_mux *mux;
+	struct clk_hw *parent;
+};
+
+#define to_clk_imx(c) container_of(c, struct clk_hw_imx, hw)
+
+extern const struct clk_hw_ops clk_imx_ops;
+
+extern int clk_imx_enable(struct clk_hw *hw);
+extern void clk_imx_disable(struct clk_hw *hw);
+extern struct clk *clk_imx_get_parent(struct clk_hw *hw);
+
+#endif /* __MACH_IMX_CLK_H */
-- 
1.7.4.1
