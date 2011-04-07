From: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch 2/2] Add GPIO DT support to s3c24xx
Date: Thu, 7 Apr 2011 18:39:45 +0200
Message-ID: <20110407163945.GC17498@dandreoli.com>
References: <20110407163322.465935232@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline; filename=s3c24xx-gpio-add-dt-support
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
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Add DT compat strings to the GPIO chips registerd by s3c24xx SOCs.

Signed-off-by: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

---
 arch/arm/plat-s3c24xx/gpiolib.c |   36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

Index: b/arch/arm/plat-s3c24xx/gpiolib.c
===================================================================
--- a/arch/arm/plat-s3c24xx/gpiolib.c	2011-04-07 18:16:09.000000000 +0200
+++ b/arch/arm/plat-s3c24xx/gpiolib.c	2011-04-07 18:20:41.000000000 +0200
@@ -94,6 +94,9 @@
 			.owner			= THIS_MODULE,
 			.label			= "GPIOA",
 			.ngpio			= 24,
+#if defined(CONFIG_OF_GPIO)
+			.dt_compat		= "samsung,s3c2410-gpio-a",
+#endif
 			.direction_input	= s3c24xx_gpiolib_banka_input,
 			.direction_output	= s3c24xx_gpiolib_banka_output,
 		},
@@ -106,6 +109,9 @@
 			.owner			= THIS_MODULE,
 			.label			= "GPIOB",
 			.ngpio			= 16,
+#if defined(CONFIG_OF_GPIO)
+			.dt_compat		= "samsung,s3c2410-gpio-b",
+#endif
 		},
 	},
 	[2] = {
@@ -116,6 +122,9 @@
 			.owner			= THIS_MODULE,
 			.label			= "GPIOC",
 			.ngpio			= 16,
+#if defined(CONFIG_OF_GPIO)
+			.dt_compat		= "samsung,s3c2410-gpio-c",
+#endif
 		},
 	},
 	[3] = {
@@ -126,6 +135,9 @@
 			.owner			= THIS_MODULE,
 			.label			= "GPIOD",
 			.ngpio			= 16,
+#if defined(CONFIG_OF_GPIO)
+			.dt_compat		= "samsung,s3c2410-gpio-d",
+#endif
 		},
 	},
 	[4] = {
@@ -136,6 +148,9 @@
 			.label			= "GPIOE",
 			.owner			= THIS_MODULE,
 			.ngpio			= 16,
+#if defined(CONFIG_OF_GPIO)
+			.dt_compat		= "samsung,s3c2410-gpio-e",
+#endif
 		},
 	},
 	[5] = {
@@ -147,6 +162,9 @@
 			.label			= "GPIOF",
 			.ngpio			= 8,
 			.to_irq			= s3c24xx_gpiolib_bankf_toirq,
+#if defined(CONFIG_OF_GPIO)
+			.dt_compat		= "samsung,s3c2410-gpio-f",
+#endif
 		},
 	},
 	[6] = {
@@ -159,6 +177,9 @@
 			.label			= "GPIOG",
 			.ngpio			= 16,
 			.to_irq			= samsung_gpiolib_to_irq,
+#if defined(CONFIG_OF_GPIO)
+			.dt_compat		= "samsung,s3c2410-gpio-g",
+#endif
 		},
 	}, {
 		.base	= S3C2410_GPHCON,
@@ -168,6 +189,9 @@
 			.owner			= THIS_MODULE,
 			.label			= "GPIOH",
 			.ngpio			= 11,
+#if defined(CONFIG_OF_GPIO)
+			.dt_compat		= "samsung,s3c2410-gpio-h",
+#endif
 		},
 	},
 		/* GPIOS for the S3C2443 and later devices. */
@@ -179,6 +203,9 @@
 			.owner			= THIS_MODULE,
 			.label			= "GPIOJ",
 			.ngpio			= 16,
+#if defined(CONFIG_OF_GPIO)
+			.dt_compat		= "samsung,s3c2440-gpio-j",
+#endif
 		},
 	}, {
 		.base	= S3C2443_GPKCON,
@@ -188,6 +215,9 @@
 			.owner			= THIS_MODULE,
 			.label			= "GPIOK",
 			.ngpio			= 16,
+#if defined(CONFIG_OF_GPIO)
+			.dt_compat		= "samsung,s3c2443-gpio-k",
+#endif
 		},
 	}, {
 		.base	= S3C2443_GPLCON,
@@ -197,6 +227,9 @@
 			.owner			= THIS_MODULE,
 			.label			= "GPIOL",
 			.ngpio			= 15,
+#if defined(CONFIG_OF_GPIO)
+			.dt_compat		= "samsung,s3c2443-gpio-l",
+#endif
 		},
 	}, {
 		.base	= S3C2443_GPMCON,
@@ -206,6 +239,9 @@
 			.owner			= THIS_MODULE,
 			.label			= "GPIOM",
 			.ngpio			= 2,
+#if defined(CONFIG_OF_GPIO)
+			.dt_compat		= "samsung,s3c2443-gpio-m",
+#endif
 		},
 	},
 };
