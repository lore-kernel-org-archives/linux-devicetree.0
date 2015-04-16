From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/4] ARM: UniPhier: add basic support for UniPhier architecture
Date: Thu, 16 Apr 2015 16:40:35 +0900
Message-ID: <1429170038-16757-2-git-send-email-yamada.masahiro@socionext.com>
References: <1429170038-16757-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1429170038-16757-1-git-send-email-yamada.masahiro@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

Initial commit for a new SoC family, UniPhier, developed by
Socionext Inc. (formerly, System LSI Business Division of
Panasonic Corporation).

This commit includes a minimal set of components for booting the
kernel, including SMP support.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm/Kconfig                  |  2 +
 arch/arm/Makefile                 |  1 +
 arch/arm/mach-uniphier/Kconfig    | 11 ++++++
 arch/arm/mach-uniphier/Makefile   |  2 +
 arch/arm/mach-uniphier/headsmp.S  | 21 +++++++++++
 arch/arm/mach-uniphier/platsmp.c  | 78 +++++++++++++++++++++++++++++++++++++++
 arch/arm/mach-uniphier/uniphier.c | 31 ++++++++++++++++
 7 files changed, 146 insertions(+)
 create mode 100644 arch/arm/mach-uniphier/Kconfig
 create mode 100644 arch/arm/mach-uniphier/Makefile
 create mode 100644 arch/arm/mach-uniphier/headsmp.S
 create mode 100644 arch/arm/mach-uniphier/platsmp.c
 create mode 100644 arch/arm/mach-uniphier/uniphier.c

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 392e7ae..c332b98 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -963,6 +963,8 @@ source "arch/arm/mach-tegra/Kconfig"
 
 source "arch/arm/mach-u300/Kconfig"
 
+source "arch/arm/mach-uniphier/Kconfig"
+
 source "arch/arm/mach-ux500/Kconfig"
 
 source "arch/arm/mach-versatile/Kconfig"
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 5575d9f..9de6aa6 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -201,6 +201,7 @@ machine-$(CONFIG_ARCH_SUNXI)		+= sunxi
 machine-$(CONFIG_ARCH_TEGRA)		+= tegra
 machine-$(CONFIG_ARCH_U300)		+= u300
 machine-$(CONFIG_ARCH_U8500)		+= ux500
+machine-$(CONFIG_ARCH_UNIPHIER)		+= uniphier
 machine-$(CONFIG_ARCH_VERSATILE)	+= versatile
 machine-$(CONFIG_ARCH_VEXPRESS)		+= vexpress
 machine-$(CONFIG_ARCH_VT8500)		+= vt8500
