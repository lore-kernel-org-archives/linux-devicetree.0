From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: dts: sun5i: inet98v_rev2 fix regulator for
 the usb wifi module
Date: Thu, 27 Aug 2015 20:37:31 +0200
Message-ID: <1440700651-30575-2-git-send-email-hdegoede@redhat.com>
References: <1440700651-30575-1-git-send-email-hdegoede@redhat.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORB4NR7WXAKGQEXF3CCDA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1440700651-30575-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jelle van der Waa <jelle-oJJ1AqDjjO4@public.gmane.org>, Ralph Willekes <benadski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The usb-wifi module is not connected to a gpio controller regulator
(as is typical on sunxi boards), instead is it connected to ldo3.

This commit fixes the us_phy usb1_vbus-supply setting thereby making
sure that we power the usb-wifi and that it can be used.

This commit also removes the wrong and now unused bits which refer to
the gpio controlled reg_usb1_vbus.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun5i-a13-inet-98v-rev2.dts | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/sun5i-a13-inet-98v-rev2.dts b/arch/arm/boot/dts/sun5i-a13-inet-98v-rev2.dts
index 6d466a2..6fa54b6 100644
--- a/arch/arm/boot/dts/sun5i-a13-inet-98v-rev2.dts
+++ b/arch/arm/boot/dts/sun5i-a13-inet-98v-rev2.dts
@@ -201,11 +201,6 @@
 	status = "okay";
 };
 
-&reg_usb1_vbus {
-	gpio = <&pio 6 11 GPIO_ACTIVE_HIGH>; /* PG11 */
-	status = "okay";
-};
-
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart1_pins_b>;
@@ -221,16 +216,12 @@
 	allwinner,pins = "PG12";
 };
 
-&usb1_vbus_pin_a {
-	allwinner,pins = "PG11";
-};
-
 &usbphy {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usb0_id_detect_pin>, <&usb0_vbus_detect_pin>;
 	usb0_id_det-gpio = <&pio 6 2 GPIO_ACTIVE_HIGH>; /* PG2 */
 	usb0_vbus_det-gpio = <&pio 6 1 GPIO_ACTIVE_HIGH>; /* PG1 */
 	usb0_vbus-supply = <&reg_usb0_vbus>;
-	usb1_vbus-supply = <&reg_usb1_vbus>;
+	usb1_vbus-supply = <&reg_ldo3>;
 	status = "okay";
 };
-- 
2.4.3
