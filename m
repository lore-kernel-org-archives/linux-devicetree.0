From: Biwen Li <biwen.li@nxp.com>
Subject: [3/3] rtc/fsl: support flextimer for SoC LS1021A (ARM32)
Date: Fri, 23 Aug 2019 17:57:40 +0800
Message-ID: <20190823095740.12280-3-biwen.li@nxp.com>
References: <20190823095740.12280-1-biwen.li@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190823095740.12280-1-biwen.li@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: a.zummo@towertech.it, alexandre.belloni@bootlin.com, leoyang.li@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Biwen Li <biwen.li@nxp.com>
List-Id: devicetree@vger.kernel.org

Support flextimer for SoC LS1021A (ARM32)

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
 drivers/rtc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 319bec4bef05..58d8b5f7cfc5 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1324,7 +1324,7 @@ config RTC_DRV_IMXDI
 
 config RTC_DRV_FSL_FTM_ALARM
 	tristate "Freescale FlexTimer alarm timer"
-	depends on ARCH_LAYERSCAPE
+	depends on ARCH_LAYERSCAPE || SOC_LS1021A
 	select FSL_RCPM
 	default y
 	help
-- 
2.17.1
