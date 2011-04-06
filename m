From: Domenico Andreoli <cavok-iIV0ii4H0r6tG0bUXCXiUA@public.gmane.org>
Subject: initial approach to DT + gpio-leds problems on s3c2440
Date: Wed, 6 Apr 2011 19:32:55 +0200
Message-ID: <20110406173255.GA17523@dandreoli.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

  I'm playing with my ARM board to add some DT support to S3C2440.
dtb file is merged within the kernel image (thanks to a patch of Jeremy
Kerr) and the board _does_ correctly boot using the basic info provided
by it (i.e. kernel command line).

Willing to play further, I succesfully added DT support to the GPIO
controller (please check the patch just to be sure I'm right) but there
is no way to bind GPIO leds (please check also the dts).

I see the usage of of_find_compatible_node() to bind DT nodes to
the GPIO controller but I don't understand _where_ the gpio-leds DT
nodes are bound to anything. I only see the leds-gpio platform driver
registration walking the device list to find an OF match but of course
there is not any device bound to the led nodes.

Please help me understand what I'm missing. Thank you.

regards,
Domenico

---

Index: arm-2.6.git/arch/arm/plat-samsung/include/plat/gpio-core.h
===================================================================
--- arm-2.6.git.orig/arch/arm/plat-samsung/include/plat/gpio-core.h	2011-04-06 17:35:26.000000000 +0200
+++ arm-2.6.git/arch/arm/plat-samsung/include/plat/gpio-core.h	2011-04-06 17:42:23.000000000 +0200
@@ -71,6 +71,7 @@
 #ifdef CONFIG_PM
 	u32			pm_save[4];
 #endif
+	const char		*of_compatible;
 };
 
 static inline struct s3c_gpio_chip *to_s3c_gpio(struct gpio_chip *gpc)

Index: arm-2.6.git/arch/arm/plat-s3c24xx/gpiolib.c
===================================================================
--- arm-2.6.git.orig/arch/arm/plat-s3c24xx/gpiolib.c	2011-04-06 16:38:33.000000000 +0200
+++ arm-2.6.git/arch/arm/plat-s3c24xx/gpiolib.c	2011-04-06 17:41:37.000000000 +0200
@@ -97,6 +97,7 @@
 			.direction_input	= s3c24xx_gpiolib_banka_input,
 			.direction_output	= s3c24xx_gpiolib_banka_output,
 		},
+		.of_compatible = "samsung,s3c2410-gpio-a",
 	},
 	[1] = {
 		.base	= S3C2410_GPBCON,
@@ -107,6 +108,7 @@
 			.label			= "GPIOB",
 			.ngpio			= 16,
 		},
+		.of_compatible = "samsung,s3c2410-gpio-b",
 	},
 	[2] = {
 		.base	= S3C2410_GPCCON,
@@ -117,6 +119,7 @@
 			.label			= "GPIOC",
 			.ngpio			= 16,
 		},
+		.of_compatible = "samsung,s3c2410-gpio-c",
 	},
 	[3] = {
 		.base	= S3C2410_GPDCON,
@@ -127,6 +130,7 @@
 			.label			= "GPIOD",
 			.ngpio			= 16,
 		},
+		.of_compatible = "samsung,s3c2410-gpio-d",
 	},
 	[4] = {
 		.base	= S3C2410_GPECON,
@@ -137,6 +141,7 @@
 			.owner			= THIS_MODULE,
 			.ngpio			= 16,
 		},
+		.of_compatible = "samsung,s3c2410-gpio-e",
 	},
 	[5] = {
 		.base	= S3C2410_GPFCON,
@@ -148,6 +153,7 @@
 			.ngpio			= 8,
 			.to_irq			= s3c24xx_gpiolib_bankf_toirq,
 		},
+		.of_compatible = "samsung,s3c2410-gpio-f",
 	},
 	[6] = {
 		.base	= S3C2410_GPGCON,
@@ -160,6 +166,7 @@
 			.ngpio			= 16,
 			.to_irq			= samsung_gpiolib_to_irq,
 		},
+		.of_compatible = "samsung,s3c2410-gpio-g",
 	}, {
 		.base	= S3C2410_GPHCON,
 		.pm	= __gpio_pm(&s3c_gpio_pm_2bit),
@@ -169,6 +176,7 @@
 			.label			= "GPIOH",
 			.ngpio			= 11,
 		},
+		.of_compatible = "samsung,s3c2410-gpio-h",
 	},
 		/* GPIOS for the S3C2443 and later devices. */
 	{
@@ -180,6 +188,7 @@
 			.label			= "GPIOJ",
 			.ngpio			= 16,
 		},
+		.of_compatible = "samsung,s3c2440-gpio-j",
 	}, {
 		.base	= S3C2443_GPKCON,
 		.pm	= __gpio_pm(&s3c_gpio_pm_2bit),
@@ -189,6 +198,7 @@
 			.label			= "GPIOK",
 			.ngpio			= 16,
 		},
+		.of_compatible = "samsung,s3c2443-gpio-k",
 	}, {
 		.base	= S3C2443_GPLCON,
 		.pm	= __gpio_pm(&s3c_gpio_pm_2bit),
@@ -198,6 +208,7 @@
 			.label			= "GPIOL",
 			.ngpio			= 15,
 		},
