From: Adam Sampson <ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>
Subject: [PATCH] ARM: dts: sun7i: Enable USB DRC on pcDuino v3 Nano
Date: Sat, 17 Oct 2015 23:08:29 +0100
Message-ID: <1445119709-1689-1-git-send-email-ats@offog.org>
Reply-To: ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCQPXGGUXQGBBZMNROYQKGQEIFLJQEI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Adam Sampson <ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The OTG arrangement on the LinkSprite pcDuino v3 Nano is the same as the
pcDuino 1/2/3: the OTG port's 5V line is connected directly to the 5V
bus (it's not switchable), and the OTG port's ID pin is connected to PH4
on the A20.

Tested successfully in both host and device modes.

Signed-off-by: Adam Sampson <ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>
---
 arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts b/arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts
index beac431..1757a6a 100644
--- a/arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts
+++ b/arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts
@@ -142,6 +142,10 @@
 	status = "okay";
 };
 
+&otg_sram {
+	status = "okay";
+};
+
 &pio {
 	ahci_pwr_pin_pcduino3_nano: ahci_pwr_pin@0 {
 		allwinner,pins = "PH2";
@@ -157,6 +161,13 @@
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
+	usb0_id_detect_pin: usb0_id_detect_pin@0 {
+		allwinner,pins = "PH4";
+		allwinner,function = "gpio_in";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	};
+
 	usb1_vbus_pin_pcduino3_nano: usb1_vbus_pin@0 {
 		allwinner,pins = "PD2";
 		allwinner,function = "gpio_out";
@@ -211,7 +222,15 @@
 	status = "okay";
 };
 
+&usb_otg {
+	dr_mode = "otg";
+	status = "okay";
+};
+
 &usbphy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb0_id_detect_pin>;
+	usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
 	usb1_vbus-supply = <&reg_usb1_vbus>;
 	usb2_vbus-supply = <&reg_usb1_vbus>;
 	status = "okay";
-- 
2.1.4
