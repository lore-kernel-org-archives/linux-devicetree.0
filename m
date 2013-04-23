From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v3 06/13] clocksource: samsung_pwm_timer: Add support for
 non-DT platforms
Date: Tue, 23 Apr 2013 17:46:27 +0200
Message-ID: <1366731994-7478-7-git-send-email-t.figa@samsung.com>
References: <1366731994-7478-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1366731994-7478-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, tomasz.figa@gmail.com, m.szyprowski@samsung.com, arnd@arndb.de, john.stultz@linaro.org, tglx@linutronix.de, olof@lixom.net, ben-linux@fluff.org, thomas.abraham@linaro.org, Tomasz Figa <t.figa@samsung.com>
List-Id: devicetree@vger.kernel.org

This patch extends the driver to support platforms that still use legacy
ATAGS-based boot, without device tree, by providing an exported function
that can be used from platform code to initialize the clocksource.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clocksource/Kconfig             |  1 -
 drivers/clocksource/samsung_pwm_timer.c | 16 ++++++++++++++--
 include/clocksource/samsung_pwm.h       |  3 +++
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 4700305..f151c6c 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -79,7 +79,6 @@ config CLKSRC_EXYNOS_MCT
 
 config CLKSRC_SAMSUNG_PWM
 	bool
-	depends on OF
 	select CLKSRC_MMIO
 	help
 	  This is a new clocksource driver for the PWM timer found in
diff --git a/drivers/clocksource/samsung_pwm_timer.c b/drivers/clocksource/samsung_pwm_timer.c
index e3257fa..9f4bd6a 100644
--- a/drivers/clocksource/samsung_pwm_timer.c
+++ b/drivers/clocksource/samsung_pwm_timer.c
@@ -356,7 +356,7 @@ static void __init samsung_timer_resources(void)
 /*
  * PWM master driver
  */
-static void __init samsung_pwm_clocksource_init(void)
+static void __init _samsung_pwm_clocksource_init(void)
 {
 	u8 mask;
 	int channel;
@@ -378,6 +378,17 @@ static void __init samsung_pwm_clocksource_init(void)
 	samsung_clocksource_init();
 }
 
+void __init samsung_pwm_clocksource_init(void __iomem *base,
+			unsigned int *irqs, struct samsung_pwm_variant *variant)
+{
+	pwm.base = base;
+	memcpy(&pwm.variant, variant, sizeof(pwm.variant));
+	memcpy(pwm.irq, irqs, SAMSUNG_PWM_NUM * sizeof(*irqs));
+
+	_samsung_pwm_clocksource_init();
+}
+
+#ifdef CONFIG_CLKSRC_OF
 static void __init samsung_pwm_alloc(struct device_node *np,
 				     const struct samsung_pwm_variant *variant)
 {
@@ -414,7 +425,7 @@ static void __init samsung_pwm_alloc(struct device_node *np,
 		return;
 	}
 
-	samsung_pwm_clocksource_init();
+	_samsung_pwm_clocksource_init();
 }
 
 static const struct samsung_pwm_variant s3c24xx_variant = {
@@ -468,3 +479,4 @@ static void __init s5p_pwm_clocksource_init(struct device_node *np)
 	samsung_pwm_alloc(np, &s5p_variant);
 }
 CLOCKSOURCE_OF_DECLARE(s5pc100_pwm, "samsung,s5pc100-pwm", s5p_pwm_clocksource_init);
+#endif
diff --git a/include/clocksource/samsung_pwm.h b/include/clocksource/samsung_pwm.h
index b1d8fe7..5c449c8 100644
--- a/include/clocksource/samsung_pwm.h
+++ b/include/clocksource/samsung_pwm.h
@@ -30,4 +30,7 @@ struct samsung_pwm_variant {
 	bool has_tint_cstat;
 };
 
+void samsung_pwm_clocksource_init(void __iomem *base,
+		unsigned int *irqs, struct samsung_pwm_variant *variant);
+
 #endif /* __CLOCKSOURCE_SAMSUNG_PWM_H */
-- 
1.8.2.1
