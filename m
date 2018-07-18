From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 15/17] MIPS: JZ4780: DTS: Update DMA node to match driver changes
Date: Wed, 18 Jul 2018 20:20:21 +0200
Message-ID: <20180718182023.8182-16-paul@crapouillou.net>
References: <20180718182023.8182-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180718182023.8182-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

The driver now accepts two memory resources, the first one for the
channel-specific registers, the second one for the controller-specific
registers.

Note that older devicetrees, without this commit, will still work with
the jz4780-dma driver.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Mathieu Malaterre <malat@debian.org>
---
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

 v2: Update info about devicetree ABI compatibility in commit message

diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index aa4e8f75ff5d..ad3b1f827cf5 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -247,7 +247,8 @@
 
 	dma: dma@13420000 {
 		compatible = "ingenic,jz4780-dma";
-		reg = <0x13420000 0x10000>;
+		reg = <0x13420000 0x400
+		       0x13421000 0x40>;
 		#dma-cells = <2>;
 
 		interrupt-parent = <&intc>;
-- 
2.11.0
