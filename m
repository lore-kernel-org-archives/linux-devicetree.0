Return-Path: <SRS0=/CI9=RE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from imap1.codethink.co.uk ([176.9.8.82]:34208 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387871AbfCAPww (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 Mar 2019 10:52:52 -0500
From: Kejia Hu <kejia.hu@codethink.co.uk>
Subject: [PATCH v2 5/6] clk: tegra20: add automotive specific clocks as dt overlay
Date: Fri,  1 Mar 2019 15:35:39 +0000
Message-Id: <20190301153540.14954-6-kejia.hu@codethink.co.uk>
In-Reply-To: <20190301153540.14954-1-kejia.hu@codethink.co.uk>
References: <20190301153540.14954-1-kejia.hu@codethink.co.uk>
Sender: devicetree-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, digetx@gmail.com
Cc: Kejia Hu <kejia.hu@codethink.co.uk>
List-ID: <devicetree@vger.kernel.org>

Signed-off-by: Kejia Hu <kejia.hu@codethink.co.uk>
---
 drivers/clk/tegra/clk-tegra20.c                    |  19 ++++
 .../clk/tegra/tegra20_automative_dt_overlay.dts    | 117 +++++++++++++++++++++
 2 files changed, 136 insertions(+)
 create mode 100644 drivers/clk/tegra/tegra20_automative_dt_overlay.dts

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index c71b61162a32..ec9fce298c39 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -22,6 +22,7 @@
 #include <linux/clk/tegra.h>
 #include <linux/delay.h>
 #include <dt-bindings/clock/tegra20-car.h>
+#include <soc/tegra/common.h>
 
 #include "clk.h"
 #include "clk-id.h"
@@ -127,6 +128,11 @@
 #define CPU_CLOCK(cpu)	(0x1 << (8 + cpu))
 #define CPU_RESET(cpu)	(0x1111ul << (cpu))
 
+extern char __dtb_tegra20_automative_dt_overlay_begin[];
+extern char __dtb_tegra20_automative_dt_overlay_end[];
+
+
+
 #ifdef CONFIG_PM_SLEEP
 static struct cpu_clk_suspend_context {
 	u32 pllx_misc;
@@ -1188,6 +1194,19 @@ static void __init tegra20_clock_init(struct device_node *np)
 
 	tegra_clk_apply_init_table = tegra20_clock_apply_init_table;
 
+	if (soc_is_tegra_auto()) {
+		int ret = 0;
+		int ovcs_id;
+		void *begin = __dtb_tegra20_automative_dt_overlay_begin;
+		void *end = __dtb_tegra20_automative_dt_overlay_end;
+
+		pr_info("Initialise Tegra Automotive clocks\n");
+
+		ret = of_overlay_fdt_apply(begin, end - begin, &ovcs_id);
+		if (ret)
+			pr_err("Failed to apply device tree overlay, ret = %d\n", ret);
+	}
+
 	tegra_cpu_car_ops = &tegra20_cpu_car_ops;
 }
 CLK_OF_DECLARE(tegra20, "nvidia,tegra20-car", tegra20_clock_init);
diff --git a/drivers/clk/tegra/tegra20_automative_dt_overlay.dts b/drivers/clk/tegra/tegra20_automative_dt_overlay.dts
new file mode 100644
index 000000000000..454046b1a055
--- /dev/null
+++ b/drivers/clk/tegra/tegra20_automative_dt_overlay.dts
@@ -0,0 +1,117 @@
+/*
+ * Clock initialization specific to Tegra2 Automative Chipset
+ *
+ * Copyright (C) 2019 Codethink Ltd
+ *                    Kejia Hu <kejia.hu@codethink.co.uk>
+*/
+
+#include <dt-bindings/clock/tegra20-car.h>
+
+/dts-v1/;
+/plugin/;
+
+/ {
+        fragment@0 {
+                target-path = "/pmc@7000e400";
+                __overlay__ {
+                        assigned-clocks = <&tegra_car TEGRA20_CLK_PCLK>;
+                        assigned-clock-rates = <120000000>;
+                };
+        };
+
+        fragment@1 {
+                target-path = "/spi@7000d400";
+                __overlay__ {
+                        assigned-clocks = <&tegra_car TEGRA20_CLK_SBC1>;
+			assigned-clock-parents = <&tegra_car TEGRA20_CLK_PLL_C>;
+                        assigned-clock-rates = <12000000>;
+                };
+        };
+
+        fragment@2 {
+                target-path = "/spi@7000d600";
+                __overlay__ {
+                        assigned-clocks = <&tegra_car TEGRA20_CLK_SBC2>;
+			assigned-clock-parents = <&tegra_car TEGRA20_CLK_PLL_C>;
+                        assigned-clock-rates = <12000000>;
+                };
+        };
+
+        fragment@3 {
+                target-path = "/spi@7000d800";
+                __overlay__ {
+                        assigned-clocks = <&tegra_car TEGRA20_CLK_SBC3>;
+			assigned-clock-parents = <&tegra_car TEGRA20_CLK_PLL_C>;
+                        assigned-clock-rates = <12000000>;
+                };
+        };
+
+        fragment@4 {
+                target-path = "/spi@7000da00";
+                __overlay__ {
+                        assigned-clocks = <&tegra_car TEGRA20_CLK_SBC4>;
+			assigned-clock-parents = <&tegra_car TEGRA20_CLK_PLL_C>;
+                        assigned-clock-rates = <12000000>;
+                };
+        };
+
+        fragment@5 {
+                target-path = "/nand-controller@70008000";
+                __overlay__ {
+                        assigned-clocks = <&tegra_car TEGRA20_CLK_NDFLASH>;
+			assigned-clock-parents = <&tegra_car TEGRA20_CLK_PLL_P>;
+                        assigned-clock-rates = <86500000>;
+                };
+        };
+
+        fragment@6 {
+                target-path = "/vde@6001a000";
+                __overlay__ {
+                        assigned-clocks = <&tegra_car TEGRA20_CLK_VDE>;
+			assigned-clock-parents = <&tegra_car TEGRA20_CLK_PLL_C>;
+                };
+        };
+
+        fragment@7 {
+                target-path = "/host1x@50000000";
+                __overlay__ {
+                        assigned-clocks = <&tegra_car TEGRA20_CLK_HOST1X>;
+			assigned-clock-parents = <&tegra_car TEGRA20_CLK_PLL_M>;
+                        assigned-clock-rates = <266400000>;
+
+	                mpe@54040000 {
+				assigned-clocks = <&tegra_car TEGRA20_CLK_MPE>;
+				assigned-clock-parents = <&tegra_car TEGRA20_CLK_PLL_C>;
+				assigned-clock-rates = <300000000>;
+			};
+
+	                vi@54080000 {
+				assigned-clocks = <&tegra_car TEGRA20_CLK_VI>;
+				assigned-clock-parents = <&tegra_car TEGRA20_CLK_PLL_M>;
+				assigned-clock-rates = <111000000>;
+			};
+
+	                epp@540c0000 {
+				assigned-clocks = <&tegra_car TEGRA20_CLK_EPP>;
+				assigned-clock-parents = <&tegra_car TEGRA20_CLK_PLL_M>;
+				assigned-clock-rates = <266400000>;
+			};
+
+	                gr2d@54140000 {
+				assigned-clocks = <&tegra_car TEGRA20_CLK_GR2D>;
+			};
+
+	                gr3d@54180000 {
+				assigned-clocks = <&tegra_car TEGRA20_CLK_GR3D>;
+				assigned-clock-rates = <300000000>;
+			};
+
+	                dc@54200000 {
+				assigned-clocks = <&tegra_car TEGRA20_CLK_DISP1>;
+				assigned-clock-parents = <&tegra_car TEGRA20_CLK_PLL_D_OUT0>;
+				assigned-clock-rates = <297000000>;
+			};
+                };
+        };
+};
+
-- 
2.11.0
