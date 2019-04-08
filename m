From: Chen-Yu Tsai <wens@kernel.org>
Subject: [PATCH 5/6] ARM: dts: sun8i: a83t: Add I2C2 pinmux setting for PE pins
Date: Tue,  9 Apr 2019 00:57:43 +0800
Message-ID: <20190408165744.11672-6-wens@kernel.org>
References: <20190408165744.11672-1-wens@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190408165744.11672-1-wens@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
List-Id: devicetree@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

I2C2 is available on the PE pingroup, on the same pins as the camera
sensor interface (CSI) controller's camera control interface pins.
This provides an option to use I2C2 instead of that control interface
to configure camera sensors.

Add a pinctrl node for it. The property /omit-if-no-ref/ is added to
keep the device tree blob size down if it is unused.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index 0c52f945fd5f..350ea40ea560 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -723,6 +723,12 @@
 				function = "i2c1";
 			};
 
+			/omit-if-no-ref/
+			i2c2_pe_pins: i2c2-pe-pins {
+				pins = "PE14", "PE15";
+				function = "i2c2";
+			};
+
 			i2c2_ph_pins: i2c2-ph-pins {
 				pins = "PH4", "PH5";
 				function = "i2c2";
-- 
2.20.1
