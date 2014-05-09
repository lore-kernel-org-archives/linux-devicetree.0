From: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCHv4 2/2] regmap: add DT endianness binding support.
Date: Fri, 9 May 2014 10:04:33 +0800
Message-ID: <1399601073-19278-3-git-send-email-Li.Xiubo@freescale.com>
References: <1399601073-19278-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399601073-19278-1-git-send-email-Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

For many drivers which will support rich endianness of CPU<-->Dev
need define DT properties by itself without the binding support.

The endianness using regmap:
Index    CPU       Device     Endianess flag for DT bool property
------------------------------------------------------------
1        LE        LE         -
2        LE        BE         'big-endian-{val,reg}'
3        BE        BE         -
4        BE        LE         'little-endian-{val,reg}'

Please see the following documetation for detail:
    Documentation/devicetree/bindings/endianness/endianness.txt

Signed-off-by: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/base/regmap/regmap-i2c.c |   2 +
 drivers/base/regmap/regmap-spi.c |   2 +
 drivers/base/regmap/regmap.c     | 148 ++++++++++++++++++++++++++++++++++++---
 3 files changed, 141 insertions(+), 11 deletions(-)

diff --git a/drivers/base/regmap/regmap-i2c.c b/drivers/base/regmap/regmap-i2c.c
index ebd1895..9b0fbf9 100644
--- a/drivers/base/regmap/regmap-i2c.c
+++ b/drivers/base/regmap/regmap-i2c.c
@@ -95,6 +95,8 @@ static struct regmap_bus regmap_i2c = {
 	.write = regmap_i2c_write,
 	.gather_write = regmap_i2c_gather_write,
 	.read = regmap_i2c_read,
+	.reg_format_endian_default = REGMAP_ENDIAN_BIG,
+	.val_format_endian_default = REGMAP_ENDIAN_BIG,
 };
 
 /**
diff --git a/drivers/base/regmap/regmap-spi.c b/drivers/base/regmap/regmap-spi.c
index 0eb3097..53d1148 100644
--- a/drivers/base/regmap/regmap-spi.c
+++ b/drivers/base/regmap/regmap-spi.c
@@ -109,6 +109,8 @@ static struct regmap_bus regmap_spi = {
 	.async_alloc = regmap_spi_async_alloc,
 	.read = regmap_spi_read,
 	.read_flag_mask = 0x80,
+	.reg_format_endian_default = REGMAP_ENDIAN_BIG,
+	.val_format_endian_default = REGMAP_ENDIAN_BIG,
 };
 
 /**
diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 63e30ef..4805246 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -15,6 +15,7 @@
 #include <linux/export.h>
 #include <linux/mutex.h>
 #include <linux/err.h>
+#include <linux/of.h>
 #include <linux/rbtree.h>
 #include <linux/sched.h>
 
@@ -402,6 +403,133 @@ int regmap_attach_dev(struct device *dev, struct regmap *map,
 }
 EXPORT_SYMBOL_GPL(regmap_attach_dev);
 
+enum regmap_endian_type {
+	REGMAP_ENDIAN_REG,
+	REGMAP_ENDIAN_VAL,
+};
+
+/**
+ * of_regmap_endian_by_type() - Parses and lookups the endianness referenced
+ * by a device node
+ * @np: pointer to the consumer device node
+ * @type: endianness type for values or registers
+ *
+ * This function parses the device endianness properties, and uses them to
+ * determine the endianness of the device's registers and values.
+ */
+static int of_regmap_endian_by_type(struct device_node *np,
+					enum regmap_endian_type type,
+					enum regmap_endian *endian)
+{
+	if (!endian)
+		return -EINVAL;
+
+	switch (type) {
+	case REGMAP_ENDIAN_REG:
+		if (of_property_read_bool(np, "big-endian-reg"))
+			*endian = REGMAP_ENDIAN_BIG;
+		else if (of_property_read_bool(np, "little-endian-reg"))
+			*endian = REGMAP_ENDIAN_LITTLE;
+		else
+			*endian = REGMAP_ENDIAN_NATIVE;
+		break;
+	case REGMAP_ENDIAN_VAL:
+		if (of_property_read_bool(np, "big-endian-val"))
+			*endian = REGMAP_ENDIAN_BIG;
+		else if (of_property_read_bool(np, "little-endian-val"))
+			*endian = REGMAP_ENDIAN_LITTLE;
+		else
+			*endian = REGMAP_ENDIAN_NATIVE;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int of_regmap_get_endian(struct device *dev,
+				const struct regmap_bus *bus,
+				const struct regmap_config *config,
+				enum regmap_endian_type type,
+				enum regmap_endian *endian)
+{
+	int ret;
+
+	if (!endian || !config)
+		return -EINVAL;
+
+	/*
+	 * Firstly, try to parse the endianness from driver's config,
+	 * this is to be compatible with the none DT or the old drivers.
+	 * From the driver's config the endianness value maybe:
+	 *   REGMAP_ENDIAN_BIG,
+	 *   REGMAP_ENDIAN_LITTLE,
+	 *   REGMAP_ENDIAN_NATIVE,
+	 *   REGMAP_ENDIAN_DEFAULT.
+	 */
+	switch (type) {
+	case REGMAP_ENDIAN_REG:
+		*endian = config->reg_format_endian;
+		break;
+	case REGMAP_ENDIAN_VAL:
+		*endian = config->val_format_endian;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/*
+	 * If the endianness parsed from driver config is
+	 * REGMAP_ENDIAN_DEFAULT, that means maybe we are using the DT
+	 * node to specify the endianness information.
+	 */
+	if (*endian != REGMAP_ENDIAN_DEFAULT)
+		return 0;
+
+	/*
+	 * Secondly, try to parse the endianness from DT node if the
+	 * driver config does not specify it.
+	 * From the DT node the endianness value maybe:
+	 *   REGMAP_ENDIAN_BIG,
+	 *   REGMAP_ENDIAN_LITTLE,
+	 *   REGMAP_ENDIAN_NATIVE,
+	 */
+	if (dev) {
+		ret = of_regmap_endian_by_type(dev->of_node, type, endian);
+		if (ret < 0)
+			return ret;
+	}
+
+	/*
+	 * If the endianness parsed from DT node is REGMAP_ENDIAN_NATIVE, that
+	 * maybe means the DT does not care the endianness or it should use
+	 * the regmap bus's default endianness, then we should try to check
+	 * whether the regmap bus has specified the default endianness.
+	 */
+	if (*endian != REGMAP_ENDIAN_NATIVE)
+		return 0;
+
+	/*
+	 * Finally, try to parse the endianness from regmap bus config
+	 * if in device's DT node the endianness property is absent.
+	 */
+	switch (type) {
+	case REGMAP_ENDIAN_REG:
+		if (bus && bus->reg_format_endian_default)
+			*endian = bus->reg_format_endian_default;
+		break;
+	case REGMAP_ENDIAN_VAL:
+		if (bus && bus->val_format_endian_default)
+			*endian = bus->val_format_endian_default;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /**
  * regmap_init(): Initialise register map
  *
@@ -499,17 +627,15 @@ struct regmap *regmap_init(struct device *dev,
 		map->reg_read  = _regmap_bus_read;
 	}
 
-	reg_endian = config->reg_format_endian;
-	if (reg_endian == REGMAP_ENDIAN_DEFAULT)
-		reg_endian = bus->reg_format_endian_default;
-	if (reg_endian == REGMAP_ENDIAN_DEFAULT)
-		reg_endian = REGMAP_ENDIAN_BIG;
-
-	val_endian = config->val_format_endian;
-	if (val_endian == REGMAP_ENDIAN_DEFAULT)
-		val_endian = bus->val_format_endian_default;
-	if (val_endian == REGMAP_ENDIAN_DEFAULT)
-		val_endian = REGMAP_ENDIAN_BIG;
+	ret = of_regmap_get_endian(dev, bus, config, REGMAP_ENDIAN_REG,
+				   &reg_endian);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = of_regmap_get_endian(dev, bus, config, REGMAP_ENDIAN_VAL,
+				   &val_endian);
+	if (ret)
+		return ERR_PTR(ret);
 
 	switch (config->reg_bits + map->reg_shift) {
 	case 2:
-- 
1.8.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
