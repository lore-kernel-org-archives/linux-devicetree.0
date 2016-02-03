From: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Subject: [PATCH 2/2] ARM: bcm2835: dt: Add the ethernet to the device tree
Date: Wed,  3 Feb 2016 16:02:39 +0100
Message-ID: <1454511759-24827-3-git-send-email-lkundrak@v3.sk>
References: <1454511759-24827-1-git-send-email-lkundrak@v3.sk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454511759-24827-1-git-send-email-lkundrak-NGH9Lh4a5iE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The hub and the ethernet in its port 1 are hardwired on the board.

Compared to the adapters that can be plugged into the USB ports, this
one has no serial EEPROM to store its MAC. Nevertheless, the Raspberry Pi
has the MAC address for this adapter in its ROM, accessible from its
firmware.

U-Boot can read out the address and set the local-mac-address property of the
node with "ethernet" alias. Let's add the node so that U-Boot can do its
business.

Signed-off-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
---
 arch/arm/boot/dts/bcm2835-rpi-b-plus.dts | 18 ++++++++++++++++++
 arch/arm/boot/dts/bcm283x.dtsi           |  4 +++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
index ef54050..32bbd2a 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
@@ -6,6 +6,10 @@
 	compatible = "raspberrypi,model-b-plus", "brcm,bcm2835";
 	model = "Raspberry Pi Model B+";
 
+	aliases {
+		ethernet = &ethernet;
+	}
+
 	leds {
 		act {
 			gpios = <&gpio 47 0>;
@@ -29,3 +33,17 @@
 		brcm,function = <BCM2835_FSEL_ALT0>;
 	};
 };
+
+&usb {
+	usb1@01 {
+		compatible = "usb1d6b,0002";
+		reg = <01>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethernet: usbether@01 {
+			compatible = "usb0424,9514";
+			reg = <01>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
index 971e741..bc5fde1 100644
--- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -187,10 +187,12 @@
 			status = "disabled";
 		};
 
-		usb@7e980000 {
+		usb: usb@7e980000 {
 			compatible = "brcm,bcm2835-usb";
 			reg = <0x7e980000 0x10000>;
 			interrupts = <1 9>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 	};
 
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
