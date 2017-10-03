From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH 07/12] of: overlay: expand check of whether overlay changeset can be removed
Date: Mon,  2 Oct 2017 20:53:41 -0700
Message-ID: <1507002826-16393-8-git-send-email-frowand.list@gmail.com>
References: <1507002826-16393-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507002826-16393-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

The test of whether it is safe to remove an overlay changeset
looked at whether any node in the overlay changeset was in a
subtree rooted at any more recently applied overlay changeset
node.

The test failed to determine whether any node in the overlay
changeset was the root of a subtree that contained a more
recently applied overlay changeset node.  Add this additional
check to the test.

The test is still lacking any check for any phandle dependencies.

Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
---
 drivers/of/overlay.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index c7526186b1c8..015d8b112f60 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -698,13 +698,13 @@ static int find_node(struct device_node *tree, struct device_node *np)
 }
 
 /*
- * Is @remove_ce_np a child of or the same as any
+ * Is @remove_ce_node a child of, a parent of, or the same as any
  * node in an overlay changeset more topmost than @remove_ovcs?
  *
  * Returns 1 if found, else 0
  */
-static int node_in_later_cs(struct overlay_changeset *remove_ovcs,
-		struct device_node *remove_ce_np)
+static int node_overlaps_later_cs(struct overlay_changeset *remove_ovcs,
+		struct device_node *remove_ce_node)
 {
 	struct overlay_changeset *ovcs;
 	struct of_changeset_entry *ce;
@@ -714,10 +714,16 @@ static int node_in_later_cs(struct overlay_changeset *remove_ovcs,
 			break;
 
 		list_for_each_entry(ce, &ovcs->cset.entries, node) {
-			if (find_node(ce->np, remove_ce_np)) {
-				pr_err("%s: #%d clashes #%d @%pOF\n",
+			if (find_node(ce->np, remove_ce_node)) {
+				pr_err("%s: #%d overlaps with #%d @%pOF\n",
 					__func__, remove_ovcs->id, ovcs->id,
-					remove_ce_np);
+					remove_ce_node);
+				return 1;
+			}
+			if (find_node(remove_ce_node, ce->np)) {
+				pr_err("%s: #%d overlaps with #%d @%pOF\n",
+					__func__, remove_ovcs->id, ovcs->id,
+					remove_ce_node);
 				return 1;
 			}
 		}
@@ -741,7 +747,7 @@ static int overlay_removal_is_ok(struct overlay_changeset *remove_ovcs)
 	struct of_changeset_entry *remove_ce;
 
 	list_for_each_entry(remove_ce, &remove_ovcs->cset.entries, node) {
-		if (node_in_later_cs(remove_ovcs, remove_ce->np)) {
+		if (node_overlaps_later_cs(remove_ovcs, remove_ce->np)) {
 			pr_err("overlay #%d is not topmost\n", remove_ovcs->id);
 			return 0;
 		}
-- 
Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
