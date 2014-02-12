From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 2/3] regulator: gpio-regulator: do not open-code counting and access of dt array elements
Date: Wed, 12 Feb 2014 01:01:08 +0100
Message-ID: <1553563.pNlhnjkCFL@phil>
References: <2573561.oCYNnnL0gm@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2573561.oCYNnnL0gm@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner-HCpLIkUQxWGakBO8gow8eQ@public.gmane.org>

Open coding the counting of elements in a dt-property is abstracted by the newly
introduced of_property_count_uXX_elems functions. Additionally the raw iteration
over the states element exposes the endian conversion and dtb-format details,
which according to Mark Rutland "would be nice to limit [...] to of_ helper
functions".

Thus change gpio-regulator to use the helper for element counting and
of_property_read_u32_index for retrieval of individual values.

This makes it possible to remove the raw access to the states property entirely.

Signed-off-by: Heiko Stuebner <heiko.stuebner-HCpLIkUQxWGakBO8gow8eQ@public.gmane.org>
---
 drivers/regulator/gpio-regulator.c |   15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/regulator/gpio-regulator.c b/drivers/regulator/gpio-regulator.c
index ac3a8c7..500aa3b 100644
--- a/drivers/regulator/gpio-regulator.c
+++ b/drivers/regulator/gpio-regulator.c
@@ -136,7 +136,6 @@ static struct gpio_regulator_config *
 of_get_gpio_regulator_config(struct device *dev, struct device_node *np)
 {
 	struct gpio_regulator_config *config;
-	struct property *prop;
 	const char *regtype;
 	int proplen, gpio, i;
 	int ret;
@@ -191,14 +190,12 @@ of_get_gpio_regulator_config(struct device *dev, struct device_node *np)
 	}
 
 	/* Fetch states. */
-	prop = of_find_property(np, "states", NULL);
-	if (!prop) {
+	proplen = of_property_count_u32_elems(np, "states");
+	if (proplen < 0) {
 		dev_err(dev, "No 'states' property found\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-	proplen = prop->length / sizeof(int);
-
 	config->states = devm_kzalloc(dev,
 				sizeof(struct gpio_regulator_state)
 				* (proplen / 2),
@@ -207,10 +204,10 @@ of_get_gpio_regulator_config(struct device *dev, struct device_node *np)
 		return ERR_PTR(-ENOMEM);
 
 	for (i = 0; i < proplen / 2; i++) {
-		config->states[i].value =
-			be32_to_cpup((int *)prop->value + (i * 2));
-		config->states[i].gpios =
-			be32_to_cpup((int *)prop->value + (i * 2 + 1));
+		of_property_read_u32_index(np, "states", i * 2,
+					   &config->states[i].value);
+		of_property_read_u32_index(np, "states", i * 2 + 1,
+					   &config->states[i].gpios);
 	}
 	config->nr_states = i;
 
-- 
1.7.10.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
