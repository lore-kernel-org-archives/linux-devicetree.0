From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: [PATCH 1/5] microblaze: Use of_find_compatible_node for timer and
Date: Fri,  9 Dec 2011 12:45:17 +0100
Message-ID: <1323431121-12780-1-git-send-email-monstr@monstr.eu>
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
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Calling of_find_compatible_node instead of calling private code
which does the same.

Signed-off-by: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
---
 arch/microblaze/kernel/intc.c  |   17 ++++-------------
 arch/microblaze/kernel/timer.c |   17 ++++-------------
 2 files changed, 8 insertions(+), 26 deletions(-)

diff --git a/arch/microblaze/kernel/intc.c b/arch/microblaze/kernel/intc.c
index eb41441..da33e45 100644
--- a/arch/microblaze/kernel/intc.c
+++ b/arch/microblaze/kernel/intc.c
@@ -99,7 +99,7 @@ unsigned int get_irq(struct pt_regs *regs)
 
 void __init init_IRQ(void)
 {
-	u32 i, j, intr_type;
+	u32 i, intr_type;
 	struct device_node *intc = NULL;
 #ifdef CONFIG_SELFMOD_INTC
 	unsigned int intc_baseaddr = 0;
@@ -113,16 +113,7 @@ void __init init_IRQ(void)
 				0
 			};
 #endif
-	const char * const intc_list[] = {
-				"xlnx,xps-intc-1.00.a",
-				NULL
-			};
-
-	for (j = 0; intc_list[j] != NULL; j++) {
-		intc = of_find_compatible_node(NULL, NULL, intc_list[j]);
-		if (intc)
-			break;
-	}
+	intc = of_find_compatible_node(NULL, NULL, "xlnx,xps-intc-1.00.a");
 	BUG_ON(!intc);
 
 	intc_baseaddr = be32_to_cpup(of_get_property(intc,
@@ -140,8 +131,8 @@ void __init init_IRQ(void)
 #ifdef CONFIG_SELFMOD_INTC
 	selfmod_function((int *) arr_func, intc_baseaddr);
 #endif
-	printk(KERN_INFO "%s #0 at 0x%08x, num_irq=%d, edge=0x%x\n",
-		intc_list[j], intc_baseaddr, nr_irq, intr_type);
+	printk(KERN_INFO "XPS intc #0 at 0x%08x, num_irq=%d, edge=0x%x\n",
+		intc_baseaddr, nr_irq, intr_mask);
 
 	/*
 	 * Disable all external interrupts until they are
diff --git a/arch/microblaze/kernel/timer.c b/arch/microblaze/kernel/timer.c
index af74b11..3ba1e1c 100644
--- a/arch/microblaze/kernel/timer.c
+++ b/arch/microblaze/kernel/timer.c
@@ -243,7 +243,7 @@ static int timer_initialized;
 
 void __init time_init(void)
 {
-	u32 irq, i = 0;
+	u32 irq;
 	u32 timer_num = 1;
 	struct device_node *timer = NULL;
 	const void *prop;
@@ -258,16 +258,7 @@ void __init time_init(void)
 				0
 			};
 #endif
-	const char * const timer_list[] = {
-		"xlnx,xps-timer-1.00.a",
-		NULL
-	};
-
-	for (i = 0; timer_list[i] != NULL; i++) {
-		timer = of_find_compatible_node(NULL, NULL, timer_list[i]);
-		if (timer)
-			break;
-	}
+	timer = of_find_compatible_node(NULL, NULL, "xlnx,xps-timer-1.00.a");
 	BUG_ON(!timer);
 
 	timer_baseaddr = be32_to_cpup(of_get_property(timer, "reg", NULL));
@@ -283,8 +274,8 @@ void __init time_init(void)
 #ifdef CONFIG_SELFMOD_TIMER
 	selfmod_function((int *) arr_func, timer_baseaddr);
 #endif
-	printk(KERN_INFO "%s #0 at 0x%08x, irq=%d\n",
-		timer_list[i], timer_baseaddr, irq);
+	printk(KERN_INFO "XPS timer #0 at 0x%08x, irq=%d\n",
+		timer_baseaddr, irq);
 
 	/* If there is clock-frequency property than use it */
 	prop = of_get_property(timer, "clock-frequency", NULL);
-- 
1.7.5.4
