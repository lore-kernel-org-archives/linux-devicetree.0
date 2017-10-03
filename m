From: frowand.list@gmail.com
Subject: [PATCH 04/12] of: overlay: rename identifiers in dup_and_fixup_symbol_prop()
Date: Mon,  2 Oct 2017 20:53:38 -0700
Message-ID: <1507002826-16393-5-git-send-email-frowand.list@gmail.com>
References: <1507002826-16393-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1507002826-16393-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, David Airlie <airlied@linux.ie>, Jyri Sarha <jsarha@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

More renaming of identifiers to better reflect what they do.

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 drivers/of/overlay.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 397ef10d1f26..c350742ed2a2 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -90,17 +90,29 @@ static int overlay_notify(struct overlay_changeset *ovcs,
 	return 0;
 }
 
+/*
+ * The properties in the "/__symbols__" node are "symbols".
+ *
+ * The value of properties in the "/__symbols__" node is the path of a
+ * node in the subtree of a fragment node's "__overlay__" node, for
+ * example "/fragment@0/__overlay__/symbol_path_tail".  Symbol_path_tail
+ * can be a single node or it may be a multi-node path.
+ *
+ * The duplicated property value will be modified by replacing the
+ * "/fragment_name/__overlay/" portion of the value  with the target
+ * path from the fragment node.
+ */
 static struct property *dup_and_fixup_symbol_prop(
 		struct overlay_changeset *ovcs, const struct property *prop)
 {
 	struct fragment *fragment;
 	struct property *new;
 	const char *overlay_name;
-	char *label_path;
+	char *symbol_path_tail;
 	char *symbol_path;
 	const char *target_path;
 	int k;
-	int label_path_len;
+	int symbol_path_tail_len;
 	int overlay_name_len;
 	int target_path_len;
 
@@ -126,18 +138,18 @@ static struct property *dup_and_fixup_symbol_prop(
 	target_path = fragment->target->full_name;
 	target_path_len = strlen(target_path);
 
-	label_path = symbol_path + overlay_name_len;
-	label_path_len = strlen(label_path);
+	symbol_path_tail = symbol_path + overlay_name_len;
+	symbol_path_tail_len = strlen(symbol_path_tail);
 
 	new->name = kstrdup(prop->name, GFP_KERNEL);
-	new->length = target_path_len + label_path_len + 1;
+	new->length = target_path_len + symbol_path_tail_len + 1;
 	new->value = kzalloc(new->length, GFP_KERNEL);
 
 	if (!new->name || !new->value)
 		goto err_free;
 
 	strcpy(new->value, target_path);
-	strcpy(new->value + target_path_len, label_path);
+	strcpy(new->value + target_path_len, symbol_path_tail);
 
 	of_property_set_flag(new, OF_DYNAMIC);
 
-- 
Frank Rowand <frank.rowand@sony.com>
