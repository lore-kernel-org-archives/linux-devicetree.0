From: Eddie Huang <eddie.huang@mediatek.com>
Subject: [PATCH v4 1/2] arm64: dts: mt8173: Add watchdog device node
Date: Wed, 17 Jun 2015 23:08:02 +0800
Message-ID: <1434553683-11651-2-git-send-email-eddie.huang@mediatek.com>
References: <1434553683-11651-1-git-send-email-eddie.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434553683-11651-1-git-send-email-eddie.huang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Daniel Kurtz <djkurtz@chromium.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Eddie Huang <eddie.huang@mediatek.com>
List-Id: devicetree@vger.kernel.org

Add MT8173 watchdog device node.

Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 30ac8dd..b52ec43 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -160,6 +160,12 @@
 						<GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8173-wdt",
+				     "mediatek,mt6589-wdt";
+			reg = <0 0x10007000 0 0x100>;
+		};
+
 		sysirq: intpol-controller@10200620 {
 			compatible = "mediatek,mt8173-sysirq",
 					"mediatek,mt6577-sysirq";
-- 
1.8.1.1.dirty
