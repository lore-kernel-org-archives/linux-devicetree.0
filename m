From: Sam Shih <sam.shih@mediatek.com>
Subject: [PATCH 1/1] arm: dts: mediatek: add mt7629 pwm support
Date: Mon, 30 Sep 2019 17:59:45 +0800
Message-ID: <1569837585-13247-2-git-send-email-sam.shih@mediatek.com>
References: <1569837585-13247-1-git-send-email-sam.shih@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1569837585-13247-1-git-send-email-sam.shih@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Sam Shih <sam.shih@mediatek.com>
List-Id: devicetree@vger.kernel.org

This adds pwm support for MT7629.
Used:
https://patchwork.kernel.org/patch/11160851/

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
---
 arch/arm/boot/dts/mt7629.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/mt7629.dtsi b/arch/arm/boot/dts/mt7629.dtsi
index 9608bc2ccb3f..24375fc5f936 100644
--- a/arch/arm/boot/dts/mt7629.dtsi
+++ b/arch/arm/boot/dts/mt7629.dtsi
@@ -241,6 +241,21 @@
 			status = "disabled";
 		};
 
+		pwm: pwm@11006000 {
+			compatible = "mediatek,mt7629-pwm";
+			reg = <0x11006000 0x1000>;
+			interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&topckgen CLK_TOP_PWM_SEL>,
+				 <&pericfg CLK_PERI_PWM_PD>,
+				 <&pericfg CLK_PERI_PWM1_PD>;
+			clock-names = "top", "main", "pwm1";
+			assigned-clocks = <&topckgen CLK_TOP_PWM_SEL>;
+			assigned-clock-parents =
+					<&topckgen CLK_TOP_UNIVPLL2_D4>;
+			num-pwms = <1>;
+			status = "disabled";
+		};
+
 		i2c: i2c@11007000 {
 			compatible = "mediatek,mt7629-i2c",
 				     "mediatek,mt2712-i2c";
-- 
2.17.1
