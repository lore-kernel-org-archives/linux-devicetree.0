From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [PATCH] ARM: dts: stm32: Add leds support to stm32f469 Discovery board
Date: Wed, 17 Jan 2018 10:40:02 +0100
Message-ID: <20180117094005.20728-1-benjamin.gaignard@st.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

Add nodes for the four user leds.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 arch/arm/boot/dts/stm32f469-disco.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
index c18acbe4cf4e..5e9994840a24 100644
--- a/arch/arm/boot/dts/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/stm32f469-disco.dts
@@ -70,6 +70,22 @@
 		dma-ranges = <0xc0000000 0x0 0x10000000>;
 	};
 
+	leds {
+		compatible = "gpio-leds";
+		green {
+			gpios = <&gpiog 6 1>;
+			linux,default-trigger = "heartbeat";
+		};
+		orange {
+			gpios = <&gpiod 4 1>;
+		};
+		red {
+			gpios = <&gpiod 5 1>;
+		};
+		blue {
+			gpios = <&gpiok 3 1>;
+	};
+
 	/* This turns on vbus for otg for host mode (dwc2) */
 	vcc5v_otg: vcc5v-otg-regulator {
 		compatible = "regulator-fixed";
-- 
2.15.0
