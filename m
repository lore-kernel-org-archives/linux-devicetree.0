From: Bai Ping <b51503@freescale.com>
Subject: [PATCH 3/3] ARM: imx: enable cpufreq device on i.mx7d
Date: Tue, 24 Nov 2015 18:25:16 +0800
Message-ID: <1448360716-1741-3-git-send-email-b51503@freescale.com>
References: <1448360716-1741-1-git-send-email-b51503@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1448360716-1741-1-git-send-email-b51503@freescale.com>
Sender: linux-clk-owner@vger.kernel.org
To: shawnguo@kernel.org, kernel@pengutronix.de
Cc: l.stach@pengutronix.de, robh+dt@kernel.org, pawel.moll@arm.com, mturquette@baylibre.com, sboyd@codeaurora.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a cpufreq-dt device on i.MX7D, using the
generic cpufreq-dt for CPU frequency scaling.

Signed-off-by: Bai Ping <b51503@freescale.com>
---
 arch/arm/mach-imx/mach-imx7d.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/mach-imx/mach-imx7d.c b/arch/arm/mach-imx/mach-imx7d.c
index b450f52..5a27f20 100644
--- a/arch/arm/mach-imx/mach-imx7d.c
+++ b/arch/arm/mach-imx/mach-imx7d.c
@@ -105,6 +105,11 @@ static void __init imx7d_init_irq(void)
 	irqchip_init();
 }
 
+static void __init imx7d_init_late(void)
+{
+	platform_device_register_simple("cpufreq-dt", -1, NULL, 0);
+}
+
 static const char *const imx7d_dt_compat[] __initconst = {
 	"fsl,imx7d",
 	NULL,
@@ -112,6 +117,7 @@ static const char *const imx7d_dt_compat[] __initconst = {
 
 DT_MACHINE_START(IMX7D, "Freescale i.MX7 Dual (Device Tree)")
 	.init_irq	= imx7d_init_irq,
+	.init_late	= imx7d_init_late,
 	.init_machine	= imx7d_init_machine,
 	.dt_compat	= imx7d_dt_compat,
 MACHINE_END
-- 
1.9.1

