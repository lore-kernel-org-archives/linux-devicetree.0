Return-Path: <SRS0=+tgD=QP=bgdev.pl=brgl@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 04/33] ARM: davinci: remove davinci_intc_type
Date: Fri,  8 Feb 2019 18:31:25 +0100
Message-Id: <20190208173154.4665-5-brgl@bgdev.pl>
In-Reply-To: <20190208173154.4665-1-brgl@bgdev.pl>
References: <20190208173154.4665-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner --to=David Lechner <tglx@linutronix.dedavid>, lechnology.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, David Lechner <david@lechnology.com>
List-ID: <devicetree@vger.kernel.org>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We now use the generic ARM irq handler on davinci. There are no more
users that check davinci_intc_type. Remove the variable and all its
references.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: David Lechner <david@lechnology.com>
---
 arch/arm/mach-davinci/common.c              | 1 -
 arch/arm/mach-davinci/cp_intc.c             | 1 -
 arch/arm/mach-davinci/da830.c               | 1 -
 arch/arm/mach-davinci/da850.c               | 1 -
 arch/arm/mach-davinci/dm355.c               | 1 -
 arch/arm/mach-davinci/dm365.c               | 1 -
 arch/arm/mach-davinci/dm644x.c              | 1 -
 arch/arm/mach-davinci/dm646x.c              | 1 -
 arch/arm/mach-davinci/include/mach/common.h | 2 --
 arch/arm/mach-davinci/include/mach/irqs.h   | 3 ---
 arch/arm/mach-davinci/irq.c                 | 1 -
 11 files changed, 14 deletions(-)

diff --git a/arch/arm/mach-davinci/common.c b/arch/arm/mach-davinci/common.c
index e1d0f0d841ff..a87e158a709b 100644
--- a/arch/arm/mach-davinci/common.c
+++ b/arch/arm/mach-davinci/common.c
@@ -24,7 +24,6 @@ struct davinci_soc_info davinci_soc_info;
 EXPORT_SYMBOL(davinci_soc_info);
 
 void __iomem *davinci_intc_base;
