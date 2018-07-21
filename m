From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 17/18] MIPS: JZ4770: DTS: Add DMA nodes
Date: Sat, 21 Jul 2018 13:06:42 +0200
Message-ID: <20180721110643.19624-18-paul@crapouillou.net>
References: <20180721110643.19624-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180721110643.19624-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, Paul Cercueil <paul@crapouillou.net>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

Add the two devicetree nodes for the two DMA cores of the JZ4770 SoC,
disabled by default, as currently there are no clients for the DMA
driver (until the MMC driver and/or others get a devicetree node).

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Mathieu Malaterre <malat@debian.org>
---
 arch/mips/boot/dts/ingenic/jz4770.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

 v2: No change

 v3: Modify nodes to comply with devicetree specification

diff --git a/arch/mips/boot/dts/ingenic/jz4770.dtsi b/arch/mips/boot/dts/ingenic/jz4770.dtsi
index 7c2804f3f5f1..49ede6c14ff3 100644
--- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
@@ -196,6 +196,36 @@
 		status = "disabled";
 	};
 
+	dmac0: dma-controller@13420000 {
+		compatible = "ingenic,jz4770-dma";
+		reg = <0x13420000 0xC0
+		       0x13420300 0x20>;
+
+		#dma-cells = <1>;
+
+		clocks = <&cgu JZ4770_CLK_DMA>;
+		interrupt-parent = <&intc>;
+		interrupts = <24>;
+
+		/* Disable dmac0 until we have something that uses it */
+		status = "disabled";
+	};
+
+	dmac1: dma-controller@13420100 {
+		compatible = "ingenic,jz4770-dma";
+		reg = <0x13420100 0xC0
+		       0x13420400 0x20>;
+
+		#dma-cells = <1>;
+
+		clocks = <&cgu JZ4770_CLK_DMA>;
+		interrupt-parent = <&intc>;
+		interrupts = <23>;
+
+		/* Disable dmac1 until we have something that uses it */
+		status = "disabled";
+	};
+
 	uhc: uhc@13430000 {
 		compatible = "generic-ohci";
 		reg = <0x13430000 0x1000>;
-- 
2.11.0
