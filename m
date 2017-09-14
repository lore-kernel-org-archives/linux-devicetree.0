From: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: dts: bcm283x: Fix console path on RPi3
Date: Thu, 14 Sep 2017 22:48:00 +0200
Message-ID: <1505422080-14336-1-git-send-email-loic.poulain@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org, Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Contrary to other RPi devices, RPi3 uses uart0 to communicate with
the BCM43438 bluetooth controller. uart1 is then used for the console.
Today, the console configuration is inherited from the bcm283x dtsi
(bootargs) which is not the correct one for the RPi3. This leads to
routing issue and confuses the Bluetooth controller with unexpected
data.

This patch introduces chosen/stdout path to configure console to uart0
on bcm283x family and overwrite it to uart1 in the RPi3 dts.

Create serial0/1 aliases referring to uart0 ant uart1 paths.
Remove unneeded earlyprintk.

Fixes: 4188ea2aeb6d ("ARM: bcm283x: Define UART pinmuxing on board level")
Signed-off-by: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/bcm2837-rpi-3-b.dts | 5 +++++
 arch/arm/boot/dts/bcm283x.dtsi        | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
index 20725ca..f1c0811 100644
--- a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
+++ b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
@@ -8,6 +8,11 @@
 	compatible = "raspberrypi,3-model-b", "brcm,bcm2837";
 	model = "Raspberry Pi 3 Model B";
 
+	chosen {
+		/* 8250 auxiliar UART instead of pl011 */
+		stdout-path = "serial1:115200n8";
+	};
+
 	memory {
 		reg = <0 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
index 431dcfc..013431e 100644
--- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -20,8 +20,13 @@
 	#address-cells = <1>;
 	#size-cells = <1>;
 
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+	};
+
 	chosen {
-		bootargs = "earlyprintk console=ttyAMA0";
+		stdout-path = "serial0:115200n8";
 	};
 
 	thermal-zones {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
