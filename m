From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: [PATCH 2/5] microblaze: intc: Change variable name
Date: Fri,  9 Dec 2011 12:45:18 +0100
Message-ID: <1323431121-12780-2-git-send-email-monstr@monstr.eu>
References: <1323431121-12780-1-git-send-email-monstr@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1323431121-12780-1-git-send-email-monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

intr_type is mask - change name.
s/intr_type/intr_mask/g

Signed-off-by: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
---
 arch/microblaze/kernel/intc.c |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/microblaze/kernel/intc.c b/arch/microblaze/kernel/intc.c
index da33e45..1293098 100644
--- a/arch/microblaze/kernel/intc.c
+++ b/arch/microblaze/kernel/intc.c
@@ -99,7 +99,7 @@ unsigned int get_irq(struct pt_regs *regs)
 
 void __init init_IRQ(void)
 {
-	u32 i, intr_type;
+	u32 i, intr_mask;
 	struct device_node *intc = NULL;
 #ifdef CONFIG_SELFMOD_INTC
 	unsigned int intc_baseaddr = 0;
@@ -122,10 +122,9 @@ void __init init_IRQ(void)
 	nr_irq = be32_to_cpup(of_get_property(intc,
 						"xlnx,num-intr-inputs", NULL));
 
-	intr_type =
-		be32_to_cpup(of_get_property(intc,
-						"xlnx,kind-of-intr", NULL));
-	if (intr_type > (u32)((1ULL << nr_irq) - 1))
+	intr_mask =
+		be32_to_cpup(of_get_property(intc, "xlnx,kind-of-intr", NULL));
+	if (intr_mask > (u32)((1ULL << nr_irq) - 1))
 		printk(KERN_INFO " ERROR: Mismatch in kind-of-intr param\n");
 
 #ifdef CONFIG_SELFMOD_INTC
@@ -147,7 +146,7 @@ void __init init_IRQ(void)
 	out_be32(intc_baseaddr + MER, MER_HIE | MER_ME);
 
 	for (i = 0; i < nr_irq; ++i) {
-		if (intr_type & (0x00000001 << i)) {
+		if (intr_mask & (0x00000001 << i)) {
 			irq_set_chip_and_handler_name(i, &intc_dev,
 				handle_edge_irq, "edge");
 			irq_clear_status_flags(i, IRQ_LEVEL);
-- 
1.7.5.4
