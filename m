From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v5 18/18] MIPS: JZ4740: DTS: Add DMA nodes
Date: Wed, 29 Aug 2018 23:33:00 +0200
Message-ID: <20180829213300.22829-19-paul@crapouillou.net>
References: <20180829213300.22829-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180829213300.22829-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>
Cc: od@zcrc.me, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Add the devicetree nodes for the DMA core of the JZ4740 SoC, disabled
by default, as currently there are no clients for the DMA driver
(until the MMC driver and/or others get a devicetree node).

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Mathieu Malaterre <malat@debian.org>
Acked-by: Paul Burton <paul.burton@mips.com>
---

Notes:
     v2: New patch in this series
    
     v3: Modify node to comply with devicetree specification
    
     v4: No change
    
     v5: No change

 arch/mips/boot/dts/ingenic/jz4740.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi b/arch/mips/boot/dts/ingenic/jz4740.dtsi
index 26c6b561d6f7..6fb16fd24035 100644
--- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
@@ -154,6 +154,21 @@
 		clock-names = "baud", "module";
 	};
 
+	dmac: dma-controller@13020000 {
+		compatible = "ingenic,jz4740-dma";
+		reg = <0x13020000 0xbc
+		       0x13020300 0x14>;
+		#dma-cells = <2>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <29>;
+
+		clocks = <&cgu JZ4740_CLK_DMA>;
+
+		/* Disable dmac until we have something that uses it */
+		status = "disabled";
+	};
+
 	uhc: uhc@13030000 {
 		compatible = "ingenic,jz4740-ohci", "generic-ohci";
 		reg = <0x13030000 0x1000>;
-- 
2.11.0
