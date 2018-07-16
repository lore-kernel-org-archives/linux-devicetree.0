From: Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v1 2/2] arm64: dts: mt7622: update a clock property for UART0
Date: Mon, 16 Jul 2018 22:59:09 +0800
Message-ID: <87527531b135f4eb7fb51d4e7ee82723cd162a6c.1531753039.git.ryder.lee@mediatek.com>
References: <2ff39c40ef6bc3054667e63c785a1d28527b5ddf.1531753039.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2ff39c40ef6bc3054667e63c785a1d28527b5ddf.1531753039.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>
List-Id: devicetree@vger.kernel.org

The input clock of UART0 should be CLK_PERI_UART0_PD.

Fixes: 13f36c326cef ("arm64: dts: mt7622: turn uart0 clock to real ones")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
change since v1:
- add Fixes tag.
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 8cdec52..4caa9b4 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -367,7 +367,7 @@
 		reg = <0 0x11002000 0 0x400>;
 		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&topckgen CLK_TOP_UART_SEL>,
-			 <&pericfg CLK_PERI_UART1_PD>;
+			 <&pericfg CLK_PERI_UART0_PD>;
 		clock-names = "baud", "bus";
 		status = "disabled";
 	};
-- 
1.9.1
