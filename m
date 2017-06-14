From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/3] overlay: Add syntactic sugar version of overlays
Date: Wed, 14 Jun 2017 17:53:05 +0300
Message-ID: <1497451986-15515-3-git-send-email-pantelis.antoniou@konsulko.com>
References: <1497451986-15515-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1497451986-15515-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

For simple overlays that use a single target there exists a
simpler syntax version.

&foo { }; generates an overlay with a single target at foo.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 dtc-parser.y | 20 +++++++++++++++++---
 dtc.h        |  1 +
 livetree.c   | 22 ++++++++++++++++++++++
 3 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index ca3f500..affc81a 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -182,10 +182,19 @@ devicetree:
 		{
 			struct node *target = get_node_by_ref($1, $2);
 
-			if (target)
+			if (target) {
 				merge_nodes(target, $3);
-			else
-				ERROR(&@2, "Label or path %s not found", $2);
+			} else {
+				/*
+				 * We rely on the rule being always:
+				 *   versioninfo plugindecl memreserves devicetree
+				 * so $-1 is what we want (plugindecl)
+				 */
+				if ($<flags>-1 & DTSF_PLUGIN)
+					add_orphan_node($1, $3, $2);
+				else
+					ERROR(&@2, "Label or path %s not found", $2);
+			}
 			$$ = $1;
 		}
 	| devicetree DT_DEL_NODE DT_REF ';'
@@ -200,6 +209,11 @@ devicetree:
 
 			$$ = $1;
 		}
+	| /* empty */
+		{
+			/* build empty node */
+			$$ = name_node(build_node(NULL, NULL), "");
+		}
 	;
 
 nodedef:
diff --git a/dtc.h b/dtc.h
index fc24e17..1e70526 100644
--- a/dtc.h
+++ b/dtc.h
@@ -202,6 +202,7 @@ struct node *build_node_delete(void);
 struct node *name_node(struct node *node, char *name);
 struct node *chain_node(struct node *first, struct node *list);
 struct node *merge_nodes(struct node *old_node, struct node *new_node);
+void add_orphan_node(struct node *old_node, struct node *new_node, char *ref);
 
 void add_property(struct node *node, struct property *prop);
 void delete_property_by_name(struct node *node, char *name);
diff --git a/livetree.c b/livetree.c
index aecd278..a5d5676 100644
--- a/livetree.c
+++ b/livetree.c
@@ -216,6 +216,28 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 	return old_node;
 }
 
+void add_orphan_node(struct node *dt, struct node *new_node, char *ref)
+{
+	static unsigned int next_orphan_fragment = 0;
+	struct node *node;
+	struct property *p;
+	struct data d = empty_data;
+	char *name;
+
+	d = data_add_marker(d, REF_PHANDLE, ref);
+	d = data_append_integer(d, 0xffffffff, 32);
+
+	p = build_property("target", d);
+
+	xasprintf(&name, "fragment@%u",
+			next_orphan_fragment++);
+	name_node(new_node, "__overlay__");
+	node = build_node(p, new_node);
+	name_node(node, name);
+
+	add_child(dt, node);
+}
+
 struct node *chain_node(struct node *first, struct node *list)
 {
 	assert(first->next_sibling == NULL);
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
