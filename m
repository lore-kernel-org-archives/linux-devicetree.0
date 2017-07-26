From: Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 1/2] gpio: davinci: Add keystone-k2g compatible
Date: Wed, 26 Jul 2017 11:20:27 +0530
Message-ID: <1501048228-3492-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, t-kristo-l0cyMroinI0@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, fcooper-l0cyMroinI0@public.gmane.org, s-anna-l0cyMroinI0@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, j-keerthy-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

The patch adds keystone-k2g compatible, specific properties and
an example.

Signed-off-by: Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>
---
 .../devicetree/bindings/gpio/gpio-davinci.txt      | 39 +++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
index 5079ba7..9f4f612 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
@@ -1,7 +1,9 @@
 Davinci/Keystone GPIO controller bindings
 
 Required Properties:
-- compatible: should be "ti,dm6441-gpio", "ti,keystone-gpio"
+- compatible: should be "ti,dm6441-gpio",
+			 "ti,keystone-gpio",
+			 "ti,keystone-k2g-gpio"
 
 - reg: Physical base address of the controller and the size of memory mapped
        registers.
@@ -26,6 +28,17 @@ The GPIO controller also acts as an interrupt controller. It uses the default
 two cells specifier as described in Documentation/devicetree/bindings/
 interrupt-controller/interrupts.txt.
 
+Required Properties specific to keystone-k2g
+
+- clocks: Should contain devices input clock. The first parameter
+           is a handle to k2g_clks. The second parameter is the
+           device ID and the third parameter is the clock ID. One can
+           refer: http://processors.wiki.ti.com/index.php/TISCI#66AK2G02_Data
+
+           Example: <&k2g_clks 0x001c 0x0>;
+
+- clock-names: The driver expects the clock name to be "gpio";
+
 Example:
 
 gpio: gpio@1e26000 {
@@ -60,3 +73,27 @@ leds {
 		...
 	};
 };
+
+Example for keystone-k2g:
+
+gpio0: gpio@2603000 {
+	compatible = "ti,keystone-k2g-gpio", "ti,keystone-gpio";
+	reg = <0x02603000 0x100>;
+	gpio-controller;
+	#gpio-cells = <2>;
+	interrupts = <GIC_SPI 432 IRQ_TYPE_EDGE_RISING>,
+			<GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
+			<GIC_SPI 434 IRQ_TYPE_EDGE_RISING>,
+			<GIC_SPI 435 IRQ_TYPE_EDGE_RISING>,
+			<GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+			<GIC_SPI 437 IRQ_TYPE_EDGE_RISING>,
+			<GIC_SPI 438 IRQ_TYPE_EDGE_RISING>,
+			<GIC_SPI 439 IRQ_TYPE_EDGE_RISING>,
+			<GIC_SPI 440 IRQ_TYPE_EDGE_RISING>;
+	interrupt-controller;
+	#interrupt-cells = <2>;
+	ti,ngpio = <144>;
+	ti,davinci-gpio-unbanked = <0>;
+	clocks = <&k2g_clks 0x001b 0x0>;
+	clock-names = "gpio";
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
