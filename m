From: <jan.tuerk@emtrion.com>
Subject: [PATCH v3 6/6] ARM: imx_v6_v7_defconfig: Enable DA0963 PMIC support.
Date: Fri, 20 Apr 2018 14:50:53 +0200
Message-ID: <20180420125108.14197-7-jan.tuerk@emtrion.com>
References: <20171220134710.64479-2-jan.tuerk@emtrion.com>
 <20180420125108.14197-1-jan.tuerk@emtrion.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180420125108.14197-1-jan.tuerk@emtrion.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Russell King <linux@armlinux.org.uk>, Jan Tuerk <jan.tuerk@emtrion.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Jan Tuerk <jan.tuerk@emtrion.com>

All recent emtrion modules based on i.mx6 make use of the DA0963.
Therefore enable it with the following defaults:
	- CONFIG_MFD_DA9063=y
	- CONFIG_REGULATOR_DA9063=y
	- CONFIG_DA9063_WATCHDOG=m
MFD and REGULATOR are built-in to have it at Kernel boot-time.
The WATCHDOG is optional and could be loaded from userspace.

Signed-off-by: Jan Tuerk <jan.tuerk@emtrion.com>
---
 arch/arm/configs/imx_v6_v7_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 3a308437b088..691d431250d4 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -214,9 +214,11 @@ CONFIG_CPU_THERMAL=y
 CONFIG_IMX_THERMAL=y
 CONFIG_WATCHDOG=y
 CONFIG_DA9062_WATCHDOG=y
+CONFIG_DA9063_WATCHDOG=m
 CONFIG_IMX2_WDT=y
 CONFIG_MFD_DA9052_I2C=y
 CONFIG_MFD_DA9062=y
+CONFIG_MFD_DA9063=y
 CONFIG_MFD_MC13XXX_SPI=y
 CONFIG_MFD_MC13XXX_I2C=y
 CONFIG_MFD_STMPE=y
@@ -225,6 +227,7 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_ANATOP=y
 CONFIG_REGULATOR_DA9052=y
 CONFIG_REGULATOR_DA9062=y
+CONFIG_REGULATOR_DA9063=y
 CONFIG_REGULATOR_GPIO=y
 CONFIG_REGULATOR_MC13783=y
 CONFIG_REGULATOR_MC13892=y
-- 
2.11.0
