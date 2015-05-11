From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 5/5] ARM64: MediaTek MT8173: Add SCPSYS device node
Date: Mon, 11 May 2015 21:23:26 +0200
Message-ID: <1431372206-1237-6-git-send-email-s.hauer@pengutronix.de>
References: <1431372206-1237-1-git-send-email-s.hauer@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431372206-1237-1-git-send-email-s.hauer@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, kernel@pengutronix.de, Matthias Brugger <matthias.bgg@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

This adds the SCPSYS device node to the MT8173 dtsi file.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 924fdb6..3c569b5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -125,6 +125,18 @@
 						<GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		scpsys: scpsys@10006000 {
+			compatible = "mediatek,mt8173-scpsys";
+			#power-domain-cells = <1>;
+			reg = <0 0x10006000 0 0x1000>;
+			clocks = <&topckgen CLK_TOP_VDEC_SEL>,
+				<&topckgen CLK_TOP_MFG_SEL>,
+				<&topckgen CLK_TOP_VENC_SEL>,
+				<&topckgen CLK_TOP_MM_SEL>,
+				<&topckgen CLK_TOP_VENC_LT_SEL>;
+			clock-names = "vdec", "mfg", "venc", "disp", "ven2";
+		};
+
 		sysirq: intpol-controller@10200620 {
 			compatible = "mediatek,mt8173-sysirq",
 					"mediatek,mt6577-sysirq";
-- 
2.1.4
