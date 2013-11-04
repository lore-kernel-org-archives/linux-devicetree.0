From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] dtc: Dynamic symbols & fixup support (v2)
Date: Mon, 4 Nov 2013 15:53:42 +0100
Message-ID: <20131104145342.GW24559@pengutronix.de>
References: <1383575773-7296-1-git-send-email-panto@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1383575773-7296-1-git-send-email-panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Pantelis,

Thank you for working on this again. I would really appreciate seeing
this upstream.

On Mon, Nov 04, 2013 at 04:36:13PM +0200, Pantelis Antoniou wrote:
> +Notice that all the nodes that had a label have been recorded, and that
> +phandles have been generated for them.
> +
> +This blob can be used to boot the board normally, the __symbols__ node will
> +be safely ignored both by the bootloader and the kernel (the only loss will
> +be a few bytes of memory and disk space).
> +
> +3.b) The Device Tree fragments must be compiled with the same option but they
> +must also have a tag (/plugin/) that allows undefined references to labels
> +that are not present at compilation time to be recorded so that the runtime
> +loader can fix them.
> +
> +So the bar peripheral's DTS format would be of the form:
> +
> +/plugin/;	/* allow undefined label references and record them */
> +/ {
> +	....	/* various properties for loader use; i.e. part id etc. */
> +	fragment@0 {
> +		target = <&ocp>;
> +		__overlay__ {
> +			/* bar peripheral */
> +			bar {
> +				compatible = "corp,bar";
> +				... /* various properties and child nodes */
> +			}
> +		};
> +	};
> +};

When last looking at this patch I created the attached follow up. What
I didn't like about this patch is that we currently have to write dts
files explicitely as overlays. With the attached patch the above could
be written as:

&ocp: {
	compatible = "corp,bar";
};

This is easier to write and more important a dts snippet could be either
compiled into a dtb or used as an overlay.

Sascha

8<-------------------------------------------------------------------

>From bf78934e2bfe5c220d97d52e4effdd95164e071f Mon Sep 17 00:00:00 2001
From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Date: Thu, 8 Aug 2013 23:08:31 +0200
Subject: [PATCH] dtc: convert unresolved labels into overlay nodes

Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 dtc-parser.y | 10 +++++++---
 dtc.h        |  3 ++-
 livetree.c   | 23 +++++++++++++++++++++++
 3 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index e444acf..db1e9f8 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -166,10 +166,14 @@ devicetree:
 		{
 			struct node *target = get_node_by_ref($1, $2);
 
-			if (target)
+			if (target) {
 				merge_nodes(target, $3);
-			else
-				print_error("label or path, '%s', not found", $2);
+			} else {
+				if (symbol_fixup_support)
+					add_orphan_node($1, $3, $2);
+				else
+					print_error("label or path, '%s', not found", $2);
+			}
 			$$ = $1;
 		}
 	| devicetree DT_DEL_NODE DT_REF ';'
diff --git a/dtc.h b/dtc.h
index 8c9059b..147ab35 100644
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
@@ -232,6 +232,7 @@ struct node *build_node_delete(void);
 struct node *name_node(struct node *node, char *name);
 struct node *chain_node(struct node *first, struct node *list);
 struct node *merge_nodes(struct node *old_node, struct node *new_node);
+void add_orphan_node(struct node *old_node, struct node *new_node, char *ref);
 
 void add_property(struct node *node, struct property *prop);
 void delete_property_by_name(struct node *node, char *name);
diff --git a/livetree.c b/livetree.c
index b61465f..cc26fe1 100644
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
1.8.4.rc3

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
