From: Christophe Kerello <christophe.kerello@st.com>
Subject: [ v3 1/3] dt-bindings: mtd: stm32_fmc2: add STM32 FMC2 NAND controller documentation
Date: Thu, 29 Nov 2018 17:41:01 +0100
Message-ID: <1543509663-26128-2-git-send-email-christophe.kerello@st.com>
References: <1543509663-26128-1-git-send-email-christophe.kerello@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543509663-26128-1-git-send-email-christophe.kerello@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: boris.brezillon@bootlin.com, miquel.raynal@bootlin.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Christophe Kerello <christophe.kerello@st.com>
List-Id: devicetree@vger.kernel.org

This patch adds the documentation of the device tree bindings for the STM32
FMC2 NAND controller.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
---
 .../devicetree/bindings/mtd/stm32-fmc2-nand.txt    | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt b/Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt
new file mode 100644
index 0000000..ad2bef8
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt
@@ -0,0 +1,61 @@
+STMicroelectronics Flexible Memory Controller 2 (FMC2)
+NAND Interface
+
+Required properties:
+- compatible: Should be one of:
+              * st,stm32mp15-fmc2
+- reg: NAND flash controller memory areas.
+       First region contains the register location.
+       Regions 2 to 4 respectively contain the data, command,
+       and address space for CS0.
+       Regions 5 to 7 contain the same areas for CS1.
+- interrupts: The interrupt number
+- pinctrl-0: Standard Pinctrl phandle (see: pinctrl/pinctrl-bindings.txt)
+- clocks: The clock needed by the NAND flash controller
+
+Optional properties:
+- resets: Reference to a reset controller asserting the FMC controller
+- dmas: DMA specifiers (see: dma/stm32-mdma.txt)
+- dma-names: Must be "tx", "rx" and "ecc"
+
+* NAND device bindings:
+
+Required properties:
+- reg: describes the CS lines assigned to the NAND device.
+
+Optional properties:
+- nand-on-flash-bbt: see nand.txt
+- nand-ecc-strength: see nand.txt
+- nand-ecc-step-size: see nand.txt
+
+The following ECC strength and step size are currently supported:
+ - nand-ecc-strength = <1>, nand-ecc-step-size = <512> (Hamming)
+ - nand-ecc-strength = <4>, nand-ecc-step-size = <512> (BCH4)
+ - nand-ecc-strength = <8>, nand-ecc-step-size = <512> (BCH8) (default)
+
+Example:
+
+	fmc: nand-controller@58002000 {
+		compatible = "st,stm32mp15-fmc2";
+		reg = <0x58002000 0x1000>,
+		      <0x80000000 0x1000>,
+		      <0x88010000 0x1000>,
+		      <0x88020000 0x1000>,
+		      <0x81000000 0x1000>,
+		      <0x89010000 0x1000>,
+		      <0x89020000 0x1000>;
+		interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rcc FMC_K>;
+		resets = <&rcc FMC_R>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&fmc_pins_a>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		nand@0 {
+			reg = <0>;
+			nand-on-flash-bbt;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+	};
-- 
1.9.1
