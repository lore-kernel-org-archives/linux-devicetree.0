From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 2/5] of/microblaze: strip out of_irq_workarounds code
Date: Fri, 04 Jun 2010 15:21:40 -0600
Message-ID: <20100604212139.10552.13637.stgit@angua>
References: <20100604212134.10552.70717.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100604212134.10552.70717.stgit@angua>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Microblaze doesn't have any legacy workaround in the device tree irq
mapping data.  All of the of_irq_workarounds stuff can be dropped

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
CC: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
CC: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
CC: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org
CC: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
---
 arch/microblaze/include/asm/prom.h  |   13 --------
 arch/microblaze/kernel/prom_parse.c |   58 ++---------------------------------
 2 files changed, 3 insertions(+), 68 deletions(-)

diff --git a/arch/microblaze/include/asm/prom.h b/arch/microblaze/include/asm/prom.h
index e9fb2eb..da7069c 100644
--- a/arch/microblaze/include/asm/prom.h
+++ b/arch/microblaze/include/asm/prom.h
@@ -94,19 +94,6 @@ extern const void *of_get_mac_address(struct device_node *np);
  */
 
 /**
- * of_irq_map_init - Initialize the irq remapper
- * @flags:	flags defining workarounds to enable
- *
- * Some machines have bugs in the device-tree which require certain workarounds
- * to be applied. Call this before any interrupt mapping attempts to enable
- * those workarounds.
- */
-#define OF_IMAP_OLDWORLD_MAC	0x00000001
-#define OF_IMAP_NO_PHANDLE	0x00000002
-
-extern void of_irq_map_init(unsigned int flags);
-
-/**
  * of_irq_map_raw - Low level interrupt tree parsing
  * @parent:	the device interrupt parent
  * @intspec:	interrupt specifier ("interrupts" property of the device)
diff --git a/arch/microblaze/kernel/prom_parse.c b/arch/microblaze/kernel/prom_parse.c
index bf7e6c2..af1b2a7 100644
--- a/arch/microblaze/kernel/prom_parse.c
+++ b/arch/microblaze/kernel/prom_parse.c
@@ -648,9 +648,6 @@ void of_parse_dma_window(struct device_node *dn, const void *dma_window_prop,
  * Interrupt remapper
  */
 
-static unsigned int of_irq_workarounds;
-static struct device_node *of_irq_dflt_pic;
-
 static struct device_node *of_irq_find_parent(struct device_node *child)
 {
 	struct device_node *p;
@@ -663,12 +660,8 @@ static struct device_node *of_irq_find_parent(struct device_node *child)
 		parp = of_get_property(child, "interrupt-parent", NULL);
 		if (parp == NULL)
 			p = of_get_parent(child);
-		else {
-			if (of_irq_workarounds & OF_IMAP_NO_PHANDLE)
-				p = of_node_get(of_irq_dflt_pic);
-			else
-				p = of_find_node_by_phandle(*parp);
-		}
+		else
+			p = of_find_node_by_phandle(*parp);
 		of_node_put(child);
 		child = p;
 	} while (p && of_get_property(p, "#interrupt-cells", NULL) == NULL);
@@ -676,47 +669,6 @@ static struct device_node *of_irq_find_parent(struct device_node *child)
 	return p;
 }
 
-/* This doesn't need to be called if you don't have any special workaround
- * flags to pass
- */
-void of_irq_map_init(unsigned int flags)
-{
-	of_irq_workarounds = flags;
-
-	/* OldWorld, don't bother looking at other things */
-	if (flags & OF_IMAP_OLDWORLD_MAC)
-		return;
-
-	/* If we don't have phandles, let's try to locate a default interrupt
-	 * controller (happens when booting with BootX). We do a first match
-	 * here, hopefully, that only ever happens on machines with one
-	 * controller.
-	 */
-	if (flags & OF_IMAP_NO_PHANDLE) {
-		struct device_node *np;
-
-		for (np = NULL; (np = of_find_all_nodes(np)) != NULL;) {
-			if (of_get_property(np, "interrupt-controller", NULL)
-				== NULL)
-				continue;
-			/* Skip /chosen/interrupt-controller */
-			if (strcmp(np->name, "chosen") == 0)
-				continue;
-			/* It seems like at least one person on this planet
-			 * wants to use BootX on a machine with an AppleKiwi
-			 * controller which happens to pretend to be an
-			 * interrupt controller too.
-			 */
-			if (strcmp(np->name, "AppleKiwi") == 0)
-				continue;
-			/* I think we found one ! */
-			of_irq_dflt_pic = np;
-			break;
-		}
-	}
-
-}
-
 int of_irq_map_raw(struct device_node *parent, const u32 *intspec, u32 ointsize,
 		const u32 *addr, struct of_irq *out_irq)
 {
@@ -831,11 +783,7 @@ int of_irq_map_raw(struct device_node *parent, const u32 *intspec, u32 ointsize,
 			pr_debug(" -> match=%d (imaplen=%d)\n", match, imaplen);
 
 			/* Get the interrupt parent */
-			if (of_irq_workarounds & OF_IMAP_NO_PHANDLE)
-				newpar = of_node_get(of_irq_dflt_pic);
-			else
-				newpar =
-					of_find_node_by_phandle((phandle)*imap);
+			newpar = of_find_node_by_phandle((phandle)*imap);
 			imap++;
 			--imaplen;
