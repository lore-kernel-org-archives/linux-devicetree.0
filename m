From: David Lechner <david@lechnology.com>
Subject: [PATCH v5 06/44] clk: davinci: Add platform information for TI DM365
 PLL
Date: Sun,  7 Jan 2018 20:17:05 -0600
Message-ID: <1515377863-20358-7-git-send-email-david@lechnology.com>
References: <1515377863-20358-1-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1515377863-20358-1-git-send-email-david@lechnology.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Adam Ford <aford173@gmail.com>
List-Id: devicetree@vger.kernel.org

This adds platform-specific declarations for the PLL clocks on TI
DaVinci 365 based systems.

Signed-off-by: David Lechner <david@lechnology.com>
---
 drivers/clk/davinci/Makefile    |  1 +
 drivers/clk/davinci/pll-dm365.c | 64 +++++++++++++++++++++++++++++++++++++++++
 include/linux/clk/davinci.h     |  1 +
 3 files changed, 66 insertions(+)
 create mode 100644 drivers/clk/davinci/pll-dm365.c

diff --git a/drivers/clk/davinci/Makefile b/drivers/clk/davinci/Makefile
index 6720bd0..353aa02 100644
--- a/drivers/clk/davinci/Makefile
+++ b/drivers/clk/davinci/Makefile
@@ -5,4 +5,5 @@ obj-y += pll.o
 obj-$(CONFIG_ARCH_DAVINCI_DA830)	+= pll-da830.o
 obj-$(CONFIG_ARCH_DAVINCI_DA850)	+= pll-da850.o
 obj-$(CONFIG_ARCH_DAVINCI_DM355)	+= pll-dm355.o
+obj-$(CONFIG_ARCH_DAVINCI_DM365)	+= pll-dm365.o
 endif
diff --git a/drivers/clk/davinci/pll-dm365.c b/drivers/clk/davinci/pll-dm365.c
new file mode 100644
index 0000000..9892b0b
--- /dev/null
+++ b/drivers/clk/davinci/pll-dm365.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PLL clock descriptions for TI DM365
+ *
+ * Copyright (C) 2017 David Lechner <david@lechnology.com>
+ */
+
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/types.h>
+
+#include "pll.h"
+
+static const char * const dm365_pll_obsclk_parent_names[] = {
+	"ref_clk",
+};
+
+static u32 dm365_pll_obsclk_table[] = {
+	0x10,
+};
+
+static const struct davinci_pll_divclk_info dm365_pll1_divclk_info[] __initconst = {
+	DIVCLK(1, pll1_sysclk1, pll1, 0),
+	DIVCLK(2, pll1_sysclk2, pll1, 0),
+	DIVCLK(3, pll1_sysclk3, pll1, 0),
+	DIVCLK(4, pll1_sysclk4, pll1, 0),
+	DIVCLK(5, pll1_sysclk5, pll1, 0),
+	DIVCLK(6, pll1_sysclk6, pll1, 0),
+	DIVCLK(7, pll1_sysclk7, pll1, 0),
+	DIVCLK(8, pll1_sysclk8, pll1, 0),
+	DIVCLK(9, pll1_sysclk9, pll1, 0),
+	{ }
+};
+
+static const struct davinci_pll_divclk_info dm365_pll2_divclk_info[] __initconst = {
+	DIVCLK(1, pll2_sysclk1, pll2, 0),
+	DIVCLK(2, pll2_sysclk2, pll2, 0),
+	DIVCLK(3, pll2_sysclk3, pll2, 0),
+	DIVCLK(4, pll2_sysclk4, pll2, 0),
+	DIVCLK(5, pll2_sysclk5, pll2, 0),
+	{ }
+};
+
+void __init dm365_pll_clk_init(void __iomem *pll1, void __iomem *pll2)
+{
+	const struct davinci_pll_divclk_info *info;
+
+	davinci_pll_clk_register("pll1", "ref_clk", pll1);
+	davinci_pll_aux_clk_register("pll1_aux_clk", "ref_clk", pll1);
+	davinci_pll_bpdiv_clk_register("pll1_sysclkbp", "ref_clk", pll1);
+	davinci_pll_obs_clk_register("clkout0", dm365_pll_obsclk_parent_names,
+				     ARRAY_SIZE(dm365_pll_obsclk_parent_names),
+				     pll1, dm365_pll_obsclk_table);
+	for (info = dm365_pll1_divclk_info; info->name; info++)
+		davinci_pll_divclk_register(info, pll1);
+
+	davinci_pll_clk_register("pll2", "ref_clk", pll2);
+	davinci_pll_aux_clk_register("clkout1", "ref_clk", pll2);
+	davinci_pll_obs_clk_register("clkout1", dm365_pll_obsclk_parent_names,
+				    ARRAY_SIZE(dm365_pll_obsclk_parent_names),
+				    pll2, dm365_pll_obsclk_table);
+	for (info = dm365_pll2_divclk_info; info->name; info++)
+		davinci_pll_divclk_register(info, pll2);
+}
diff --git a/include/linux/clk/davinci.h b/include/linux/clk/davinci.h
index 95333fe..5bf60a7 100644
--- a/include/linux/clk/davinci.h
+++ b/include/linux/clk/davinci.h
@@ -12,5 +12,6 @@
 void da830_pll_clk_init(void __iomem *pll);
 void da850_pll_clk_init(void __iomem *pll0, void __iomem *pll1);
 void dm355_pll_clk_init(void __iomem *pll1, void __iomem *pll2);
+void dm365_pll_clk_init(void __iomem *pll1, void __iomem *pll2);
 
 #endif /* __LINUX_CLK_DAVINCI_H__ */
-- 
2.7.4
