From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v3 05/13] clocksource: samsung_pwm_timer: Drop unused
 samsung_pwm struct
Date: Tue, 23 Apr 2013 17:46:26 +0200
Message-ID: <1366731994-7478-6-git-send-email-t.figa@samsung.com>
References: <1366731994-7478-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1366731994-7478-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, tomasz.figa@gmail.com, m.szyprowski@samsung.com, arnd@arndb.de, john.stultz@linaro.org, tglx@linutronix.de, olof@lixom.net, ben-linux@fluff.org, thomas.abraham@linaro.org, Tomasz Figa <t.figa@samsung.com>
List-Id: devicetree@vger.kernel.org

This patch removes the unused samsung_pwm struct from public header.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 include/clocksource/samsung_pwm.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/clocksource/samsung_pwm.h b/include/clocksource/samsung_pwm.h
index 399d241..b1d8fe7 100644
--- a/include/clocksource/samsung_pwm.h
+++ b/include/clocksource/samsung_pwm.h
@@ -20,9 +20,6 @@
 
 #define SAMSUNG_PWM_NUM		5
 
-struct platform_device;
-struct device_node;
-
 extern spinlock_t samsung_pwm_lock;
 
 struct samsung_pwm_variant {
@@ -33,11 +30,4 @@ struct samsung_pwm_variant {
 	bool has_tint_cstat;
 };
 
-struct samsung_pwm {
-	struct samsung_pwm_variant variant;
-	spinlock_t slock;
-	void __iomem *base;
-	int irq[SAMSUNG_PWM_NUM];
-};
-
 #endif /* __CLOCKSOURCE_SAMSUNG_PWM_H */
-- 
1.8.2.1
