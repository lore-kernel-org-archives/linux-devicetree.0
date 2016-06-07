From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v2 04/15] clk: sunxi-ng: Add fixed factor clock support
Date: Tue,  7 Jun 2016 22:41:43 +0200
Message-ID: <20160607204154.31967-5-maxime.ripard@free-electrons.com>
References: <20160607204154.31967-1-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160607204154.31967-1-maxime.ripard@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Vishnu Patekar <vishnupatekar0510@gmail.com>, Jean-Francois Moine <moinejf@free.fr>, Andre Przywara <andre.przywara@arm.com>, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Some clocks in the Allwinner SoCs clock units are direct, fixed,
multipliers or dividers from their parent.

Add support for such clocks.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 drivers/clk/sunxi-ng/Makefile           |  2 ++
 drivers/clk/sunxi-ng/ccu_fixed_factor.c | 50 +++++++++++++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_fixed_factor.h | 50 +++++++++++++++++++++++++++++++++
 3 files changed, 102 insertions(+)
 create mode 100644 drivers/clk/sunxi-ng/ccu_fixed_factor.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_fixed_factor.h

diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefile
index 4585443b3771..c59cf2ea509b 100644
--- a/drivers/clk/sunxi-ng/Makefile
+++ b/drivers/clk/sunxi-ng/Makefile
@@ -2,3 +2,5 @@ obj-y += ccu_common.o
 obj-y += ccu_reset.o
 
 obj-y += ccu_frac.o
+
+obj-y += ccu_fixed_factor.o
diff --git a/drivers/clk/sunxi-ng/ccu_fixed_factor.c b/drivers/clk/sunxi-ng/ccu_fixed_factor.c
new file mode 100644
index 000000000000..0498dc5340ea
--- /dev/null
+++ b/drivers/clk/sunxi-ng/ccu_fixed_factor.c
@@ -0,0 +1,50 @@
+/*
+ * Copyright (C) 2016 Maxime Ripard
+ * Maxime Ripard <maxime.ripard@free-electrons.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ */
+
+#include <linux/clk-provider.h>
+
+#include "ccu_fixed_factor.h"
+
+static unsigned long ccu_fixed_factor_recalc_rate(struct clk_hw *hw,
+						  unsigned long parent_rate)
+{
+	struct ccu_fixed_factor *fix = hw_to_ccu_fixed_factor(hw);
+
+	return parent_rate / fix->div * fix->mult;
+}
+
+static long ccu_fixed_factor_round_rate(struct clk_hw *hw,
+					unsigned long rate,
+					unsigned long *parent_rate)
+{
+	struct ccu_fixed_factor *fix = hw_to_ccu_fixed_factor(hw);
+
+	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
+		unsigned long best_parent;
+
+		best_parent = (rate / fix->mult) * fix->div;
+		*parent_rate = clk_hw_round_rate(clk_hw_get_parent(hw),
+						 best_parent);
+	}
+
+	return *parent_rate / fix->div * fix->mult;
+}
+
+static int ccu_fixed_factor_set_rate(struct clk_hw *hw, unsigned long rate,
+				     unsigned long parent_rate)
+{
+	return 0;
+}
+
+const struct clk_ops ccu_fixed_factor_ops = {
+	.recalc_rate	= ccu_fixed_factor_recalc_rate,
+	.round_rate	= ccu_fixed_factor_round_rate,
+	.set_rate	= ccu_fixed_factor_set_rate,
+};
diff --git a/drivers/clk/sunxi-ng/ccu_fixed_factor.h b/drivers/clk/sunxi-ng/ccu_fixed_factor.h
new file mode 100644
index 000000000000..4e53dbc9d10b
--- /dev/null
+++ b/drivers/clk/sunxi-ng/ccu_fixed_factor.h
@@ -0,0 +1,50 @@
+/*
+ * Copyright (c) 2016 Maxime Ripard. All rights reserved.
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef _CCU_FIXED_FACTOR_H_
+#define _CCU_FIXED_FACTOR_H_
+
+#include <linux/clk-provider.h>
+
+#include "ccu_common.h"
+
+struct ccu_fixed_factor {
+	u16			div;
+	u16			mult;
+
+	struct ccu_common	common;
+};
+
+#define SUNXI_CCU_FIXED_FACTOR(_struct, _name, _parent,			\
+			       _div, _mult, _flags)			\
+	struct ccu_fixed_factor _struct = {				\
+		.div	= _div,						\
+		.mult	= _mult,					\
+		.common	= {						\
+			.hw.init	= SUNXI_HW_INIT(_name,		\
+							_parent,	\
+							&ccu_fixed_factor_ops, \
+							_flags),	\
+		},							\
+	}
+
+static inline struct ccu_fixed_factor *hw_to_ccu_fixed_factor(struct clk_hw *hw)
+{
+	struct ccu_common *common = hw_to_ccu_common(hw);
+
+	return container_of(common, struct ccu_fixed_factor, common);
+}
+
+extern const struct clk_ops ccu_fixed_factor_ops;
+
+#endif /* _CCU_FIXED_FACTOR_H_ */
-- 
2.8.3
