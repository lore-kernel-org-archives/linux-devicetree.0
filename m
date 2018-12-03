From: YT Shen <yt.shen@mediatek.com>
Subject: [PATCH 5/8] arm64: dts: add pwm nodes for MT2712
Date: Mon, 3 Dec 2018 19:35:59 +0800
Message-ID: <1543836962-18293-6-git-send-email-yt.shen@mediatek.com>
References: <1543836962-18293-1-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543836962-18293-1-git-send-email-yt.shen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com, YT Shen <yt.shen@mediatek.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: YT Shen <yt.shen@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
index 4843376..e9856fe 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
@@ -418,6 +418,34 @@
 		status = "disabled";
 	};
 
+	pwm: pwm@11006000 {
+		compatible = "mediatek,mt2712-pwm";
+		reg = <0 0x11006000 0 0x1000>;
+		#pwm-cells = <2>;
+		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&topckgen CLK_TOP_PWM_SEL>,
+			 <&pericfg CLK_PERI_PWM>,
+			 <&pericfg CLK_PERI_PWM0>,
+			 <&pericfg CLK_PERI_PWM1>,
+			 <&pericfg CLK_PERI_PWM2>,
+			 <&pericfg CLK_PERI_PWM3>,
+			 <&pericfg CLK_PERI_PWM4>,
+			 <&pericfg CLK_PERI_PWM5>,
+			 <&pericfg CLK_PERI_PWM6>,
+			 <&pericfg CLK_PERI_PWM7>;
+		clock-names = "top",
+			      "main",
+			      "pwm1",
+			      "pwm2",
+			      "pwm3",
+			      "pwm4",
+			      "pwm5",
+			      "pwm6",
+			      "pwm7",
+			      "pwm8";
+		status = "disabled";
+	};
+
 	i2c0: i2c@11007000 {
 		compatible = "mediatek,mt2712-i2c";
 		reg = <0 0x11007000 0 0x90>,
-- 
1.9.1
