From: Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 2/3] of/irq: sparse fixes
Date: Mon, 8 Oct 2012 19:42:04 -0500
Message-ID: <20121008194204.fa666587adc7445ac580ddf3@freescale.com>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

drivers/of/irq.c:195:57: warning: restricted __be32 degrades to integer
drivers/of/irq.c:196:51: warning: restricted __be32 degrades to integer
drivers/of/irq.c:199:57: warning: restricted __be32 degrades to integer
drivers/of/irq.c:201:58: warning: restricted __be32 degrades to integer
drivers/of/irq.c:470:37: warning: incorrect type in assignment (different modifiers)
drivers/of/irq.c:470:37:    expected int ( *[usertype] irq_init_cb )( ... )
drivers/of/irq.c:470:37:    got void const *const data
drivers/of/irq.c:96:5: error: symbol 'of_irq_map_raw' redeclared with different type (originally declared at include/linux/of_irq.h:61) - incompatible argument 2 (different base types)

drivers/of/of_pci_irq.c:91:40: warning: incorrect type in argument 2 (different base types)
drivers/of/of_pci_irq.c:91:40:    expected unsigned int const [usertype] *intspec
drivers/of/of_pci_irq.c:91:40:    got restricted __be32 *<noident>
drivers/of/of_pci_irq.c:91:53: warning: incorrect type in argument 4 (different base types)
drivers/of/of_pci_irq.c:91:53:    expected unsigned int const [usertype] *addr
drivers/of/of_pci_irq.c:91:53:    got restricted __be32 *<noident>

Signed-off-by: Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/of/irq.c       | 8 +++++---
 include/linux/of_irq.h | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index a23ec77..a3c1c5a 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -192,11 +192,13 @@ int of_irq_map_raw(struct device_node *parent, const __be32 *intspec,
 			/* Compare specifiers */
 			match = 1;
 			for (i = 0; i < addrsize && match; ++i) {
-				u32 mask = imask ? imask[i] : 0xffffffffu;
+				__be32 mask = imask ? imask[i]
+						    : cpu_to_be32(0xffffffffu);
 				match = ((addr[i] ^ imap[i]) & mask) == 0;
 			}
 			for (; i < (addrsize + intsize) && match; ++i) {
-				u32 mask = imask ? imask[i] : 0xffffffffu;
+				__be32 mask = imask ? imask[i]
+						    : cpu_to_be32(0xffffffffu);
 				match =
 				   ((intspec[i-addrsize] ^ imap[i]) & mask) == 0;
 			}
@@ -465,7 +467,7 @@ void __init of_irq_init(const struct of_device_id *matches)
 			pr_debug("of_irq_init: init %s @ %p, parent %p\n",
 				 match->compatible,
 				 desc->dev, desc->interrupt_parent);
-			irq_init_cb = match->data;
+			irq_init_cb = (of_irq_init_cb_t)match->data;
 			ret = irq_init_cb(desc->dev, desc->interrupt_parent);
 			if (ret) {
 				kfree(desc);
diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index b8e2411..535cecf 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -58,8 +58,8 @@ static inline int of_irq_map_oldworld(struct device_node *device, int index,
 #endif /* CONFIG_PPC32 && CONFIG_PPC_PMAC */
 
 
-extern int of_irq_map_raw(struct device_node *parent, const u32 *intspec,
-			  u32 ointsize, const u32 *addr,
+extern int of_irq_map_raw(struct device_node *parent, const __be32 *intspec,
+			  u32 ointsize, const __be32 *addr,
 			  struct of_irq *out_irq);
 extern int of_irq_map_one(struct device_node *device, int index,
 			  struct of_irq *out_irq);
-- 
1.7.12.2
