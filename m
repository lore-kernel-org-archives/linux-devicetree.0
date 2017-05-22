From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 5/6] ARM: sun8i: a83t: Add device node for SPDIF transmitter
Date: Mon, 22 May 2017 14:25:51 +0800
Message-ID: <20170522062552.19026-6-wens@csie.org>
References: <20170522062552.19026-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBAEJRLEQKGQE4LKKZ2Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170522062552.19026-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The A83T SoC has an SPDIF transmitter block. According to the vendor
BSP kernel, it is compatible with the one found on the H3 SoC.

Add a device node and pinmux setting for it.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index 47196feda26b..1dc4cfe81534 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -202,6 +202,11 @@
 				bias-pull-up;
 			};
 
+			spdif_tx_pin: spdif-tx-pin {
+				pins = "PE18";
+				function = "spdif";
+			};
+
 			uart0_pb_pins: uart0-pb-pins {
 				pins = "PB9", "PB10";
 				function = "uart0";
@@ -228,6 +233,22 @@
 			clocks = <&osc24M>;
 		};
 
+		spdif: spdif@1c21000 {
+			#sound-dai-cells = <0>;
+			compatible = "allwinner,sun8i-a83t-spdif",
+				     "allwinner,sun8i-h3-spdif";
+			reg = <0x01c21000 0x400>;
+			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu 44>, <&ccu 76>;
+			resets = <&ccu 32>;
+			clock-names = "apb", "spdif";
+			dmas = <&dma 2>;
+			dma-names = "tx";
+			pinctrl-names = "default";
+			pinctrl-0 = <&spdif_tx_pin>;
+			status = "disabled";
+		};
+
 		uart0: serial@01c28000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28000 0x400>;
-- 
2.11.0
