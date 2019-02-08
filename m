From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 16/33] ARM: davinci: aintc: use the new config structure
Date: Fri,  8 Feb 2019 18:34:41 +0100
Message-ID: <20190208173458.4801-17-brgl@bgdev.pl>
References: <20190208173458.4801-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190208173458.4801-1-brgl@bgdev.pl>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, David Lechner <david@lechnology.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Modify the aintc driver to take all its configuration from the new
config structure. Stop referencing davinci_soc_info in any way.
Move the declaration for davinci_aintc_init() to irq-davinci-aintc.h
and make it take the new config structure as parameter. Convert all
users to the new version.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: David Lechner <david@lechnology.com>
---
 arch/arm/mach-davinci/dm355.c               |  2 +-
 arch/arm/mach-davinci/dm365.c               |  2 +-
 arch/arm/mach-davinci/dm644x.c              |  2 +-
 arch/arm/mach-davinci/dm646x.c              |  2 +-
 arch/arm/mach-davinci/include/mach/common.h |  2 --
 arch/arm/mach-davinci/irq.c                 | 39 +++++++++++----------
 include/linux/irqchip/irq-davinci-aintc.h   |  2 ++
 7 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/arch/arm/mach-davinci/dm355.c b/arch/arm/mach-davinci/dm355.c
