From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v3 09/13] clocksource: samsung_pwm_timer: Work around rounding
 errors in clockevents core
Date: Tue, 23 Apr 2013 17:46:30 +0200
Message-ID: <1366731994-7478-10-git-send-email-t.figa@samsung.com>
References: <1366731994-7478-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1366731994-7478-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, tomasz.figa@gmail.com, m.szyprowski@samsung.com, arnd@arndb.de, john.stultz@linaro.org, tglx@linutronix.de, olof@lixom.net, ben-linux@fluff.org, thomas.abraham@linaro.org, Tomasz Figa <t.figa@samsung.com>
List-Id: devicetree@vger.kernel.org

Due to rounding errors in clockevents core (in conversions between ticks
and nsecs), it might happen that the set_next_event callback gets called
with cycles = 0, causing the code to incorrectly program the PWM timer.

This patch modifies the callback to program the timer for 1 tick, if
received tick count value is 0.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clocksource/samsung_pwm_timer.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clocksource/samsung_pwm_timer.c b/drivers/clocksource/samsung_pwm_timer.c
index 92b2f13..0234c8d 100644
--- a/drivers/clocksource/samsung_pwm_timer.c
+++ b/drivers/clocksource/samsung_pwm_timer.c
@@ -176,6 +176,19 @@ static void samsung_time_start(unsigned int channel, bool periodic)
 static int samsung_set_next_event(unsigned long cycles,
 				struct clock_event_device *evt)
 {
+	/*
+	 * This check is needed to account for internal rounding
+	 * errors inside clockevents core, which might result in
+	 * passing cycles = 0, which in turn would not generate any
+	 * timer interrupt and hang the system.
+	 *
+	 * Another solution would be to set up the clockevent device
+	 * with min_delta = 2, but this would unnecessarily increase
+	 * the minimum sleep period.
+	 */
+	if (!cycles)
+		cycles = 1;
+
 	samsung_time_setup(pwm.event_id, cycles);
 	samsung_time_start(pwm.event_id, false);
 
-- 
1.8.2.1
