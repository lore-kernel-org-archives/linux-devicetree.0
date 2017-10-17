From: frowand.list@gmail.com
Subject: [PATCH v3 07/12] of: overlay: expand check of whether overlay changeset can be removed
Date: Tue, 17 Oct 2017 16:36:27 -0700
Message-ID: <1508283392-18252-8-git-send-email-frowand.list@gmail.com>
References: <1508283392-18252-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508283392-18252-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, David Airlie <airlied@linux.ie>, Jyri Sarha <jsarha@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

The test of whether it is safe to remove an overlay changeset
looked at whether any node in the overlay changeset was in a
subtree rooted at any more recently applied overlay changeset
node.

The test failed to determine whether any node in the overlay
changeset was the root of a subtree that contained a more
recently applied overlay changeset node.  Add this additional
check to the test.

The test is still lacking any check for any phandle dependencies.

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 drivers/of/overlay.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 78c50fd57750..4cdee169a5ab 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -707,13 +707,13 @@ static int find_node(struct device_node *tree, struct device_node *np)
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
@@ -723,10 +723,16 @@ static int node_in_later_cs(struct overlay_changeset *remove_ovcs,
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
@@ -750,7 +756,7 @@ static int overlay_removal_is_ok(struct overlay_changeset *remove_ovcs)
 	struct of_changeset_entry *remove_ce;
 
 	list_for_each_entry(remove_ce, &remove_ovcs->cset.entries, node) {
-		if (node_in_later_cs(remove_ovcs, remove_ce->np)) {
+		if (node_overlaps_later_cs(remove_ovcs, remove_ce->np)) {
 			pr_err("overlay #%d is not topmost\n", remove_ovcs->id);
 			return 0;
 		}
-- 
Frank Rowand <frank.rowand@sony.com>
