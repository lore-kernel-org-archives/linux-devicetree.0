From: Siarhei Siamashka <siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/3] ARM: dts: sun4i: Allow to use the PH6 pin
 for GPIO on pcDuino1/2
Date: Sun,  4 Oct 2015 21:58:46 +0300
Message-ID: <1443985128-23137-2-git-send-email-siarhei.siamashka@gmail.com>
References: <1443985128-23137-1-git-send-email-siarhei.siamashka@gmail.com>
Reply-To: siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCH4DA7NUEBBB37NYWYAKGQE7YMUP5A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1443985128-23137-1-git-send-email-siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
resistor. So that the USB power is still enabled by default even
if nobody bothers to configure the PD2 pin or runs the pcDuino1
firmware.

The current dts file unnecessarily meddles with the PH3 and PH6
pins. But the PH6 pin is available on the J11 expansion header
and may have a better use for other purposes. This patch fixes
the problem and now the PH6 pin can be used with the GPIO sysfs
interface. Tested on a pcDuino2 board and confirmed the voltage
on the PH6 pin with a multimeter:

    echo 230 > /sys/class/gpio/export
    echo "out" > /sys/class/gpio/gpio230/direction
    echo 0 > /sys/class/gpio/gpio230/value
    echo 1 > /sys/class/gpio/gpio230/value

USB still works as expected too.

Signed-off-by: Siarhei Siamashka <siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/sun4i-a10-pcduino.dts | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm/boot/dts/sun4i-a10-pcduino.dts b/arch/arm/boot/dts/sun4i-a10-pcduino.dts
index 4e3e1b9..fdc074c 100644
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
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins_a>;
@@ -195,7 +187,5 @@
 };
 
 &usbphy {
-	usb1_vbus-supply = <&reg_usb1_vbus>;
-	usb2_vbus-supply = <&reg_usb2_vbus>;
 	status = "okay";
 };
-- 
2.4.9
