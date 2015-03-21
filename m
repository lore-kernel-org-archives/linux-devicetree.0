From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: dts: sun6i: csq cs908 dts cleanup
Date: Sat, 21 Mar 2015 14:23:01 +0100
Message-ID: <1426944181-30588-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBOXBWWUAKGQE74WHYAA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Remove the unused usb1_vbus_pin_csq908 node (vbus is always on on the cs908),
and sort the remaining nodes alphabetically.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun6i-a31s-cs908.dts | 37 +++++++++++++---------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/arch/arm/boot/dts/sun6i-a31s-cs908.dts b/arch/arm/boot/dts/sun6i-a31s-cs908.dts
index bc3734f..3f0cc8c 100644
--- a/arch/arm/boot/dts/sun6i-a31s-cs908.dts
+++ b/arch/arm/boot/dts/sun6i-a31s-cs908.dts
@@ -55,10 +55,6 @@
 	compatible = "csq,cs908", "allwinner,sun6i-a31s";
 };
 
-&usbphy {
-	status = "okay";
-};
-
 &ehci0 {
 	status = "okay";
 };
@@ -67,25 +63,6 @@
 	status = "okay";
 };
 
-&ohci1 {
-	status = "okay";
-};
-
-&pio {
-	usb1_vbus_pin_csq908: usb1_vbus_pin@0 {
-		allwinner,pins = "PC27";
-		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
-		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
-	};
-};
-
-&uart0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart0_pins_a>;
-	status = "okay";
-};
-
 &gmac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&gmac_pins_mii_a>;
@@ -102,3 +79,17 @@
 	pinctrl-0 = <&ir_pins_a>;
 	status = "okay";
 };
+
+&ohci1 {
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins_a>;
+	status = "okay";
+};
+
+&usbphy {
+	status = "okay";
+};
-- 
2.3.3
