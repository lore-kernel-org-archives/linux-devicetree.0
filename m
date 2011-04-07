From: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch 1/2] Add dt_compat field to struct gpio_chip
Date: Thu, 7 Apr 2011 18:39:30 +0200
Message-ID: <20110407163930.GB17498@dandreoli.com>
References: <20110407163322.465935232@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline; filename=gpiolib-add-dt_compat-to-gpio_chip
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

This new field allows easy creation of GPIO chips in base of struct arrays.

Signed-off-by: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

---
 drivers/of/gpio.c          |    3 +++
 include/asm-generic/gpio.h |    1 +
 2 files changed, 4 insertions(+)

Index: b/drivers/of/gpio.c
===================================================================
--- a/drivers/of/gpio.c	2011-04-07 18:19:20.000000000 +0200
+++ b/drivers/of/gpio.c	2011-04-07 18:20:31.000000000 +0200
@@ -212,6 +212,9 @@
 
 void of_gpiochip_add(struct gpio_chip *chip)
 {
+	if ((!chip->of_node) && (chip->dt_compat))
+		chip->of_node = of_find_compatible_node(NULL, NULL, chip->dt_compat);
+
 	if ((!chip->of_node) && (chip->dev))
 		chip->of_node = chip->dev->of_node;
 
Index: b/include/asm-generic/gpio.h
===================================================================
--- a/include/asm-generic/gpio.h	2011-04-07 18:19:20.000000000 +0200
+++ b/include/asm-generic/gpio.h	2011-04-07 18:19:30.000000000 +0200
@@ -129,6 +129,7 @@
 	int of_gpio_n_cells;
 	int (*of_xlate)(struct gpio_chip *gc, struct device_node *np,
 		        const void *gpio_spec, u32 *flags);
+	const char *dt_compat;
 #endif
 };
