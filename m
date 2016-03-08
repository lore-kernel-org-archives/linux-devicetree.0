From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 3/5] gpio: of: Return error if gpio hog configuration failed
Date: Tue, 8 Mar 2016 17:32:06 +0530
Message-ID: <1457438528-29054-4-git-send-email-ldewangan@nvidia.com>
References: <1457438528-29054-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1457438528-29054-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org
Cc: pawel.moll@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, treding@nvidia.com, swarren@wwwdotorg.org, Laxman Dewangan <ldewangan@nvidia.com>, Benoit Parrot <bparrot@ti.com>, Alexandre Courbot <acourbot@nvidia.com>
List-Id: devicetree@vger.kernel.org

If GPIO hog configuration failed while adding OF based
gpiochip() then return the error instead of ignoring it.

This helps of properly handling the gpio driver dependency.

When adding the gpio hog nodes for NVIDIA's Tegra210 platforms,
the gpio_hogd() fails with EPROBE_DEFER because pinctrl is not
ready at this time and gpio_request() for Tegra GPIO driver
returns error. The error was not causing the Tegra GPIO driver
to fail as the error was getting ignored.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Benoit Parrot <bparrot@ti.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpio/gpiolib-of.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index f2ba1a4..d81dbd8 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -201,14 +201,16 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
  *
  * This is only used by of_gpiochip_add to request/set GPIO initial
  * configuration.
+ * It retures error if it fails otherwise 0 on success.
  */
-static void of_gpiochip_scan_gpios(struct gpio_chip *chip)
+static int of_gpiochip_scan_gpios(struct gpio_chip *chip)
 {
 	struct gpio_desc *desc = NULL;
 	struct device_node *np;
 	const char *name;
 	enum gpio_lookup_flags lflags;
 	enum gpiod_flags dflags;
+	int ret;
 
 	for_each_available_child_of_node(chip->of_node, np) {
 		if (!of_property_read_bool(np, "gpio-hog"))
@@ -218,9 +220,12 @@ static void of_gpiochip_scan_gpios(struct gpio_chip *chip)
 		if (IS_ERR(desc))
 			continue;
 
-		if (gpiod_hog(desc, name, lflags, dflags))
-			continue;
+		ret = gpiod_hog(desc, name, lflags, dflags);
+		if (ret < 0)
+			return ret;
 	}
+
+	return 0;
 }
 
 /**
@@ -442,9 +447,7 @@ int of_gpiochip_add(struct gpio_chip *chip)
 
 	of_node_get(chip->of_node);
 
-	of_gpiochip_scan_gpios(chip);
-
-	return 0;
+	return of_gpiochip_scan_gpios(chip);
 }
 
 void of_gpiochip_remove(struct gpio_chip *chip)
-- 
2.1.4

