From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH] watchdog: meson-wdt: add support for the watchdog on Meson8 and Meson8m2
Date: Sun, 11 Jun 2017 11:52:19 +0200
Message-ID: <20170611095219.22095-1-martin.blumenstingl@googlemail.com>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The watchdog IP block on Meson8 and Meson8m2 is already supported by the
existing meson-wdt driver. Meson8 uses the same register bits as Meson6,
while the newer Meson8m2 SoC uses the same register bits as Meson8b.

Currently watchdog support on Meson8 SoC already works because
meson8.dtsi simply uses the "amlogic,meson6-wdt" compatible. Adding a
separate compatible for Meson8 makes this more explicit though.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 Documentation/devicetree/bindings/watchdog/meson-wdt.txt | 6 +++++-
 drivers/watchdog/meson_wdt.c                             | 2 ++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/meson-wdt.txt b/Documentation/devicetree/bindings/watchdog/meson-wdt.txt
index ae70185d96e6..f2fbe1a39d31 100644
--- a/Documentation/devicetree/bindings/watchdog/meson-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/meson-wdt.txt
@@ -2,7 +2,11 @@ Meson SoCs Watchdog timer
 
 Required properties:
 
-- compatible : should be "amlogic,meson6-wdt" or "amlogic,meson8b-wdt"
+- compatible : depending on the SoC this should be one of:
+	"amlogic,meson6-wdt"
+	"amlogic,meson8-wdt"
+	"amlogic,meson8b-wdt"
+	"amlogic,meson8m2-wdt"
 - reg : Specifies base physical address and size of the registers.
 
 Example:
diff --git a/drivers/watchdog/meson_wdt.c b/drivers/watchdog/meson_wdt.c
index 491b9bf13d84..304274c67735 100644
--- a/drivers/watchdog/meson_wdt.c
+++ b/drivers/watchdog/meson_wdt.c
@@ -155,7 +155,9 @@ static const struct watchdog_ops meson_wdt_ops = {
 
 static const struct of_device_id meson_wdt_dt_ids[] = {
 	{ .compatible = "amlogic,meson6-wdt", .data = &meson6_wdt_data },
+	{ .compatible = "amlogic,meson8-wdt", .data = &meson6_wdt_data },
 	{ .compatible = "amlogic,meson8b-wdt", .data = &meson8b_wdt_data },
+	{ .compatible = "amlogic,meson8m2-wdt", .data = &meson8b_wdt_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, meson_wdt_dt_ids);
-- 
2.13.1

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
