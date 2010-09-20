From: Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 5/7] Samsung: SMDKV210: Init Timer Using Device tree
Date: Mon, 20 Sep 2010 15:49:57 +0530
Message-ID: <1284977997-30807-1-git-send-email-shaju.abraham@linaro.org>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Get the irq number and virtual address to be used from the
device tree. Initialise the timer using these parameters.

Signed-off-by: Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/plat-s5p/irq_dt.c |   29 +++++++++++++++++++++++------
 1 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/arch/arm/plat-s5p/irq_dt.c b/arch/arm/plat-s5p/irq_dt.c
index 2fca196..317348f 100644
--- a/arch/arm/plat-s5p/irq_dt.c
+++ b/arch/arm/plat-s5p/irq_dt.c
@@ -58,7 +58,28 @@ static struct s3c_uart_irq uart_irqs[] = {
 	},
 #endif
 };
+int s5p_dt_init_vic_timer_irq(void)
+{
+	struct device_node *node;
+	int err = -ENODEV, irq = 0;
+	const u32 *prop;
+	u32 virt_irq = 0;
 
+	for_each_compatible_node(node, NULL , "samsung,s5p-timer") {
+		prop = of_get_property(node, "interrupts", NULL);
+		if (prop == NULL) {
+			printk(KERN_ERR "No Irq defined for %s timer\n",
+				node->name);
+			return err;
+		}
+		irq = of_read_ulong(prop, 1);
+		s3c_init_vic_timer_irq(S5P_IRQ_VIC0(irq),
+					S5P_TIMER_IRQ(virt_irq));
+		virt_irq++;
+	}
+	of_node_put(node);
+	return 0;
+}
 
 static int __init s5p_dt_vic_init(void)
 {
@@ -88,11 +109,7 @@ void __init s5p_dt_init_irq(void)
 
 	/* initialize the VICs */
 	s5p_dt_vic_init();
-	s3c_init_vic_timer_irq(IRQ_TIMER0_VIC, IRQ_TIMER0);
-	s3c_init_vic_timer_irq(IRQ_TIMER1_VIC, IRQ_TIMER1);
-	s3c_init_vic_timer_irq(IRQ_TIMER2_VIC, IRQ_TIMER2);
-	s3c_init_vic_timer_irq(IRQ_TIMER3_VIC, IRQ_TIMER3);
-	s3c_init_vic_timer_irq(IRQ_TIMER4_VIC, IRQ_TIMER4);
-
+	if (s5p_dt_init_vic_timer_irq())
+		printk(KERN_ERR"s5p_dt Timer init Failed\n");
 	s3c_init_uart_irqs(uart_irqs, ARRAY_SIZE(uart_irqs));
 }
-- 
1.7.2
