From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v3 02/13] clocksource: samsung_pwm_timer: Let platforms select
 the driver
Date: Tue, 23 Apr 2013 17:46:23 +0200
Message-ID: <1366731994-7478-3-git-send-email-t.figa@samsung.com>
References: <1366731994-7478-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1366731994-7478-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, tomasz.figa@gmail.com, m.szyprowski@samsung.com, arnd@arndb.de, john.stultz@linaro.org, tglx@linutronix.de, olof@lixom.net, ben-linux@fluff.org, thomas.abraham@linaro.org, Tomasz Figa <t.figa@samsung.com>
List-Id: devicetree@vger.kernel.org

This patch modifies the way of enabling the driver to let the platforms
select it in their Kconfig instead of specifying particular platforms in
Kconfig entry of the driver.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clocksource/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index f261ddc..4700305 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -78,7 +78,7 @@ config CLKSRC_EXYNOS_MCT
 	  Support for Multi Core Timer controller on Exynos SoCs.
 
 config CLKSRC_SAMSUNG_PWM
-	def_bool ARCH_EXYNOS4
+	bool
 	depends on OF
 	select CLKSRC_MMIO
 	help
-- 
1.8.2.1
