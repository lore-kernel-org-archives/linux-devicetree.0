From: Wadim Egorov <w.egorov@phytec.de>
Subject: [PATCH v5 6/6] rtc: Kconfig: Name RK818 in Kconfig for RTC_DRV_RK808
Date: Tue, 10 May 2016 15:19:00 +0200
Message-ID: <1462886340-7893-7-git-send-email-w.egorov@phytec.de>
References: <1462886340-7893-1-git-send-email-w.egorov@phytec.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462886340-7893-1-git-send-email-w.egorov@phytec.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, rtc-linux@googlegroups.com, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mturquette@baylibre.com, sboyd@codeaurora.org, lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, dianders@chromium.org, zyw@rock-chips.com
List-Id: devicetree@vger.kernel.org

The RK808 and RK818 PMICs are using a similar register map.
We can reuse the rtc driver for the RK818 PMIC. So let's add
the RK818 in the Kconfig description.

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
Acked-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 drivers/rtc/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 18639e0..2faed74 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -324,11 +324,11 @@ config RTC_DRV_MAX77686
 	  will be called rtc-max77686.
 
 config RTC_DRV_RK808
-	tristate "Rockchip RK808 RTC"
+	tristate "Rockchip RK808/RK818 RTC"
 	depends on MFD_RK808
 	help
 	  If you say yes here you will get support for the
-	  RTC of RK808 PMIC.
+	  RTC of RK808 and RK818 PMIC.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called rk808-rtc.
-- 
1.9.1
