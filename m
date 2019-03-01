Return-Path: <SRS0=/CI9=RE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from imap1.codethink.co.uk ([176.9.8.82]:34202 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387833AbfCAPww (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 Mar 2019 10:52:52 -0500
From: Kejia Hu <kejia.hu@codethink.co.uk>
Subject: [PATCH v2 6/6] clk: tegra30: add automotive specific clocks as dt overlay
Date: Fri,  1 Mar 2019 15:35:40 +0000
Message-Id: <20190301153540.14954-7-kejia.hu@codethink.co.uk>
In-Reply-To: <20190301153540.14954-1-kejia.hu@codethink.co.uk>
References: <20190301153540.14954-1-kejia.hu@codethink.co.uk>
Sender: devicetree-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, digetx@gmail.com
Cc: Kejia Hu <kejia.hu@codethink.co.uk>
List-ID: <devicetree@vger.kernel.org>

Signed-off-by: Kejia Hu <kejia.hu@codethink.co.uk>
---
 drivers/clk/tegra/clk-tegra30.c                    |  17 ++
 .../clk/tegra/tegra30_automative_dt_overlay.dts    | 256 +++++++++++++++++++++
 2 files changed, 273 insertions(+)
 create mode 100644 drivers/clk/tegra/tegra30_automative_dt_overlay.dts

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index fa8d573ac626..757551af2b29 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -25,6 +25,7 @@
 #include <soc/tegra/pmc.h>
 
 #include <dt-bindings/clock/tegra30-car.h>
+#include <soc/tegra/common.h>
 
 #include "clk.h"
 #include "clk-id.h"
@@ -145,6 +146,9 @@
 /* PLLM override registers */
 #define PMC_PLLM_WB0_OVERRIDE 0x1dc
 
+extern char __dtb_tegra30_automative_dt_overlay_begin[];
+extern char __dtb_tegra30_automative_dt_overlay_end[];
+
 #ifdef CONFIG_PM_SLEEP
 static struct cpu_clk_suspend_context {
 	u32 pllx_misc;
@@ -1361,6 +1365,19 @@ static void __init tegra30_clock_init(struct device_node *np)
 
 	tegra_clk_apply_init_table = tegra30_clock_apply_init_table;
 
+	if (soc_is_tegra_auto()) {
+		int ret = 0;
+		int ovcs_id;
+		void *begin = __dtb_tegra30_automative_dt_overlay_begin;
+		void *end = __dtb_tegra30_automative_dt_overlay_end;
+
+		pr_info("Initialise Tegra Automotive clocks\n");
+
+		ret = of_overlay_fdt_apply(begin, end - begin, &ovcs_id);
+		if (ret)
+			pr_err("Failed to apply device tree overlay, ret = %d\n", ret);
+	}
+
 	tegra_cpu_car_ops = &tegra30_cpu_car_ops;
 }
 CLK_OF_DECLARE(tegra30, "nvidia,tegra30-car", tegra30_clock_init);
diff --git a/drivers/clk/tegra/tegra30_automative_dt_overlay.dts b/drivers/clk/tegra/tegra30_automative_dt_overlay.dts
new file mode 100644
index 000000000000..008d05ef3544
--- /dev/null
+++ b/drivers/clk/tegra/tegra30_automative_dt_overlay.dts
@@ -0,0 +1,256 @@
+/*
+ * Clock initialization specific to Tegra3 Automative Chipset
+ *
+ * Copyright (C) 2019 Codethink Ltd
+ *                    Kejia Hu <kejia.hu@codethink.co.uk>
+*/
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/tegra30-car.h>
+
+/ {
+	fragment@0 {
+		target-path = "/sound";
+		__overlay__ {
+			assigned-clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
+					  <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
+					  <&tegra_car TEGRA30_CLK_EXTERN1>;
+			assigned-clock-rates = <552960000>,
+					       <24576000>,
+					       <24576000>;
+		};
+	};
+
+	fragment@1 {
+		target-path = "/ahub@70080000/tegra_i2s0";
+		__overlay__ {
+			assigned-clocks = <&tegra_car TEGRA30_CLK_I2S0>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_CLK_M>;
+			assigned-clock-rates = <12288000>;
+		};
+	};
+
+	fragment@2 {
+		target-path = "/ahub@70080000/tegra_i2s1";
+		__overlay__ {
+			assigned-clocks = <&tegra_car TEGRA30_CLK_I2S1>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_CLK_M>;
+			assigned-clock-rates = <12288000>;
+		};
+	};
+
+	fragment@3 {
+		target-path = "/ahub@70080000/tegra_i2s2";
+		__overlay__ {
+			assigned-clocks = <&tegra_car TEGRA30_CLK_I2S2>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_CLK_M>;
+			assigned-clock-rates = <12288000>;
+		};
+	};
+
+	fragment@4 {
+		target-path = "/ahub@70080000/tegra_i2s3";
+		__overlay__ {
+			assigned-clocks = <&tegra_car TEGRA30_CLK_I2S3>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_CLK_M>;
+			assigned-clock-rates = <12288000>;
+		};
+	};
+
+	fragment@5 {
+		target-path = "/ahub@70080000/tegra_i2s4";
+		__overlay__ {
+			assigned-clocks = <&tegra_car TEGRA30_CLK_I2S4>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_CLK_M>;
+			assigned-clock-rates = <12288000>;
+		};
+	};
+
+	fragment@6 {
+		target-path = "/sdhci@78000200";
+		__overlay__ {
+			assigned-clocks = <&tegra_car TEGRA30_CLK_SDMMC2>;
+			assigned-clock-rates = <104000000>;
+		};
+	};
+
+	fragment@7 {
+		target-path = "/sdhci@78000600";
+		__overlay__ {
+			assigned-clocks = <&tegra_car TEGRA30_CLK_SDMMC4>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_PLL_P>;
+			assigned-clock-rates = <48000000>;
+		};
+	};
+
+	fragment@8 {
+		target-path = "/spi@7000d400";
+		__overlay__ {
+			assigned-clocks = <&tegra_car TEGRA30_CLK_SBC1>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_CLK_M>;
+			assigned-clock-rates = <15822784>;
+		};
+	};
+
+	fragment@9 {
+		target-path = "/spi@7000d600";
+		__overlay__ {
+			assigned-clocks = <&tegra_car TEGRA30_CLK_SBC2>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_CLK_M>;
+			assigned-clock-rates = <100000000>;
+		};
+	};
+
+	fragment@10 {
+		target-path = "/spi@7000d800";
+		__overlay__ {
+			assigned-clocks = <&tegra_car TEGRA30_CLK_SBC3>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_CLK_M>;
+			assigned-clock-rates = <100000000>;
+		};
+	};
+
+	fragment@11 {
+		target-path = "/spi@7000da00";
+		__overlay__ {
+			assigned-clocks = <&tegra_car TEGRA30_CLK_SBC4>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_CLK_M>;
+			assigned-clock-rates = <100000000>;
+		};
+	};
+
+	fragment@12 {
+		target-path = "/spi@7000dc00";
+		__overlay__ {
+			assigned-clocks = <&tegra_car TEGRA30_CLK_SBC5>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_CLK_M>;
+			assigned-clock-rates = <100000000>;
+		};
+	};
+
+	fragment@13 {
+		target-path = "/spi@7000de00";
+		__overlay__ {
+			assigned-clocks = <&tegra_car TEGRA30_CLK_SBC6>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_CLK_M>;
+			assigned-clock-rates = <100000000>;
+		};
+	};
+
+	fragment@14 {
+		target-path = "/host1x@50000000";
+		__overlay__ {
+			assigned-clocks = <&tegra_car TEGRA30_CLK_HOST1X>;
+			assigned-clock-rates = <242000000>;
+
+			gr2d@54140000 {
+				assigned-clocks = <&tegra_car TEGRA30_CLK_GR2D>;
+				assigned-clock-parents = <&tegra_car TEGRA30_CLK_CLK_MAX>;
+				assigned-clock-rates = <484000000>;
+			};
+
+			gr3d@54180000 {
+				assigned-clocks = <&tegra_car TEGRA30_CLK_GR3D>,
+						  <&tegra_car TEGRA30_CLK_GR3D2>;
+				assigned-clock-parents = <&tegra_car TEGRA30_CLK_CLK_MAX>,
+							 <&tegra_car TEGRA30_CLK_CLK_MAX>;
+				assigned-clock-rates = <484000000>, <484000000>;
+			};
+
+			dc@54200000 {
+				assigned-clocks = <&tegra_car TEGRA30_CLK_DISP1>;
+				assigned-clock-rates = <275000000>;
+			};
+
+			dc@54240000 {
+				assigned-clocks = <&tegra_car TEGRA30_CLK_DISP2>;
+				assigned-clock-rates = <275000000>;
+			};
+
+			epp@540c0000 {
+				assigned-clocks = <&tegra_car TEGRA30_CLK_EPP>;
+				assigned-clock-parents = <&tegra_car TEGRA30_CLK_PLL_C>;
+				assigned-clock-rates = <484000000>;
+			};
+
+			mpe@54040000 {
+				assigned-clocks = <&tegra_car TEGRA30_CLK_MPE>;
+				assigned-clock-parents = <&tegra_car TEGRA30_CLK_PLL_C>;
+				assigned-clock-rates = <484000000>;
+			};
+
+			vi@54080000 {
+				assigned-clocks = <&tegra_car TEGRA30_CLK_VI>;
+				assigned-clock-parents = <&tegra_car TEGRA30_CLK_PLL_P>;
+				assigned-clock-rates = <150000000>;
+			};
+		};
+	};
+
+	fragment@15 {
+		target-path = "/vde@6001a000";
+		__overlay__ {
+			assigned-clocks = <&tegra_car TEGRA30_CLK_VDE>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_PLL_C>;
+			assigned-clock-rates = <484000000>;
+		};
+	};
+
+	fragment@16 {
+		target-path = "/fuse@7000f800";
+		__overlay__ {
+			assigned-clocks = <&tegra_car TEGRA30_CLK_FUSE>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_CLK_MAX>;
+			assigned-clock-rates = <12000000>;
+		};
+	};
+
+	fragment@17 {
+		target-path = "/hda@70030000";
+		__overlay__ {
+			assigned-clocks = <&tegra_car TEGRA30_CLK_HDA>,
+					  <&tegra_car TEGRA30_CLK_HDA2CODEC_2X>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_PLL_P>,
+						 <&tegra_car TEGRA30_CLK_PLL_P>;
+			assigned-clock-rates = <108000000>, <48000000>;
+		};
+	};
+
+	fragment@18 {
+		target-path = "/gmi@70009000";
+		__overlay__ {
+			assigned-clocks = <&tegra_car TEGRA30_CLK_NOR>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_PLL_P>;
+			assigned-clock-rates = <102000000>;
+		};
+	};
+
+	fragment@19 {
+		target-path = "/pmc@7000e400";
+		__overlay__ {
+			assigned-clocks = <&tegra_car TEGRA30_CLK_PCLK>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_CLK_MAX>;
+			assigned-clock-rates = <166250000>;
+		};
+	};
+
+	fragment@20 {
+		target-path = "/ahub@70080000";
+		__overlay__ {
+			assigned-clocks = <&tegra_car TEGRA30_CLK_D_AUDIO>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_PLL_A_OUT0>;
+			assigned-clock-rates = <24576000>;
+		};
+	};
+
+	fragment@21 {
+		target-path = "/pwm@7000a000";
+		__overlay__ {
+			assigned-clocks = <&tegra_car TEGRA30_CLK_PWM>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_CLK_32K>;
+			assigned-clock-rates = <32768>;
+		};
+	};
+};
-- 
2.11.0
