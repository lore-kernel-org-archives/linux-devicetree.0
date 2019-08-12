From: Anson.Huang@nxp.com
Subject: [PATCH V2 3/4] ARM: imx_v6_v7_defconfig: Enable CONFIG_IMX7ULP_WDT by default
Date: Mon, 12 Aug 2019 16:53:20 +0800
Message-ID: <20190812085321.13823-3-Anson.Huang@nxp.com>
References: <20190812085321.13823-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190812085321.13823-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux@armlinux.org.uk, otavio@ossystems.com.br, leonard.crestez@nxp.com, u.kleine-koenig@pengutronix.de, schnitzeltony@gmail.com, jan.tuerk@emtrion.com, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

Select CONFIG_IMX7ULP_WDT by default to support i.MX7ULP watchdog.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No changes.
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index bd2e2f5..f69075b 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -235,6 +235,7 @@ CONFIG_DA9062_WATCHDOG=y
 CONFIG_DA9063_WATCHDOG=m
 CONFIG_RN5T618_WATCHDOG=y
 CONFIG_IMX2_WDT=y
+CONFIG_IMX7ULP_WDT=y
 CONFIG_MFD_DA9052_I2C=y
 CONFIG_MFD_DA9062=y
 CONFIG_MFD_DA9063=y
-- 
2.7.4
