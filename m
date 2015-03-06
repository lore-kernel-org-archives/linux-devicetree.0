From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v4 2/3] dtc: Plugin (object) device tree support.
Date: Fri, 06 Mar 2015 18:55:14 +0100
Message-ID: <1425664514.11054.150.camel@pengutronix.de>
References: <1425063346-14554-1-git-send-email-pantelis.antoniou@konsulko.com>
	 <1425063346-14554-3-git-send-email-pantelis.antoniou@konsulko.com>
	 <20150304233411.GJ18072@voom.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150304233411.GJ18072-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Do, 2015-03-05 at 10:34 +1100, David Gibson wrote:
> On Fri, Feb 27, 2015 at 08:55:45PM +0200, Pantelis Antoniou wrote:
> > Enables the generation of a __fixups__ node for trees compiled
> > using the -@ option that are using the /plugin/ tag.
> > 
> > The __fixups__ node make possible the dynamic resolution of phandle
> > references which are present in the plugin tree but lie in the
> > tree that are applying the overlay against.
> 
> It seems to me you've really missed an opportunity in designing the
> plugin syntax.  You have dtc generating the fixups nodes, but you
> still have to manually lay out your fragments in the right format,
> and 
> manually construct the target properties.  Instead you could re-use
> the existing dts overlay syntax.  For a plugin tree, you wouldn't need
> the base tree piece. So, allow something like:
> 
> /dts-v1/ /plugin/;
> 
> &res {
>         baz_res: baz_res { ... };
> };
> 
> &ocp {
>         baz { ... };
> };

During our initial experiments with overlays in Barebox, Sascha Hauer
did a simple patch to DTC to implement this. I've recently rebased it on
Pantelis' series. It makes writing overlays much more natural:

>From e7082dd7160082c64d242b4ed2ebb9eb0b8aad42 Mon Sep 17 00:00:00 2001
From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Date: Thu, 8 Aug 2013 23:08:31 +0200
Subject: [PATCH] dtc: convert unresolved labels into overlay nodes

Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 dtc-parser.y | 10 +++++++---
 dtc.h        |  3 ++-
 livetree.c   | 23 +++++++++++++++++++++++
 3 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index d23927d99215..f431bdd6e57c 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -172,10 +172,14 @@ devicetree:
 		{
 			struct node *target = get_node_by_ref($1, $2);
 
-			if (target)
+			if (target) {
 				merge_nodes(target, $3);
-			else
-				ERROR(&@2, "Label or path %s not found", $2);
+			} else {
+				if (symbol_fixup_support)
+					add_orphan_node($1, $3, $2);
+				else
+					ERROR(&@2, "Label or path %s not found", $2);
+			}
 			$$ = $1;
 		}
 	| devicetree DT_DEL_NODE DT_REF ';'
diff --git a/dtc.h b/dtc.h
index f163b22b14b8..fc7330e9013e 100644
--- a/dtc.h
+++ b/dtc.h
@@ -20,7 +20,7 @@
  *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
  *                                                                   USA
  */
-
+#define _GNU_SOURCE
 #include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
@@ -234,6 +234,7 @@ struct node *build_node_delete(void);
 struct node *name_node(struct node *node, char *name);
 struct node *chain_node(struct node *first, struct node *list);
 struct node *merge_nodes(struct node *old_node, struct node *new_node);
+void add_orphan_node(struct node *old_node, struct node *new_node, char *ref);
 
 void add_property(struct node *node, struct property *prop);
 void delete_property_by_name(struct node *node, char *name);
diff --git a/livetree.c b/livetree.c
index e229b84432f9..ed16b8c216f4 100644
--- a/livetree.c
+++ b/livetree.c
@@ -216,6 +216,29 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 	return old_node;
 }
 
+void add_orphan_node(struct node *dt, struct node *new_node, char *ref)
+{
+	struct node *ovl = xmalloc(sizeof(*ovl));
+	struct property *p;
+	struct data d = empty_data;
+	char *name;
+
+	memset(ovl, 0, sizeof(*ovl));
+
+	d = data_add_marker(d, REF_PHANDLE, ref);
+	d = data_append_integer(d, 0xdeadbeef, 32);
+
+	p = build_property("target", d);
+	add_property(ovl, p);
+
+	asprintf(&name, "fragment@%s", ref);
+	name_node(ovl, name);
+	name_node(new_node, "__overlay__");
+
+	add_child(dt, ovl);
+	add_child(ovl, new_node);
+}
+
 struct node *chain_node(struct node *first, struct node *list)
 {
 	assert(first->next_sibling == NULL);
-- 
2.1.4



-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
