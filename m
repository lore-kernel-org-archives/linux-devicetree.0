From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 16/20] ARM: mmp: add SMP support
Date: Thu, 22 Aug 2019 11:26:39 +0200
Message-ID: <20190822092643.593488-17-lkundrak@v3.sk>
References: <20190822092643.593488-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190822092643.593488-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

Used to bring up the second core on MMP3.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

---
Changes since v1:
- Wrap SW_BRANCH_VIRT_ADDR with __pa_symbol()

 arch/arm/mach-mmp/Makefile  |  3 +++
 arch/arm/mach-mmp/platsmp.c | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 arch/arm/mach-mmp/platsmp.c

diff --git a/arch/arm/mach-mmp/Makefile b/arch/arm/mach-mmp/Makefile
index 322c1c97dc900..7b3a7f979eece 100644
--- a/arch/arm/mach-mmp/Makefile
+++ b/arch/arm/mach-mmp/Makefile
@@ -22,6 +22,9 @@ ifeq ($(CONFIG_PM),y)
 obj-$(CONFIG_CPU_PXA910)	+=3D pm-pxa910.o
 obj-$(CONFIG_CPU_MMP2)		+=3D pm-mmp2.o
 endif
+ifeq ($(CONFIG_SMP),y)
+obj-$(CONFIG_MACH_MMP3_DT)	+=3D platsmp.o
+endif
=20
 # board support
 obj-$(CONFIG_MACH_ASPENITE)	+=3D aspenite.o
diff --git a/arch/arm/mach-mmp/platsmp.c b/arch/arm/mach-mmp/platsmp.c
new file mode 100644
index 0000000000000..98d5ef23623cb
--- /dev/null
+++ b/arch/arm/mach-mmp/platsmp.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2019 Lubomir Rintel <lkundrak@v3.sk>
+ */
+#include <linux/io.h>
+#include <asm/smp_scu.h>
+#include <asm/smp.h>
+#include "addr-map.h"
+
+#define SW_BRANCH_VIRT_ADDR	CIU_REG(0x24)
+
+static int mmp3_boot_secondary(unsigned int cpu, struct task_struct *idl=
e)
+{
+	/*
+	 * Apparently, the boot ROM on the second core spins on this
+	 * register becoming non-zero and then jumps to the address written
+	 * there. No IPIs involved.
+	 */
+	__raw_writel(virt_to_phys(secondary_startup),
+			__pa_symbol(SW_BRANCH_VIRT_ADDR));
+	return 0;
+}
+
+static void mmp3_smp_prepare_cpus(unsigned int max_cpus)
+{
+	scu_enable(SCU_VIRT_BASE);
+}
+
+static const struct smp_operations mmp3_smp_ops __initconst =3D {
+	.smp_prepare_cpus	=3D mmp3_smp_prepare_cpus,
+	.smp_boot_secondary	=3D mmp3_boot_secondary,
+};
+CPU_METHOD_OF_DECLARE(mmp3_smp, "marvell,mmp3-smp", &mmp3_smp_ops);
--=20
2.21.0
