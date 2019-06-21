From: Anson.Huang@nxp.com
Subject: [PATCH 1/4] arm64: Enable TIMER_IMX_SYS_CTR for ARCH_MXC platforms
Date: Fri, 21 Jun 2019 15:07:17 +0800
Message-ID: <20190621070720.12395-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: catalin.marinas@arm.com, will@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, leonard.crestez@nxp.com, aisheng.dong@nxp.com, ping.bai@nxp.com, daniel.baluta@nxp.com, peng.fan@nxp.com, abel.vesa@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

ARCH_MXC platforms needs system counter as broadcast timer
to support cpuidle, enable it by default.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 4778c77..f5e623f 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -173,6 +173,7 @@ config ARCH_MXC
 	select PM
 	select PM_GENERIC_DOMAINS
 	select SOC_BUS
+	select TIMER_IMX_SYS_CTR
 	help
 	  This enables support for the ARMv8 based SoCs in the
 	  NXP i.MX family.
-- 
2.7.4
