From: Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 2/4] ARM: mstar: Add machine for MStar infinity family SoCs
Date: Mon, 14 Oct 2019 15:15:57 +0900
Message-ID: <20191014061617.10296-2-daniel@0x0f.com>
References: <20191014061617.10296-1-daniel@0x0f.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191014061617.10296-1-daniel@0x0f.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: daniel@0x0f.com, Daniel Palmer <daniel@thingy.jp>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Ripard <mripard@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Icenowy Zheng <icenowy@aosc.io>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, "Paul E. McKenney" <paulmck@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Paul Burton <paul.burton@mips.com>, Andrew Morton <akpm@linux-foundation.org>Mike Rapoport <r>
List-Id: devicetree@vger.kernel.org

Initial support for the MStar infinity/infinity3 series of Cortex A7
based IP camera SoCs.

These chips are interesting in that they contain a Cortex A7,
peripherals and system memory in a single tiny QFN package that
can be hand soldered allowing almost anyone to embed Linux
in their projects.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 MAINTAINERS                    |  1 +
 arch/arm/Kconfig               |  2 +
 arch/arm/Makefile              |  1 +
 arch/arm/mach-mstar/Kconfig    | 15 ++++++
 arch/arm/mach-mstar/Makefile   |  1 +
 arch/arm/mach-mstar/infinity.c | 96 ++++++++++++++++++++++++++++++++++
 6 files changed, 116 insertions(+)
 create mode 100644 arch/arm/mach-mstar/Kconfig
 create mode 100644 arch/arm/mach-mstar/Makefile
 create mode 100644 arch/arm/mach-mstar/infinity.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 8b7913c13f9a..e35c3eb2b680 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1985,6 +1985,7 @@ ARM/MStar SoC support
 M:	Daniel Palmer <daniel@thingy.jp>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 F:	Documentation/devicetree/bindings/arm/mstar.yaml
+F:	arch/arm/mach-mstar/
 S:	Maintained
 
 ARM/NEC MOBILEPRO 900/c MACHINE SUPPORT
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 8a50efb559f3..b8450ed8d946 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -667,6 +667,8 @@ source "arch/arm/mach-mmp/Kconfig"
 
 source "arch/arm/mach-moxart/Kconfig"
 
+source "arch/arm/mach-mstar/Kconfig"
+
 source "arch/arm/mach-mv78xx0/Kconfig"
 
 source "arch/arm/mach-mvebu/Kconfig"
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index db857d07114f..2a3c127cd243 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -196,6 +196,7 @@ machine-$(CONFIG_ARCH_MXC)		+= imx
 machine-$(CONFIG_ARCH_MEDIATEK)		+= mediatek
 machine-$(CONFIG_ARCH_MILBEAUT)		+= milbeaut
 machine-$(CONFIG_ARCH_MXS)		+= mxs
+machine-$(CONFIG_ARCH_MSTAR)		+= mstar
 machine-$(CONFIG_ARCH_NOMADIK)		+= nomadik
 machine-$(CONFIG_ARCH_NPCM)		+= npcm
 machine-$(CONFIG_ARCH_NSPIRE)		+= nspire
