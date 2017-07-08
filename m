From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 1/2] of: irq: use of_property_read_bool() for "interrupt-controller" prop
Date: Sat, 08 Jul 2017 23:29:51 +0300
Message-ID: <20170708203318.045262932@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline; filename=of-irq-use-of_property_read_bool-for-interrupt-controller-prop.patch
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The "interrupt-controller" property is boolean, i.e. has no value.  The DT
interrupt parsing code predates of_property_read_bool(), so it uses either
of_get_property() or of_find_property() -- the former isn't quite correct
for the boolean props (but works somehow). Use the modern boolean prop API
instead.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
 drivers/of/irq.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

Index: linux/drivers/of/irq.c
===================================================================
--- linux.orig/drivers/of/irq.c
+++ linux/drivers/of/irq.c
@@ -169,8 +169,7 @@ int of_irq_parse_raw(const __be32 *addr,
 		/* Now check if cursor is an interrupt-controller and if it is
 		 * then we are done
 		 */
-		if (of_get_property(ipar, "interrupt-controller", NULL) !=
-				NULL) {
+		if (of_property_read_bool(ipar, "interrupt-controller")) {
 			pr_debug(" -> got it !\n");
 			return 0;
 		}
@@ -508,7 +507,7 @@ void __init of_irq_init(const struct of_
 	INIT_LIST_HEAD(&intc_parent_list);
 
 	for_each_matching_node_and_match(np, matches, &match) {
-		if (!of_find_property(np, "interrupt-controller", NULL) ||
+		if (!of_property_read_bool(np, "interrupt-controller") ||
 				!of_device_is_available(np))
 			continue;
 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
