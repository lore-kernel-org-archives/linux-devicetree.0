From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH] arm64: dts: uniphier: Add PCIe host controller and PHY nodes
Date: Thu, 20 Dec 2018 14:23:13 +0900
Message-ID: <1545283393-2078-1-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add PCIe host controller and PHY nodes. This supports for LD20, PXs3 and
their boards.

This node defines PCIe memory, I/O, and config spaces as follows.

  MEM: 20000000-2ffdffff (255MB)
  I/O: 2ffe0000-2ffeffff ( 64KB)
  CFG: 2fff0000-2fffffff ( 64KB)

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi   | 47 ++++++++++++++++++++++
 .../arm64/boot/dts/socionext/uniphier-pxs3-ref.dts |  4 ++
 arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi   | 47 ++++++++++++++++++++++
 3 files changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
index d7e2d89..63d3d17 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
@@ -872,6 +872,53 @@
 			};
 		};
 
+		pcie: pcie@66000000 {
+			compatible = "socionext,uniphier-pcie", "snps,dw-pcie";
+			status = "disabled";
+			reg-names = "dbi", "link", "config";
+			reg = <0x66000000 0x1000>, <0x66010000 0x10000>,
+			      <0x2fff0000 0x10000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			clocks = <&sys_clk 24>;
+			resets = <&sys_rst 24>;
+			num-lanes = <1>;
+			num-viewport = <1>;
+			bus-range = <0x0 0xff>;
+			device_type = "pci";
+			ranges =
+			/* downstream I/O */
+				<0x81000000 0 0x00000000  0x2ffe0000  0 0x00010000
+			/* non-prefetchable memory */
+				 0x82000000 0 0x20000000  0x20000000  0 0x0ffe0000>;
+			#interrupt-cells = <1>;
+			interrupt-names = "dma", "msi";
+			interrupts = <0 224 4>, <0 225 4>;
+			interrupt-map-mask = <0 0 0  7>;
+			interrupt-map = <0 0 0  1  &pcie_intc 0>,	/* INTA */
+					<0 0 0  2  &pcie_intc 1>,	/* INTB */
+					<0 0 0  3  &pcie_intc 2>,	/* INTC */
+					<0 0 0  4  &pcie_intc 3>;	/* INTD */
+			phy-names = "pcie-phy";
+			phys = <&pcie_phy>;
+
+			pcie_intc: legacy-interrupt-controller {
+				interrupt-controller;
+				#interrupt-cells = <1>;
+				interrupt-parent = <&gic>;
+				interrupts = <0 226 4>;
+			};
+		};
+
+		pcie_phy: phy@66038000 {
+			compatible = "socionext,uniphier-ld20-pcie-phy";
+			reg = <0x66038000 0x4000>;
+			#phy-cells = <0>;
+			clocks = <&sys_clk 24>;
+			resets = <&sys_rst 24>;
+			socionext,syscon = <&soc_glue>;
+		};
+
 		nand: nand@68000000 {
 			compatible = "socionext,uniphier-denali-nand-v5b";
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/socionext/uniphier-pxs3-ref.dts b/arch/arm64/boot/dts/socionext/uniphier-pxs3-ref.dts
index a41f7ca..f91d77f 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-pxs3-ref.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-pxs3-ref.dts
@@ -112,3 +112,7 @@
 &usb1 {
 	status = "okay";
 };
+
+&pcie {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
index 4f57c9e..fe56a32 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
@@ -727,6 +727,53 @@
 			};
 		};
 
+		pcie: pcie@66000000 {
+			compatible = "socionext,uniphier-pcie", "snps,dw-pcie";
+			status = "disabled";
+			reg-names = "dbi", "link", "config";
+			reg = <0x66000000 0x1000>, <0x66010000 0x10000>,
+			      <0x2fff0000 0x10000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			clocks = <&sys_clk 24>;
+			resets = <&sys_rst 24>;
+			num-lanes = <1>;
+			num-viewport = <1>;
+			bus-range = <0x0 0xff>;
+			device_type = "pci";
+			ranges =
+			/* downstream I/O */
+				<0x81000000 0 0x00000000  0x2ffe0000  0 0x00010000
+			/* non-prefetchable memory */
+				 0x82000000 0 0x20000000  0x20000000  0 0x0ffe0000>;
+			#interrupt-cells = <1>;
+			interrupt-names = "dma", "msi";
+			interrupts = <0 224 4>, <0 225 4>;
+			interrupt-map-mask = <0 0 0  7>;
+			interrupt-map = <0 0 0  1  &pcie_intc 0>,	/* INTA */
+					<0 0 0  2  &pcie_intc 1>,	/* INTB */
+					<0 0 0  3  &pcie_intc 2>,	/* INTC */
+					<0 0 0  4  &pcie_intc 3>;	/* INTD */
+			phy-names = "pcie-phy";
+			phys = <&pcie_phy>;
+
+			pcie_intc: legacy-interrupt-controller {
+				interrupt-controller;
+				#interrupt-cells = <1>;
+				interrupt-parent = <&gic>;
+				interrupts = <0 226 4>;
+			};
+		};
+
+		pcie_phy: phy@66038000 {
+			compatible = "socionext,uniphier-pxs3-pcie-phy";
+			reg = <0x66038000 0x4000>;
+			#phy-cells = <0>;
+			clocks = <&sys_clk 24>;
+			resets = <&sys_rst 24>;
+			socionext,syscon = <&soc_glue>;
+		};
+
 		nand: nand@68000000 {
 			compatible = "socionext,uniphier-denali-nand-v5b";
 			status = "disabled";
-- 
2.7.4
