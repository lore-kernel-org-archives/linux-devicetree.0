From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [resend] Make the kernel accept ePAPR style phandle information
Date: Mon, 1 Feb 2010 15:52:42 +1100
Message-ID: <20100201045242.GB8095@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Grant, I've updated this for your current test-devicetree branch.
Please apply.

Currently when processing flattened device trees, the kernel expects
the phandle in a property called "linux,phandle".  The ePAPR spec -
not being Linux specific - instead requires phandles to be encoded in
a property named simply "phandle".  This patch makes the kernel accept
either form when unflattening the device tree.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Index: working-2.6/drivers/of/fdt.c
===================================================================
--- working-2.6.orig/drivers/of/fdt.c	2010-02-01 15:51:44.000000000 +1100
+++ working-2.6/drivers/of/fdt.c	2010-02-01 15:51:46.458557615 +1100
@@ -310,10 +310,19 @@ unsigned long __init unflatten_dt_node(u
 		pp = unflatten_dt_alloc(&mem, sizeof(struct property),
 					__alignof__(struct property));
 		if (allnextpp) {
-			if (strcmp(pname, "linux,phandle") == 0) {
+			/* We accept flattened tree phandles either in
+			 * ePAPR-style "phandle" properties, or the
+			 * legacy "linux,phandle" properties.  If both
+			 * appear and have different values, things
+			 * will get weird.  Don't do that. */
+			if ((strcmp(pname, "phandle") == 0)
+			    || (strcmp(pname, "linux,phandle") == 0)) {
 				if (np->phandle == 0)
 					np->phandle = *((u32 *)*p);
 			}
+			/* And we process the "ibm,phandle" property
+			 * used in pSeries dynamic device tree
+			 * stuff */
 			if (strcmp(pname, "ibm,phandle") == 0)
 				np->phandle = *((u32 *)*p);
 			pp->name = pname;

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
