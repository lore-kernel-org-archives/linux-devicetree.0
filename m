From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 7/9] ARM: dts: sun7i: bananapi-m1-plus: red LED
 is power LED
Date: Wed,  6 Jul 2016 17:10:48 +0800
Message-ID: <1467796250-22010-8-git-send-email-wens@csie.org>
References: <1467796250-22010-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBI4W6O5QKGQEEM2GUBI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1467796250-22010-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The red led on the Bananapi M1+ is wired to light up as soon as the
board is powered, and continues to be lit while the GPIO is floating.

Rename the LED to "pwr", remove the default trigger, and mark it as
default on.

Also fix the pinmux node that was specifying a different pin for this
LED.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts b/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
index 14fb463758e4..ba5bca0fe997 100644
--- a/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
+++ b/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
@@ -70,12 +70,11 @@
 			gpios = <&pio 7 24 GPIO_ACTIVE_HIGH>;
 		};
 
-		red {
-			label = "bananapi-m1-plus:red:usr";
+		pwr {
+			label = "bananapi-m1-plus:pwr:usr";
 			gpios = <&pio 7 25 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "default-on";
+			default-state = "on";
 		};
-
 	};
 
 	mmc3_pwrseq: mmc3_pwrseq {
@@ -202,7 +201,7 @@
 	};
 
 	led_pins_bpi_m1p: led_pins@0 {
-		allwinner,pins = "PH24", "PG2";
+		allwinner,pins = "PH24", "PH25";
 		allwinner,function = "gpio_out";
 		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
-- 
2.8.1
