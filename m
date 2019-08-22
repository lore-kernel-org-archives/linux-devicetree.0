From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: [PATCH] arm64: dts: mt8183: fix pwrap gic number
Date: Thu, 22 Aug 2019 16:55:40 +0800
Message-ID: <1566464140-26977-1-git-send-email-hsin-hsiung.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

The correct gic number of pwrap is 185 instead of 209. This patch fixes
it to avoid triggering error interrupt.

Fixes: e526c9bc11f8 ("arm64: dts: Add Mediatek SoC MT8183 and evaluation board dts and Makefile")

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index c2749c4..afb0996 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -248,7 +248,7 @@
 			compatible = "mediatek,mt8183-pwrap";
 			reg = <0 0x1000d000 0 0x1000>;
 			reg-names = "pwrap";
-			interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&topckgen CLK_TOP_MUX_PMICSPI>,
 				 <&infracfg CLK_INFRA_PMIC_AP>;
 			clock-names = "spi", "wrap";
-- 
1.9.1
