From: Saravanan Sekar <sravanhome@gmail.com>
Subject: [PATCH v6 1/5] clk: actions: Add missing REGMAP_MMIO dependency
Date: Sun, 15 Jul 2018 22:35:20 +0200
Message-ID: <20180715203524.11948-2-sravanhome@gmail.com>
References: <20180715203524.11948-1-sravanhome@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180715203524.11948-1-sravanhome@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: afaerber@suse.de, manivannan.sadhasivam@linaro.org, sboyd@kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@cubietech.com, sravanhome@gmail.com, support@cubietech.com, catalin.marinas@arm.com, mturquette@baylibre.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, thomas.liau@actions-semi.com, darren@cubietech.com, robh+dt@kernel.org, jeff.chen@actions-semi.com, pn@denx.de, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mp-cs@actions-semi.com
List-Id: devicetree@vger.kernel.org

Add REGMAP_MMIO as dependency to avoid undefined
reference to regmap symbols.

Fixes: d85d20053e19 ("clk: actions: Add S900 SoC clock support")
Signed-off-by: Saravanan Sekar <sravanhome@gmail.com>
---
 drivers/clk/actions/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/actions/Kconfig b/drivers/clk/actions/Kconfig
index 8854adb37847..39491154abbf 100644
--- a/drivers/clk/actions/Kconfig
+++ b/drivers/clk/actions/Kconfig
@@ -1,6 +1,7 @@
 config CLK_ACTIONS
 	bool "Clock driver for Actions Semi SoCs"
 	depends on ARCH_ACTIONS || COMPILE_TEST
+	select REGMAP_MMIO
 	default ARCH_ACTIONS
 
 if CLK_ACTIONS
-- 
2.18.0
