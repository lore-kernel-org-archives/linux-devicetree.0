From: Quan Nguyen <qnguyen-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH v7 2/3] Documentation: gpio: Update description for X-Gene standby GPIO controller DTS binding
Date: Wed, 17 Feb 2016 20:15:08 +0700
Message-ID: <1455714909-3027-3-git-send-email-qnguyen@apm.com>
References: <1455714909-3027-1-git-send-email-qnguyen@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455714909-3027-1-git-send-email-qnguyen-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Y Vo <yvo-qTEPVZfXA3Y@public.gmane.org>, Phong Vo <pvo-qTEPVZfXA3Y@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>, Duc Dang <dhdang-qTEPVZfXA3Y@public.gmane.org>, Iyappan Subramanian <isubramanian-qTEPVZfXA3Y@public.gmane.org>, patches-qTEPVZfXA3Y@public.gmane.org, Quan Nguyen <qnguyen-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Update description for X-Gene standby GPIO controller DTS binding to
support GPIO line configuration as input, output or external IRQ pin.

Signed-off-by: Y Vo <yvo-qTEPVZfXA3Y@public.gmane.org>
Signed-off-by: Quan Nguyen <qnguyen-qTEPVZfXA3Y@public.gmane.org>
---
 .../devicetree/bindings/gpio/gpio-xgene-sb.txt     | 47 ++++++++++++++++++----
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-xgene-sb.txt b/Documentation/devicetree/bindings/gpio/gpio-xgene-sb.txt
index dae1300..5490c1d 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-xgene-sb.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-xgene-sb.txt
@@ -1,10 +1,20 @@
 APM X-Gene Standby GPIO controller bindings
 
-This is a gpio controller in the standby domain.
-
-There are 20 GPIO pins from 0..21. There is no GPIO_DS14 or GPIO_DS15,
-only GPIO_DS8..GPIO_DS13 support interrupts. The IRQ mapping
-is currently 1-to-1 on interrupts 0x28 thru 0x2d.
+This is a gpio controller in the standby domain. It also supports interrupt in
+some particular pins which are sourced to its parent interrupt controller
+as diagram below:
+                            +-----------------+
+                            | X-Gene standby  |
+                            | GPIO controller +------ GPIO_0
++------------+              |                 | ...
+| Parent IRQ | EXT_INT_0    |                 +------ GPIO_8/EXT_INT_0
+| controller | (SPI40)      |                 | ...
+| (GICv2)    +--------------+                 +------ GPIO_[N+8]/EXT_INT_N
+|            |   ...        |                 |
+|            | EXT_INT_N    |                 +------ GPIO_[N+9]
+|            | (SPI[40 + N])|                 | ...
+|            +--------------+                 +------ GPIO_MAX
++------------+              +-----------------+
 
 Required properties:
 - compatible: "apm,xgene-gpio-sb" for the X-Gene Standby GPIO controller
@@ -15,10 +25,18 @@ Required properties:
 		0 = active high
 		1 = active low
 - gpio-controller: Marks the device node as a GPIO controller.
-- interrupts: Shall contain exactly 6 interrupts.
+- interrupts: The EXT_INT_0 parent interrupt resource must be listed first.
+- interrupt-parent: Phandle of the parent interrupt controller.
+- interrupt-cells: Should be two.
+       - first cell is 0-N coresponding for EXT_INT_0 to EXT_INT_N.
+       - second cell is used to specify flags.
+- interrupt-controller: Marks the device node as an interrupt controller.
+- apm,nr-gpios: Optional, specify number of gpios pin.
+- apm,nr-irqs: Optional, specify number of interrupt pins.
+- apm,irq-start: Optional, specify lowest gpio pin support interrupt.
 
 Example:
-	sbgpio: sbgpio@17001000 {
+	sbgpio: gpio@17001000{
 		compatible = "apm,xgene-gpio-sb";
 		reg = <0x0 0x17001000 0x0 0x400>;
 		#gpio-cells = <2>;
@@ -29,4 +47,19 @@ Example:
 				<0x0 0x2b 0x1>,
 				<0x0 0x2c 0x1>,
 				<0x0 0x2d 0x1>;
+		interrupt-parent = <&gic>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		apm,nr-gpios = <22>;
+		apm,nr-irqs = <6>;
+		apm,irq-start = <8>;
+	};
+
+	testuser {
+		compatible = "example,testuser";
+		/* Use the GPIO_13/EXT_INT_5 line as an active high triggered
+		 * level interrupt
+		 */
+		interrupts = <5 4>;
+		interrupt-parent = <&sbgpio>;
 	};
-- 
1.7.12.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
