From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH V2 1/5] arm: mvebu: Added support for coherency fabric in
 mach-mvebu
Date: Mon, 29 Oct 2012 22:11:44 +0100
Message-ID: <1351545108-18954-2-git-send-email-gregory.clement@free-electrons.com>
References: <1351545108-18954-1-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1351545108-18954-1-git-send-email-gregory.clement@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Ike Pan <ike.pan@canonical.com>, Will Deacon <will.deacon@arm.com>, Nadav Haklai <nadavh@marvell.com>, Ian Molton <ian.molton@codethink.co.uk>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Jani Monoses <jani.monoses@canonical.com>, Russell King <linux@arm.linux.org.uk>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Leif Lindholm <leif.lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Jon Masters <jcm@redhat.com>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Ben Dooks <ben-linux@fluff.org>, Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Chris Van Hoof <vanhoof@canonical.c>
List-Id: devicetree@vger.kernel.org

From: Yehuda Yitschak <yehuday@marvell.com>

Signed-off-by: Yehuda Yitschak <yehuday@marvell.com>
Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 .../devicetree/bindings/arm/coherency-fabric.txt   |   16 ++++
 arch/arm/boot/dts/armada-370-xp.dtsi               |    5 ++
 arch/arm/mach-mvebu/Makefile                       |    2 +-
 arch/arm/mach-mvebu/coherency.c                    |   89 ++++++++++++++++++++
 arch/arm/mach-mvebu/coherency.h                    |   21 +++++
 arch/arm/mach-mvebu/common.h                       |    2 +
 6 files changed, 134 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/arm/coherency-fabric.txt
 create mode 100644 arch/arm/mach-mvebu/coherency.c
 create mode 100644 arch/arm/mach-mvebu/coherency.h

diff --git a/Documentation/devicetree/bindings/arm/coherency-fabric.txt b/Documentation/devicetree/bindings/arm/coherency-fabric.txt
new file mode 100644
index 0000000..2bfbf67
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/coherency-fabric.txt
@@ -0,0 +1,16 @@
+Coherency fabric
+----------------
+Available on Marvell SOCs: Armada 370 and Armada XP
+
+Required properties:
+
+- compatible: "marvell,coherency-fabric"
+- reg: Should contain,coherency fabric registers location and length.
+
+Example:
+
+coherency-fabric@d0020200 {
+	compatible = "marvell,coherency-fabric";
+	reg = <0xd0020200 0xb0>;
+};
+
diff --git a/arch/arm/boot/dts/armada-370-xp.dtsi b/arch/arm/boot/dts/armada-370-xp.dtsi
index 94b4b9e..b0d075b 100644
--- a/arch/arm/boot/dts/armada-370-xp.dtsi
+++ b/arch/arm/boot/dts/armada-370-xp.dtsi
@@ -36,6 +36,11 @@
 	      interrupt-controller;
 	};
 
+	coherency-fabric@d0020200 {
+		compatible = "marvell,coherency-fabric";
+		reg = <0xd0020200 0xb0>;
+	};
+
 	soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm/mach-mvebu/Makefile b/arch/arm/mach-mvebu/Makefile
index 57f996b..abd6d3b 100644
--- a/arch/arm/mach-mvebu/Makefile
+++ b/arch/arm/mach-mvebu/Makefile
@@ -2,4 +2,4 @@ ccflags-$(CONFIG_ARCH_MULTIPLATFORM) := -I$(srctree)/$(src)/include \
 	-I$(srctree)/arch/arm/plat-orion/include
 
 obj-y += system-controller.o
