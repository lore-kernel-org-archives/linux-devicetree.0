From: Luis Oliveira <Luis.Oliveira@synopsys.com>
Subject: [PATCH V2 1/2] reset: Add DesignWare IP support to simple reset
Date: Thu,  6 Jun 2019 17:36:27 +0200
Message-ID: <1559835388-2578-2-git-send-email-luis.oliveira@synopsys.com>
References: <1559835388-2578-1-git-send-email-luis.oliveira@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559835388-2578-1-git-send-email-luis.oliveira@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Joao.Pinto@synopsys.com, Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, Luis Oliveira <Luis.Oliveira@synopsys.com>
List-Id: devicetree@vger.kernel.org

From: Gustavo Pimentel <gustavo.pimentel@synopsys.com>

The reset-simple driver can be now used on DesignWare IPs by
default by selecting the following compatible strings:
 - snps,dw-high-reset for active high resets inputs
 - snps,dw-low-reset for active low resets inputs

Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Signed-off-by: Luis Oliveira <luis.oliveira@synopsys.com>
---
Changelog
- no changes

 drivers/reset/Kconfig        | 2 +-
 drivers/reset/reset-simple.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index d506d32..ac85fd2 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -118,7 +118,7 @@ config RESET_QCOM_PDC
 
 config RESET_SIMPLE
 	bool "Simple Reset Controller Driver" if COMPILE_TEST
-	default ARCH_STM32 || ARCH_STRATIX10 || ARCH_SUNXI || ARCH_ZX || ARCH_ASPEED
+	default ARCH_STM32 || ARCH_STRATIX10 || ARCH_SUNXI || ARCH_ZX || ARCH_ASPEED || ARC
 	help
 	  This enables a simple reset controller driver for reset lines that
 	  that can be asserted and deasserted by toggling bits in a contiguous,
diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 77fbba3..79e73be 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -129,6 +129,9 @@ static const struct of_device_id reset_simple_dt_ids[] = {
 		.data = &reset_simple_active_low },
 	{ .compatible = "aspeed,ast2400-lpc-reset" },
 	{ .compatible = "aspeed,ast2500-lpc-reset" },
+	{ .compatible = "snps,dw-high-reset" },
+	{ .compatible = "snps,dw-low-reset",
+		.data = &reset_simple_active_low },
 	{ /* sentinel */ },
 };
 
-- 
2.7.4
