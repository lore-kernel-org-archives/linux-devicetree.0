From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 20/33] ARM: davinci: cp-intc: remove cp_intc.h
Date: Fri,  8 Feb 2019 18:34:45 +0100
Message-ID: <20190208173458.4801-21-brgl@bgdev.pl>
References: <20190208173458.4801-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190208173458.4801-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, David Lechner <david@lechnology.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

There's no need to have a local header for cp-intc. Move the only
declaration for a public function to common.h. Move all register
offsets into the driver source file and drop all unused defines.
Make cp_intc_of_init() static.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: David Lechner <david@lechnology.com>
---
 arch/arm/mach-davinci/board-da830-evm.c     |  1 -
 arch/arm/mach-davinci/board-da850-evm.c     |  1 -
 arch/arm/mach-davinci/board-mityomapl138.c  |  1 -
 arch/arm/mach-davinci/board-omapl138-hawk.c |  1 -
 arch/arm/mach-davinci/cp_intc.c             | 20 +++++++-
 arch/arm/mach-davinci/cp_intc.h             | 57 ---------------------
 arch/arm/mach-davinci/include/mach/common.h |  1 +
 7 files changed, 19 insertions(+), 63 deletions(-)
 delete mode 100644 arch/arm/mach-davinci/cp_intc.h

diff --git a/arch/arm/mach-davinci/board-da830-evm.c b/arch/arm/mach-davinci/board-da830-evm.c
index 7b8c4aeca096..f81c92b9cf07 100644
--- a/arch/arm/mach-davinci/board-da830-evm.c
+++ b/arch/arm/mach-davinci/board-da830-evm.c
@@ -39,7 +39,6 @@
 #include <mach/mux.h>
 #include <mach/da8xx.h>
 
-#include "cp_intc.h"
 #include "irqs.h"
 
 #define DA830_EVM_PHY_ID		""
diff --git a/arch/arm/mach-davinci/board-da850-evm.c b/arch/arm/mach-davinci/board-da850-evm.c
index b0814bd30a1f..1cc49e7bf128 100644
--- a/arch/arm/mach-davinci/board-da850-evm.c
+++ b/arch/arm/mach-davinci/board-da850-evm.c
@@ -46,7 +46,6 @@
 #include <mach/da8xx.h>
 #include <mach/mux.h>
 
-#include "cp_intc.h"
 #include "irqs.h"
 #include "sram.h"
 
diff --git a/arch/arm/mach-davinci/board-mityomapl138.c b/arch/arm/mach-davinci/board-mityomapl138.c
index 8df16e81b69e..eb6a9465f229 100644
--- a/arch/arm/mach-davinci/board-mityomapl138.c
+++ b/arch/arm/mach-davinci/board-mityomapl138.c
@@ -27,7 +27,6 @@
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 #include <mach/common.h>
-#include "cp_intc.h"
 #include <mach/da8xx.h>
 #include <linux/platform_data/mtd-davinci.h>
 #include <linux/platform_data/mtd-davinci-aemif.h>
diff --git a/arch/arm/mach-davinci/board-omapl138-hawk.c b/arch/arm/mach-davinci/board-omapl138-hawk.c
index 94c4f126ef86..7f852722ff08 100644
--- a/arch/arm/mach-davinci/board-omapl138-hawk.c
+++ b/arch/arm/mach-davinci/board-omapl138-hawk.c
@@ -27,7 +27,6 @@
 #include <asm/mach/arch.h>
 
 #include <mach/common.h>
-#include "cp_intc.h"
 #include <mach/da8xx.h>
 #include <mach/mux.h>
 
diff --git a/arch/arm/mach-davinci/cp_intc.c b/arch/arm/mach-davinci/cp_intc.c
index 4e293cde20fb..82110d332c82 100644
--- a/arch/arm/mach-davinci/cp_intc.c
+++ b/arch/arm/mach-davinci/cp_intc.c
@@ -21,7 +21,22 @@
 
 #include <asm/exception.h>
 #include <mach/common.h>
-#include "cp_intc.h"
+
+#define CP_INTC_CTRL			0x04
+#define CP_INTC_HOST_CTRL		0x0C
+#define CP_INTC_GLOBAL_ENABLE		0x10
+#define CP_INTC_SYS_STAT_IDX_CLR	0x24
+#define CP_INTC_SYS_ENABLE_IDX_SET	0x28
+#define CP_INTC_SYS_ENABLE_IDX_CLR	0x2C
+#define CP_INTC_HOST_ENABLE_IDX_SET	0x34
+#define CP_INTC_HOST_ENABLE_IDX_CLR	0x38
+#define CP_INTC_PRIO_IDX		0x80
+#define CP_INTC_SYS_STAT_CLR(n)		(0x0280 + (n << 2))
+#define CP_INTC_SYS_ENABLE_CLR(n)	(0x0380 + (n << 2))
+#define CP_INTC_CHAN_MAP(n)		(0x0400 + (n << 2))
+#define CP_INTC_SYS_POLARITY(n)		(0x0D00 + (n << 2))
+#define CP_INTC_SYS_TYPE(n)		(0x0D80 + (n << 2))
+#define CP_INTC_HOST_ENABLE(n)		(0x1500 + (n << 2))
 
 #define DAVINCI_CP_INTC_PRI_INDX_MASK		GENMASK(9, 0)
 #define DAVINCI_CP_INTC_GPIR_NONE		BIT(31)
