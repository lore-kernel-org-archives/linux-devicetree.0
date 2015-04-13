From: Ola Jeppsson <ola-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] clocksource: arm_global_timer: Detect if gt is usable with
 CPU_FREQ
Date: Mon, 13 Apr 2015 19:37:29 +0200
Message-ID: <552BFED9.3020105@adapteva.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Stuart Menefy <stuart.menefy-qxv4g6HH51o@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Some Cortex A9 CPU:s (e.g. zynq) have the tick tied to the CPU
frequency. On those CPU:s we cannot use the global-timer as a reliable
clocksource with CPU frequency scaling enabled since this is not
currently taken into account by the driver.

Add a "tied-to-cpu-freq" boolean to the global-timer dt node indicate
this condition.

When the global-timer register function sees this property return
immediately and don't register the clocksource.

Signed-off-by: Ola Jeppsson <ola-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/global_timer.txt | 4 ++++
 drivers/clocksource/arm_global_timer.c                 | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/global_timer.txt b/Documentation/devicetree/bindings/arm/global_timer.txt
index bdae3a818793..465e02c17b5b 100644
--- a/Documentation/devicetree/bindings/arm/global_timer.txt
+++ b/Documentation/devicetree/bindings/arm/global_timer.txt
@@ -17,6 +17,10 @@
 
 - clocks : Should be phandle to a clock.
 
+** Timer node optional properties:
+
+- tied-to-cpu-freq : indicates that the timer scales with the CPU frequency.
+
 Example:
 
 	timer@2c000600 {
diff --git a/drivers/clocksource/arm_global_timer.c b/drivers/clocksource/arm_global_timer.c
index e6833771a716..8913ebda3f09 100644
--- a/drivers/clocksource/arm_global_timer.c
+++ b/drivers/clocksource/arm_global_timer.c
@@ -268,6 +268,13 @@ static void __init global_timer_of_register(struct device_node *np)
 		return;
 	}
 
+#ifdef CONFIG_CPU_FREQ
+	if (of_property_read_bool(np, "tied-to-cpu-freq")) {
+		pr_warn("global-timer: tied to cpu frequency, not supported with scaling\n");
+		return;
+	}
+#endif
+
 	gt_clk = of_clk_get(np, 0);
 	if (!IS_ERR(gt_clk)) {
 		err = clk_prepare_enable(gt_clk);
-- 
2.3.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
