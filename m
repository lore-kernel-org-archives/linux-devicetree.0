From: Stefan Riedmueller <s.riedmueller-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v5 6/6] ARM: imx_v6_v7_defconfig: Enable Dialog Semiconductor DA9062 driver
Date: Tue, 9 Jan 2018 17:10:00 +0100
Message-ID: <1515514200-9801-7-git-send-email-s.riedmueller@phytec.de>
References: <1515514200-9801-1-git-send-email-s.riedmueller@phytec.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515514200-9801-1-git-send-email-s.riedmueller-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stefan Riedmueller <s.riedmueller-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The phyCORE-i.MX 6 uses the DA9062/63 PMIC, RTC and Watchdog driver.

Enable these options by default.

Signed-off-by: Stefan Riedmueller <s.riedmueller-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Reviewed-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
---
 arch/arm/configs/imx_v6_v7_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 6726c83..e3c4163 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -216,8 +216,10 @@ CONFIG_THERMAL_WRITABLE_TRIPS=y
 CONFIG_CPU_THERMAL=y
 CONFIG_IMX_THERMAL=y
 CONFIG_WATCHDOG=y
+CONFIG_DA9062_WATCHDOG=y
 CONFIG_IMX2_WDT=y
 CONFIG_MFD_DA9052_I2C=y
+CONFIG_MFD_DA9062=y
 CONFIG_MFD_MC13XXX_SPI=y
 CONFIG_MFD_MC13XXX_I2C=y
 CONFIG_MFD_STMPE=y
@@ -225,6 +227,7 @@ CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_ANATOP=y
 CONFIG_REGULATOR_DA9052=y
+CONFIG_REGULATOR_DA9062=y
 CONFIG_REGULATOR_GPIO=y
 CONFIG_REGULATOR_MC13783=y
 CONFIG_REGULATOR_MC13892=y
@@ -348,6 +351,7 @@ CONFIG_RTC_DRV_ISL1208=y
 CONFIG_RTC_DRV_PCF8523=y
 CONFIG_RTC_DRV_PCF8563=y
 CONFIG_RTC_DRV_M41T80=y
+CONFIG_RTC_DRV_DA9063=y
 CONFIG_RTC_DRV_MC13XXX=y
 CONFIG_RTC_DRV_MXC=y
 CONFIG_RTC_DRV_SNVS=y
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
