From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 1/2] ARM: dts: sun8i-a23-q8-tablet: Drop pinmux
 setting for codec PA gpio
Date: Wed,  8 Mar 2017 11:28:20 +0800
Message-ID: <20170308032821.26854-2-wens@csie.org>
References: <20170308032821.26854-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBWHU7XCQKGQE4GO7O4Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170308032821.26854-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The old sunxi specific pinctrl bindings are deprecated, in favor of
the new generic pinconf bindings. Also, we are moving towards handling
GPIO pinmux settings that don't require extra bias or drive strength
settings to use the GPIO bindings only.

This patch removes the last instance of the sunxi specific pinctrl
bindings that use the pinctrl header by dropping the pinmux setting
for the audio codec's PA (external amplifier) control GPIO. The pin
is pulled down externally.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-a23-q8-tablet.dts | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-a23-q8-tablet.dts b/arch/arm/boot/dts/sun8i-a23-q8-tablet.dts
index 3ab5c0c09d93..b6958e8f2f01 100644
--- a/arch/arm/boot/dts/sun8i-a23-q8-tablet.dts
+++ b/arch/arm/boot/dts/sun8i-a23-q8-tablet.dts
@@ -50,7 +50,6 @@
 };
 
 &codec {
-	pinctrl-0 = <&codec_pa_pin>;
 	allwinner,pa-gpios = <&pio 7 9 GPIO_ACTIVE_HIGH>; /* PH9 */
 	allwinner,audio-routing =
 		"Headphone", "HP",
@@ -62,12 +61,3 @@
 		"Headset Mic", "HBIAS";
 	status = "okay";
 };
-
-&pio {
-	codec_pa_pin: codec_pa_pin@0 {
-		allwinner,pins = "PH9";
-		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
-		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
-	};
-};
-- 
2.11.0
