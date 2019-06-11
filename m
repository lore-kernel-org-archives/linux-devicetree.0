From: Dehui Sun <dehui.sun@mediatek.com>
Subject: [PATCH v1 2/2] arm64: dts: mt8183: add systimer0 device node
Date: Tue, 11 Jun 2019 19:28:54 +0800
Message-ID: <1560252534-11412-3-git-send-email-dehui.sun@mediatek.com>
References: <1560252534-11412-1-git-send-email-dehui.sun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560252534-11412-1-git-send-email-dehui.sun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, erin.lo@mediatek.com, weiyi.lu@mediatek.com, dehui.sun@mediatek.com
List-Id: devicetree@vger.kernel.org

Add systimer0 device node for MT8183.

Signed-off-by: Dehui Sun <dehui.sun@mediatek.com>
---
This patch is based on the following patches:
https://patchwork.kernel.org/cover/10962385/
https://patchwork.kernel.org/patch/10983939/
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index c2749c4..ac3f87d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -254,6 +254,15 @@
 			clock-names = "spi", "wrap";
 		};
 
+		systimer: systimer@10017000 {
+			compatible = "mediatek,mt8183-timer",
+				     "mediatek,mt6765-timer";
+			reg = <0 0x10017000 0 0x1000>;
+			interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&topckgen CLK_TOP_CLK13M>;
+			clock-names = "clk13m";
+		};
+
 		auxadc: auxadc@11001000 {
 			compatible = "mediatek,mt8183-auxadc",
 				     "mediatek,mt8173-auxadc";
-- 
2.1.0
