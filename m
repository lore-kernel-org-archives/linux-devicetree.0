From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] MIPS: DTS: jz4740: Correct interrupt number of DMA core
Date: Fri, 25 Jan 2019 15:12:45 -0300
Message-ID: <20190125181245.9966-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

The interrupt number set in the devicetree node of the DMA driver was
wrong.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/boot/dts/ingenic/jz4740.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi b/arch/mips/boot/dts/ingenic/jz4740.dtsi
index 6fb16fd24035..2beb78a62b7d 100644
--- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
@@ -161,7 +161,7 @@
 		#dma-cells = <2>;
 
 		interrupt-parent = <&intc>;
-		interrupts = <29>;
+		interrupts = <20>;
 
 		clocks = <&cgu JZ4740_CLK_DMA>;
 
-- 
2.11.0
