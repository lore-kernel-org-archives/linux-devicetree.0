From: "Frank Wunderlich" <FrankWu@gmx.de>
Subject: Fw: fix green/blue pio-led on bpi-r2
Date: Fri, 25 May 2018 17:51:23 +0200
Message-ID: <trinity-b1da805c-c37c-4bf8-9384-b923a3919016-1527263483541@3c-app-gmx-bs69>
References: <trinity-63c216a4-492c-4250-934a-37dc10d0cb56-1527263229587@3c-app-gmx-bs69>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Resend to Mailinglist because of previous blocked  cause of html-format

Gesendet: Freitag, 25. Mai 2018 um 17:47 Uhr
Von: "Frank Wunderlich" <FrankWu@gmx.de>
An: "Matthias Brugger" <matthias.bgg@gmail.com>, "Rob Herring" <robh+dt@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>, "Russell King" <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Betreff: fix green/blue pio-led on bpi-r2

Hi,
 
i've tested LEDs on bananapi-r2 and see that they stay on at boot-time and can be switched off by "echo 0", as this behaviour is not logical i changed that. Also green and blue are swapped by access their names in sysfs.
 
http://forum.banana-pi.org/t/control-on-board-leds/4287/33
 
hoping everything is alright with the patch (it's my first on here)
 
to test it:
 
[16:08] root@bpi-r2:~# L=/sys/class/leds/bpi-r2\:isink
[17:41] root@bpi-r2:~# L2=/sys/class/leds/bpi-r2\:pio
[17:42] root@bpi-r2:~# echo 1 > $L2:green/brightness
[17:42] root@bpi-r2:~# echo 1 > $L2:blue/brightness
[17:42] root@bpi-r2:~# echo 0 > $L2:green/brightness
[17:42] root@bpi-r2:~# echo 0 > $L2:blue/brightness
 
at least options needed:
CONFIG_SYSFS=y
CONFIG_GPIO_SYSFS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_MT6323=y
CONFIG_LEDS_GPIO=y
 
regards Frank
 
>From 850977bdb8cf05b1212c69232f03fd55293fe21a Mon Sep 17 00:00:00 2001
From: Frank Wunderlich <frank-w@public-files.de>
Date: Mon, 21 May 2018 21:38:53 +0200
Subject: [PATCH] [DTS] fix green/blue pio-led on bpi-r2
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
index 024bdb7d6cca5..6fa37a2764110 100644
--- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
@@ -80,21 +80,21 @@
         pinctrl-names = "default";
         pinctrl-0 = <&led_pins_a>;
 
-        blue {
-            label = "bpi-r2:pio:blue";
-            gpios = <&pio 241 GPIO_ACTIVE_HIGH>;
+        green {
+            label = "bpi-r2:pio:green";
+            gpios = <&pio 241 GPIO_ACTIVE_LOW>;
             default-state = "off";
         };
 
-        green {
-            label = "bpi-r2:pio:green";
-            gpios = <&pio 240 GPIO_ACTIVE_HIGH>;
+        blue {
+            label = "bpi-r2:pio:blue";
+            gpios = <&pio 240 GPIO_ACTIVE_LOW>;
             default-state = "off";
         };
 
         red {
             label = "bpi-r2:pio:red";
-            gpios = <&pio 239 GPIO_ACTIVE_HIGH>;
+            gpios = <&pio 239 GPIO_ACTIVE_LOW>;
             default-state = "off";
         };
     };
