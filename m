From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 1/2] clk: meson: add clk-input helper function
Date: Tue,  4 Dec 2018 17:58:18 +0100
Message-ID: <20181204165819.21541-2-jbrunet@baylibre.com>
References: <20181204165819.21541-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204165819.21541-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the clock input helper function. Several amlogic clock controllers
will now be registering bypass clock input. Instead of copying this
code in every of them, let's make an helper function for it

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/Makefile    |  2 +-
 drivers/clk/meson/clk-input.c | 44 +++++++++++++++++++++++++++++++++++
 drivers/clk/meson/clkc.h      |  5 ++++
 3 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/meson/clk-input.c

diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index 6da1d7082f1a..e8d1c727cf69 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -3,7 +3,7 @@
 #
 
 obj-$(CONFIG_COMMON_CLK_AMLOGIC) += clk-pll.o clk-mpll.o clk-phase.o vid-pll-div.o
-obj-$(CONFIG_COMMON_CLK_AMLOGIC) += clk-dualdiv.o
+obj-$(CONFIG_COMMON_CLK_AMLOGIC) += clk-dualdiv.o clk-input.o
 obj-$(CONFIG_COMMON_CLK_AMLOGIC_AUDIO)	+= clk-triphase.o sclk-div.o
 obj-$(CONFIG_COMMON_CLK_MESON_AO) += meson-aoclk.o
 obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o
diff --git a/drivers/clk/meson/clk-input.c b/drivers/clk/meson/clk-input.c
new file mode 100644
index 000000000000..06b3e3bb6a66
--- /dev/null
+++ b/drivers/clk/meson/clk-input.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2018 BayLibre, SAS.
+ * Author: Jerome Brunet <jbrunet@baylibre.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include "clkc.h"
+
+static const struct clk_ops meson_clk_no_ops = {};
+
+struct clk_hw *meson_clk_hw_register_input(struct device *dev,
+					   const char *of_name,
+					   const char *clk_name,
+					   unsigned long flags)
+{
+	struct clk *parent_clk = devm_clk_get(dev, of_name);
+	struct clk_init_data init;
+	const char *parent_name;
+	struct clk_hw *hw;
+	int ret;
+
+	if (IS_ERR(parent_clk))
+		return (struct clk_hw *)parent_clk;
+
+	hw = devm_kzalloc(dev, sizeof(*hw), GFP_KERNEL);
+	if (!hw)
+		return ERR_PTR(-ENOMEM);
+
+	parent_name = __clk_get_name(parent_clk);
+	init.name = clk_name;
+	init.ops = &meson_clk_no_ops;
+	init.flags = flags;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+	hw->init = &init;
+
+	ret = devm_clk_hw_register(dev, hw);
+
+	return ret ? ERR_PTR(ret) : hw;
+}
+EXPORT_SYMBOL_GPL(meson_clk_hw_register_input);
diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
index 1efa6be9cfe4..e3cd442db739 100644
--- a/drivers/clk/meson/clkc.h
+++ b/drivers/clk/meson/clkc.h
@@ -138,4 +138,9 @@ extern const struct clk_ops meson_vid_pll_div_ro_ops;
 extern const struct clk_ops meson_clk_dualdiv_ops;
 extern const struct clk_ops meson_clk_dualdiv_ro_ops;
 
+struct clk_hw *meson_clk_hw_register_input(struct device *dev,
+					   const char *of_name,
+					   const char *clk_name,
+					   unsigned long flags);
+
 #endif /* __CLKC_H */
-- 
2.19.1
