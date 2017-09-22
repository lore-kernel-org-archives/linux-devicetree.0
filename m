From: <sean.wang@mediatek.com>
Subject: [PATCH 3/4] rtc: mediatek: enhance the description for MediaTek PMIC based RTC
Date: Fri, 22 Sep 2017 11:33:16 +0800
Message-ID: <0d9d5559d9d884c98ef589a8f56ab0dcb140e5e0.1506049341.git.sean.wang@mediatek.com>
References: <cover.1506049341.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1506049341.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: a.zummo@towertech.it, alexandre.belloni@free-electrons.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

Give a better description for original MediaTek RTC driver as PMIC based
RTC in order to distinguish SoC based RTC. Also turning all words with
Mediatek to MediaTek here.

Cc: Eddie Huang <eddie.huang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/rtc/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 4226295..4500f77 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1716,14 +1716,14 @@ config RTC_DRV_MEDIATEK
 	  will be called rtc-mediatek.
 
 config RTC_DRV_MT6397
-	tristate "Mediatek Real Time Clock driver"
+	tristate "MediaTek PMIC based RTC"
 	depends on MFD_MT6397 || (COMPILE_TEST && IRQ_DOMAIN)
 	help
-	  This selects the Mediatek(R) RTC driver. RTC is part of Mediatek
+	  This selects the MediaTek(R) RTC driver. RTC is part of MediaTek
 	  MT6397 PMIC. You should enable MT6397 PMIC MFD before select
-	  Mediatek(R) RTC driver.
+	  MediaTek(R) RTC driver.
 
-	  If you want to use Mediatek(R) RTC interface, select Y or M here.
+	  If you want to use MediaTek(R) RTC interface, select Y or M here.
 
 config RTC_DRV_XGENE
 	tristate "APM X-Gene RTC"
-- 
2.7.4
