From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v3 3/6] mtd: nand: vf610_nfc: add device tree bindings
Date: Fri, 13 Mar 2015 10:38:55 +0100
Message-ID: <1426239538-11529-4-git-send-email-stefan@agner.ch>
References: <1426239538-11529-1-git-send-email-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426239538-11529-1-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: dwmw2@infradead.org, computersforpeace@gmail.com
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, shawn.guo@linaro.org, kernel@pengutronix.de, boris.brezillon@free-electrons.com, marb@ixxat.de, aaron@tastycactus.com, bpringlemeir@nbsps.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Bill Pringlemeir <bpringlemeir@nbsps.com>
Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 .../devicetree/bindings/mtd/vf610-nfc.txt          | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/vf610-nfc.txt

diff --git a/Documentation/devicetree/bindings/mtd/vf610-nfc.txt b/Documentation/devicetree/bindings/mtd/vf610-nfc.txt
new file mode 100644
index 0000000..5f0d344
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/vf610-nfc.txt
@@ -0,0 +1,45 @@
+Freescale's NAND flash controller (NFC)
+
+This variant of the Freescale NAND flash controller (NFC) is on Vybrid (vf610),
+MPC5125, MCF54418 and Kinetis K70.
+
+Required properties:
+- compatible: "fsl,vf610-nfc"
+- reg: address range of the NFC
+- interrupts: interrupt of the NFC
+- nand-bus-width: see nand.txt
+- nand-ecc-mode: see nand.txt
+- nand-on-flash-bbt: see nand.txt
+- assigned-clocks: main clock from the SoC, for Vybrid <&clks VF610_CLK_NFC>;
+- assigned-clock-rates: The NAND bus timing is derived from this clock
+    rate and should not exceed maximum timing for any NAND memory chip
+    in a board stuffing. Typical NAND memory timings derived from this
+    clock are found in the SoC hardware reference manual. Furthermore,
+    there might be restrictions on maximum rates when using hardware ECC.
+
+- #address-cells, #size-cells : Must be present if the device has sub-nodes
+  representing partitions.
+
+Required properties for hardware ECC:
+- nand-ecc-strength: supported strengths are 24 and 32 bit (see nand.txt)
+- nand-ecc-step-size: step size equals page size, currently only 2k pages are
+    supported
+
+Example:
+
+	nfc: nand@400e0000 {
+		compatible = "fsl,vf610-nfc";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0x400e0000 0x4000>;
+		interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clks VF610_CLK_NFC>;
+		clock-names = "nfc";
+		assigned-clocks = <&clks VF610_CLK_NFC>;
+		assigned-clock-rates = <33000000>;
+		nand-bus-width = <8>;
+		nand-ecc-mode = "hw";
+		nand-on-flash-bbt;
+		nand-ecc-strength = <32>;
+		nand-ecc-step-size = <2048>;
+	};
-- 
2.3.1
