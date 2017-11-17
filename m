From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 4/5] checks: check for #{size,address}-cells without child nodes
Date: Fri, 17 Nov 2017 08:45:14 -0600
Message-ID: <20171117144515.10870-5-robh@kernel.org>
References: <20171117144515.10870-1-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171117144515.10870-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

nodes with a 'reg' property nor a ranges property.

An exception may be an overlay that adds nodes, but this case would need

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 checks.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/checks.c b/checks.c
index 346b0256f9cb..a785b81bea07 100644
--- a/checks.c
+++ b/checks.c
@@ -982,6 +982,31 @@ static void check_avoid_default_addr_size(struct check *c, struct dt_info *dti,
 WARNING(avoid_default_addr_size, check_avoid_default_addr_size, NULL,
 	&addr_size_cells);
 
+static void check_avoid_unecessary_addr_size(struct check *c, struct dt_info *dti,
+					     struct node *node)
+{
+	struct property *prop;
+	struct node *child;
+	bool has_reg = false;
+
+	if (!node->parent || node->addr_cells < 0 || node->size_cells < 0)
+		return;
+
+	if (get_property(node, "ranges") || !node->children)
+		return;
+
+	for_each_child(node, child) {
+		prop = get_property(child, "reg");
+		if (prop)
+			has_reg = true;
+	}
+
+	if (!has_reg)
+		FAIL(c, dti, "unnecessary #address-cells/#size-cells without \"ranges\" or child \"reg\" property in %s",
+		     node->fullpath);
+}
+WARNING(avoid_unecessary_addr_size, check_avoid_unecessary_addr_size, NULL, &avoid_default_addr_size);
+
 static void check_obsolete_chosen_interrupt_controller(struct check *c,
 						       struct dt_info *dti,
 						       struct node *node)
@@ -1306,6 +1331,7 @@ static struct check *check_table[] = {
 	&simple_bus_reg,
 
 	&avoid_default_addr_size,
+	&avoid_unecessary_addr_size,
 	&obsolete_chosen_interrupt_controller,
 
 	&clocks_property,
-- 
2.14.1