-obj-$(CONFIG_MACH_ARMADA_370_XP) += armada-370-xp.o irq-armada-370-xp.o addr-map.o
+obj-$(CONFIG_MACH_ARMADA_370_XP) += armada-370-xp.o irq-armada-370-xp.o addr-map.o coherency.o
diff --git a/arch/arm/mach-mvebu/coherency.c b/arch/arm/mach-mvebu/coherency.c
new file mode 100644
index 0000000..69e130d
--- /dev/null
+++ b/arch/arm/mach-mvebu/coherency.c
@@ -0,0 +1,89 @@
+/*
+ * Coherency fabric (Aurora) support for Armada 370 and XP platforms.
+ *
+ * Copyright (C) 2012 Marvell
+ *
+ * Yehuda Yitschak <yehuday@marvell.com>
+ * Gregory Clement <gregory.clement@free-electrons.com>
+ * Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+ *
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2.  This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ *
+ * The Armada 370 and Armada XP SOCs have a coherency fabric which is
+ * responsible for ensuring hardware coherency between all CPUs and between
+ * CPUs and I/O masters. This file initializes the coherency fabric and
+ * supplies basic routines for configuring and controlling hardware coherency
+ */
+
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/of_address.h>
+#include <linux/io.h>
+#include <linux/smp.h>
+#include <asm/smp_plat.h>
+#include "armada-370-xp.h"
+
+/* Some functions in this file are called very early during SMP
+ * initialization. At that time the device tree framework is not yet
+ * ready, and it is not possible to get the register address to
+ * ioremap it. That's why the pointer below is given with an initial
+ * value matching its virtual mapping
+ */
+static void __iomem *coherency_base = ARMADA_370_XP_REGS_VIRT_BASE + 0x20200;
+
+/* Coherency fabric registers */
+#define COHERENCY_FABRIC_CTL_OFFSET		   0x0
+#define COHERENCY_FABRIC_CFG_OFFSET		   0x4
+
+static struct of_device_id of_coherency_table[] = {
+	{.compatible = "marvell,coherency-fabric"},
+	{ /* end of list */ },
+};
+
+int coherency_get_cpu_count(void)
+{
+	int reg, cnt;
+
+	reg = readl(coherency_base + COHERENCY_FABRIC_CFG_OFFSET);
+	cnt = (reg & 0xF) + 1;
+
+	return cnt;
+}
+
+int set_cpu_coherent(unsigned int hw_cpu_id, int smp_group_id)
+{
+	int reg;
+
+	if (!coherency_base) {
+		pr_warn("Can't make CPU %d cache coherent.\n", hw_cpu_id);
+		pr_warn("Coherency fabric is not initialized\n");
+		return 1;
+	}
+
+	/* Enable the CPU in coherency fabric */
+	reg = readl(coherency_base + COHERENCY_FABRIC_CTL_OFFSET);
+	reg |= 1 << (24 + hw_cpu_id);
+	writel(reg, coherency_base + COHERENCY_FABRIC_CTL_OFFSET);
+
+	/* Add CPU to SMP group */
+	reg = readl(coherency_base + COHERENCY_FABRIC_CFG_OFFSET);
+	reg |= 1 << (16 + hw_cpu_id + (smp_group_id == 0 ? 8 : 0));
+	writel(reg, coherency_base + COHERENCY_FABRIC_CFG_OFFSET);
+
+	return 0;
+}
+
+int __init coherency_init(void)
+{
+	struct device_node *np;
+
+	np = of_find_matching_node(NULL, of_coherency_table);
+	if (np) {
+		pr_info("Initializing Coherency fabric\n");
+		coherency_base = of_iomap(np, 0);
+	}
+
+	return 0;
+}
diff --git a/arch/arm/mach-mvebu/coherency.h b/arch/arm/mach-mvebu/coherency.h
new file mode 100644
index 0000000..6182192
--- /dev/null
+++ b/arch/arm/mach-mvebu/coherency.h
@@ -0,0 +1,21 @@
+/*
+ * arch/arm/mach-mvebu/include/mach/coherency.h
+ *
+ *
+ * Coherency fabric (Aurora) support for Armada 370 and XP platforms.
+ *
+ * Copyright (C) 2012 Marvell
+ *
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2.  This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+
+#ifndef __MACH_370_XP_COHERENCY_H
+#define __MACH_370_XP_COHERENCY_H
+
+int set_cpu_coherent(int cpu_id, int smp_group_id);
+int coherency_get_cpu_count(void);
+int coherency_init(void);
+
+#endif	/* __MACH_370_XP_COHERENCY_H */
diff --git a/arch/arm/mach-mvebu/common.h b/arch/arm/mach-mvebu/common.h
index 281fab3..ea08919 100644
--- a/arch/arm/mach-mvebu/common.h
+++ b/arch/arm/mach-mvebu/common.h
@@ -21,4 +21,6 @@ void mvebu_clocks_init(void);
 void armada_370_xp_init_irq(void);
 void armada_370_xp_handle_irq(struct pt_regs *regs);
 
+
+int armada_370_xp_coherency_init(void);
 #endif
-- 
1.7.9.5
