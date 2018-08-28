From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 1/3] arm64: dts: allwinner: a64: Split out data
 strobe pin from mmc2 pinmux
Date: Tue, 28 Aug 2018 18:01:30 +0800
Message-ID: <20180828100132.12975-2-wens@csie.org>
References: <20180828100132.12975-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBGV3STOAKGQEOX2OJJA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

The eMMC 5.0 standard introduced the data strobe (DS) pin. This pin is
not used for pre-5.0 data modes, nor is it found on pre-5.0 eMMC chips.
On the A64, this pin is muxed with spi0's MISO pin. If the DS pin is
included in the mmc2 pinmux by default, this wil prevent the usage
of both mmc2 and spi0 together.

Instead, split out the DS pin to a separate pinmux that only gets used
by boards that actually have it wired up. Currently supported ones
include the Bananapi M64 and Pine64 Pinebook. These are fixed up.

Fixes: a3e8f4926248 ("arm64: allwinner: a64: Add MMC pinctrl nodes")
Fixes: b8bcf0e1b212 ("arm64: allwinner: add BananaPi-M64 support")
Fixes: df35fbcfa398 ("arm64: dts: allwinner: add support for Pinebook")
Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 .../arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts    | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi            | 9 ++++++++-
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
index 094cfed13df9..e643e453ec68 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
@@ -151,7 +151,7 @@
 
 &mmc2 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&mmc2_pins>;
+	pinctrl-0 = <&mmc2_pins>, <&mmc2_ds_pin>;
 	vmmc-supply = <&reg_dcdc1>;
 	bus-width = <8>;
 	non-removable;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
index 4b8fe453bacd..73f14d7f915a 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
@@ -103,7 +103,7 @@
 
 &mmc2 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&mmc2_pins>;
+	pinctrl-0 = <&mmc2_pins>, <&mmc2_ds_pin>;
 	vmmc-supply = <&reg_dcdc1>;
 	vqmmc-supply = <&reg_eldo1>;
 	bus-width = <8>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index b73f9287c3f0..364b7a499f7c 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -413,7 +413,7 @@
 			};
 
 			mmc2_pins: mmc2-pins {
-				pins = "PC1", "PC5", "PC6", "PC8", "PC9",
+				pins = "PC5", "PC6", "PC8", "PC9",
 				       "PC10","PC11", "PC12", "PC13",
 				       "PC14", "PC15", "PC16";
 				function = "mmc2";
@@ -421,6 +421,13 @@
 				bias-pull-up;
 			};
 
+			mmc2_ds_pin: mmc2-ds-pin {
+				pins = "PC1";
+				function = "mmc2";
+				drive-strength = <30>;
+				bias-pull-up;
+			};
+
 			pwm_pin: pwm_pin {
 				pins = "PD22";
 				function = "pwm";
-- 
2.18.0
