From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH 9/9] arm: dts: Add power controller device node of MT2712
Date: Tue, 22 Aug 2017 18:28:22 +0800
Message-ID: <1503397702-7201-10-git-send-email-weiyi.lu@mediatek.com>
References: <1503397702-7201-1-git-send-email-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503397702-7201-1-git-send-email-weiyi.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, Weiyi Lu <weiyi.lu@mediatek.com>
List-Id: devicetree@vger.kernel.org

add power controller node for MT2712

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
index 6338a1f..4269ade 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/mt2712-clk.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/mt2712-power.h>
 #include "mt2712-pinfunc.h"
 
 / {
@@ -165,6 +166,21 @@
 		interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	scpsys: scpsys@10006000 {
+		compatible = "mediatek,mt2712-scpsys", "syscon";
+		#power-domain-cells = <1>;
+		reg = <0 0x10006000 0 0x1000>;
+		clocks = <&topckgen CLK_TOP_MM_SEL>,
+			 <&topckgen CLK_TOP_MFG_SEL>,
+			 <&topckgen CLK_TOP_VENC_SEL>,
+			 <&topckgen CLK_TOP_JPGDEC_SEL>,
+			 <&topckgen CLK_TOP_A1SYS_HP_SEL>,
+			 <&topckgen CLK_TOP_VDEC_SEL>;
+		clock-names = "mm", "mfg", "venc",
+			"jpgdec", "audio", "vdec";
+		infracfg = <&infracfg>;
+	};
+
 	uart5: serial@1000f000 {
 		compatible = "mediatek,mt2712-uart",
 			     "mediatek,mt6577-uart";
-- 
1.9.1
