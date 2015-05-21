From: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/7] clocksource: mips-gic: Enable the clock before using it
Date: Thu, 21 May 2015 18:37:34 -0300
Message-ID: <1432244260-14908-2-git-send-email-ezequiel.garcia@imgtec.com>
References: <1432244260-14908-1-git-send-email-ezequiel.garcia@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432244260-14908-1-git-send-email-ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Damien.Horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, Govindraj.Raja-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

For the clock to be used (e.g. get its rate through clk_get_rate)
it should be prepared and enabled first.

Also, while the clock is enabled the driver must hold a reference to it,
so let's remove the call to clk_put.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
---
 drivers/clocksource/mips-gic-timer.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index b81ed1a..913585d 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -158,8 +158,13 @@ static void __init gic_clocksource_of_init(struct device_node *node)
 
 	clk = of_clk_get(node, 0);
 	if (!IS_ERR(clk)) {
+		if (clk_prepare_enable(clk) < 0) {
+			pr_err("GIC failed to enable clock\n");
+			clk_put(clk);
+			return;
+		}
+
 		gic_frequency = clk_get_rate(clk);
-		clk_put(clk);
 	} else if (of_property_read_u32(node, "clock-frequency",
 					&gic_frequency)) {
 		pr_err("GIC frequency not specified.\n");
-- 
2.3.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