index ff79c1a17fae..c7cd765114af 100644
--- a/arch/arm/mach-davinci/dm355.c
+++ b/arch/arm/mach-davinci/dm355.c
@@ -805,7 +805,7 @@ static const struct davinci_aintc_config dm355_aintc_config = {
 
 void __init dm355_init_irq(void)
 {
-	davinci_aintc_init();
+	davinci_aintc_init(&dm355_aintc_config);
 }
 
 static int __init dm355_init_devices(void)
diff --git a/arch/arm/mach-davinci/dm365.c b/arch/arm/mach-davinci/dm365.c
index 44dc3ca94dd3..bde3c3b94cc9 100644
--- a/arch/arm/mach-davinci/dm365.c
+++ b/arch/arm/mach-davinci/dm365.c
@@ -1064,7 +1064,7 @@ static const struct davinci_aintc_config dm365_aintc_config = {
 
 void __init dm365_init_irq(void)
 {
-	davinci_aintc_init();
+	davinci_aintc_init(&dm365_aintc_config);
 }
 
 static int __init dm365_init_devices(void)
diff --git a/arch/arm/mach-davinci/dm644x.c b/arch/arm/mach-davinci/dm644x.c
index 0b0ecac36486..6d3498058283 100644
--- a/arch/arm/mach-davinci/dm644x.c
+++ b/arch/arm/mach-davinci/dm644x.c
@@ -741,7 +741,7 @@ static const struct davinci_aintc_config dm644x_aintc_config = {
 
 void __init dm644x_init_irq(void)
 {
-	davinci_aintc_init();
+	davinci_aintc_init(&dm644x_aintc_config);
 }
 
 void __init dm644x_init_devices(void)
diff --git a/arch/arm/mach-davinci/dm646x.c b/arch/arm/mach-davinci/dm646x.c
index 4e871d00e4e9..a0a8b336c1a4 100644
--- a/arch/arm/mach-davinci/dm646x.c
+++ b/arch/arm/mach-davinci/dm646x.c
@@ -702,7 +702,7 @@ static const struct davinci_aintc_config dm646x_aintc_config = {
 
 void __init dm646x_init_irq(void)
 {
-	davinci_aintc_init();
+	davinci_aintc_init(&dm646x_aintc_config);
 }
 
 static int __init dm646x_init_devices(void)
diff --git a/arch/arm/mach-davinci/include/mach/common.h b/arch/arm/mach-davinci/include/mach/common.h
index 8c9c011f96f6..14e0e1c40611 100644
--- a/arch/arm/mach-davinci/include/mach/common.h
+++ b/arch/arm/mach-davinci/include/mach/common.h
@@ -24,8 +24,6 @@
 
 void davinci_timer_init(struct clk *clk);
 
-extern void davinci_aintc_init(void);
-
 struct davinci_timer_instance {
 	u32		base;
 	u32		bottom_irq;
diff --git a/arch/arm/mach-davinci/irq.c b/arch/arm/mach-davinci/irq.c
index 6a7205a844e1..f5578abfc0aa 100644
--- a/arch/arm/mach-davinci/irq.c
+++ b/arch/arm/mach-davinci/irq.c
@@ -8,6 +8,7 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/irqchip/irq-davinci-aintc.h>
 #include <linux/io.h>
 #include <linux/irqdomain.h>
 
@@ -82,13 +83,14 @@ davinci_aintc_handle_irq(struct pt_regs *regs)
 }
 
 /* ARM Interrupt Controller Initialization */
-void __init davinci_aintc_init(void)
+void __init davinci_aintc_init(const struct davinci_aintc_config *config)
 {
-	unsigned i, j;
-	const u8 *davinci_def_priorities = davinci_soc_info.intc_irq_prios;
+	unsigned int irq_off, reg_off, prio, shift;
 	int rv, irq_base;
+	const u8 *prios;
 
-	davinci_aintc_base = ioremap(davinci_soc_info.intc_base, SZ_4K);
+	davinci_aintc_base = ioremap(config->reg.start,
+				     resource_size(&config->reg));
 	if (WARN_ON(!davinci_aintc_base))
 		return;
 
@@ -114,23 +116,21 @@ void __init davinci_aintc_init(void)
 	davinci_aintc_writel(~0x0, DAVINCI_AINTC_IRQ_REG0);
 	davinci_aintc_writel(~0x0, DAVINCI_AINTC_IRQ_REG1);
 
-	for (i = DAVINCI_AINTC_IRQ_INTPRI0_REG;
-	     i <= DAVINCI_AINTC_IRQ_INTPRI7_REG; i += 4) {
-		u32		pri;
-
-		for (j = 0, pri = 0; j < 32; j += 4, davinci_def_priorities++)
-			pri |= (*davinci_def_priorities & 0x07) << j;
-		davinci_aintc_writel(pri, i);
+	prios = config->prios;
+	for (reg_off = DAVINCI_AINTC_IRQ_INTPRI0_REG;
+	     reg_off <= DAVINCI_AINTC_IRQ_INTPRI7_REG; reg_off += 4) {
+		for (shift = 0, prio = 0; shift < 32; shift += 4, prios++)
+			prio |= (*prios & 0x07) << shift;
+		davinci_aintc_writel(prio, reg_off);
 	}
 
-	irq_base = irq_alloc_descs(-1, 0, davinci_soc_info.intc_irq_num, 0);
+	irq_base = irq_alloc_descs(-1, 0, config->num_irqs, 0);
 	if (WARN_ON(irq_base < 0))
 		return;
 
 	davinci_aintc_irq_domain = irq_domain_add_legacy(NULL,
-					davinci_soc_info.intc_irq_num,
-					irq_base, 0, &irq_domain_simple_ops,
-					NULL);
+						config->num_irqs, irq_base, 0,
+						&irq_domain_simple_ops, NULL);
 	if (WARN_ON(!davinci_aintc_irq_domain))
 		return;
 
@@ -140,10 +140,11 @@ void __init davinci_aintc_init(void)
 	if (WARN_ON(rv))
 		return;
 
-	for (i = 0, j = 0; i < davinci_soc_info.intc_irq_num;
-	     i += 32, j += 0x04)
-		davinci_aintc_setup_gc(davinci_aintc_base + j,
-				       irq_base + i, 32);
+	for (irq_off = 0, reg_off = 0;
+	     irq_off < config->num_irqs;
+	     irq_off += 32, reg_off += 0x04)
+		davinci_aintc_setup_gc(davinci_aintc_base + reg_off,
+				       irq_base + irq_off, 32);
 
 	irq_set_handler(DAVINCI_INTC_IRQ(IRQ_TINT1_TINT34), handle_level_irq);
 	set_handle_irq(davinci_aintc_handle_irq);
diff --git a/include/linux/irqchip/irq-davinci-aintc.h b/include/linux/irqchip/irq-davinci-aintc.h
index 2b2ace3c1b22..ea4e087fac98 100644
--- a/include/linux/irqchip/irq-davinci-aintc.h
+++ b/include/linux/irqchip/irq-davinci-aintc.h
@@ -22,4 +22,6 @@ struct davinci_aintc_config {
 	u8 *prios;
 };
 
+void davinci_aintc_init(const struct davinci_aintc_config *config);
+
 #endif /* _LINUX_IRQ_DAVINCI_AINTC_ */
-- 
2.20.1
