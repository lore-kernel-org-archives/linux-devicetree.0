From: Siarhei Siamashka <siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 1/3] ARM: dts: sun4i: Allow to use the PH6
 pin for GPIO on pcDuino1/2
Date: Fri,  9 Oct 2015 14:09:37 +0300
Message-ID: <1444388979-12072-2-git-send-email-siarhei.siamashka@gmail.com>
References: <1444388979-12072-1-git-send-email-siarhei.siamashka@gmail.com>
Reply-To: siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCH4DA7NUEBBB6WA32YAKGQEQUPEBCQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1444388979-12072-1-git-send-email-siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Zoltan HERPAI <wigyori-1V5s5g7wVVk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The pcDuino1 board does not use any power switches at all for its
two USB host ports and the VBUS pins are always connected to 5V.

The pcDuino2 board uses the RT9701GB power switch for its single
USB host port, but the USB_EN pin (PD2) is pulled up with a 10K
resistor. So that the USB power is still enabled by default,
resulting in the same behaviour as pcDuino1 if nobody touches
the PD2 pin. This minor difference is going to be handled in a
follow-up patch, introducing a separate dts file for pcDuino2.

The primary reason for this fix is that the current dts file
unnecessarily meddles with the PH3 and PH6 pins. But the PH6 pin
is available on the Arduino-compatible expansion header and may
have a better use for other purposes. This patch fixes the
problem and now the PH6 pin can be used with the GPIO sysfs
interface. Tested on a pcDuino2 board with a multimeter:

    echo 230 > /sys/class/gpio/export
    echo "out" > /sys/class/gpio/gpio230/direction
    echo 0 > /sys/class/gpio/gpio230/value
    echo 1 > /sys/class/gpio/gpio230/value

USB still works as expected too.

Signed-off-by: Siarhei Siamashka <siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/sun4i-a10-pcduino.dts | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/sun4i-a10-pcduino.dts b/arch/arm/boot/dts/sun4i-a10-pcduino.dts
index c882421..0b45d27 100644
--- a/arch/arm/boot/dts/sun4i-a10-pcduino.dts
+++ b/arch/arm/boot/dts/sun4i-a10-pcduino.dts
@@ -180,14 +180,6 @@
 	};
 };
 
-&reg_usb1_vbus {
-	status = "okay";
-};
-
-&reg_usb2_vbus {
-	status = "okay";
-};
-
 #include "axp209.dtsi"
 
 &reg_dcdc2 {
@@ -222,7 +214,7 @@
 };
 
 &usbphy {
-	usb1_vbus-supply = <&reg_usb1_vbus>;
-	usb2_vbus-supply = <&reg_usb2_vbus>;
+	usb1_vbus-supply = <&reg_vcc5v0>; /* USB1 VBUS is always on */
+	usb2_vbus-supply = <&reg_vcc5v0>; /* USB2 VBUS is always on */
 	status = "okay";
 };
-- 
2.4.9
