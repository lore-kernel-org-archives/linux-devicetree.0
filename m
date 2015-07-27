From: Govindraj Raja <govindraj.raja-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 2/7] clocksource: mips-gic: Add missing error returns checks
Date: Mon, 27 Jul 2015 15:00:13 +0100
Message-ID: <1438005618-27003-3-git-send-email-govindraj.raja@imgtec.com>
References: <1438005618-27003-1-git-send-email-govindraj.raja@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438005618-27003-1-git-send-email-govindraj.raja-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, James Hartley <James.Hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Govindraj Raja <Govindraj.Raja-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Damien Horsley <Damien.Horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <James.Hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

This commit adds the required checks on the functions that return
an error. Some of them are not critical, so only a warning is
printed.

Reviewed-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
---
 drivers/clocksource/mips-gic-timer.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index 913585d..c4352f0 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -100,12 +100,18 @@ static struct notifier_block gic_cpu_nb = {
 
 static int gic_clockevent_init(void)
 {
+	int ret;
+
 	if (!cpu_has_counter || !gic_frequency)
 		return -ENXIO;
 
-	setup_percpu_irq(gic_timer_irq, &gic_compare_irqaction);
+	ret = setup_percpu_irq(gic_timer_irq, &gic_compare_irqaction);
+	if (ret < 0)
+		return ret;
 
-	register_cpu_notifier(&gic_cpu_nb);
+	ret = register_cpu_notifier(&gic_cpu_nb);
+	if (ret < 0)
+		pr_warn("GIC: Unable to register CPU notifier\n");
 
 	gic_clockevent_cpu_init(this_cpu_ptr(&gic_clockevent_device));
 
@@ -125,13 +131,17 @@ static struct clocksource gic_clocksource = {
 
 static void __init __gic_clocksource_init(void)
 {
+	int ret;
+
 	/* Set clocksource mask. */
 	gic_clocksource.mask = CLOCKSOURCE_MASK(gic_get_count_width());
 
 	/* Calculate a somewhat reasonable rating value. */
 	gic_clocksource.rating = 200 + gic_frequency / 10000000;
 
-	clocksource_register_hz(&gic_clocksource, gic_frequency);
+	ret = clocksource_register_hz(&gic_clocksource, gic_frequency);
+	if (ret < 0)
+		pr_warn("GIC: Unable to register clocksource\n");
 
 	gic_clockevent_init();
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
