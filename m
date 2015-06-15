From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCHv7 1/4] ARM: dts: exynos5422-odroidxu3: Add pwm-fan node
Date: Mon, 15 Jun 2015 12:23:20 +0930
Message-ID: <1434336803-4132-1-git-send-email-linux.amoon@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Markus Reichl <m.reichl@fivetechno.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>
List-Id: devicetree@vger.kernel.org

Add pwm-fan node to the Odroid-XU3 board.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Markus Reichl <m.reichl@fivetechno.de>
Acked-by: Lukasz Majewski <l.majewski@samsung.com>
Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index 8adf455..17e6a9a 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -107,6 +107,15 @@
 			clocks = <&i2s0 CLK_I2S_CDCLK>;
 		};
 	};
+
+	fan0: pwm-fan {
+		compatible = "pwm-fan";
+		pwms = <&pwm 0 20972 0>;
+		cooling-min-state = <0>;
+		cooling-max-state = <3>;
+		#cooling-cells = <2>;
+		cooling-levels = <0 130 170 230>;
+	};
 };
 
 &clock_audss {
@@ -461,6 +470,7 @@
 	 */
 	pinctrl-0 = <&pwm0_out &pwm1_out &pwm2_out &pwm3_out>;
 	pinctrl-names = "default";
+	samsung,pwm-outputs = <0>;
 	status = "okay";
 };
 
-- 
2.4.3
