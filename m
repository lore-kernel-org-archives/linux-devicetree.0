From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v5 14/14] clocksource: samsung-pwm: Prepare for
 clocksource_of_init
Date: Fri, 12 Apr 2013 21:17:30 +0200
Message-ID: <1365794250-14436-15-git-send-email-t.figa@samsung.com>
References: <1365794250-14436-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1365794250-14436-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, linux@simtec.co.uk, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, sylvester.nawrocki@gmail.com, buserror@gmail.com, christer@weinigel.se, jekhor@gmail.com, ghcstop@gmail.com, mark.rutland@arm.com, tomasz.figa@gmail.com, heiko@sntech.de, robherring2@gmail.com, m.szyprowski@samsung.com, arnd@arndb.de, john.stultz@linaro.org, tglx@linutronix.de, Tomasz Figa <t.figa@samsung.com>
List-Id: devicetree@vger.kernel.org

This patch adds support for clocksource instantiation using
clocksource_of_init, by declaring OF clocksources with
CLOCKSOURCE_OF_DECLARE() macro.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clocksource/samsung_pwm.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/samsung_pwm.c b/drivers/clocksource/samsung_pwm.c
index b816b65..a12ee08 100644
--- a/drivers/clocksource/samsung_pwm.c
+++ b/drivers/clocksource/samsung_pwm.c
@@ -590,12 +590,13 @@ static void __init samsung_timer_resources(void)
 	}
 }
 
-void __init samsung_pwm_clocksource_init(struct platform_device *pdev)
+static void __init __samsung_pwm_clocksource_init(
+			struct platform_device *pdev, struct device_node *np)
 {
 	u8 mask;
 	int channel;
 
-	pwm = samsung_pwm_get(pdev, NULL);
+	pwm = samsung_pwm_get(pdev, np);
 	if (IS_ERR(pwm))
 		panic("failed to get PWM device");
 
@@ -615,3 +616,21 @@ void __init samsung_pwm_clocksource_init(struct platform_device *pdev)
 	samsung_clockevent_init();
 	samsung_clocksource_init();
 }
+
+static void __init samsung_pwm_clocksource_init_of(struct device_node *np)
+{
+	__samsung_pwm_clocksource_init(NULL, np);
+}
+CLOCKSOURCE_OF_DECLARE(s3c2410_pwm, "samsung,s3c2410-pwm",
+					samsung_pwm_clocksource_init_of);
+CLOCKSOURCE_OF_DECLARE(s3c6400_pwm, "samsung,s3c6400-pwm",
+					samsung_pwm_clocksource_init_of);
+CLOCKSOURCE_OF_DECLARE(s5p6440_pwm, "samsung,s5p6440-pwm",
+					samsung_pwm_clocksource_init_of);
+CLOCKSOURCE_OF_DECLARE(s5pc100_pwm, "samsung,s5pc100-pwm",
+					samsung_pwm_clocksource_init_of);
+
+void __init samsung_pwm_clocksource_init(struct platform_device *pdev)
+{
+	__samsung_pwm_clocksource_init(pdev, NULL);
+}
-- 
1.8.1.5
