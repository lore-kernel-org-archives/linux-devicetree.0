From: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 12/16] clk: tz1090: add HEP clock provider driver
Date: Mon,  1 Dec 2014 23:20:02 +0000
Message-ID: <1417476006-10407-13-git-send-email-james.hogan@imgtec.com>
References: <1417476006-10407-1-git-send-email-james.hogan@imgtec.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417476006-10407-1-git-send-email-james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The TZ1090 High End Peripheral (HEP) register region controls several
clocks for the HEP peripherals.

The set up is pretty straight forward, with only a clock gate bank
(HEP_CLK_EN) needing to be configured.

Signed-off-by: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
Changes since v1 (patch 15):
- New patch.
- Convert explicit DT representation of clock infrastructure using
  generic bindings to several TZ1090 specific bindings representing
  groups of TZ1090 clocks.
---
 drivers/clk/tz1090/Makefile         |  1 +
 drivers/clk/tz1090/clk-tz1090-hep.c | 46 +++++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 drivers/clk/tz1090/clk-tz1090-hep.c

diff --git a/drivers/clk/tz1090/Makefile b/drivers/clk/tz1090/Makefile
index 873a8f6..1d3cd32 100644
--- a/drivers/clk/tz1090/Makefile
+++ b/drivers/clk/tz1090/Makefile
@@ -7,5 +7,6 @@ obj-y		+= clk-tz1090-gate-bank.o
 obj-y		+= clk-tz1090-mux-bank.o
 obj-y		+= clk-tz1090-pll.o
 
+obj-y		+= clk-tz1090-hep.o
 obj-y		+= clk-tz1090-pdc.o
 obj-y		+= clk-tz1090-top.o
diff --git a/drivers/clk/tz1090/clk-tz1090-hep.c b/drivers/clk/tz1090/clk-tz1090-hep.c
new file mode 100644
index 0000000..e5585b4
--- /dev/null
+++ b/drivers/clk/tz1090/clk-tz1090-hep.c
@@ -0,0 +1,46 @@
+/*
+ * Copyright (C) 2013-2014 Imagination Technologies Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify it under
+ * the terms of the GNU General Public License version 2 as published by the
+ * Free Software Foundation.
+ *
+ * TZ1090 High End Peripheral (HEP) Clocks
+ */
+
+#include <dt-bindings/clock/tz1090-hep.h>
+
+#include "clk.h"
+
+/* Register offsets into high end peripheral memory region */
+#define HEP_CLK_EN		0x04
+
+/*
+ *                      CR_HEP_CLK_EN
+ *                      =============
+ *
+ * sys              -+--[ 2d_en      ]--- 0 sys_2d
+ * sys_x2_undeleted -|--[ ddr_en     ]--- 1 ddr_en
+ * sys               `--[ pdp_pdi_en ]--- 2 sys_pdp
+ */
+GATE_BANK(tz1090_hep_clken, 0, HEP_CLK_EN,
+	/*   bit in			out	*/
+	GATE( 0, "@sys",		"sys_2d")
+	GATE( 1, "@sys_x2_undeleted",	"ddr_en")
+	GATE( 2, "@sys",		"sys_pdp")
+	/* bits 3..31 unused */
+);
+
+static void __init tz1090_hep_cru_init(struct device_node *np)
+{
+	struct tz1090_clk_provider *p;
+
+	p = tz1090_clk_alloc_provider(np, CLK_HEP_MAX);
+	if (!p)
+		return;
+
+	tz1090_clk_register_gate_bank(p, &tz1090_hep_clken);
+
+	tz1090_clk_register_provider(p);
+}
+CLK_OF_DECLARE(tz1090_hep_cru, "img,tz1090-hep-cru", tz1090_hep_cru_init);
-- 
2.0.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
