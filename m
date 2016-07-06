From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 5/9] ARM: dts: sun7i: bananapi-m1-plus: Reindent
 whole file using tabs
Date: Wed,  6 Jul 2016 17:10:46 +0800
Message-ID: <1467796250-22010-6-git-send-email-wens@csie.org>
References: <1467796250-22010-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBJEW6O5QKGQEOGXOK7A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

The bananapi-m1-plus dts file was indented using 4 spaces, without
tabs. This does not match the code style.

Reindent the whole file before we do anything else.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts | 272 +++++++++++------------
 1 file changed, 136 insertions(+), 136 deletions(-)

diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts b/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
index 89e38e9e0be6..edfb5b37939e 100644
--- a/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
+++ b/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
@@ -49,182 +49,182 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
 / {
-    model = "Banana Pi BPI-M1-Plus";
-    compatible = "sinovoip,bpi-m1-plus", "allwinner,sun7i-a20";
-
-    aliases {
-        serial0 = &uart0;
-    };
-
-    chosen {
-        stdout-path = "serial0:115200n8";
-    };
-
-    leds {
-        compatible = "gpio-leds";
-        pinctrl-names = "default";
-        pinctrl-0 = <&led_pins_bananapi>;
-
-        green {
-            label = "bananapi-m1-plus:green:usr";
-            gpios = <&pio 7 24 GPIO_ACTIVE_HIGH>;
-        };
-
-        red {
-            label = "bananapi-m1-plus:red:usr";
-            gpios = <&pio 7 25 GPIO_ACTIVE_HIGH>;
-            linux,default-trigger = "default-on";
-        };
-
-    };
-
-    mmc3_pwrseq: mmc3_pwrseq {
-        compatible = "mmc-pwrseq-simple";
-        pinctrl-names = "default";
-        pinctrl-0 = <&mmc3_pwrseq_pin_bananapim1plus>;
-        reset-gpios = <&pio 7 22 GPIO_ACTIVE_LOW>; /* PH22 WL-PMU-EN */
-    };
-
-    reg_gmac_3v3: gmac-3v3 {
-        compatible = "regulator-fixed";
-        pinctrl-names = "default";
-        pinctrl-0 = <&gmac_power_pin_bananapi>;
-        regulator-name = "gmac-3v3";
-        regulator-min-microvolt = <3300000>;
-        regulator-max-microvolt = <3300000>;
-        startup-delay-us = <100000>;
-        enable-active-high;
-        gpio = <&pio 7 23 GPIO_ACTIVE_HIGH>;
-    };
+	model = "Banana Pi BPI-M1-Plus";
+	compatible = "sinovoip,bpi-m1-plus", "allwinner,sun7i-a20";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pins_bananapi>;
+
+		green {
+			label = "bananapi-m1-plus:green:usr";
+			gpios = <&pio 7 24 GPIO_ACTIVE_HIGH>;
+		};
+
+		red {
+			label = "bananapi-m1-plus:red:usr";
+			gpios = <&pio 7 25 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "default-on";
+		};
+
+	};
+
+	mmc3_pwrseq: mmc3_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		pinctrl-names = "default";
+		pinctrl-0 = <&mmc3_pwrseq_pin_bananapim1plus>;
+		reset-gpios = <&pio 7 22 GPIO_ACTIVE_LOW>; /* PH22 WL-PMU-EN */
+	};
+
+	reg_gmac_3v3: gmac-3v3 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&gmac_power_pin_bananapi>;
+		regulator-name = "gmac-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <100000>;
+		enable-active-high;
+		gpio = <&pio 7 23 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &ahci {
-    status = "okay";
+	status = "okay";
 };
 
 &codec {
-    status = "okay";
+	status = "okay";
 };
 
 &ehci0 {
-    status = "okay";
+	status = "okay";
 };
 
 &ehci1 {
-    status = "okay";
+	status = "okay";
 };
 
 &gmac {
-    pinctrl-names = "default";
-    pinctrl-0 = <&gmac_pins_rgmii_a>;
-    phy = <&phy1>;
-    phy-mode = "rgmii";
-    phy-supply = <&reg_gmac_3v3>;
-    status = "okay";
-
-    phy1: ethernet-phy@1 {
-        reg = <1>;
-    };
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac_pins_rgmii_a>;
+	phy = <&phy1>;
+	phy-mode = "rgmii";
+	phy-supply = <&reg_gmac_3v3>;
+	status = "okay";
+
+	phy1: ethernet-phy@1 {
+		reg = <1>;
+	};
 };
 
 &i2c0 {
-    pinctrl-names = "default";
-    pinctrl-0 = <&i2c0_pins_a>;
-    status = "okay";
-
-    axp209: pmic@34 {
-        compatible = "x-powers,axp209";
-        reg = <0x34>;
-        interrupt-parent = <&nmi_intc>;
-        interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
-
-        interrupt-controller;
-        #interrupt-cells = <1>;
-    };
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins_a>;
+	status = "okay";
+
+	axp209: pmic@34 {
+		compatible = "x-powers,axp209";
+		reg = <0x34>;
+		interrupt-parent = <&nmi_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+
+		interrupt-controller;
+		#interrupt-cells = <1>;
+	};
 };
 
 &ir0 {
-    pinctrl-names = "default";
-    pinctrl-0 = <&ir0_rx_pins_a>;
-    status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&ir0_rx_pins_a>;
+	status = "okay";
 };
 
 &mmc0 {
-    pinctrl-names = "default";
-    pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin_bananapi>;
-    vmmc-supply = <&reg_vcc3v3>;
-    bus-width = <4>;
-    cd-gpios = <&pio 7 10 GPIO_ACTIVE_HIGH>; /* PH10 */
-    cd-inverted;
-    status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin_bananapi>;
+	vmmc-supply = <&reg_vcc3v3>;
+	bus-width = <4>;
+	cd-gpios = <&pio 7 10 GPIO_ACTIVE_HIGH>; /* PH10 */
+	cd-inverted;
+	status = "okay";
 };
 
 &mmc3 {
-    #address-cells = <1>;
-    #size-cells = <0>;
-    pinctrl-names = "default";
-    pinctrl-0 = <&mmc3_pins_a>;
-    vmmc-supply = <&reg_vcc3v3>;
-    mmc-pwrseq = <&mmc3_pwrseq>;
-    bus-width = <4>;
-    non-removable;
-    enable-sdio-wakeup;
-    status = "okay";
-
-    brcmf: bcrmf@1 {
-        reg = <1>;
-        compatible = "brcm,bcm4329-fmac";
-        interrupt-parent = <&pio>;
-        interrupts = <7 15 IRQ_TYPE_LEVEL_LOW>;
-        interrupt-names = "host-wake";
-    };
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc3_pins_a>;
+	vmmc-supply = <&reg_vcc3v3>;
+	mmc-pwrseq = <&mmc3_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	enable-sdio-wakeup;
+	status = "okay";
+
+	brcmf: bcrmf@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+		interrupt-parent = <&pio>;
+		interrupts = <7 15 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "host-wake";
+	};
 };
 
 &mmc3_pins_a {
-    /* AP6210 requires pull-up */
-    allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	/* AP6210 requires pull-up */
+	allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 };
 
 &ohci0 {
-    status = "okay";
+	status = "okay";
 };
 
 &ohci1 {
-    status = "okay";
+	status = "okay";
 };
 
 &pio {
-    gmac_power_pin_bananapi: gmac_power_pin@0 {
-        allwinner,pins = "PH23";
-        allwinner,function = "gpio_out";
-        allwinner,drive = <SUN4I_PINCTRL_10_MA>;
-        allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
-    };
-
-    led_pins_bananapi: led_pins@0 {
-        allwinner,pins = "PH24", "PG2";
-        allwinner,function = "gpio_out";
-        allwinner,drive = <SUN4I_PINCTRL_10_MA>;
-        allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
-    };
-
-    mmc0_cd_pin_bananapi: mmc0_cd_pin@0 {
-        allwinner,pins = "PH10";
-        allwinner,function = "gpio_in";
-        allwinner,drive = <SUN4I_PINCTRL_10_MA>;
-        allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
-    };
-
-    mmc3_pwrseq_pin_bananapim1plus: mmc3_pwrseq_pin@0 {
-        allwinner,pins = "PH22";
-        allwinner,function = "gpio_out";
-        allwinner,drive = <SUN4I_PINCTRL_10_MA>;
-        allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
-    };
+	gmac_power_pin_bananapi: gmac_power_pin@0 {
+		allwinner,pins = "PH23";
+		allwinner,function = "gpio_out";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
+	};
+
+	led_pins_bananapi: led_pins@0 {
+		allwinner,pins = "PH24", "PG2";
+		allwinner,function = "gpio_out";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
+	};
+
+	mmc0_cd_pin_bananapi: mmc0_cd_pin@0 {
+		allwinner,pins = "PH10";
+		allwinner,function = "gpio_in";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	};
+
+	mmc3_pwrseq_pin_bananapim1plus: mmc3_pwrseq_pin@0 {
+		allwinner,pins = "PH22";
+		allwinner,function = "gpio_out";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
+	};
 };
 
 &uart0 {
-    pinctrl-names = "default";
-    pinctrl-0 = <&uart0_pins_a>;
-    status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins_a>;
+	status = "okay";
 };
-- 
2.8.1
