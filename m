From: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH V5 1/4] arm/dt: add basic mx51 device tree support
Date: Wed, 16 Mar 2011 23:51:38 +0800
Message-ID: <1300290701-9433-2-git-send-email-jason.hui@linaro.org>
References: <1300290701-9433-1-git-send-email-jason.hui@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <1300290701-9433-1-git-send-email-jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/mach-mx5/Kconfig               |    8 ++++
 arch/arm/mach-mx5/Makefile              |    1 +
 arch/arm/mach-mx5/board-dt.c            |   64 +++++++++++++++++++++++++++++++
 arch/arm/mach-mx5/clock-dt.c            |   52 +++++++++++++++++++++++++
 arch/arm/plat-mxc/include/mach/common.h |    1 +
 5 files changed, 126 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-mx5/Kconfig b/arch/arm/mach-mx5/Kconfig
index de4fa99..6438f87 100644
--- a/arch/arm/mach-mx5/Kconfig
+++ b/arch/arm/mach-mx5/Kconfig
@@ -47,6 +47,14 @@ config MACH_MX51_BABBAGE
 	  u-boot. This includes specific configurations for the board and its
 	  peripherals.
 
+config MACH_MX51_DT
+	bool "Generic MX51 board (FDT support)"
+	select USE_OF
+	select SOC_IMX51
+	help
+	 Support for generic Freescale i.MX51 boards using Flattened Device
+	 Tree.
+
 config MACH_MX51_3DS
 	bool "Support MX51PDK (3DS)"
 	select SOC_IMX51
diff --git a/arch/arm/mach-mx5/Makefile b/arch/arm/mach-mx5/Makefile
index 0d43be9..bd4542d 100644
--- a/arch/arm/mach-mx5/Makefile
+++ b/arch/arm/mach-mx5/Makefile
@@ -18,3 +18,4 @@ obj-$(CONFIG_MACH_EUKREA_CPUIMX51SD) += board-cpuimx51sd.o
 obj-$(CONFIG_MACH_EUKREA_MBIMXSD51_BASEBOARD) += eukrea_mbimxsd-baseboard.o
 obj-$(CONFIG_MACH_MX51_EFIKAMX) += board-mx51_efikamx.o
 obj-$(CONFIG_MACH_MX50_RDP) += board-mx50_rdp.o
+obj-$(CONFIG_MACH_MX51_DT) += board-dt.o clock-dt.o
diff --git a/arch/arm/mach-mx5/board-dt.c b/arch/arm/mach-mx5/board-dt.c
new file mode 100644
index 0000000..62ca693
--- /dev/null
+++ b/arch/arm/mach-mx5/board-dt.c
@@ -0,0 +1,64 @@
+/*
+ * Copyright 2011 Linaro Ltd.
+ * Copyright 2011 Freescale Semiconductor, Inc.
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/platform_device.h>
+#include <linux/dma-mapping.h>
+#include <linux/of_platform.h>
+#include <linux/of_fdt.h>
+
+#include <mach/common.h>
+#include <mach/hardware.h>
+#include <mach/imx-uart.h>
+#include <mach/iomux-mx51.h>
+
+#include <asm/irq.h>
+#include <asm/setup.h>
+#include <asm/mach-types.h>
+#include <asm/mach/arch.h>
+#include <asm/mach/time.h>
+
+#include "devices.h"
+
+static struct of_device_id mx51_dt_match_table[] __initdata = {
+	{ .compatible = "simple-bus", },
+	{}
+};
+
+static void __init mx51_dt_board_init(void)
+{
+	of_platform_bus_probe(NULL, mx51_dt_match_table, NULL);
+}
+
+static void __init mx51_dt_timer_init(void)
+{
+	mx51_clocks_init(32768, 24000000, 22579200, 0);
+	mx5_clk_dt_init();
+}
+
+static struct sys_timer mxc_timer = {
+	.init = mx51_dt_timer_init,
+};
+
+static const char *mx51_dt_board_compat[] = {
+	"fsl,mx51-babbage",
+	NULL
+};
+
+DT_MACHINE_START(MX51_DT, "Freescale MX51 (Flattened Device Tree)")
+	.map_io       = mx51_map_io,
+	.init_irq     = mx51_init_irq,
+	.init_machine = mx51_dt_board_init,
+	.dt_compat    = mx51_dt_board_compat,
+	.timer        = &mxc_timer,
+MACHINE_END
diff --git a/arch/arm/mach-mx5/clock-dt.c b/arch/arm/mach-mx5/clock-dt.c
new file mode 100644
index 0000000..9c04475
--- /dev/null
+++ b/arch/arm/mach-mx5/clock-dt.c
@@ -0,0 +1,52 @@
+
+/*
+ * Copyright 2011 Linaro Ltd.
+ * Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/clk.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_clk.h>
+
+static struct clk *mx5_dt_clk_get(struct device_node *np,
+					const char *output_id, void *data)
+{
+	return data;
+}
+
+static __init void mx5_dt_scan_clks(void)
+{
+	struct device_node *node;
+	struct clk *clk;
+	const char *id;
+	int rc;
+
+	for_each_compatible_node(node, NULL, "clock") {
+		id = of_get_property(node, "clock-outputs", NULL);
+		if (!id)
+			continue;
+
+		clk = clk_get_sys(id, NULL);
+		if (IS_ERR(clk))
+			continue;
+
+		rc = of_clk_add_provider(node, mx5_dt_clk_get, clk);
+		if (rc)
+			pr_err("error adding fixed clk %s\n", node->name);
+	}
+}
+
+void __init mx5_clk_dt_init(void)
+{
+	mx5_dt_scan_clks();
+}
diff --git a/arch/arm/plat-mxc/include/mach/common.h b/arch/arm/plat-mxc/include/mach/common.h
index aea2cd3..a28e84a 100644
--- a/arch/arm/plat-mxc/include/mach/common.h
+++ b/arch/arm/plat-mxc/include/mach/common.h
@@ -58,4 +58,5 @@ extern void mxc91231_arch_reset(int, const char *);
 extern void mxc91231_prepare_idle(void);
 extern void mx51_efikamx_reset(void);
 extern int mx53_revision(void);
+extern void mx5_clk_dt_init(void);
 #endif
-- 
1.7.1
