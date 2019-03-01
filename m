Return-Path: <SRS0=/CI9=RE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from imap1.codethink.co.uk ([176.9.8.82]:34194 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728377AbfCAPwu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 Mar 2019 10:52:50 -0500
From: Kejia Hu <kejia.hu@codethink.co.uk>
Subject: [PATCH v2 4/6] kconfig: build device tree overlay into tegra20/30
Date: Fri,  1 Mar 2019 15:35:38 +0000
Message-Id: <20190301153540.14954-5-kejia.hu@codethink.co.uk>
In-Reply-To: <20190301153540.14954-1-kejia.hu@codethink.co.uk>
References: <20190301153540.14954-1-kejia.hu@codethink.co.uk>
Sender: devicetree-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, digetx@gmail.com
Cc: Kejia Hu <kejia.hu@codethink.co.uk>
List-ID: <devicetree@vger.kernel.org>

Signed-off-by: Kejia Hu <kejia.hu@codethink.co.uk>
---
 drivers/clk/tegra/Makefile | 6 ++++--
 drivers/soc/tegra/Kconfig  | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
index 6507acc843c7..b9d8281c3629 100644
--- a/drivers/clk/tegra/Makefile
+++ b/drivers/clk/tegra/Makefile
@@ -16,8 +16,10 @@ obj-y					+= clk-tegra-pmc.o
 obj-y					+= clk-tegra-fixed.o
 obj-y					+= clk-tegra-super-gen4.o
 obj-$(CONFIG_TEGRA_CLK_EMC)		+= clk-emc.o
-obj-$(CONFIG_ARCH_TEGRA_2x_SOC)         += clk-tegra20.o
-obj-$(CONFIG_ARCH_TEGRA_3x_SOC)         += clk-tegra30.o
+obj-$(CONFIG_ARCH_TEGRA_2x_SOC)         += clk-tegra20.o \
+					   tegra20_automative_dt_overlay.dtb.o
+obj-$(CONFIG_ARCH_TEGRA_3x_SOC)         += clk-tegra30.o \
+					   tegra30_automative_dt_overlay.dtb.o
 obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+= clk-tegra114.o
 obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= clk-tegra124.o
 obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= clk-tegra124-dfll-fcpu.o
diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index fe4481676da6..a61f34af738d 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -15,6 +15,7 @@ config ARCH_TEGRA_2x_SOC
 	select SOC_TEGRA_FLOWCTRL
 	select SOC_TEGRA_PMC
 	select TEGRA_TIMER
+	select OF_OVERLAY
 	help
 	  Support for NVIDIA Tegra AP20 and T20 processors, based on the
 	  ARM CortexA9MP CPU and the ARM PL310 L2 cache controller
@@ -28,6 +29,7 @@ config ARCH_TEGRA_3x_SOC
 	select SOC_TEGRA_FLOWCTRL
 	select SOC_TEGRA_PMC
 	select TEGRA_TIMER
+	select OF_OVERLAY
 	help
 	  Support for NVIDIA Tegra T30 processor family, based on the
 	  ARM CortexA9MP CPU and the ARM PL310 L2 cache controller
-- 
2.11.0
