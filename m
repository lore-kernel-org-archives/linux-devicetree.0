From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 2/2] of/crypto: n2_core: fix build breakage
Date: Thu,  3 Jun 2010 06:03:47 +0200
Message-ID: <1275537827-28921-2-git-send-email-w.sang@pengutronix.de>
References: <AANLkTikNcAvyHf1yHPweNBVSCSPNmq-JaEOgYW2FYUGJ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTikNcAvyHf1yHPweNBVSCSPNmq-JaEOgYW2FYUGJ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Cc: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 drivers/crypto/n2_core.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/n2_core.c b/drivers/crypto/n2_core.c
index 8566be8..3f813d3 100644
--- a/drivers/crypto/n2_core.c
+++ b/drivers/crypto/n2_core.c
@@ -1398,7 +1398,7 @@ static int find_devino_index(struct of_device *dev, struct spu_mdesc_info *ip,
 
 	intr = ip->ino_table[i].intr;
 
-	dev_intrs = of_get_property(dev->node, "interrupts", NULL);
+	dev_intrs = of_get_property(dev->dev.of_node, "interrupts", NULL);
 	if (!dev_intrs)
 		return -ENODEV;
 
@@ -1574,7 +1574,7 @@ static int spu_mdesc_walk_arcs(struct mdesc_handle *mdesc,
 		id = mdesc_get_property(mdesc, tgt, "id", NULL);
 		if (table[*id] != NULL) {
 			dev_err(&dev->dev, "%s: SPU cpu slot already set.\n",
-				dev->node->full_name);
+				dev->dev.of_node->full_name);
 			return -EINVAL;
 		}
 		cpu_set(*id, p->sharing);
@@ -1595,7 +1595,7 @@ static int handle_exec_unit(struct spu_mdesc_info *ip, struct list_head *list,
 	p = kzalloc(sizeof(struct spu_queue), GFP_KERNEL);
 	if (!p) {
 		dev_err(&dev->dev, "%s: Could not allocate SPU queue.\n",
-			dev->node->full_name);
+			dev->dev.of_node->full_name);
 		return -ENOMEM;
 	}
 
@@ -1684,7 +1684,7 @@ static int __devinit grab_mdesc_irq_props(struct mdesc_handle *mdesc,
 	const unsigned int *reg;
 	u64 node;
 
-	reg = of_get_property(dev->node, "reg", NULL);
+	reg = of_get_property(dev->dev.of_node, "reg", NULL);
 	if (!reg)
 		return -ENODEV;
 
@@ -1836,7 +1836,7 @@ static int __devinit n2_crypto_probe(struct of_device *dev,
 
 	n2_spu_driver_version();
 
-	full_name = dev->node->full_name;
+	full_name = dev->dev.of_node->full_name;
 	pr_info("Found N2CP at %s\n", full_name);
 
 	np = alloc_n2cp();
@@ -1948,7 +1948,7 @@ static int __devinit n2_mau_probe(struct of_device *dev,
 
 	n2_spu_driver_version();
 
-	full_name = dev->node->full_name;
+	full_name = dev->dev.of_node->full_name;
 	pr_info("Found NCP at %s\n", full_name);
 
 	mp = alloc_ncp();
-- 
1.7.0
