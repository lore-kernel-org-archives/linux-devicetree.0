From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH 2/2] sfp: add sff module support
Date: Thu, 14 Dec 2017 10:27:47 +0000
Message-ID: <E1ePQjz-0003q6-Tf@rmk-PC.armlinux.org.uk>
References: <20171214102712.GP10595@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171214102712.GP10595-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add support for SFF modules, which are soldered down SFP modules.
These have a different phys_id value, and also have the present and
rate select signals omitted compared with their socketed counter-parts.

Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
---
 drivers/net/phy/sfp.c | 78 ++++++++++++++++++++++++++++++++++++++++++---------
 include/linux/sfp.h   |  1 +
 2 files changed, 65 insertions(+), 14 deletions(-)

diff --git a/drivers/net/phy/sfp.c b/drivers/net/phy/sfp.c
index 9dfc1c4c954f..96511557eb2c 100644
--- a/drivers/net/phy/sfp.c
+++ b/drivers/net/phy/sfp.c
@@ -98,12 +98,18 @@ static const enum gpiod_flags gpio_flags[] = {
 
 static DEFINE_MUTEX(sfp_mutex);
 
+struct sff_data {
+	unsigned int gpios;
+	bool (*module_supported)(const struct sfp_eeprom_id *id);
+};
+
 struct sfp {
 	struct device *dev;
 	struct i2c_adapter *i2c;
 	struct mii_bus *i2c_mii;
 	struct sfp_bus *sfp_bus;
 	struct phy_device *mod_phy;
+	const struct sff_data *type;
 
 	unsigned int (*get_state)(struct sfp *);
 	void (*set_state)(struct sfp *, unsigned int);
@@ -123,6 +129,36 @@ struct sfp {
 	struct sfp_eeprom_id id;
 };
 
+static bool sff_module_supported(const struct sfp_eeprom_id *id)
+{
+	return id->base.phys_id == SFP_PHYS_ID_SFF &&
+	       id->base.phys_ext_id == SFP_PHYS_EXT_ID_SFP;
+}
+
+static const struct sff_data sff_data = {
+	.gpios = SFP_F_LOS | SFP_F_TX_FAULT | SFP_F_TX_DISABLE,
+	.module_supported = sff_module_supported,
+};
+
+static bool sfp_module_supported(const struct sfp_eeprom_id *id)
+{
+	return id->base.phys_id == SFP_PHYS_ID_SFP &&
+	       id->base.phys_ext_id == SFP_PHYS_EXT_ID_SFP;
+}
+
+static const struct sff_data sfp_data = {
+	.gpios = SFP_F_PRESENT | SFP_F_LOS | SFP_F_TX_FAULT |
+		 SFP_F_TX_DISABLE | SFP_F_RATE_SELECT,
+	.module_supported = sfp_module_supported,
+};
+
+static const struct of_device_id sfp_of_match[] = {
+	{ .compatible = "sff,sff", .data = &sff_data, },
+	{ .compatible = "sff,sfp", .data = &sfp_data, },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, sfp_of_match);
+
 static unsigned long poll_jiffies;
 
 static unsigned int sfp_gpio_get_state(struct sfp *sfp)
@@ -141,6 +177,11 @@ static unsigned int sfp_gpio_get_state(struct sfp *sfp)
 	return state;
 }
 
+static unsigned int sff_gpio_get_state(struct sfp *sfp)
+{
+	return sfp_gpio_get_state(sfp) | SFP_F_PRESENT;
+}
+
 static void sfp_gpio_set_state(struct sfp *sfp, unsigned int state)
 {
 	if (state & SFP_F_PRESENT) {
@@ -479,10 +520,10 @@ static int sfp_sm_mod_probe(struct sfp *sfp)
 	dev_info(sfp->dev, "module %s %s rev %s sn %s dc %s\n",
 		 vendor, part, rev, sn, date);
 
-	/* We only support SFP modules, not the legacy GBIC modules. */
-	if (sfp->id.base.phys_id != SFP_PHYS_ID_SFP ||
-	    sfp->id.base.phys_ext_id != SFP_PHYS_EXT_ID_SFP) {
-		dev_err(sfp->dev, "module is not SFP - phys id 0x%02x 0x%02x\n",
+	/* Check whether we support this module */
+	if (!sfp->type->module_supported(&sfp->id)) {
+		dev_err(sfp->dev,
+			"module is not supported - phys id 0x%02x 0x%02x\n",
 			sfp->id.base.phys_id, sfp->id.base.phys_ext_id);
 		return -EINVAL;
 	}
@@ -801,6 +842,7 @@ static void sfp_cleanup(void *data)
 
 static int sfp_probe(struct platform_device *pdev)
 {
+	const struct sff_data *sff;
 	struct sfp *sfp;
 	bool poll = false;
 	int irq, err, i;
@@ -815,10 +857,19 @@ static int sfp_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
+	sff = sfp->type = &sfp_data;
+
 	if (pdev->dev.of_node) {
 		struct device_node *node = pdev->dev.of_node;
+		const struct of_device_id *id;
 		struct device_node *np;
 
+		id = of_match_node(sfp_of_match, node);
+		if (WARN_ON(!id))
+			return -EINVAL;
+
+		sff = sfp->type = id->data;
+
 		np = of_parse_phandle(node, "i2c-bus", 0);
 		if (np) {
 			struct i2c_adapter *i2c;
@@ -834,17 +885,22 @@ static int sfp_probe(struct platform_device *pdev)
 				return err;
 			}
 		}
+	}
 
-		for (i = 0; i < GPIO_MAX; i++) {
+	for (i = 0; i < GPIO_MAX; i++)
+		if (sff->gpios & BIT(i)) {
 			sfp->gpio[i] = devm_gpiod_get_optional(sfp->dev,
 					   gpio_of_names[i], gpio_flags[i]);
 			if (IS_ERR(sfp->gpio[i]))
 				return PTR_ERR(sfp->gpio[i]);
 		}
 
-		sfp->get_state = sfp_gpio_get_state;
-		sfp->set_state = sfp_gpio_set_state;
-	}
+	sfp->get_state = sfp_gpio_get_state;
+	sfp->set_state = sfp_gpio_set_state;
+
+	/* Modules that have no detect signal are always present */
+	if (!(sfp->gpio[GPIO_MODDEF0]))
+		sfp->get_state = sff_gpio_get_state;
 
 	sfp->sfp_bus = sfp_register_socket(sfp->dev, sfp, &sfp_module_ops);
 	if (!sfp->sfp_bus)
@@ -899,12 +955,6 @@ static int sfp_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id sfp_of_match[] = {
-	{ .compatible = "sff,sfp", },
-	{ },
-};
-MODULE_DEVICE_TABLE(of, sfp_of_match);
-
 static struct platform_driver sfp_driver = {
 	.probe = sfp_probe,
 	.remove = sfp_remove,
diff --git a/include/linux/sfp.h b/include/linux/sfp.h
index 47ea32d3e816..0c5c5f6ae1ec 100644
--- a/include/linux/sfp.h
+++ b/include/linux/sfp.h
@@ -231,6 +231,7 @@ enum {
 	SFP_SFF8472_COMPLIANCE		= 0x5e,
 	SFP_CC_EXT			= 0x5f,
 
+	SFP_PHYS_ID_SFF			= 0x02,
 	SFP_PHYS_ID_SFP			= 0x03,
 	SFP_PHYS_EXT_ID_SFP		= 0x04,
 	SFP_CONNECTOR_UNSPEC		= 0x00,
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
