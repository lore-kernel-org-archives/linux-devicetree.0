From: Archit Taneja <architt@codeaurora.org>
Subject: [PATCH v4 3/5] dt/bindings: qcom_nandc: Add DT bindings
Date: Wed, 19 Aug 2015 10:19:04 +0530
Message-ID: <1439959746-25498-4-git-send-email-architt@codeaurora.org>
References: <1438578498-32254-1-git-send-email-architt@codeaurora.org>
 <1439959746-25498-1-git-send-email-architt@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439959746-25498-1-git-send-email-architt@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org, dehrenberg@google.com, cernekee@gmail.com, computersforpeace@gmail.com, sboyd@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, agross@codeaurora.org, linux-kernel@vger.kernel.org, Archit Taneja <architt@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add DT bindings document for the Qualcomm NAND controller driver.

Cc: devicetree@vger.kernel.org

v4:
- No changes

v3:
- Don't use '0x' when specifying nand controller address space
- Add optional property for on-flash bbt usage

Acked-by: Andy Gross <agross@codeaurora.org>
Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
 .../devicetree/bindings/mtd/qcom_nandc.txt         | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/qcom_nandc.txt

diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
new file mode 100644
index 0000000..1de4643
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
@@ -0,0 +1,49 @@
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
+
+Optional properties:
+- nand-bus-width:	bus width. Must be 8 or 16. If not present, 8 is chosen
+			as default
+
+- nand-ecc-strength:	number of bits to correct per ECC step. Must be 4 or 8
+			bits. If not present, 4 is chosen as default
+- nand-on-flash-bbt:	Create/use on-flash bad block table
+
+The device tree may optionally contain sub-nodes describing partitions of the
+address space. See partition.txt for more detail.
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
+	partition@0 {
+	...
+	};
+};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
