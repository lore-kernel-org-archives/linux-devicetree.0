From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH resend 2/3] ARM: dts: sun5i: Add lradc node
Date: Tue, 23 Dec 2014 11:13:21 +0100
Message-ID: <1419329602-11552-3-git-send-email-hdegoede@redhat.com>
References: <1419329602-11552-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBS4A4WSAKGQERJPJ2KI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1419329602-11552-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts | 45 ++++++++++++++++++++++--
 arch/arm/boot/dts/sun5i-a10s.dtsi                |  7 ++++
 arch/arm/boot/dts/sun5i-a13-olinuxino.dts        | 45 ++++++++++++++++++++++--
 arch/arm/boot/dts/sun5i-a13.dtsi                 |  7 ++++
 4 files changed, 100 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts b/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts
index fe3c559..dac9d49 100644
--- a/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts
+++ b/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts
@@ -48,8 +48,9 @@
  */
 
 /dts-v1/;
-/include/ "sun5i-a10s.dtsi"
-/include/ "sunxi-common-regulators.dtsi"
+#include "sun5i-a10s.dtsi"
+#include "sunxi-common-regulators.dtsi"
+#include <dt-bindings/input/input.h>
 
 / {
 	model = "Olimex A10s-Olinuxino Micro";
@@ -134,6 +135,46 @@
 			};
 		};
 
+		lradc: lradc@01c22800 {
+			vref-supply = <&reg_vcc3v0>;
+			status = "okay";
+
+			button@191 {
+				label = "Volume Up";
+				linux,code = <KEY_VOLUMEUP>;
+				channel = <0>;
+				voltage = <191274>;
+			};
+
+			button@392 {
+				label = "Volume Down";
+				linux,code = <KEY_VOLUMEDOWN>;
+				channel = <0>;
+				voltage = <392644>;
+			};
+
+			button@601 {
+				label = "Menu";
+				linux,code = <KEY_MENU>;
+				channel = <0>;
+				voltage = <601151>;
+			};
+
+			button@795 {
+				label = "Enter";
+				linux,code = <KEY_ENTER>;
+				channel = <0>;
+				voltage = <795090>;
+			};
+
+			button@987 {
+				label = "Home";
+				linux,code = <KEY_HOMEPAGE>;
+				channel = <0>;
+				voltage = <987387>;
+			};
+		};
+
 		uart0: serial@01c28000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&uart0_pins_a>;
diff --git a/arch/arm/boot/dts/sun5i-a10s.dtsi b/arch/arm/boot/dts/sun5i-a10s.dtsi
index 1b76667..58a9666 100644
--- a/arch/arm/boot/dts/sun5i-a10s.dtsi
+++ b/arch/arm/boot/dts/sun5i-a10s.dtsi
@@ -526,6 +526,13 @@
 			reg = <0x01c20c90 0x10>;
 		};
 
+		lradc: lradc@01c22800 {
+			compatible = "allwinner,sun4i-a10-lradc-keys";
+			reg = <0x01c22800 0x100>;
+			interrupts = <31>;
+			status = "disabled";
+		};
+
 		sid: eeprom@01c23800 {
 			compatible = "allwinner,sun4i-a10-sid";
 			reg = <0x01c23800 0x10>;
diff --git a/arch/arm/boot/dts/sun5i-a13-olinuxino.dts b/arch/arm/boot/dts/sun5i-a13-olinuxino.dts
index e31d291..529ff27 100644
--- a/arch/arm/boot/dts/sun5i-a13-olinuxino.dts
+++ b/arch/arm/boot/dts/sun5i-a13-olinuxino.dts
@@ -48,8 +48,9 @@
  */
 
 /dts-v1/;
-/include/ "sun5i-a13.dtsi"
-/include/ "sunxi-common-regulators.dtsi"
+#include "sun5i-a13.dtsi"
+#include "sunxi-common-regulators.dtsi"
+#include <dt-bindings/input/input.h>
 
 / {
 	model = "Olimex A13-Olinuxino";
@@ -102,6 +103,46 @@
 			};
 		};
 
+		lradc: lradc@01c22800 {
+			vref-supply = <&reg_vcc3v0>;
+			status = "okay";
+
+			button@191 {
+				label = "Volume Up";
+				linux,code = <KEY_VOLUMEUP>;
+				channel = <0>;
+				voltage = <191274>;
+			};
+
+			button@392 {
+				label = "Volume Down";
+				linux,code = <KEY_VOLUMEDOWN>;
+				channel = <0>;
+				voltage = <392644>;
+			};
+
+			button@601 {
+				label = "Menu";
+				linux,code = <KEY_MENU>;
+				channel = <0>;
+				voltage = <601151>;
+			};
+
+			button@795 {
+				label = "Enter";
+				linux,code = <KEY_ENTER>;
+				channel = <0>;
+				voltage = <795090>;
+			};
+
+			button@987 {
+				label = "Home";
+				linux,code = <KEY_HOMEPAGE>;
+				channel = <0>;
+				voltage = <987387>;
+			};
+		};
+
 		uart1: serial@01c28400 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&uart1_pins_b>;
diff --git a/arch/arm/boot/dts/sun5i-a13.dtsi b/arch/arm/boot/dts/sun5i-a13.dtsi
index c35217e..061b2273 100644
--- a/arch/arm/boot/dts/sun5i-a13.dtsi
+++ b/arch/arm/boot/dts/sun5i-a13.dtsi
@@ -460,6 +460,13 @@
 			reg = <0x01c20c90 0x10>;
 		};
 
+		lradc: lradc@01c22800 {
+			compatible = "allwinner,sun4i-a10-lradc-keys";
+			reg = <0x01c22800 0x100>;
+			interrupts = <31>;
+			status = "disabled";
+		};
+
 		sid: eeprom@01c23800 {
 			compatible = "allwinner,sun4i-a10-sid";
 			reg = <0x01c23800 0x10>;
-- 
2.1.0