+		.of_compatible = "samsung,s3c2443-gpio-l",
 	}, {
 		.base	= S3C2443_GPMCON,
 		.pm	= __gpio_pm(&s3c_gpio_pm_2bit),
@@ -207,6 +218,7 @@
 			.label			= "GPIOM",
 			.ngpio			= 2,
 		},
+		.of_compatible = "samsung,s3c2443-gpio-m",
 	},
 };
 
Index: arm-2.6.git/arch/arm/plat-samsung/gpio.c
===================================================================
--- arm-2.6.git.orig/arch/arm/plat-samsung/gpio.c	2011-04-06 17:13:46.000000000 +0200
+++ arm-2.6.git/arch/arm/plat-samsung/gpio.c	2011-04-06 17:50:46.000000000 +0200
@@ -15,6 +15,7 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/gpio.h>
+#include <linux/of.h>
 #include <linux/spinlock.h>
 
 #include <plat/gpio-core.h>
@@ -152,6 +153,13 @@
 		printk(KERN_ERR "gpio: %s has no PM function\n", gc->label);
 #endif
 
+#ifdef CONFIG_OF_GPIO
+	if (chip->of_compatible)
+		gc->of_node = of_find_compatible_node(NULL, NULL, chip->of_compatible);
+#endif /* CONFIG_OF_GPIO */
+
 	/* gpiochip_add() prints own failure message on error. */
 	ret = gpiochip_add(gc);
 	if (ret >= 0)
Index: arm-2.6.git/arch/arm/boot/dts/friendlyarm-qq2440.dts
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ arm-2.6.git/arch/arm/boot/dts/friendlyarm-qq2440.dts	2011-04-06 18:42:20.000000000 +0200
@@ -0,0 +1,42 @@
+/dts-v1/;
+/include/ "skeleton.dtsi"
+
+/ {
+	model = "FriendlyARM QQ2440 Development Board";
+	compatible = "friendlyarm,qq2440";
+
+	chosen {
+		bootargs = "noinitrd root=/dev/mtdblock4 init=/linuxrc console=ttySAC0";
+	};
+
+	memory {
+		reg = <0x30000000 0x04000000>;
+	};
+
+	gpb: gpio-controller@1 {
+		#gpio-cells = <2>;
+		compatible = "samsung,s3c2440-gpio-b", "samsung,s3c2410-gpio-b";
+		gpio-controller;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led1 {
+			gpios = <&gpb 5 1>;
+			linux,default-trigger = "heartbeat";
+		};
+		led2 {
+			gpios = <&gpb 6 1>;
+			linux,default-trigger = "nand-disk";
+		};
+		led3 {
+			gpios = <&gpb 7 1>;
+			linux,default-trigger = "mmc0";
+		};
+		led4 {
+			gpios = <&gpb 8 1>;
+			linux,default-trigger = "none";
+		};
+	};
+};
Index: arm-2.6.git/arch/arm/mach-s3c2440/mach-qq2440.c
===================================================================
--- arm-2.6.git.orig/arch/arm/mach-s3c2440/mach-qq2440.c	2011-04-06 10:39:33.000000000 +0200
+++ arm-2.6.git/arch/arm/mach-s3c2440/mach-qq2440.c	2011-04-06 16:26:10.000000000 +0200
@@ -273,7 +273,7 @@
 	&s3c_device_i2c0,
 	&s3c_device_rtc,
 	&s3c_device_usbgadget,
-	&qq2440_leds,
+//	&qq2440_leds,
 	&qq2440_button_device,
 	&s3c_device_nand,
 	&s3c_device_sdi,
@@ -316,10 +316,16 @@
 	platform_add_devices(qq2440_devices, ARRAY_SIZE(qq2440_devices));
 }
 
+static const char *qq2440_dt_match[] __initdata = {
+	"friendlyarm,qq2440",
+	NULL
+};
+
 MACHINE_START(QQ2440, "QQ2440")
 	.boot_params   = S3C2410_SDRAM_PA + 0x100,
 	.map_io        = qq2440_map_io,
 	.init_machine  = qq2440_init,
 	.init_irq      = s3c24xx_init_irq,
 	.timer         = &s3c24xx_timer,
+	.dt_compat     = qq2440_dt_match,
 MACHINE_END
Index: arm-2.6.git/arch/arm/mach-s3c2410/Makefile.boot
===================================================================
--- arm-2.6.git.orig/arch/arm/mach-s3c2410/Makefile.boot	2011-04-06 10:20:38.000000000 +0200
+++ arm-2.6.git/arch/arm/mach-s3c2410/Makefile.boot	2011-04-06 10:39:39.000000000 +0200
@@ -5,3 +5,5 @@
 	zreladdr-y		:= 0x30008000
 	params_phys-y	:= 0x30000100
 endif
+
+dtb-$(CONFIG_MACH_QQ2440) += friendlyarm-qq2440.dtb


-----[ Domenico Andreoli, aka cavok
 --[ http://www.dandreoli.com/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
