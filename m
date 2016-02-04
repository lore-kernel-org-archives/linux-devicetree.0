From: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Subject: [PATCH v2 1/2] ARM: bcm2835: dt: Add the ethernet to the device trees
Date: Thu,  4 Feb 2016 08:36:03 +0100
Message-ID: <1454571364-24708-2-git-send-email-lkundrak@v3.sk>
References: <1454571364-24708-1-git-send-email-lkundrak@v3.sk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454571364-24708-1-git-send-email-lkundrak-NGH9Lh4a5iE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Olivier Blin <dev-RZzICDNEOQ/YtjvyW6yDsg@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, popcornmix <popcornmix-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The hub and the ethernet in its port 1 are hardwired on the board.

Compared to the adapters that can be plugged into the USB ports, this
one has no serial EEPROM to store its MAC. Nevertheless, the Raspberry Pi
has the MAC address for this adapter in its ROM, accessible from its
firmware.

U-Boot can read out the address and set the local-mac-address property of the
node with "ethernet" alias. Let's add the node so that U-Boot can do its
business.

Model B rev2 and Model B+ entries were verified by me, the hierarchy and
pid/vid pair for the Version 2 was provided by Olivier Blin. Original
Model B is a blind short, though very likely correct.

Signed-off-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
---
Changes since v1:
  - s/@01/@1/ for ethernet and the hub
  - Corrected the vid/pid pairs for hub and ethernet
  - Added Model B rev2 and version 2 board changes
  - Fixed a missing semicolon typo

 arch/arm/boot/dts/bcm2835-rpi-b-plus.dts | 18 ++++++++++++++++++
 arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts | 18 ++++++++++++++++++
 arch/arm/boot/dts/bcm2835-rpi-b.dts      | 18 ++++++++++++++++++
 arch/arm/boot/dts/bcm2836-rpi-2-b.dts    | 18 ++++++++++++++++++
 arch/arm/boot/dts/bcm283x.dtsi           |  4 +++-
 5 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
index ef54050..983353f 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
@@ -6,6 +6,10 @@
 	compatible = "raspberrypi,model-b-plus", "brcm,bcm2835";
 	model = "Raspberry Pi Model B+";
 
+	aliases {
+		ethernet = &ethernet;
+	};
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
+	usb1@1 {
+		compatible = "usb0424,9514";
+		reg = <01>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethernet: usbether@1 {
+			compatible = "usb0424,ec00";
+			reg = <01>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts b/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts
index 86f1f2f..4b695a0 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts
@@ -6,6 +6,10 @@
 	compatible = "raspberrypi,model-b-rev2", "brcm,bcm2835";
 	model = "Raspberry Pi Model B rev2";
 
+	aliases {
+		ethernet = &ethernet;
+	};
+
 	leds {
 		act {
 			gpios = <&gpio 16 1>;
@@ -22,3 +26,17 @@
 		brcm,function = <BCM2835_FSEL_ALT2>;
 	};
 };
+
+&usb {
+	usb1@1 {
+		compatible = "usb0424,9512";
+		reg = <01>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethernet: usbether@1 {
+			compatible = "usb0424,ec00";
+			reg = <01>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/bcm2835-rpi-b.dts b/arch/arm/boot/dts/bcm2835-rpi-b.dts
index 4859e9d..749648e 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-b.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-b.dts
@@ -6,6 +6,10 @@
 	compatible = "raspberrypi,model-b", "brcm,bcm2835";
 	model = "Raspberry Pi Model B";
 
+	aliases {
+		ethernet = &ethernet;
+	};
+
 	leds {
 		act {
 			gpios = <&gpio 16 1>;
@@ -16,3 +20,17 @@
 &gpio {
 	pinctrl-0 = <&gpioout &alt0 &alt3>;
 };
+
+&usb {
+	usb1@1 {
+		compatible = "usb0424,9512";
+		reg = <01>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethernet: usbether@1 {
+			compatible = "usb0424,ec00";
+			reg = <01>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/bcm2836-rpi-2-b.dts b/arch/arm/boot/dts/bcm2836-rpi-2-b.dts
index ff94666..2bc1a96 100644
--- a/arch/arm/boot/dts/bcm2836-rpi-2-b.dts
+++ b/arch/arm/boot/dts/bcm2836-rpi-2-b.dts
@@ -10,6 +10,10 @@
 		reg = <0 0x40000000>;
 	};
 
+	aliases {
+		ethernet = &ethernet;
+	};
+
 	leds {
 		act {
 			gpios = <&gpio 47 0>;
@@ -33,3 +37,17 @@
 		brcm,function = <BCM2835_FSEL_ALT0>;
 	};
 };
+
+&usb {
+	usb1@1 {
+		compatible = "usb0424,9514";
+		reg = <01>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethernet: usbether@1 {
+			compatible = "usb0424,ec00";
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
