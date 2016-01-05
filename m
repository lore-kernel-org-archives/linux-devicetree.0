From: Archit Taneja <architt@codeaurora.org>
Subject: [PATCH v5 3/3] dt/bindings: qcom_nandc: Add DT bindings
Date: Tue,  5 Jan 2016 10:55:01 +0530
Message-ID: <1451971501-18160-4-git-send-email-architt@codeaurora.org>
References: <1439959746-25498-1-git-send-email-architt@codeaurora.org>
 <1451971501-18160-1-git-send-email-architt@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1451971501-18160-1-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: computersforpeace@gmail.com, boris.brezillon@free-electrons.com
Cc: linux-mtd@lists.infradead.org, cernekee@gmail.com, sboyd@codeaurora.org, andy.gross@linaro.org, dehrenberg@google.com, linux-arm-msm@vger.kernel.org, Archit Taneja <architt@codeaurora.org>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Add DT bindings document for the Qualcomm NAND controller driver.

Cc: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
v5:
- Make changes to incorporate chip select sub nodes (brcmnand taken as
  reference)

v3:
- Don't use '0x' when specifying nand controller address space
- Add optional property for on-flash bbt usage

 .../devicetree/bindings/mtd/qcom_nandc.txt         | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/qcom_nandc.txt

diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
new file mode 100644
index 0000000..b2cf2d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
@@ -0,0 +1,84 @@
+* Qualcomm NAND controller
+
+Required properties:
+- compatible:		should be "qcom,ebi2-nand" for IPQ806x
+- reg:			MMIO address range
+- clocks:		must contain core clock and always on clock
+- clock-names:		must contain "core" for the core clock and "aon" for the
+			always on clock
+- dmas:			DMA specifier, consisting of a phandle to the ADM DMA
+			controller node and the channel number to be used for
+			NAND. Refer to dma.txt and qcom_adm.txt for more details
+- dma-names:		must be "rxtx"
+- qcom,cmd-crci:	must contain the ADM command type CRCI block instance
+			number specified for the NAND controller on the given
+			platform
+- qcom,data-crci:	must contain the ADM data type CRCI block instance
+			number specified for the NAND controller on the given
+			platform
+- #address-cells:	<1> - subnodes give the chip-select number
+- #size-cells:		<0>
+
+* NAND chip-select
+
+Each controller may contain one or more subnodes to represent enabled
+chip-selects which (may) contain NAND flash chips. Their properties are as
+follows.
+
+Required properties:
+- compatible:		should contain "qcom,nandcs"
+- reg:			a single integer representing the chip-select
+			number (e.g., 0, 1, 2, etc.)
+- #address-cells:	see partition.txt
+- #size-cells:		see partition.txt
+- nand-ecc-strength:	number of bits to correct per ECC step. Must be 4 or 8
+			bits.
+- nand-ecc-step-size:	bytes of data per ECC step. Must be 512.
+
+Optional properties:
+- nand-bus-width:	bus width. Must be 8 or 16. If not present, 8 is chosen
+			as default
+
+Each nandcs device node may optionally contain sub-nodes describing the flash
+partition mapping. See partition.txt for more detail.
+
+Example:
+
+nand@1ac00000 {
+	compatible = "qcom,ebi2-nandc";
+	reg = <0x1ac00000 0x800>;
+
+	clocks = <&gcc EBI2_CLK>,
+		 <&gcc EBI2_AON_CLK>;
+	clock-names = "core", "aon";
+
+	dmas = <&adm_dma 3>;
+	dma-names = "rxtx";
+	qcom,cmd-crci = <15>;
+	qcom,data-crci = <3>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	nandcs@0 {
+		compatible = "qcom,nandcs";
+		reg = <0>;
+
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+		nand-bus-width = <8>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@0 {
+			label = "boot-nand";
+			reg = <0 0x58a0000>;
+		};
+
+		partition@58a0000 {
+			label = "fs-nand";
+			reg = <0x58a0000 0x4000000>;
+		};
+	};
+};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
