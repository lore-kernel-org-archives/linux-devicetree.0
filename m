Return-Path: <SRS0=zlaX=QF=linux.intel.com=thor.thayer@kernel.org>
From: thor.thayer@linux.intel.com
Subject: [PATCH 2/4] Documentation: dt: edac: Add Stratix10 Peripheral bindings
Date: Tue, 29 Jan 2019 16:03:46 -0600
Message-Id: <1548799428-10541-3-git-send-email-thor.thayer@linux.intel.com>
In-Reply-To: <1548799428-10541-1-git-send-email-thor.thayer@linux.intel.com>
References: <1548799428-10541-1-git-send-email-thor.thayer@linux.intel.com>
To: bp@alien8.de, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, james.morse@arm.com
Cc: thor.thayer@linux.intel.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Thor Thayer <thor.thayer@linux.intel.com>

Add peripheral bindings for Stratix10 EDAC to capture
the differences between the ARM64 and ARM32 architecture.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
 .../devicetree/bindings/edac/socfpga-eccmgr.txt    | 106 +++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt b/Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt
index a0ac50e15912..a0fa80c53d2a 100644
--- a/Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt
+++ b/Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt
@@ -258,6 +258,49 @@ Required Properties:
 - compatible : Should be "altr,sdram-edac-s10"
 - interrupts : Should be single bit error interrupt.
 
+On-Chip RAM ECC
+Required Properties:
+- compatible      : Should be "altr,socfpga-s10-ocram-ecc"
+- reg             : Address and size for ECC block registers.
+- altr,ecc-parent : phandle to parent OCRAM node.
+- interrupts      : Should be single bit error interrupt.
+
+Ethernet FIFO ECC
+Required Properties:
+- compatible      : Should be "altr,socfpga-s10-eth-mac-ecc"
+- reg             : Address and size for ECC block registers.
+- altr,ecc-parent : phandle to parent Ethernet node.
+- interrupts      : Should be single bit error interrupt.
+
+NAND FIFO ECC
+Required Properties:
+- compatible      : Should be "altr,socfpga-s10-nand-ecc"
+- reg             : Address and size for ECC block registers.
+- altr,ecc-parent : phandle to parent NAND node.
+- interrupts      : Should be single bit error interrupt.
+
+DMA FIFO ECC
+Required Properties:
+- compatible      : Should be "altr,socfpga-s10-dma-ecc"
+- reg             : Address and size for ECC block registers.
+- altr,ecc-parent : phandle to parent DMA node.
+- interrupts      : Should be single bit error interrupt.
+
+USB FIFO ECC
+Required Properties:
+- compatible      : Should be "altr,socfpga-s10-usb-ecc"
+- reg             : Address and size for ECC block registers.
+- altr,ecc-parent : phandle to parent USB node.
+- interrupts      : Should be single bit error interrupt.
+
+SDMMC FIFO ECC
+Required Properties:
+- compatible      : Should be "altr,socfpga-s10-sdmmc-ecc"
+- reg             : Address and size for ECC block registers.
+- altr,ecc-parent : phandle to parent SD/MMC node.
+- interrupts      : Should be single bit error interrupt for port A
+		    and then single bit error interrupt for port B.
+
 Example:
 
 	eccmgr {
@@ -274,4 +317,67 @@ Example:
 			compatible = "altr,sdram-edac-s10";
 			interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		ocram-ecc@ff8cc000 {
+			compatible = "altr,socfpga-s10-ocram-ecc";
+			reg = <ff8cc000 0x100>;
+			altr,ecc-parent = <&ocram>;
+			interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		emac0-rx-ecc@ff8c0000 {
+			compatible = "altr,socfpga-s10-eth-mac-ecc";
+			reg = <0xff8c0000 0x100>;
+			altr,ecc-parent = <&gmac0>;
+			interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		emac0-tx-ecc@ff8c0400 {
+			compatible = "altr,socfpga-s10-eth-mac-ecc";
+			reg = <0xff8c0400 0x100>;
+			altr,ecc-parent = <&gmac0>;
+			interrupts = <5 IRQ_TYPE_LEVEL_HIGH>'
+		};
+
+		nand-buf-ecc@ff8c8000 {
+			compatible = "altr,socfpga-s10-nand-ecc";
+			reg = <0xff8c8000 0x100>;
+			altr,ecc-parent = <&nand>;
+			interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		nand-rd-ecc@ff8c8400 {
+			compatible = "altr,socfpga-s10-nand-ecc";
+			reg = <0xff8c8400 0x100>;
+			altr,ecc-parent = <&nand>;
+			interrupts = <13 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		nand-wr-ecc@ff8c8800 {
+			compatible = "altr,socfpga-s10-nand-ecc";
+			reg = <0xff8c8800 0x100>;
+			altr,ecc-parent = <&nand>;
+			interrupts = <12 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		dma-ecc@ff8c9000 {
+			compatible = "altr,socfpga-s10-dma-ecc";
+			reg = <0xff8c9000 0x100>;
+			altr,ecc-parent = <&pdma>;
+			interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
+
+		usb0-ecc@ff8c4000 {
+			compatible = "altr,socfpga-s10-usb-ecc";
+			reg = <0xff8c4000 0x100>;
+			altr,ecc-parent = <&usb0>;
+			interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		sdmmc-ecc@ff8c8c00 {
+			compatible = "altr,socfpga-s10-sdmmc-ecc";
+			reg = <0xff8c8c00 0x100>;
+			altr,ecc-parent = <&mmc>;
+			interrupts = <14 IRQ_TYPE_LEVEL_HIGH>,
+				     <15 IRQ_TYPE_LEVEL_HIGH>;
+		};
 	};
-- 
2.7.4
