From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [RFC][PATCH] gpio: Add device tree support for exynos4
Date: Thu, 21 Jul 2011 22:40:50 +0530
Message-ID: <1311268250-3100-1-git-send-email-thomas.abraham@linaro.org>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: grant.likely@secretlab.ca, linux-samsung-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Exynos4 GPIO helper functions registers each bank of GPIO as a gpio chip.
For each gpio chip being registered, this patch finds a matching node
in device tree and attaches the node pointer to the gpio chip. The match
is based on the compatible property of the node.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---

Each gpio controller is listed as below in the dts file.

	gpa0: gpio-controller@11400000 {
		compatible = "samsung,exynos4-gpio-gpa0","samsung,exynos4-gpio";
		#gpio-cells = <2>;
		gpio-controller;
	};

	gpa1: gpio-controller@11400020 {
		compatible = "samsung,exynos4-gpio-gpa1","samsung,exynos4-gpio";
		#gpio-cells = <2>;
		gpio-controller;
	};
		
	gpb: gpio-controller@11400040 {
		compatible = "samsung,exynos4-gpio-gpb","samsung,exynos4-gpio";
		#gpio-cells = <2>;
		gpio-controller;
	};

	and many more (gpc, gpd, ...., gpx)

For each linux domain gpio chip registered by the exynos4 gpio helpers,
a matching device node is found from the device tree by matching the
compatible property.

 drivers/gpio/gpio-exynos4.c |   30 ++++++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/drivers/gpio/gpio-exynos4.c b/drivers/gpio/gpio-exynos4.c
index 9029835..c727bf1 100644
--- a/drivers/gpio/gpio-exynos4.c
+++ b/drivers/gpio/gpio-exynos4.c
@@ -14,6 +14,10 @@
 #include <linux/irq.h>
 #include <linux/io.h>
 #include <linux/gpio.h>
+#ifdef CONFIG_OF
+#include <linux/of.h>
+#include <linux/slab.h>
+#endif
 
 #include <mach/map.h>
 
@@ -321,6 +325,29 @@ static struct s3c_gpio_chip exynos4_gpio_part3_4bit[] = {
 	},
 };
 
+#ifdef CONFIG_OF
+static __init void exynos4_gpiolib_attach_ofnode(struct gpio_chip *gc)
+{
+	const char exynos4_gpio_compat_base[] = "samsung,exynos4-gpio-";
+	char *exynos4_gpio_compat;
+
+	exynos4_gpio_compat = kzalloc(strlen(exynos4_gpio_compat_base) +
+				strlen(gc->label), GFP_KERNEL);
+	if (!exynos4_gpio_compat)
+		return;
+
+	strcpy(exynos4_gpio_compat, exynos4_gpio_compat_base);
+	strcat(exynos4_gpio_compat, gc->label);
+	gc->of_node = of_find_compatible_node(NULL, NULL, exynos4_gpio_compat);
+	kfree(exynos4_gpio_compat);
+}
+#else
+static __init void exynos4_gpiolib_attach_ofnode(struct gpio_chip *chip)
+{
+	return;
+}
+#endif
+
 static __init int exynos4_gpiolib_init(void)
 {
 	struct s3c_gpio_chip *chip;
@@ -341,6 +368,7 @@ static __init int exynos4_gpiolib_init(void)
 		}
 		if (chip->base == NULL)
 			chip->base = S5P_VA_GPIO1 + (i) * 0x20;
+		exynos4_gpiolib_attach_ofnode(&chip->chip);
 	}
 
 	samsung_gpiolib_add_4bit_chips(exynos4_gpio_part1_4bit, nr_chips);
@@ -358,6 +386,7 @@ static __init int exynos4_gpiolib_init(void)
 		}
 		if (chip->base == NULL)
 			chip->base = S5P_VA_GPIO2 + (i) * 0x20;
+		exynos4_gpiolib_attach_ofnode(&chip->chip);
 	}
 
 	samsung_gpiolib_add_4bit_chips(exynos4_gpio_part2_4bit, nr_chips);
@@ -375,6 +404,7 @@ static __init int exynos4_gpiolib_init(void)
 		}
 		if (chip->base == NULL)
 			chip->base = S5P_VA_GPIO3 + (i) * 0x20;
+		exynos4_gpiolib_attach_ofnode(&chip->chip);
 	}
 
 	samsung_gpiolib_add_4bit_chips(exynos4_gpio_part3_4bit, nr_chips);
-- 
1.6.6.rc2
