From: Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 2/2] clk: mediatek: add audsys clock driver for MT8516
Date: Thu,  2 May 2019 14:18:43 +0200
Message-ID: <20190502121843.14493-2-fparent@baylibre.com>
References: <20190502121843.14493-1-fparent@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190502121843.14493-1-fparent@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, wenzhen.yu@mediatek.com, sean.wang@mediatek.com, ryder.lee@mediatek.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
List-Id: devicetree@vger.kernel.org

Add audsys clock driver for MediaTek MT8516 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/clk/mediatek/Kconfig          |  6 +++
 drivers/clk/mediatek/Makefile         |  1 +
 drivers/clk/mediatek/clk-mt8516-aud.c | 65 +++++++++++++++++++++++++++
 3 files changed, 72 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8516-aud.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 1e951ae49982..f9cd45e7760a 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -225,4 +225,10 @@ config COMMON_CLK_MT8516
 	help
 	  This driver supports MediaTek MT8516 clocks.
 
+config COMMON_CLK_MT8516_AUDSYS
+	bool "Clock driver for MediaTek MT8516 audsys"
+	depends on COMMON_CLK_MT8516
+	help
+	  This driver supports MediaTek MT8516 audsys clocks.
+
 endmenu
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index c4f413ef5aad..a2557b0c9273 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -32,3 +32,4 @@ obj-$(CONFIG_COMMON_CLK_MT7629_HIFSYS) += clk-mt7629-hif.o
 obj-$(CONFIG_COMMON_CLK_MT8135) += clk-mt8135.o
 obj-$(CONFIG_COMMON_CLK_MT8173) += clk-mt8173.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
+obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8516-aud.c b/drivers/clk/mediatek/clk-mt8516-aud.c
new file mode 100644
index 000000000000..6ab3a06dc9d5
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8516-aud.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Author: James Liao <jamesjj.liao@mediatek.com>
+ *         Fabien Parent <fparent@baylibre.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8516-clk.h>
+
+static const struct mtk_gate_regs aud_cg_regs = {
+	.set_ofs = 0x0,
+	.clr_ofs = 0x0,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_AUD(_id, _name, _parent, _shift) {	\
+		.id = _id,			\
+		.name = _name,			\
+		.parent_name = _parent,		\
+		.regs = &aud_cg_regs,		\
+		.shift = _shift,		\
+		.ops = &mtk_clk_gate_ops_no_setclr,		\
+	}
+
+static const struct mtk_gate aud_clks[] __initconst = {
+	GATE_AUD(CLK_AUD_AFE, "aud_afe", "clk26m_ck", 2),
+	GATE_AUD(CLK_AUD_I2S, "aud_i2s", "i2s_infra_bck", 6),
+	GATE_AUD(CLK_AUD_22M, "aud_22m", "rg_aud_engen1", 8),
+	GATE_AUD(CLK_AUD_24M, "aud_24m", "rg_aud_engen2", 9),
+	GATE_AUD(CLK_AUD_INTDIR, "aud_intdir", "rg_aud_spdif_in", 15),
+	GATE_AUD(CLK_AUD_APLL2_TUNER, "aud_apll2_tuner", "rg_aud_engen2", 18),
+	GATE_AUD(CLK_AUD_APLL_TUNER, "aud_apll_tuner", "rg_aud_engen1", 19),
+	GATE_AUD(CLK_AUD_HDMI, "aud_hdmi", "apll12_div4", 20),
+	GATE_AUD(CLK_AUD_SPDF, "aud_spdf", "apll12_div6", 21),
+	GATE_AUD(CLK_AUD_ADC, "aud_adc", "aud_afe", 24),
+	GATE_AUD(CLK_AUD_DAC, "aud_dac", "aud_afe", 25),
+	GATE_AUD(CLK_AUD_DAC_PREDIS, "aud_dac_predis", "aud_afe", 26),
+	GATE_AUD(CLK_AUD_TML, "aud_tml", "aud_afe", 27),
+};
+
+static void __init mtk_audsys_init(struct device_node *node)
+{
+	struct clk_onecell_data *clk_data;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_AUD_NR_CLK);
+
+	mtk_clk_register_gates(node, aud_clks, ARRAY_SIZE(aud_clks), clk_data);
+
+	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	if (r)
+		pr_err("%s(): could not register clock provider: %d\n",
+			__func__, r);
+
+}
+CLK_OF_DECLARE(mtk_audsys, "mediatek,mt8516-audsys", mtk_audsys_init);
-- 
2.20.1
