From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 11/20] tegra: fdt: Add clock bindings
Date: Wed, 11 Jan 2012 20:33:00 -0800
Message-ID: <1326342789-5781-12-git-send-email-sjg@chromium.org>
References: <1326342789-5781-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1326342789-5781-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds a basic binding for the oscillator and peripheral clocks. The
second cell is the clock number, defined as the bit number within the clock
enable register if the peripheral clock.

This uses the RFC clock bindings from Grant Likely so may change later:

https://lkml.org/lkml/2011/12/12/498

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v4:
- Add clock bindings for Tegra2x

 arch/arm/dts/tegra20.dtsi                      |   27 ++++++++++++
 doc/device-tree-bindings/clock/tegra-periphclk |   51 ++++++++++++++++++++++++
 2 files changed, 78 insertions(+), 0 deletions(-)
 create mode 100644 doc/device-tree-bindings/clock/tegra-periphclk

diff --git a/arch/arm/dts/tegra20.dtsi b/arch/arm/dts/tegra20.dtsi
index 6146d24..68eae12 100644
--- a/arch/arm/dts/tegra20.dtsi
+++ b/arch/arm/dts/tegra20.dtsi
@@ -4,6 +4,33 @@
 	compatible = "nvidia,tegra20";
 	interrupt-parent = <&intc>;
 
+	clocks = <&osc_clk>;
+	clock-names = "osc_clk";
+	clock-ranges;
+
+	clocks {
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		/* The frequency of this clock is board-specific */
+		osc_clk: oscclk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+
+		/*
+		 * This node provides clocks to all peripherals. We don't
+		 * enumerate the clock names for now since there are no
+		 * users of this information.
+		 */
+		periph_clk: periphclk {
+			compatible = "tegra,periphclk";
+			#clock-cells = <1>;
+			clocks = <&osc_clk>;
+			reg = <0x60006000 400>;
+		};
+	};
+
 	intc: interrupt-controller@50041000 {
 		compatible = "nvidia,tegra20-gic";
 		interrupt-controller;
diff --git a/doc/device-tree-bindings/clock/tegra-periphclk b/doc/device-tree-bindings/clock/tegra-periphclk
new file mode 100644
index 0000000..8d21e4d
--- /dev/null
+++ b/doc/device-tree-bindings/clock/tegra-periphclk
@@ -0,0 +1,51 @@
+Clock controllers
+
+(there isn't yet a binding in Linux, so this describes what is in U-Boot)
+
+The device node for a clock controller is as described in the document
+"Open Firmware Recommended Practice : Universal Serial Bus" with the
+following modifications and additions :
+
+This is based on Grant Likely's proposed patch for clock bindings.
+
+Required properties :
+ - compatible : Should be "tegra,periphclk" for peripheral clock controller
+ - clocks : Should contain a single phandle pointing to the oscillator clock
+
+Peripherals which refer to a clock should have a property called "clocks" with
+two cells: phandle of the peripheral clock and the clock ID number (which
+is the bit number in the peripheral clock controller enable register numbered
+from 0).
+
+Example:
+
+clocks {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	/* The frequency of this clock is board-specific */
+	osc_clk: oscclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	/*
+	 * This node provides clocks to all peripherals. We don't
+	 * enumerate the clock names for now since there are no
+	 * users of this information.
+	 */
+	periph_clk: periphclk {
+		compatible = "tegra,periphclk";
+		#clock-cells = <1>;
+		clocks = <&osc_clk>;
+		reg = <0x60006000 400>;
+	};
+};
+
+usb@c5004000 {
+	compatible = "nvidia,tegra20-ehci", "usb-ehci";
+	reg = <0xc5004000 0x4000>;
+	interrupts = < 53 >;
+	phy_type = "ulpi";
+	clocks = <&periph_clk 58>;	// PERIPH_ID_USB2
+};
-- 
1.7.7.3
