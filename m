From: Jelle van der Waa <jelle-oJJ1AqDjjO4@public.gmane.org>
Subject: [PATCH] ARM: dts: sun8i: NanoPi NEO Air add WiFi / eMMC
Date: Sun, 19 Feb 2017 15:38:48 +0100
Message-ID: <20170219143848.25911-1-jelle@vdwaa.nl>
Reply-To: jelle-oJJ1AqDjjO4@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDYIFONAQMORB763U3CQKGQENMC37PY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jelle van der Waa <jelle-oJJ1AqDjjO4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Enable the WiFi (AP6212) chip and eMMC support for the NanoPi NEO Air.

Signed-off-by: Jelle van der Waa <jelle-oJJ1AqDjjO4@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-h3-nanopi-neo-air.dts | 45 +++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-neo-air.dts b/arch/arm/boot/dts/sun8i-h3-nanopi-neo-air.dts
index 3ba081c1f555..3813156f5d35 100644
--- a/arch/arm/boot/dts/sun8i-h3-nanopi-neo-air.dts
+++ b/arch/arm/boot/dts/sun8i-h3-nanopi-neo-air.dts
@@ -73,6 +73,13 @@
 			gpios = <&pio 0 10 GPIO_ACTIVE_HIGH>; /* PA10 */
 		};
 	};
+
+	wifi_pwrseq: wifi_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_en_nanopi_neo_air>;
+		reset-gpios = <&r_pio 0 7 GPIO_ACTIVE_LOW>; /* PL7 */
+	};
 };
 
 &mmc0 {
@@ -85,6 +92,44 @@
 	status = "okay";
 };
 
+&mmc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins_a>;
+	vmmc-supply = <&reg_vcc3v3>;
+	vqmmc-supply = <&reg_vcc3v3>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+
+	brcmf: bcrmf@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+		interrupt-parent = <&pio>;
+		interrupts = <6 10 IRQ_TYPE_LEVEL_LOW>; /* PG10 / EINT10 */
+		interrupt-names = "host-wake";
+	};
+};
+
+&mmc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc2_8bit_pins>;
+	vmmc-supply = <&reg_vcc3v3>;
+	vqmmc-supply = <&reg_vcc3v3>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
+&r_pio {
+	wifi_en_nanopi_neo_air: wifi_en_pin {
+		allwinner,pins = "PL7";
+		allwinner,function = "gpio_out";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins_a>;
-- 
2.11.1
