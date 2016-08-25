From: Milo Kim <woogyom.kim@gmail.com>
Subject: [PATCH 2/2] ARM: dts: sun8i-h3: Add UART1 pinctrl
Date: Thu, 25 Aug 2016 15:44:54 +0900
Message-ID: <1472107494-20740-2-git-send-email-woogyom.kim@gmail.com>
References: <1472107494-20740-1-git-send-email-woogyom.kim@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1472107494-20740-1-git-send-email-woogyom.kim@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Milo Kim <woogyom.kim@gmail.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

In H3, PA5 can be used as PWM and UART0. If the PWM is used, the console
UART should be moved to other port.
This patch enables UART1 pinctrl to support this case.

	PA5: PWM
	PG6, PG7: debug console

Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Milo Kim <woogyom.kim@gmail.com>
---
 arch/arm/boot/dts/sun8i-h3.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
index 3a965fb..fdb6801 100644
--- a/arch/arm/boot/dts/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
@@ -526,6 +526,13 @@
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
+			uart1_pins_a: uart1@0 {
+				allwinner,pins = "PG6", "PG7";
+				allwinner,function = "uart1";
+				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
+			};
+
 			mmc0_pins_a: mmc0@0 {
 				allwinner,pins = "PF0", "PF1", "PF2", "PF3",
 						 "PF4", "PF5";
-- 
1.9.1
