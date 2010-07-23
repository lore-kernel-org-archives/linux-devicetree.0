From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH v2 1/2] of: Fix phandle endian issues
Date: Fri, 23 Jul 2010 17:05:09 -0600
Message-ID: <20100723230437.28579.19577.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The flat tree code wasn't fixing the endianness on phandle values when
unflattening the tree, and the code in drivers/of wasn't always doing a
be32_to_cpu before trying to dereference the phandle values.  This patch
fixes them.

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
changed in v2: fixed up reference in drivers/of/irq.c too

 drivers/of/base.c |   12 ++++++------
 drivers/of/fdt.c  |    4 ++--
 drivers/of/irq.c  |    6 +++---
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index e3f7af8..aa80525 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -605,14 +605,14 @@ EXPORT_SYMBOL(of_find_node_by_phandle);
 struct device_node *
 of_parse_phandle(struct device_node *np, const char *phandle_name, int index)
 {
-	const phandle *phandle;
+	const __be32 *phandle;
 	int size;
 
 	phandle = of_get_property(np, phandle_name, &size);
 	if ((!phandle) || (size < sizeof(*phandle) * (index + 1)))
 		return NULL;
 
-	return of_find_node_by_phandle(phandle[index]);
+	return of_find_node_by_phandle(be32_to_cpup(phandle + index));
 }
 EXPORT_SYMBOL(of_parse_phandle);
 
@@ -668,16 +668,16 @@ int of_parse_phandles_with_args(struct device_node *np, const char *list_name,
 
 	while (list < list_end) {
 		const __be32 *cells;
-		const phandle *phandle;
+		phandle phandle;
 
-		phandle = list++;
+		phandle = be32_to_cpup(list++);
 		args = list;
 
 		/* one cell hole in the list = <>; */
-		if (!*phandle)
+		if (!phandle)
 			goto next;
 
-		node = of_find_node_by_phandle(*phandle);
+		node = of_find_node_by_phandle(phandle);
 		if (!node) {
 			pr_debug("%s: could not find phandle\n",
 				 np->full_name);
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index d61fda8..f3a7b4f 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -320,13 +320,13 @@ unsigned long __init unflatten_dt_node(unsigned long mem,
 			if ((strcmp(pname, "phandle") == 0) ||
 			    (strcmp(pname, "linux,phandle") == 0)) {
 				if (np->phandle == 0)
-					np->phandle = *((u32 *)*p);
+					np->phandle = be32_to_cpup((__be32*)*p);
 			}
 			/* And we process the "ibm,phandle" property
 			 * used in pSeries dynamic device tree
 			 * stuff */
 			if (strcmp(pname, "ibm,phandle") == 0)
-				np->phandle = *((u32 *)*p);
+				np->phandle = be32_to_cpup((__be32 *)*p);
 			pp->name = pname;
 			pp->length = sz;
 			pp->value = (void *)*p;
diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 6cfb307..65cfae1 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -54,7 +54,7 @@ EXPORT_SYMBOL_GPL(irq_of_parse_and_map);
 static struct device_node *of_irq_find_parent(struct device_node *child)
 {
 	struct device_node *p;
-	const phandle *parp;
+	const __be32 *parp;
 
 	if (!of_node_get(child))
 		return NULL;
@@ -67,7 +67,7 @@ static struct device_node *of_irq_find_parent(struct device_node *child)
 			if (of_irq_workarounds & OF_IMAP_NO_PHANDLE)
 				p = of_node_get(of_irq_dflt_pic);
 			else
-				p = of_find_node_by_phandle(*parp);
+				p = of_find_node_by_phandle(be32_to_cpup(parp));
 		}
 		of_node_put(child);
 		child = p;
@@ -206,7 +206,7 @@ int of_irq_map_raw(struct device_node *parent, const u32 *intspec, u32 ointsize,
 			if (of_irq_workarounds & OF_IMAP_NO_PHANDLE)
 				newpar = of_node_get(of_irq_dflt_pic);
 			else
-				newpar = of_find_node_by_phandle((phandle)*imap);
+				newpar = of_find_node_by_phandle(be32_to_cpup(imap));
 			imap++;
 			--imaplen;
