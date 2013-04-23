From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v3 07/13] clocksource: samsung_pwm_timer: Use proper
 clockevents max_delta
Date: Tue, 23 Apr 2013 17:46:28 +0200
Message-ID: <1366731994-7478-8-git-send-email-t.figa@samsung.com>
References: <1366731994-7478-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1366731994-7478-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, tomasz.figa@gmail.com, m.szyprowski@samsung.com, arnd@arndb.de, john.stultz@linaro.org, tglx@linutronix.de, olof@lixom.net, ben-linux@fluff.org, thomas.abraham@linaro.org, Tomasz Figa <t.figa@samsung.com>
List-Id: devicetree@vger.kernel.org

This patch replaces hardcoded -1 argument passed to
clockevents_config_and_register() with tcnt_max calculated based on
variant data.

This fixes invalid max delta configuration for 16-bit timers of s3c24xx.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clocksource/samsung_pwm_timer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/samsung_pwm_timer.c b/drivers/clocksource/samsung_pwm_timer.c
index 9f4bd6a..cb86615 100644
--- a/drivers/clocksource/samsung_pwm_timer.c
+++ b/drivers/clocksource/samsung_pwm_timer.c
@@ -263,7 +263,8 @@ static void __init samsung_clockevent_init(void)
 	pwm.clock_count_per_tick = clock_rate / HZ;
 
 	time_event_device.cpumask = cpumask_of(0);
-	clockevents_config_and_register(&time_event_device, clock_rate, 1, -1);
+	clockevents_config_and_register(&time_event_device,
+						clock_rate, 1, pwm.tcnt_max);
 
 	irq_number = pwm.irq[pwm.event_id];
 	setup_irq(irq_number, &samsung_clock_event_irq);
-- 
1.8.2.1
