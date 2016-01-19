From: kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org
Subject: [RFC 1/9] clk: bcm2835: add basic device tree support for per clock settings
Date: Tue, 19 Jan 2016 14:51:32 +0000
Message-ID: <1453215100-2382-2-git-send-email-kernel@martin.sperl.org>
References: <1453215100-2382-1-git-send-email-kernel@martin.sperl.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453215100-2382-1-git-send-email-kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Remi Pommarel <repk-lovNVp52yxIDGOk2Oe9MvA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>

Add basic device tree support for per clock settings taken from the
device tree.

Signed-off-by: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
---
 drivers/clk/bcm/clk-bcm2835.c |   72 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 66 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 637f8ae..1c714d0 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -1757,8 +1757,38 @@ static const struct clk_ops bcm2835_vpu_clock_clk_ops = {
 	.get_parent = bcm2835_clock_get_parent,
 };
 
+static struct device_node *bcm2835_find_dt_node(
+	struct bcm2835_cprman *cprman, int id)
+{
+	struct device *dev = cprman->dev;
+	struct device_node *nc, *ncp = dev->of_node;
+	u32 value;
+	int err;
+
+	/* if no dt, then use the constant version */
+	if (!ncp)
+		return NULL;
+
+	/* try to find the devicetree with the id */
+	for_each_available_child_of_node(ncp, nc) {
+		/* get reg value */
+		err = of_property_read_u32(nc, "reg", &value);
+		if (err) {
+			dev_err(dev, "%s has no valid 'reg' property (%d)\n",
+				nc->full_name, err);
+		} else {
+			if (value == id)
+				return nc;
+		}
+	}
+
+	/* not found */
+	return NULL;
+}
+
 static struct clk *bcm2835_register_pll(struct bcm2835_cprman *cprman,
-					const struct bcm2835_pll_data *data)
+					const struct bcm2835_pll_data *data,
+					size_t id)
 {
 	struct bcm2835_pll *pll;
 	struct clk_init_data init;
@@ -1785,7 +1815,8 @@ static struct clk *bcm2835_register_pll(struct bcm2835_cprman *cprman,
 
 static struct clk *
 bcm2835_register_pll_divider(struct bcm2835_cprman *cprman,
-			     const struct bcm2835_pll_divider_data *data)
+			     const struct bcm2835_pll_divider_data *data,
+			     size_t id)
 {
 	struct bcm2835_pll_divider *divider;
 	struct clk_init_data init;
@@ -1843,14 +1874,42 @@ bcm2835_register_pll_divider(struct bcm2835_cprman *cprman,
 	return clk;
 }
 
+static const struct bcm2835_clock_data *bcm2835_register_clock_of(
+	struct bcm2835_cprman *cprman,
+	const struct bcm2835_clock_data *data_orig,
+	size_t id)
+{
+	struct device *dev = cprman->dev;
+	struct device_node *nc;
+	struct bcm2835_clock_data *data;
+
+	/* find the corresponding dt-node */
+	nc = bcm2835_find_dt_node(cprman, id);
+	if (!nc)
+		return data_orig;
+
+	/* create a copy of data */
+	data = devm_kmalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return data_orig;
+	memcpy(data, data_orig, sizeof(*data));
+
+	/* and return the result */
+	return data;
+}
+
 static struct clk *bcm2835_register_clock(struct bcm2835_cprman *cprman,
-					  const struct bcm2835_clock_data *data)
+					  const struct bcm2835_clock_data *data,
+					  size_t id)
 {
 	struct bcm2835_clock *clock;
 	struct clk_init_data init;
 	const char *parents[1 << CM_SRC_BITS];
 	size_t i;
 
+	/* update default values from the device_tree */
+	data = bcm2835_register_clock_of(cprman, data, id);
+
 	/*
 	 * Replace our "xosc" references with the oscillator's
 	 * actual name.
@@ -1887,7 +1946,8 @@ static struct clk *bcm2835_register_clock(struct bcm2835_cprman *cprman,
 }
 
 static struct clk *bcm2835_register_gate(struct bcm2835_cprman *cprman,
-					 const struct bcm2835_gate_data *data)
+					 const struct bcm2835_gate_data *data,
+					 size_t id)
 {
 	return clk_register_gate(cprman->dev, data->name, data->parent,
 				 CLK_IGNORE_UNUSED | CLK_SET_RATE_GATE,
@@ -1896,7 +1956,7 @@ static struct clk *bcm2835_register_gate(struct bcm2835_cprman *cprman,
 }
 
 typedef struct clk *(*bcm2835_clk_register)(struct bcm2835_cprman *cprman,
-					    const void *data);
+					    const void *data, size_t id);
 struct bcm2835_clk_desc {
 	bcm2835_clk_register clk_register;
 	const void *data;
@@ -2007,7 +2067,7 @@ static int bcm2835_clk_probe(struct platform_device *pdev)
 	for (i = 0; i < asize; i++) {
 		desc = &clk_desc_array[i];
 		if (desc->clk_register && desc->data)
-			clks[i] = desc->clk_register(cprman, desc->data);
+			clks[i] = desc->clk_register(cprman, desc->data, i);
 	}
 
 	return of_clk_add_provider(dev->of_node, of_clk_src_onecell_get,
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