@@ -141,7 +156,8 @@ static const struct irq_domain_ops cp_intc_host_ops = {
 	.xlate = irq_domain_xlate_onetwocell,
 };
 
-int __init cp_intc_of_init(struct device_node *node, struct device_node *parent)
+static int __init cp_intc_of_init(struct device_node *node,
+				  struct device_node *parent)
 {
 	u32 num_irq		= davinci_soc_info.intc_irq_num;
 	u8 *irq_prio		= davinci_soc_info.intc_irq_prios;
diff --git a/arch/arm/mach-davinci/cp_intc.h b/arch/arm/mach-davinci/cp_intc.h
deleted file mode 100644
index 827bbe9baed4..000000000000
--- a/arch/arm/mach-davinci/cp_intc.h
+++ /dev/null
@@ -1,57 +0,0 @@
-/*
- * TI Common Platform Interrupt Controller (cp_intc) definitions
- *
- * Author: Steve Chen <schen@mvista.com>
- * Copyright (C) 2008-2009, MontaVista Software, Inc. <source@mvista.com>
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2. This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
- */
-#ifndef __ASM_HARDWARE_CP_INTC_H
-#define __ASM_HARDWARE_CP_INTC_H
-
-#define CP_INTC_REV			0x00
-#define CP_INTC_CTRL			0x04
-#define CP_INTC_HOST_CTRL		0x0C
-#define CP_INTC_GLOBAL_ENABLE		0x10
-#define CP_INTC_GLOBAL_NESTING_LEVEL	0x1C
-#define CP_INTC_SYS_STAT_IDX_SET	0x20
-#define CP_INTC_SYS_STAT_IDX_CLR	0x24
-#define CP_INTC_SYS_ENABLE_IDX_SET	0x28
-#define CP_INTC_SYS_ENABLE_IDX_CLR	0x2C
-#define CP_INTC_GLOBAL_WAKEUP_ENABLE	0x30
-#define CP_INTC_HOST_ENABLE_IDX_SET	0x34
-#define CP_INTC_HOST_ENABLE_IDX_CLR	0x38
-#define CP_INTC_PACING_PRESCALE 	0x40
-#define CP_INTC_VECTOR_BASE		0x50
-#define CP_INTC_VECTOR_SIZE		0x54
-#define CP_INTC_VECTOR_NULL		0x58
-#define CP_INTC_PRIO_IDX		0x80
-#define CP_INTC_PRIO_VECTOR		0x84
-#define CP_INTC_SECURE_ENABLE		0x90
-#define CP_INTC_SECURE_PRIO_IDX 	0x94
-#define CP_INTC_PACING_PARAM(n) 	(0x0100 + (n << 4))
-#define CP_INTC_PACING_DEC(n)		(0x0104 + (n << 4))
-#define CP_INTC_PACING_MAP(n)		(0x0108 + (n << 4))
-#define CP_INTC_SYS_RAW_STAT(n) 	(0x0200 + (n << 2))
-#define CP_INTC_SYS_STAT_CLR(n) 	(0x0280 + (n << 2))
-#define CP_INTC_SYS_ENABLE_SET(n)	(0x0300 + (n << 2))
-#define CP_INTC_SYS_ENABLE_CLR(n)	(0x0380 + (n << 2))
-#define CP_INTC_CHAN_MAP(n)		(0x0400 + (n << 2))
-#define CP_INTC_HOST_MAP(n)		(0x0800 + (n << 2))
-#define CP_INTC_HOST_PRIO_IDX(n)	(0x0900 + (n << 2))
-#define CP_INTC_SYS_POLARITY(n) 	(0x0D00 + (n << 2))
-#define CP_INTC_SYS_TYPE(n)		(0x0D80 + (n << 2))
-#define CP_INTC_WAKEUP_ENABLE(n)	(0x0E00 + (n << 2))
-#define CP_INTC_DEBUG_SELECT(n) 	(0x0F00 + (n << 2))
-#define CP_INTC_SYS_SECURE_ENABLE(n)	(0x1000 + (n << 2))
-#define CP_INTC_HOST_NESTING_LEVEL(n)	(0x1100 + (n << 2))
-#define CP_INTC_HOST_ENABLE(n)		(0x1500 + (n << 2))
-#define CP_INTC_HOST_PRIO_VECTOR(n)	(0x1600 + (n << 2))
-#define CP_INTC_VECTOR_ADDR(n)		(0x2000 + (n << 2))
-
-void cp_intc_init(void);
-int cp_intc_of_init(struct device_node *, struct device_node *);
-
-#endif	/* __ASM_HARDWARE_CP_INTC_H */
diff --git a/arch/arm/mach-davinci/include/mach/common.h b/arch/arm/mach-davinci/include/mach/common.h
index 14e0e1c40611..3f3f1169d47e 100644
--- a/arch/arm/mach-davinci/include/mach/common.h
+++ b/arch/arm/mach-davinci/include/mach/common.h
@@ -22,6 +22,7 @@
 #define DAVINCI_INTC_START		NR_IRQS
 #define DAVINCI_INTC_IRQ(_irqnum)	(DAVINCI_INTC_START + (_irqnum))
 
+void cp_intc_init(void);
 void davinci_timer_init(struct clk *clk);
 
 struct davinci_timer_instance {
-- 
2.20.1