diff --git a/arch/arm/mach-uniphier/Kconfig b/arch/arm/mach-uniphier/Kconfig
new file mode 100644
index 0000000..a017b1d
--- /dev/null
+++ b/arch/arm/mach-uniphier/Kconfig
@@ -0,0 +1,11 @@
+config ARCH_UNIPHIER
+	bool "Socionext UniPhier SoCs"
+	depends on ARCH_MULTI_V7
+	select ARM_AMBA
+	select ARM_GLOBAL_TIMER
+	select ARM_GIC
+	select HAVE_ARM_SCU
+	select HAVE_ARM_TWD
+	help
+	  Support for UniPhier SoC family developed by Socionext Inc.
+	  (formerly, System LSI Business Division of Panasonic Corporation)
diff --git a/arch/arm/mach-uniphier/Makefile b/arch/arm/mach-uniphier/Makefile
new file mode 100644
index 0000000..46cfa54
--- /dev/null
+++ b/arch/arm/mach-uniphier/Makefile
@@ -0,0 +1,2 @@
+obj-y			:= uniphier.o
+obj-$(CONFIG_SMP)	+= headsmp.o platsmp.o
diff --git a/arch/arm/mach-uniphier/headsmp.S b/arch/arm/mach-uniphier/headsmp.S
new file mode 100644
index 0000000..8d94877
--- /dev/null
+++ b/arch/arm/mach-uniphier/headsmp.S
@@ -0,0 +1,21 @@
+/*
+ * Copyright (C) 2015 Socionext Inc.
+ *   Author: Masahiro Yamada <yamada.masahiro@socionext.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/linkage.h>
+
+ENTRY(uniphier_secondary_startup)
+	bl	v7_invalidate_l1
+	b	secondary_startup
+ENDPROC(uniphier_secondary_startup)
diff --git a/arch/arm/mach-uniphier/platsmp.c b/arch/arm/mach-uniphier/platsmp.c
new file mode 100644
index 0000000..6b61f8d
--- /dev/null
+++ b/arch/arm/mach-uniphier/platsmp.c
@@ -0,0 +1,78 @@
+/*
+ * Copyright (C) 2015 Socionext Inc.
+ *   Author: Masahiro Yamada <yamada.masahiro@socionext.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/sizes.h>
+#include <linux/init.h>
+#include <asm/io.h>
+#include <asm/smp.h>
+#include <asm/smp_scu.h>
+
+#define ROM_BOOT_ROMRSV2		0x59801208
+
+static void __init uniphier_smp_prepare_cpus(unsigned int max_cpus)
+{
+	static cpumask_t only_cpu_0 = { CPU_BITS_CPU0 };
+	unsigned long scu_base_phys = 0;
+	void __iomem *scu_base;
+
+	if (scu_a9_has_base())
+		scu_base_phys = scu_a9_get_base();
+
+	if (!scu_base_phys) {
+		pr_err("failed to get scu base\n");
+		goto err;
+	}
+
+	scu_base = ioremap(scu_base_phys, SZ_128);
+	if (!scu_base) {
+		pr_err("failed to remap scu base (0x%08lx)\n", scu_base_phys);
+		goto err;
+	}
+
+	scu_enable(scu_base);
+	iounmap(scu_base);
+
+err:
+	pr_warn("disabling SMP\n");
+	init_cpu_present(&only_cpu_0);
+}
+
+void uniphier_secondary_startup(void);
+
+static int uniphier_boot_secondary(unsigned int cpu,
+				   struct task_struct *idle)
+{
+	void __iomem *reg;
+
+	reg = ioremap(ROM_BOOT_ROMRSV2, 4);
+	if (!reg) {
+		pr_err("failed to remap ROM_BOOT_ROMRSV2.\n");
+		return -ENOMEM;
+	}
+
+	writel(virt_to_phys(uniphier_secondary_startup), reg);
+	iounmap(reg);
+
+	asm("sev");
+
+	return 0;
+}
+
+struct smp_operations uniphier_smp_ops __initdata = {
+	.smp_prepare_cpus	= uniphier_smp_prepare_cpus,
+	.smp_boot_secondary	= uniphier_boot_secondary,
+};
+CPU_METHOD_OF_DECLARE(uniphier_smp, "socionext,uniphier-smp",
+		      &uniphier_smp_ops);
diff --git a/arch/arm/mach-uniphier/uniphier.c b/arch/arm/mach-uniphier/uniphier.c
new file mode 100644
index 0000000..f08ccf5
--- /dev/null
+++ b/arch/arm/mach-uniphier/uniphier.c
@@ -0,0 +1,31 @@
+/*
+ * Copyright (C) 2015 Socionext Inc.
+ *   Author: Masahiro Yamada <yamada.masahiro@socionext.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <asm/mach/arch.h>
+
+static const char * const uniphier_board_dt_compat[] __initconst = {
+	"socionext,ph1-sld3",
+	"socionext,ph1-ld4",
+	"socionext,ph1-pro4",
+	"socionext,ph1-sld8",
+	"socionext,ph1-pro5",
+	"socionext,ph1-proxstream2",
+	"socionext,ph1-ld6b",
+	NULL,
+};
+
+DT_MACHINE_START(UNIPHIER, "Socionext UniPhier")
+	.dt_compat	= uniphier_board_dt_compat,
+MACHINE_END
-- 
1.9.1
