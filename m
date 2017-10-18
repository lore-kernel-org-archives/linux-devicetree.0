From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 7/8] ARM: dts: sun8i: a83t: cubietruck-plus:
 Enable AP6330 WiFi on mmc1
Date: Wed, 18 Oct 2017 16:31:37 +0800
Message-ID: <20171018083138.14517-8-wens@csie.org>
References: <20171018083138.14517-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBB4FCTTHQKGQESZZYHRQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171018083138.14517-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The WiFi side of the AP6330 WiFi/BT combo module is connected to
mmc1. There are also GPIOs for enable and interrupts. An external
clock from the AC100 RTC is also used.

Enable WiFi on this board by enabling mmc1 and adding the power
sequencing clocks and GPIO, as well as the chip's interrupt line.

For the WiFi module to correctly detect the frequency of its main
oscillator, the external low power clock must be set to 32768 Hz.

Their does not seem to be proper out-of-band interrupt support
for the BCM4330 chip within the AP6330 module. This part is left
out for now.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts b/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts
index bd53e5748991..7f0a3f6d0cf2 100644
--- a/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts
+++ b/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts
@@ -131,6 +131,17 @@
 		#sound-dai-cells = <0>;
 		compatible = "linux,spdif-dit";
 	};
+
+	wifi_pwrseq: wifi_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&ac100_rtc 1>;
+		clock-names = "ext_clock";
+		/* The WiFi low power clock must be 32768 Hz */
+		assigned-clocks = <&ac100_rtc 1>;
+		assigned-clock-rates = <32768>;
+		/* enables internal regulator and de-asserts reset */
+		reset-gpios = <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 WL-PMU-EN */
+	};
 };
 
 &ehci0 {
@@ -153,6 +164,15 @@
 	status = "okay";
 };
 
+&mmc1 {
+	vmmc-supply = <&reg_dcdc1>;
+	vqmmc-supply = <&reg_sw>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+};
+
 &mmc2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc2_8bit_emmc_pins>;
-- 
2.14.2
