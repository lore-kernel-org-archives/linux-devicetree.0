From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V2 5/5] gpio: of: Add support to have multiple gpios in gpio-hog
Date: Fri, 11 Mar 2016 19:13:24 +0530
Message-ID: <1457703804-3016-6-git-send-email-ldewangan@nvidia.com>
References: <1457703804-3016-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457703804-3016-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, mpa@pengutronix.de, swarren@wwwdotorg.org, treding@nvidia.com
Cc: bparrot@ti.com, acourbot@nvidia.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
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
Changes from V1:
- Add "labels" property for GPIO label names.
---
 drivers/gpio/gpiolib-of.c | 77 ++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 59 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index d81dbd8..47a514d 100644
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
@@ -150,18 +166,17 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
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
-					   &gg_data.gpiospec.args[i]);
+	for (i = 0; i < ncells; i++) {
+		ret = of_property_read_u32_index(np, "gpios", start_index + i,
+						 &gg_data.gpiospec.args[i]);
 		if (ret)
 			return ERR_PTR(ret);
 	}
@@ -189,9 +204,16 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (name && of_property_read_string(np, "line-name", name))
-		*name = np->name;
+	if (!name)
+		goto out;
 
+	ret = of_property_read_string(np, "line-name", name);
+	if (ret)
+		ret = of_property_read_string_index(np, "label", gpio_index,
+						    name);
+	if (ret)
+		*name = np->name;
+out:
 	return gg_data.out_gpio;
 }
 
@@ -211,18 +233,37 @@ static int of_gpiochip_scan_gpios(struct gpio_chip *chip)
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
 			continue;
 
-		ret = gpiod_hog(desc, name, lflags, dflags);
-		if (ret < 0)
-			return ret;
+		if (ngpios % ncells) {
+			dev_warn(chip->parent, "Invalid GPIO entries at %s\n",
+				 np->name);
+			continue;
+		}
+
+		ngpios /= ncells;
+		for (i = 0; i < ngpios; i++) {
+			desc = of_parse_own_gpio(np, &name, i,
+						 &lflags, &dflags);
+			if (IS_ERR(desc))
+				continue;
+
+			ret = gpiod_hog(desc, name, lflags, dflags);
+			if (ret < 0)
+				return ret;
+		}
 	}
 
 	return 0;
-- 
2.1.4