diff --git a/arch/arm/mach-mstar/Kconfig b/arch/arm/mach-mstar/Kconfig
new file mode 100644
index 000000000000..7bc79c296ebb
--- /dev/null
+++ b/arch/arm/mach-mstar/Kconfig
@@ -0,0 +1,15 @@
+menuconfig ARCH_MSTAR
+	bool "MStar SoC Support"
+	depends on ARCH_MULTI_V7
+	select ARM_GIC
+	help
+	  Support for MStar ARMv7 SoCs
+
+if ARCH_MSTAR
+
+config MACH_INFINITY
+	bool "MStar infinity SoC support"
+	default ARCH_INFINITY
+	help
+	  Support for MStar infinity(1/3) IP camera SoCs
+endif
diff --git a/arch/arm/mach-mstar/Makefile b/arch/arm/mach-mstar/Makefile
new file mode 100644
index 000000000000..144b58b189e3
--- /dev/null
+++ b/arch/arm/mach-mstar/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_MACH_INFINITY) += infinity.o
diff --git a/arch/arm/mach-mstar/infinity.c b/arch/arm/mach-mstar/infinity.c
new file mode 100644
index 000000000000..520581660bef
--- /dev/null
+++ b/arch/arm/mach-mstar/infinity.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree support for MStar Infinity SoCs
+ *
+ * Copyright (c) 2019 thingy.jp
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ */
+
+#include <linux/init.h>
+#include <asm/mach/arch.h>
+#include <asm/mach/map.h>
+#include <linux/of.h>
+#include <linux/io.h>
+
+/*
+ * The IO space is remapped to the same place
+ * the vendor kernel does so that the hardcoded
+ * addresses all over the vendor drivers line up.
+ */
+
+#define INFINITY_IO_PHYS	0x1f000000
+#define INFINITY_IO_OFFSET	0xde000000
+#define INFINITY_IO_VIRT	(INFINITY_IO_PHYS + INFINITY_IO_OFFSET)
+#define INFINITY_IO_SIZE	0x00400000
+
+/*
+ * In the u-boot code the area these registers are in is
+ * called "L3 bridge".
+ *
+ * It's not exactly known what is the L3 bridge is but
+ * the vendor code for both u-boot and linux share calls
+ * to "flush the miu pipe". This seems to be to force pending
+ * CPU writes to memory so that the state is right before
+ * DMA capable devices try to read descriptors and data
+ * the CPU has prepared. Without doing this ethernet doesn't
+ * work reliably for example.
+ */
+
+#define INFINITY_L3BRIDGE_FLUSH		0x204414
+#define INFINITY_L3BRIDGE_STATUS	0x204440
+#define INFINITY_L3BRIDGE_FLUSH_TRIGGER	BIT(0)
+#define INFINITY_L3BRIDGE_STATUS_DONE	BIT(12)
+
+static void __iomem *miu_status;
+static void __iomem *miu_flush;
+
+static struct map_desc infinity_io_desc[] __initdata = {
+		{INFINITY_IO_VIRT, __phys_to_pfn(INFINITY_IO_PHYS),
+				INFINITY_IO_SIZE, MT_DEVICE},
+};
+
+static void __init infinity_map_io(void)
+{
+	iotable_init(infinity_io_desc, ARRAY_SIZE(infinity_io_desc));
+	miu_flush = (void __iomem *)(infinity_io_desc[0].virtual
+			+ INFINITY_L3BRIDGE_FLUSH);
+	miu_status = (void __iomem *)(infinity_io_desc[0].virtual
+			+ INFINITY_L3BRIDGE_STATUS);
+}
+
+static const char * const infinity_board_dt_compat[] = {
+	"mstar,infinity",
+	NULL,
+};
+
+static DEFINE_SPINLOCK(infinity_mb_lock);
+
+static void infinity_mb(void)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&infinity_mb_lock, flags);
+	/* toggle the flush miu pipe fire bit */
+	writel_relaxed(0, miu_flush);
+	writel_relaxed(INFINITY_L3BRIDGE_FLUSH_TRIGGER, miu_flush);
+	while (!(readl_relaxed(miu_status) & INFINITY_L3BRIDGE_STATUS_DONE)) {
+		/* wait for flush to complete */
+	}
+	spin_unlock_irqrestore(&infinity_mb_lock, flags);
+}
+
+static void __init infinity_barriers_init(void)
+{
+	soc_mb = infinity_mb;
+}
+
+static void __init infinity_init(void)
+{
+	infinity_barriers_init();
+}
+
+DT_MACHINE_START(INFINITY_DT, "MStar Infinity (Device Tree)")
+	.dt_compat	= infinity_board_dt_compat,
+	.init_machine	= infinity_init,
+	.map_io		= infinity_map_io,
+MACHINE_END
-- 
2.23.0
