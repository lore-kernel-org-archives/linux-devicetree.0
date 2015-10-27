From: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 4/6] reset: sunxi: Add Allwinner H3 bus resets
Date: Tue, 27 Oct 2015 17:50:24 +0100
Message-ID: <1445964626-6484-5-git-send-email-jenskuske@gmail.com>
References: <1445964626-6484-1-git-send-email-jenskuske@gmail.com>
Reply-To: jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCC5XIE2SIHBBZ6WX2YQKGQEUOV6DKY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1445964626-6484-1-git-send-email-jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
Cc: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The H3 bus resets have some holes between the registers, so we add
an of_xlate() function to skip them according to the datasheet.

Signed-off-by: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../bindings/reset/allwinner,sunxi-clock-reset.txt |  1 +
 drivers/reset/reset-sunxi.c                        | 30 +++++++++++++++++++---
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/allwinner,sunxi-clock-reset.txt b/Documentation/devicetree/bindings/reset/allwinner,sunxi-clock-reset.txt
index c8f7757..e11f023 100644
--- a/Documentation/devicetree/bindings/reset/allwinner,sunxi-clock-reset.txt
+++ b/Documentation/devicetree/bindings/reset/allwinner,sunxi-clock-reset.txt
@@ -8,6 +8,7 @@ Required properties:
 - compatible: Should be one of the following:
   "allwinner,sun6i-a31-ahb1-reset"
   "allwinner,sun6i-a31-clock-reset"
+  "allwinner,sun8i-h3-bus-reset"
 - reg: should be register base and length as documented in the
   datasheet
 - #reset-cells: 1, see below
diff --git a/drivers/reset/reset-sunxi.c b/drivers/reset/reset-sunxi.c
index 3d95c87..c91e146 100644
--- a/drivers/reset/reset-sunxi.c
+++ b/drivers/reset/reset-sunxi.c
@@ -75,7 +75,9 @@ static struct reset_control_ops sunxi_reset_ops = {
 	.deassert	= sunxi_reset_deassert,
 };
 
-static int sunxi_reset_init(struct device_node *np)
+static int sunxi_reset_init(struct device_node *np,
+			    int (*of_xlate)(struct reset_controller_dev *rcdev,
+				    const struct of_phandle_args *reset_spec))
 {
 	struct sunxi_reset_data *data;
 	struct resource res;
@@ -108,6 +110,7 @@ static int sunxi_reset_init(struct device_node *np)
 	data->rcdev.nr_resets = size * 32;
 	data->rcdev.ops = &sunxi_reset_ops;
 	data->rcdev.of_node = np;
+	data->rcdev.of_xlate = of_xlate;
 	reset_controller_register(&data->rcdev);
 
 	return 0;
@@ -117,6 +120,21 @@ err_alloc:
 	return ret;
 };
 
+static int sun8i_h3_bus_reset_xlate(struct reset_controller_dev *rcdev,
+				    const struct of_phandle_args *reset_spec)
+{
+	unsigned int index = reset_spec->args[0];
+
+	if (index < 96)
+		return index;
+	else if (index < 128)
+		return index + 32;
+	else if (index < 160)
+		return index + 64;
+	else
+		return -EINVAL;
+}
+
 /*
  * These are the reset controller we need to initialize early on in
  * our system, before we can even think of using a regular device
@@ -124,15 +142,21 @@ err_alloc:
  */
 static const struct of_device_id sunxi_early_reset_dt_ids[] __initdata = {
 	{ .compatible = "allwinner,sun6i-a31-ahb1-reset", },
+	{ .compatible = "allwinner,sun8i-h3-bus-reset", .data = sun8i_h3_bus_reset_xlate, },
 	{ /* sentinel */ },
 };
 
 void __init sun6i_reset_init(void)
 {
 	struct device_node *np;
+	const struct of_device_id *match;
+	int (*of_xlate)(struct reset_controller_dev *rcdev,
+			const struct of_phandle_args *reset_spec);
 
-	for_each_matching_node(np, sunxi_early_reset_dt_ids)
-		sunxi_reset_init(np);
+	for_each_matching_node_and_match(np, sunxi_early_reset_dt_ids, &match) {
+		of_xlate = match->data;
+		sunxi_reset_init(np, of_xlate);
+	}
 }
 
 /*
-- 
2.6.2
