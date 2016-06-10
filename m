From: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] ARM: dts: sun4i: Re-order pinctrl nodes alphabetically
Date: Fri, 10 Jun 2016 11:05:18 +0300
Message-ID: <1465545919-24270-2-git-send-email-mamlinav@gmail.com>
References: <1465545919-24270-1-git-send-email-mamlinav@gmail.com>
Reply-To: mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCENVD7YAEIK327JXICRUBGT4M6RO-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1465545919-24270-1-git-send-email-mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

No functional change. Re-order sun4i pinctrl nodes alphabetically.

Signed-off-by: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/sun4i-a10.dtsi | 114 +++++++++++++++++++--------------------
 1 file changed, 57 insertions(+), 57 deletions(-)

diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a10.dtsi
index a9c3190..6d9c7c70 100644
--- a/arch/arm/boot/dts/sun4i-a10.dtsi
+++ b/arch/arm/boot/dts/sun4i-a10.dtsi
@@ -958,69 +958,62 @@
 			#interrupt-cells = <3>;
 			#gpio-cells = <3>;
 
-			pwm0_pins_a: pwm0@0 {
-				allwinner,pins = "PB2";
-				allwinner,function = "pwm";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
-				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
-			};
-
-			pwm1_pins_a: pwm1@0 {
-				allwinner,pins = "PI3";
-				allwinner,function = "pwm";
+			emac_pins_a: emac0@0 {
+				allwinner,pins = "PA0", "PA1", "PA2",
+						"PA3", "PA4", "PA5", "PA6",
+						"PA7", "PA8", "PA9", "PA10",
+						"PA11", "PA12", "PA13", "PA14",
+						"PA15", "PA16";
+				allwinner,function = "emac";
 				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
-			uart0_pins_a: uart0@0 {
-				allwinner,pins = "PB22", "PB23";
-				allwinner,function = "uart0";
+			i2c0_pins_a: i2c0@0 {
+				allwinner,pins = "PB0", "PB1";
+				allwinner,function = "i2c0";
 				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
-			uart0_pins_b: uart0@1 {
-				allwinner,pins = "PF2", "PF4";
-				allwinner,function = "uart0";
+			i2c1_pins_a: i2c1@0 {
+				allwinner,pins = "PB18", "PB19";
+				allwinner,function = "i2c1";
 				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
-			uart1_pins_a: uart1@0 {
-				allwinner,pins = "PA10", "PA11";
-				allwinner,function = "uart1";
+			i2c2_pins_a: i2c2@0 {
+				allwinner,pins = "PB20", "PB21";
+				allwinner,function = "i2c2";
 				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
-			i2c0_pins_a: i2c0@0 {
-				allwinner,pins = "PB0", "PB1";
-				allwinner,function = "i2c0";
+			ir0_rx_pins_a: ir0@0 {
+				allwinner,pins = "PB4";
+				allwinner,function = "ir0";
 				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
-			i2c1_pins_a: i2c1@0 {
-				allwinner,pins = "PB18", "PB19";
-				allwinner,function = "i2c1";
+			ir0_tx_pins_a: ir0@1 {
+				allwinner,pins = "PB3";
+				allwinner,function = "ir0";
 				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
-			i2c2_pins_a: i2c2@0 {
-				allwinner,pins = "PB20", "PB21";
-				allwinner,function = "i2c2";
+			ir1_rx_pins_a: ir1@0 {
+				allwinner,pins = "PB23";
+				allwinner,function = "ir1";
 				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
-			emac_pins_a: emac0@0 {
-				allwinner,pins = "PA0", "PA1", "PA2",
-						"PA3", "PA4", "PA5", "PA6",
-						"PA7", "PA8", "PA9", "PA10",
-						"PA11", "PA12", "PA13", "PA14",
-						"PA15", "PA16";
-				allwinner,function = "emac";
+			ir1_tx_pins_a: ir1@1 {
+				allwinner,pins = "PB22";
+				allwinner,function = "ir1";
 				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
@@ -1040,34 +1033,41 @@
 				allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 			};
 
-			ir0_rx_pins_a: ir0@0 {
-				allwinner,pins = "PB4";
-				allwinner,function = "ir0";
+			ps20_pins_a: ps20@0 {
+				allwinner,pins = "PI20", "PI21";
+				allwinner,function = "ps2";
 				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
-			ir0_tx_pins_a: ir0@1 {
-				allwinner,pins = "PB3";
-				allwinner,function = "ir0";
+			ps21_pins_a: ps21@0 {
+				allwinner,pins = "PH12", "PH13";
+				allwinner,function = "ps2";
 				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
-			ir1_rx_pins_a: ir1@0 {
-				allwinner,pins = "PB23";
-				allwinner,function = "ir1";
+			pwm0_pins_a: pwm0@0 {
+				allwinner,pins = "PB2";
+				allwinner,function = "pwm";
 				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
-			ir1_tx_pins_a: ir1@1 {
-				allwinner,pins = "PB22";
-				allwinner,function = "ir1";
+			pwm1_pins_a: pwm1@0 {
+				allwinner,pins = "PI3";
+				allwinner,function = "pwm";
 				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
+			spdif_tx_pins_a: spdif@0 {
+				allwinner,pins = "PB13";
+				allwinner,function = "spdif";
+				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+				allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+			};
+
 			spi0_pins_a: spi0@0 {
 				allwinner,pins = "PI11", "PI12", "PI13";
 				allwinner,function = "spi0";
@@ -1124,25 +1124,25 @@
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
-			ps20_pins_a: ps20@0 {
-				allwinner,pins = "PI20", "PI21";
-				allwinner,function = "ps2";
+			uart0_pins_a: uart0@0 {
+				allwinner,pins = "PB22", "PB23";
+				allwinner,function = "uart0";
 				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
-			ps21_pins_a: ps21@0 {
-				allwinner,pins = "PH12", "PH13";
-				allwinner,function = "ps2";
+			uart0_pins_b: uart0@1 {
+				allwinner,pins = "PF2", "PF4";
+				allwinner,function = "uart0";
 				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
-			spdif_tx_pins_a: spdif@0 {
-				allwinner,pins = "PB13";
-				allwinner,function = "spdif";
+			uart1_pins_a: uart1@0 {
+				allwinner,pins = "PA10", "PA11";
+				allwinner,function = "uart1";
 				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
-				allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 		};
 
-- 
2.7.3
