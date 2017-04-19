From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 4/4] ARM: sun8i: h3: bananapi-m2-plus: Enable
 USB OTG
Date: Wed, 19 Apr 2017 13:09:19 +0800
Message-ID: <20170419050919.6762-5-wens@csie.org>
References: <20170419050919.6762-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBA7C3PDQKGQECIF57HY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170419050919.6762-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Bananapi M2 Plus has a USB OTG port that can be used in both
powered host mode and peripheral mode. When in peripheral mode,
the port does not power the board. There is no VBUS sensing on
the port.

This patch adds the regulator controlling VBUS on the OTG port,
the GPIO for the ID detect pin, and enables the USB OTG and host
controllers.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts b/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
index 52acbe111cad..17c7c088cdea 100644
--- a/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
+++ b/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
@@ -92,6 +92,10 @@
 	};
 };
 
+&ehci0 {
+	status = "okay";
+};
+
 &ehci1 {
 	status = "okay";
 };
@@ -145,6 +149,10 @@
 	status = "okay";
 };
 
+&ohci0 {
+	status = "okay";
+};
+
 &ohci1 {
 	status = "okay";
 };
@@ -170,6 +178,11 @@
 	};
 };
 
+&reg_usb0_vbus {
+	gpio = <&pio 3 11 GPIO_ACTIVE_HIGH>; /* PD11 */
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins_a>;
@@ -182,7 +195,14 @@
 	status = "okay";
 };
 
+&usb_otg {
+	dr_mode = "otg";
+	status = "okay";
+};
+
 &usbphy {
-	/* USB VBUS is on as long as VCC-IO is on */
+	usb0_id_det-gpios = <&r_pio 0 6 GPIO_ACTIVE_HIGH>; /* PL6 */
+	usb0_vbus-supply = <&reg_usb0_vbus>;
+	/* USB host VBUS is on as long as VCC-IO is on */
 	status = "okay";
 };
-- 
2.11.0
