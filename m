From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 3/3] arm64: dts: allwinner: a64: Rename
 r_i2c_pins_a label to r_i2c_pl89_pins
Date: Tue, 28 Aug 2018 18:01:32 +0800
Message-ID: <20180828100132.12975-4-wens@csie.org>
References: <20180828100132.12975-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBHF3STOAKGQELWQYUMQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180828100132.12975-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The pinmux name and label for a specific function should denote which
pingroup it is on, or if there is only one option for the function, have
not enumerating prefix/suffix at all.

The "r_i2c_pins_a" label is renamed to "r_i2c_pl89_pins" to fit our
current style. The node name "i2c" is also changed to "r-i2c-pl89-pins"
to match. The reason for the peculiar name is that the other option for
muxing R_I2C is on the PL0/PL1 pins, so the name has to mention the pin
numbers in addition to the pingroup.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
index 25683a7ac64f..77fac84797e9 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
@@ -142,7 +142,7 @@
 &r_i2c {
 	clock-frequency = <100000>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&r_i2c_pins_a>;
+	pinctrl-0 = <&r_i2c_pl89_pins>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index e3eda63230a6..e4cfa8778623 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -770,7 +770,7 @@
 			interrupt-controller;
 			#interrupt-cells = <3>;
 
-			r_i2c_pins_a: i2c-a {
+			r_i2c_pl89_pins: r-i2c-pl89-pins {
 				pins = "PL8", "PL9";
 				function = "s_i2c";
 			};
-- 
2.18.0