-int davinci_intc_type;
 
 void davinci_get_mac_addr(struct nvmem_device *nvmem, void *context)
 {
diff --git a/arch/arm/mach-davinci/cp_intc.c b/arch/arm/mach-davinci/cp_intc.c
index 4a372add8cf9..19874f5ef542 100644
--- a/arch/arm/mach-davinci/cp_intc.c
+++ b/arch/arm/mach-davinci/cp_intc.c
@@ -146,7 +146,6 @@ int __init cp_intc_of_init(struct device_node *node, struct device_node *parent)
 	unsigned num_reg	= BITS_TO_LONGS(num_irq);
 	int i, irq_base;
 
-	davinci_intc_type = DAVINCI_INTC_TYPE_CP_INTC;
 	if (node) {
 		davinci_intc_base = of_iomap(node, 0);
 		if (of_property_read_u32(node, "ti,intc-size", &num_irq))
diff --git a/arch/arm/mach-davinci/da830.c b/arch/arm/mach-davinci/da830.c
index 2cc9fe4c3a91..9e18b245266b 100644
--- a/arch/arm/mach-davinci/da830.c
+++ b/arch/arm/mach-davinci/da830.c
@@ -807,7 +807,6 @@ static const struct davinci_soc_info davinci_soc_info_da830 = {
 	.pinmux_pins		= da830_pins,
 	.pinmux_pins_num	= ARRAY_SIZE(da830_pins),
 	.intc_base		= DA8XX_CP_INTC_BASE,
-	.intc_type		= DAVINCI_INTC_TYPE_CP_INTC,
 	.intc_irq_prios		= da830_default_priorities,
 	.intc_irq_num		= DA830_N_CP_INTC_IRQ,
 	.timer_info		= &da830_timer_info,
diff --git a/arch/arm/mach-davinci/da850.c b/arch/arm/mach-davinci/da850.c
index e7b78df2bfef..e823b89e2b7a 100644
--- a/arch/arm/mach-davinci/da850.c
+++ b/arch/arm/mach-davinci/da850.c
@@ -739,7 +739,6 @@ static const struct davinci_soc_info davinci_soc_info_da850 = {
 	.pinmux_pins		= da850_pins,
 	.pinmux_pins_num	= ARRAY_SIZE(da850_pins),
 	.intc_base		= DA8XX_CP_INTC_BASE,
-	.intc_type		= DAVINCI_INTC_TYPE_CP_INTC,
 	.intc_irq_prios		= da850_default_priorities,
 	.intc_irq_num		= DA850_N_CP_INTC_IRQ,
 	.timer_info		= &da850_timer_info,
diff --git a/arch/arm/mach-davinci/dm355.c b/arch/arm/mach-davinci/dm355.c
index 4c6e0bef4509..03ce5df28d87 100644
--- a/arch/arm/mach-davinci/dm355.c
+++ b/arch/arm/mach-davinci/dm355.c
@@ -705,7 +705,6 @@ static const struct davinci_soc_info davinci_soc_info_dm355 = {
 	.pinmux_pins		= dm355_pins,
 	.pinmux_pins_num	= ARRAY_SIZE(dm355_pins),
 	.intc_base		= DAVINCI_ARM_INTC_BASE,
-	.intc_type		= DAVINCI_INTC_TYPE_AINTC,
 	.intc_irq_prios		= dm355_default_priorities,
 	.intc_irq_num		= DAVINCI_N_AINTC_IRQ,
 	.timer_info		= &dm355_timer_info,
diff --git a/arch/arm/mach-davinci/dm365.c b/arch/arm/mach-davinci/dm365.c
index 01fb2b0c82de..3e034f0478d2 100644
--- a/arch/arm/mach-davinci/dm365.c
+++ b/arch/arm/mach-davinci/dm365.c
@@ -722,7 +722,6 @@ static const struct davinci_soc_info davinci_soc_info_dm365 = {
 	.pinmux_pins		= dm365_pins,
 	.pinmux_pins_num	= ARRAY_SIZE(dm365_pins),
 	.intc_base		= DAVINCI_ARM_INTC_BASE,
-	.intc_type		= DAVINCI_INTC_TYPE_AINTC,
 	.intc_irq_prios		= dm365_default_priorities,
 	.intc_irq_num		= DAVINCI_N_AINTC_IRQ,
 	.timer_info		= &dm365_timer_info,
diff --git a/arch/arm/mach-davinci/dm644x.c b/arch/arm/mach-davinci/dm644x.c
index 38f92b7d413e..66bab4782c62 100644
--- a/arch/arm/mach-davinci/dm644x.c
+++ b/arch/arm/mach-davinci/dm644x.c
@@ -646,7 +646,6 @@ static const struct davinci_soc_info davinci_soc_info_dm644x = {
 	.pinmux_pins		= dm644x_pins,
 	.pinmux_pins_num	= ARRAY_SIZE(dm644x_pins),
 	.intc_base		= DAVINCI_ARM_INTC_BASE,
-	.intc_type		= DAVINCI_INTC_TYPE_AINTC,
 	.intc_irq_prios 	= dm644x_default_priorities,
 	.intc_irq_num		= DAVINCI_N_AINTC_IRQ,
 	.timer_info		= &dm644x_timer_info,
diff --git a/arch/arm/mach-davinci/dm646x.c b/arch/arm/mach-davinci/dm646x.c
index 7dc54b2a610f..45efa715a2c1 100644
--- a/arch/arm/mach-davinci/dm646x.c
+++ b/arch/arm/mach-davinci/dm646x.c
@@ -586,7 +586,6 @@ static const struct davinci_soc_info davinci_soc_info_dm646x = {
 	.pinmux_pins		= dm646x_pins,
 	.pinmux_pins_num	= ARRAY_SIZE(dm646x_pins),
 	.intc_base		= DAVINCI_ARM_INTC_BASE,
-	.intc_type		= DAVINCI_INTC_TYPE_AINTC,
 	.intc_irq_prios		= dm646x_default_priorities,
 	.intc_irq_num		= DAVINCI_N_AINTC_IRQ,
 	.timer_info		= &dm646x_timer_info,
diff --git a/arch/arm/mach-davinci/include/mach/common.h b/arch/arm/mach-davinci/include/mach/common.h
index 944afd57ee38..34e48de92dcc 100644
--- a/arch/arm/mach-davinci/include/mach/common.h
+++ b/arch/arm/mach-davinci/include/mach/common.h
@@ -21,7 +21,6 @@ void davinci_timer_init(struct clk *clk);
 
 extern void davinci_irq_init(void);
 extern void __iomem *davinci_intc_base;
-extern int davinci_intc_type;
 
 struct davinci_timer_instance {
 	u32		base;
@@ -58,7 +57,6 @@ struct davinci_soc_info {
 	const struct mux_config		*pinmux_pins;
 	unsigned long			pinmux_pins_num;
 	u32				intc_base;
-	int				intc_type;
 	u8				*intc_irq_prios;
 	unsigned long			intc_irq_num;
 	struct davinci_timer_info	*timer_info;
diff --git a/arch/arm/mach-davinci/include/mach/irqs.h b/arch/arm/mach-davinci/include/mach/irqs.h
index edb2ca62321a..03c446635301 100644
--- a/arch/arm/mach-davinci/include/mach/irqs.h
+++ b/arch/arm/mach-davinci/include/mach/irqs.h
@@ -30,9 +30,6 @@
 /* Base address */
 #define DAVINCI_ARM_INTC_BASE 0x01C48000
 
-#define DAVINCI_INTC_TYPE_AINTC		0
-#define DAVINCI_INTC_TYPE_CP_INTC	1
-
 /* Interrupt lines */
 #define IRQ_VDINT0       0
 #define IRQ_VDINT1       1
diff --git a/arch/arm/mach-davinci/irq.c b/arch/arm/mach-davinci/irq.c
index 3ce821a06e52..2494d9b36966 100644
--- a/arch/arm/mach-davinci/irq.c
+++ b/arch/arm/mach-davinci/irq.c
@@ -99,7 +99,6 @@ void __init davinci_irq_init(void)
 	const u8 *davinci_def_priorities = davinci_soc_info.intc_irq_prios;
 	int rv, irq_base;
 
-	davinci_intc_type = DAVINCI_INTC_TYPE_AINTC;
 	davinci_intc_base = ioremap(davinci_soc_info.intc_base, SZ_4K);
 	if (WARN_ON(!davinci_intc_base))
 		return;
-- 
2.20.1
