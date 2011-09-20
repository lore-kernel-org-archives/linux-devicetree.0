From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/3] of/irq: of_irq_find_parent: check for parent equal to
	child
Date: Tue, 20 Sep 2011 15:24:02 -0500
Message-ID: <1316550244-3655-2-git-send-email-robherring2@gmail.com>
References: <1316550244-3655-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1316550244-3655-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

An interrupt controller may often implicitly inherit itself from a parent
node when in fact the controller is the interrupt root controller. Guard
against the case of child == parent and return NULL in this case.

This can also be fixed by adding an explicit "interrupt-parent;" to a root
interrupt controller node.

Based on code from Grant Likely.

Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 drivers/of/irq.c |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 9f689f1..6a5b5e7 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -58,27 +58,27 @@ EXPORT_SYMBOL_GPL(irq_of_parse_and_map);
  */
 struct device_node *of_irq_find_parent(struct device_node *child)
 {
-	struct device_node *p;
+	struct device_node *p, *c = child;
 	const __be32 *parp;
 
-	if (!of_node_get(child))
+	if (!of_node_get(c))
 		return NULL;
 
 	do {
-		parp = of_get_property(child, "interrupt-parent", NULL);
+		parp = of_get_property(c, "interrupt-parent", NULL);
 		if (parp == NULL)
-			p = of_get_parent(child);
+			p = of_get_parent(c);
 		else {
 			if (of_irq_workarounds & OF_IMAP_NO_PHANDLE)
 				p = of_node_get(of_irq_dflt_pic);
 			else
 				p = of_find_node_by_phandle(be32_to_cpup(parp));
 		}
-		of_node_put(child);
-		child = p;
+		of_node_put(c);
+		c = p;
 	} while (p && of_get_property(p, "#interrupt-cells", NULL) == NULL);
 
-	return p;
+	return (p == child) ? NULL : p;
 }
 
 /**
-- 
1.7.5.4
