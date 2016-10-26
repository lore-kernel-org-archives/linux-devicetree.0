Return-Path: <mbrugger@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] arm64: dts: mt8173: Fix auxadc node
Date: Wed, 26 Oct 2016 16:15:00 +0200
Message-Id: <20161026141500.27105-1-matthias.bgg@gmail.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, will.deacon@arm.com, zhiyong.tao@mediatek.com, s.hauer@pengutronix.de
Cc: djkurtz@chromium.org, p.zabel@pengutronix.de, hans.verkuil@cisco.com, andrew-ct.chen@mediatek.com, ck.hu@mediatek.com, bayi.cheng@mediatek.com, yong.wu@mediatek.com, dawei.chien@mediatek.com, chunfeng.yun@mediatek.com, tiffany.lin@mediatek.com, fan.chen@mediatek.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
List-ID: <devicetree@vger.kernel.org>

The devicetree node for mt8173-auxadc lacks the clock and
io-channel-cells property. This leads to a non-working driver.

	mt6577-auxadc 11001000.auxadc: failed to get auxadc clock
	mt6577-auxadc: probe of 11001000.auxadc failed with error -2

Fix these fields to get the device up and running.

Fixes: 748c7d4de46a ("ARM64: dts: mt8173: Add thermal/auxadc device
nodes")
Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 1c71e25..6c03c17 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -450,6 +450,9 @@
 		auxadc: auxadc@11001000 {
 			compatible = "mediatek,mt8173-auxadc";
 			reg = <0 0x11001000 0 0x1000>;
+			clocks = <&pericfg CLK_PERI_AUXADC>;
+			clock-names = "main";
+			#io-channel-cells = <1>;
 		};
 
 		uart0: serial@11002000 {
-- 
2.10.1
