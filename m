From: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Subject: [PATCH 2/3] OF: Add a allnodes pointer back to the tree
Date: Tue, 10 Dec 2013 16:13:52 +0200
Message-ID: <1386684833-24112-3-git-send-email-panto@antoniou-consulting.com>
References: <1386684833-24112-1-git-send-email-panto@antoniou-consulting.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386684833-24112-1-git-send-email-panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As it stands right now there's no way for a node to point back
to allnodes that the top level tree tracker for now.

This is problematic when using unflatten_dt_node more than once
because is leads to the nodes to be linked incorrectly.

Keep track of the root allnodes on each device_node and modify
unflaten_dt_node to match.

Signed-off-by: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
---
 drivers/of/base.c  |  1 +
 drivers/of/fdt.c   | 10 +++++++---
 include/linux/of.h |  1 +
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index a4f3dda..db0de86 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1791,6 +1791,7 @@ int of_attach_node(struct device_node *np)
 	np->allnext = of_allnodes;
 	np->parent->child = np;
 	of_allnodes = np;
+	np->allnodes = &of_allnodes;
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 
 	of_node_add(np);
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index d5d62cd..b09b1c2 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -145,6 +145,7 @@ static void *unflatten_dt_alloc(void **mem, unsigned long size,
  * @p: pointer to node in flat tree
  * @dad: Parent struct device_node
  * @allnextpp: pointer to ->allnext from last allocated device_node
+ * @mynodes: The device_node tree
  * @fpsize: Size of the node path up at the current depth.
  */
 static void * unflatten_dt_node(struct boot_param_header *blob,
@@ -152,6 +153,7 @@ static void * unflatten_dt_node(struct boot_param_header *blob,
 				void **p,
 				struct device_node *dad,
 				struct device_node ***allnextpp,
+				struct device_node **mynodes,
 				unsigned long fpsize)
 {
 	struct device_node *np;
@@ -327,6 +329,7 @@ static void * unflatten_dt_node(struct boot_param_header *blob,
 		if (!np->type)
 			np->type = "<NULL>";
 
+		np->allnodes = mynodes;
 		of_node_add(np);
 	}
 	while (tag == OF_DT_BEGIN_NODE || tag == OF_DT_NOP) {
@@ -334,7 +337,7 @@ static void * unflatten_dt_node(struct boot_param_header *blob,
 			*p += 4;
 		else
 			mem = unflatten_dt_node(blob, mem, p, np, allnextpp,
-						fpsize);
+						mynodes, fpsize);
 		tag = be32_to_cpup(*p);
 	}
 	if (tag != OF_DT_END_NODE) {
@@ -384,7 +387,8 @@ static void __unflatten_device_tree(struct boot_param_header *blob,
 
 	/* First pass, scan for size */
 	start = ((void *)blob) + be32_to_cpu(blob->off_dt_struct);
-	size = (unsigned long)unflatten_dt_node(blob, 0, &start, NULL, NULL, 0);
+	size = (unsigned long)unflatten_dt_node(blob, 0, &start, NULL, NULL,
+			mynodes, 0);
 	size = ALIGN(size, 4);
 
 	pr_debug("  size is %lx, allocating...\n", size);
@@ -399,7 +403,7 @@ static void __unflatten_device_tree(struct boot_param_header *blob,
 
 	/* Second pass, do actual unflattening */
 	start = ((void *)blob) + be32_to_cpu(blob->off_dt_struct);
-	unflatten_dt_node(blob, mem, &start, NULL, &allnextp, 0);
+	unflatten_dt_node(blob, mem, &start, NULL, &allnextp, mynodes, 0);
 	if (be32_to_cpup(start) != OF_DT_END)
 		pr_warning("Weird tag at end of tree: %08x\n", be32_to_cpup(start));
 	if (be32_to_cpup(mem + size) != 0xdeadbeef)
diff --git a/include/linux/of.h b/include/linux/of.h
index f285222..c5ca1f2 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -57,6 +57,7 @@ struct device_node {
 	struct	device_node *sibling;
 	struct	device_node *next;	/* next device of same type */
 	struct	device_node *allnext;	/* next in list of all nodes */
+	struct  device_node **allnodes;	/* pointer to the tree */
 	struct	kobject kobj;
 	unsigned long _flags;
 	void	*data;
-- 
1.7.12

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
