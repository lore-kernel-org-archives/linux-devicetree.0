From: Jamie Lentin <jm@lentin.co.uk>
Subject: [PATCH 2/4] kirkwood: Replace DNS-320/DNS-325 leds with dt bindings
Date: Thu, 19 Jul 2012 21:30:58 +0100
Message-ID: <1342729860-14647-3-git-send-email-jm@lentin.co.uk>
References: <y>
 <1342729860-14647-1-git-send-email-jm@lentin.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1342729860-14647-1-git-send-email-jm@lentin.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>, Jason <jason@lakedaemon.net>
Cc: devicetree-discuss@lists.ozlabs.org, Jamie Lentin <jm@lentin.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Replace code in board-dnskw with the equivalent devicetree bindings.

Signed-off-by: Jamie Lentin <jm@lentin.co.uk>
---
 arch/arm/boot/dts/kirkwood-dns320.dts |   25 +++++++++
 arch/arm/boot/dts/kirkwood-dns325.dts |   25 +++++++++
 arch/arm/mach-kirkwood/board-dnskw.c  |   90 ---------------------------------
 3 files changed, 50 insertions(+), 90 deletions(-)

diff --git a/arch/arm/boot/dts/kirkwood-dns320.dts b/arch/arm/boot/dts/kirkwood-dns320.dts
index f2a9808..a81c3a9 100644
--- a/arch/arm/boot/dts/kirkwood-dns320.dts
+++ b/arch/arm/boot/dts/kirkwood-dns320.dts
@@ -15,6 +15,31 @@
 		bootargs = "console=ttyS0,115200n8 earlyprintk";
 	};
 
+	gpio-leds {
+		compatible = "gpio-leds";
+		blue-power {
+			label = "dns320:blue:power";
+			gpios = <&gpio0 26 1>; /* GPIO 26 Active Low */
+			linux,default-trigger = "default-on";
+		};
+		blue-usb {
+			label = "dns320:blue:usb";
+			gpios = <&gpio1 11 1>; /* GPIO 43 Active Low */
+		};
+		orange-l_hdd {
+			label = "dns320:orange:l_hdd";
+			gpios = <&gpio0 28 1>; /* GPIO 28 Active Low */
+		};
+		orange-r_hdd {
+			label = "dns320:orange:r_hdd";
+			gpios = <&gpio0 27 1>; /* GPIO 27 Active Low */
+		};
+		orange-usb {
+			label = "dns320:orange:usb";
+			gpios = <&gpio1 3 1>; /* GPIO 35 Active Low */
+		};
+	};
+
 	ocp@f1000000 {
 		serial@12000 {
 			clock-frequency = <166666667>;
diff --git a/arch/arm/boot/dts/kirkwood-dns325.dts b/arch/arm/boot/dts/kirkwood-dns325.dts
index e040d6c..421dcab 100644
--- a/arch/arm/boot/dts/kirkwood-dns325.dts
+++ b/arch/arm/boot/dts/kirkwood-dns325.dts
@@ -15,6 +15,31 @@
 		bootargs = "console=ttyS0,115200n8 earlyprintk";
 	};
 
+	gpio-leds {
+		compatible = "gpio-leds";
+		white-power {
+			label = "dns325:white:power";
+			gpios = <&gpio0 26 1>; /* GPIO 26 Active Low */
+			linux,default-trigger = "default-on";
+		};
+		white-usb {
+			label = "dns325:white:usb";
+			gpios = <&gpio1 11 1>; /* GPIO 43 Active Low */
+		};
+		red-l_hdd {
+			label = "dns325:red:l_hdd";
+			gpios = <&gpio0 28 1>; /* GPIO 28 Active Low */
+		};
+		red-r_hdd {
+			label = "dns325:red:r_hdd";
+			gpios = <&gpio0 27 1>; /* GPIO 27 Active Low */
+		};
+		red-usb {
+			label = "dns325:red:usb";
+			gpios = <&gpio0 29 1>; /* GPIO 29 Active Low */
+		};
+	};
+
 	ocp@f1000000 {
 		i2c@11000 {
 			status = "okay";
diff --git a/arch/arm/mach-kirkwood/board-dnskw.c b/arch/arm/mach-kirkwood/board-dnskw.c
index 1c97efa..aac9c90 100644
--- a/arch/arm/mach-kirkwood/board-dnskw.c
+++ b/arch/arm/mach-kirkwood/board-dnskw.c
@@ -68,90 +68,6 @@ static unsigned int dnskw_mpp_config[] __initdata = {
 	0
 };
 
-static struct gpio_led dns325_led_pins[] = {
-	{
-		.name	= "dns325:white:power",
-		.gpio	= 26,
-		.active_low = 1,
-		.default_trigger = "default-on",
-	},
-	{
-		.name	= "dns325:white:usb",
-		.gpio	= 43,
-		.active_low = 1,
-	},
-	{
-		.name	= "dns325:red:l_hdd",
-		.gpio	= 28,
-		.active_low = 1,
-	},
-	{
-		.name	= "dns325:red:r_hdd",
-		.gpio	= 27,
-		.active_low = 1,
-	},
-	{
-		.name	= "dns325:red:usb",
-		.gpio	= 29,
-		.active_low = 1,
-	},
-};
-
-static struct gpio_led_platform_data dns325_led_data = {
-	.num_leds	= ARRAY_SIZE(dns325_led_pins),
-	.leds		= dns325_led_pins,
-};
-
-static struct platform_device dns325_led_device = {
-	.name		= "leds-gpio",
-	.id		= -1,
-	.dev		= {
-		.platform_data	= &dns325_led_data,
-	},
-};
-
-static struct gpio_led dns320_led_pins[] = {
-	{
-		.name	= "dns320:blue:power",
-		.gpio	= 26,
-		.active_low = 1,
-		.default_trigger = "default-on",
-	},
-	{
-		.name	= "dns320:blue:usb",
-		.gpio	= 43,
-		.active_low = 1,
-	},
-	{
-		.name	= "dns320:orange:l_hdd",
-		.gpio	= 28,
-		.active_low = 1,
-	},
-	{
-		.name	= "dns320:orange:r_hdd",
-		.gpio	= 27,
-		.active_low = 1,
-	},
-	{
-		.name	= "dns320:orange:usb",
-		.gpio	= 35,
-		.active_low = 1,
-	},
-};
-
-static struct gpio_led_platform_data dns320_led_data = {
-	.num_leds	= ARRAY_SIZE(dns320_led_pins),
-	.leds		= dns320_led_pins,
-};
-
-static struct platform_device dns320_led_device = {
-	.name		= "leds-gpio",
-	.id		= -1,
-	.dev		= {
-		.platform_data	= &dns320_led_data,
-	},
-};
-
 static struct gpio_keys_button dnskw_button_pins[] = {
 	{
 		.code		= KEY_POWER,
@@ -237,12 +153,6 @@ void __init dnskw_init(void)
 	platform_device_register(&dnskw_button_device);
 	platform_device_register(&dnskw_fan_device);
 
-	if (of_machine_is_compatible("dlink,dns-325"))
-		platform_device_register(&dns325_led_device);
-
-	else if (of_machine_is_compatible("dlink,dns-320"))
-		platform_device_register(&dns320_led_device);
-
 	/* Register power-off GPIO. */
 	if (gpio_request(36, "dnskw:power:off") == 0
 	    && gpio_direction_output(36, 0) == 0)
-- 
1.7.10.4
