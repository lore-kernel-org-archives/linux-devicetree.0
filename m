From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v4 08/13] arm64: dts: allwinner: a64: Add IR node
Date: Tue,  4 Jun 2019 18:29:54 +0200
Message-ID: <20190604162959.29199-9-peron.clem@gmail.com>
References: <20190604162959.29199-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190604162959.29199-1-peron.clem@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Igors Makejevs <git_bb@bwzone.com>, Jernej Skrabec <jernej.skrabec@siol.net>, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>, Sean Young <sean@mess.org>
List-Id: devicetree@vger.kernel.org

From: Igors Makejevs <git_bb@bwzone.com>

IR peripheral is completely compatible with A31 one.

Signed-off-by: Igors Makejevs <git_bb@bwzone.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
Acked-by: Sean Young <sean@mess.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 8c5b521e6389..b22b0aa89515 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -1072,6 +1072,19 @@
 			#size-cells = <0>;
 		};
 
+		r_ir: ir@1f02000 {
+			compatible = "allwinner,sun50i-a64-ir",
+				     "allwinner,sun6i-a31-ir";
+			reg = <0x01f02000 0x400>;
+			clocks = <&r_ccu CLK_APB0_IR>, <&r_ccu CLK_IR>;
+			clock-names = "apb", "ir";
+			resets = <&r_ccu RST_APB0_IR>;
+			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&r_ir_rx_pin>;
+			status = "disabled";
+		};
+
 		r_pwm: pwm@1f03800 {
 			compatible = "allwinner,sun50i-a64-pwm",
 				     "allwinner,sun5i-a13-pwm";
@@ -1099,6 +1112,11 @@
 				function = "s_i2c";
 			};
 
+			r_ir_rx_pin: r-ir-rx-pin {
+				pins = "PL11";
+				function = "s_cir_rx";
+			};
+
 			r_pwm_pin: r-pwm-pin {
 				pins = "PL10";
 				function = "s_pwm";
-- 
2.20.1
