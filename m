From: Pablo Greco <pgreco-/kQrlZ55X3WoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
Subject: [PATCH v3 7/7] ARM: dts: sun8i: v40: bananapi-m2-berry:
 Add Bluetooth device node
Date: Wed, 17 Apr 2019 06:21:02 -0300
Message-ID: <1555492863-88860-8-git-send-email-pgreco@centosproject.org>
References: <1555492863-88860-1-git-send-email-pgreco@centosproject.org>
Reply-To: pgreco-/kQrlZ55X3WoClj4AeEUq9i2O/JbrIOy@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBC53DWXR44JBBLPA3PSQKGQE5D3TRLA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1555492863-88860-1-git-send-email-pgreco-/kQrlZ55X3WoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Pablo Greco <pgreco-/kQrlZ55X3WoClj4AeEUq9i2O/JbrIOy@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Since the bananapi-m2-ultra and the bananapi-m2-berry have the same
WiFi/Bluetooth, add the required nodes to the bananapi-m2-berry.

Signed-off-by: Pablo Greco <pgreco-/kQrlZ55X3WoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
index 6ada736..e88eb43 100644
--- a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
+++ b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
@@ -96,6 +96,8 @@
 	wifi_pwrseq: wifi_pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&pio 6 10 GPIO_ACTIVE_LOW>; /* PG10 WIFI_EN */
+		clocks = <&ccu CLK_OUTA>;
+		clock-names = "ext_clock";
 	};
 };
 
@@ -275,6 +277,25 @@
 	status = "okay";
 };
 
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart3_pg_pins>, <&uart3_rts_cts_pg_pins>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		clocks = <&ccu CLK_OUTA>;
+		clock-names = "lpo";
+		vbat-supply = <&reg_dldo2>;
+		vddio-supply = <&reg_dldo1>;
+		device-wakeup-gpios = <&pio 6 11 GPIO_ACTIVE_HIGH>; /* PG11 */
+		/* TODO host wake line connected to PMIC GPIO pins */
+		shutdown-gpios = <&pio 7 12 GPIO_ACTIVE_HIGH>; /* PH12 */
+		max-speed = <1500000>;
+	};
+};
+
 &usbphy {
 	usb1_vbus-supply = <&reg_vcc5v0>;
 	status = "okay";
-- 
1.8.3.1
