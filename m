From: <Frank.Li@freescale.com>
Subject: [PATCH v2 7/8] ARM: imx: imx_v6_v7_defconfig enable imx6ul support
Date: Fri, 19 Jun 2015 23:32:30 +0800
Message-ID: <1434727951-4852-8-git-send-email-Frank.Li@freescale.com>
References: <1434727951-4852-1-git-send-email-Frank.Li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1434727951-4852-1-git-send-email-Frank.Li@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, shawn.guo@linaro.org, shawnguo@kernel.org, linus.walleij@linaro.org, lznuaa@gmail.com
Cc: linux-gpio@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, Frank Li <Frank.Li@freescale.com>
List-Id: devicetree@vger.kernel.org

From: Frank Li <Frank.Li@freescale.com>

default enable imx6ul support

Signed-off-by: Frank Li <Frank.Li@freescale.com>
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index b47863d..b0fe9d9 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -38,6 +38,7 @@ CONFIG_SOC_IMX53=y
 CONFIG_SOC_IMX6Q=y
 CONFIG_SOC_IMX6SL=y
 CONFIG_SOC_IMX6SX=y
+CONFIG_SOC_IMX6UL=y
 CONFIG_SOC_IMX7D=y
 CONFIG_SOC_VF610=y
 CONFIG_SOC_LS1021A=y
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
