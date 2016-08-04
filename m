From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v5] arm64: dts: mt8173: add mmsel clocks for 4K support
Date: Thu, 4 Aug 2016 10:57:18 +0800
Message-ID: <1470279438-60372-1-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Kurtz <djkurtz@chromium.org>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, James Liao <jamesjj.liao@mediatek.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, YH Huang <yh.huang@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, "dawei.chien@mediatek.com" <dawei.chien@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Junzhi Zhao <junzhi.zhao@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Bibby Hsieh <bibby.hsieh@mediatek.com>
List-Id: devicetree@vger.kernel.org

To support HDMI 4K resolution, mmsys need clcok
mm_sel to be 400MHz.

The board .dts file should override the clock rate
property with the higher VENCPLL frequency the board
supports HDMI 4K resolution.

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 78529e4..c3f32f3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -690,6 +690,8 @@
 			compatible = "mediatek,mt8173-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
 			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+			assigned-clocks = <&topckgen CLK_TOP_MM_SEL>;
+			assigned-clock-rates = <400000000>;
 			#clock-cells = <1>;
 		};
 
-- 
1.7.9.5
