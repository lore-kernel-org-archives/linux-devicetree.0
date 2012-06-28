From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] of: Allow #size-cells=0 in of_get_address()
Date: Thu, 28 Jun 2012 16:41:43 -0600
Message-ID: <1340923303-24826-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

It's quite legitimate for a DT node to specify #size-cells=0. Prevent
of_get_address() and of_get_pci_address() from failing in this case.

Note that almost all users of of_get_address() immediately call
of_translate_address(), which will trigger an error (and issue a
diagnostic) for this condition. However, I intend introduce a new use-
case in a future change where this is not true. See:
https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-June/016835.html

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/of/address.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 7e262a6..f206956 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -9,8 +9,8 @@
 
 /* Max address size we deal with */
 #define OF_MAX_ADDR_CELLS	4
-#define OF_CHECK_COUNTS(na, ns)	((na) > 0 && (na) <= OF_MAX_ADDR_CELLS && \
-			(ns) > 0)
+#define OF_CHECK_ADDR_COUNTS(na) ((na) > 0 && (na) <= OF_MAX_ADDR_CELLS)
+#define OF_CHECK_COUNTS(na, ns)	(OF_CHECK_ADDR_COUNTS(na) && (ns) > 0)
 
 static struct of_bus *of_match_bus(struct device_node *np);
 static int __of_address_to_resource(struct device_node *dev,
@@ -182,7 +182,7 @@ const __be32 *of_get_pci_address(struct device_node *dev, int bar_no, u64 *size,
 	}
 	bus->count_cells(dev, &na, &ns);
 	of_node_put(parent);
-	if (!OF_CHECK_COUNTS(na, ns))
+	if (!OF_CHECK_ADDR_COUNTS(na))
 		return NULL;
 
 	/* Get "reg" or "assigned-addresses" property */
@@ -506,7 +506,7 @@ const __be32 *of_get_address(struct device_node *dev, int index, u64 *size,
 	bus = of_match_bus(parent);
 	bus->count_cells(dev, &na, &ns);
 	of_node_put(parent);
-	if (!OF_CHECK_COUNTS(na, ns))
+	if (!OF_CHECK_ADDR_COUNTS(na))
 		return NULL;
 
 	/* Get "reg" or "assigned-addresses" property */
-- 
1.7.0.4
