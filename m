From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 4/5] gpio: of: Add support to have multiple gpios in gpio-hog
Date: Tue, 8 Mar 2016 17:32:07 +0530
Message-ID: <1457438528-29054-5-git-send-email-ldewangan@nvidia.com>
References: <1457438528-29054-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1457438528-29054-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org
Cc: pawel.moll@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, treding@nvidia.com, swarren@wwwdotorg.org, Laxman Dewangan <ldewangan@nvidia.com>, Benoit Parrot <bparrot@ti.com>, Alexandre Courbot <acourbot@nvidia.com>
List-Id: devicetree@vger.kernel.org

The child node for gpio hogs under gpio controller's node
provide the mechanism to automatic GPIO request and
configuration as part of the gpio-controller's driver
probe function.

Currently, property "gpio" takes one gpios for such
configuration. Add support to have multiple GPIOs in
this property so that multiple GPIOs of gpio-controller
can be configured by this mechanism with one child node.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Benoit Parrot <bparrot@ti.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpio/gpiolib-of.c | 64 ++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 49 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index d81dbd8..0e4e8fd 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -118,6 +118,21 @@ int of_get_named_gpio_flags(struct device_node *np, const char *list_name,
 }
 EXPORT_SYMBOL(of_get_named_gpio_flags);
 
+static int of_gpio_get_gpio_cells_size(struct device_node *chip_np)
+{
+	u32 ncells;
+	int ret;
+
+	ret = of_property_read_u32(chip_np, "#gpio-cells", &ncells);
+	if (ret)
+		return ret;
+
+	if (ncells > MAX_PHANDLE_ARGS)
+		return -EINVAL;
+
+	return ncells;
+}
+
 /**
  * of_parse_own_gpio() - Get a GPIO hog descriptor, names and flags for GPIO API
  * @np:		device node to get GPIO from
@@ -131,6 +146,7 @@ EXPORT_SYMBOL(of_get_named_gpio_flags);
  */
 static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 					   const char **name,
+					   int gpio_index,
 					   enum gpio_lookup_flags *lflags,
 					   enum gpiod_flags *dflags)
 {
@@ -139,8 +155,8 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 	struct gg_data gg_data = {
 		.flags = &xlate_flags,
 	};
-	u32 tmp;
-	int i, ret;
+	int ncells;
+	int i, start_index, ret;
 
 	chip_np = np->parent;
 	if (!chip_np)
@@ -150,17 +166,16 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 	*lflags = 0;
 	*dflags = 0;
 
-	ret = of_property_read_u32(chip_np, "#gpio-cells", &tmp);
-	if (ret)
-		return ERR_PTR(ret);
+	ncells = of_gpio_get_gpio_cells_size(chip_np);
+	if (ncells < 0)
+		return ERR_PTR(ncells);
 
-	if (tmp > MAX_PHANDLE_ARGS)
-		return ERR_PTR(-EINVAL);
+	start_index = ncells * gpio_index;
 
-	gg_data.gpiospec.args_count = tmp;
+	gg_data.gpiospec.args_count = ncells;
 	gg_data.gpiospec.np = chip_np;
-	for (i = 0; i < tmp; i++) {
-		ret = of_property_read_u32_index(np, "gpios", i,
+	for (i = 0; i < ncells; i++) {
+		ret = of_property_read_u32_index(np, "gpios", start_index + i,
 					   &gg_data.gpiospec.args[i]);
 		if (ret)
 			return ERR_PTR(ret);
@@ -211,18 +226,37 @@ static int of_gpiochip_scan_gpios(struct gpio_chip *chip)
 	enum gpio_lookup_flags lflags;
 	enum gpiod_flags dflags;
 	int ret;
+	int i, ncells, ngpios;
+
+	ncells = of_gpio_get_gpio_cells_size(chip->of_node);
+	if (ncells < 0)
+		return 0;
 
 	for_each_available_child_of_node(chip->of_node, np) {
 		if (!of_property_read_bool(np, "gpio-hog"))
 			continue;
 
-		desc = of_parse_own_gpio(np, &name, &lflags, &dflags);
-		if (IS_ERR(desc))
+		ngpios = of_property_count_u32_elems(np, "gpios");
+		if (ngpios < 0)
+			continue;
+
+		if (ngpios % ncells) {
+			dev_warn(chip->parent,
+				"GPIOs entries are not proper in gpios\n");
 			continue;
+		}
+
+		ngpios /= ncells;
+		for (i = 0; i < ngpios; i++) {
+			desc = of_parse_own_gpio(np, &name, i,
+						 &lflags, &dflags);
+			if (IS_ERR(desc))
+				continue;
 
-		ret = gpiod_hog(desc, name, lflags, dflags);
-		if (ret < 0)
-			return ret;
+			ret = gpiod_hog(desc, name, lflags, dflags);
+			if (ret < 0)
+				return ret;
+		}
 	}
 
 	return 0;
-- 
2.1.4

