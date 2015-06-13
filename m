From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Subject: [PATCH v2 2/3] watchdog: bcm2835: Add poweroff code for the Raspberry Pi
Date: Sat, 13 Jun 2015 13:39:00 +0200
Message-ID: <1434195541-28368-2-git-send-email-noralf@tronnes.org>
References: <1434195541-28368-1-git-send-email-noralf@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434195541-28368-1-git-send-email-noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds a new poweroff function to the watchdog driver for the
Raspberry Pi. Currently poweroff/halt results in a reboot.

The Raspberry Pi firmware uses the RSTS register to know which
partiton to boot from. The partiton value is spread into bits
0, 2, 4, 6, 8, 10. Partiton 63 is a special partition used by
the firmware to indicate halt.

The firmware made this change in 19 Aug 2013 and was matched
by the downstream commit:
Changes for new NOOBS multi partition booting from gsh

Signed-off-by: Noralf Tr=C3=B8nnes <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Acked-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
---
 drivers/watchdog/bcm2835_wdt.c | 38 ++++++++++++++++++++++++++++++++++=
----
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/bcm2835_wdt.c b/drivers/watchdog/bcm2835_=
wdt.c
index 7116968..fdf0d7d 100644
--- a/drivers/watchdog/bcm2835_wdt.c
+++ b/drivers/watchdog/bcm2835_wdt.c
@@ -36,6 +36,13 @@
 #define PM_RSTC_WRCFG_FULL_RESET	0x00000020
 #define PM_RSTC_RESET			0x00000102
=20
+/*
+ * The Raspberry Pi firmware uses the RSTS register to know which part=
iton
+ * to boot from. The partiton value is spread into bits 0, 2, 4, 6, 8,=
 10.
+ * Partiton 63 is a special partition used by the firmware to indicate=
 halt.
+ */
+#define PM_RSTS_RASPBERRYPI_HALT	0x555
+
 #define SECS_TO_WDOG_TICKS(x) ((x) << 16)
 #define WDOG_TICKS_TO_SECS(x) ((x) >> 16)
=20
@@ -159,6 +166,24 @@ static void bcm2835_power_off(void)
 	bcm2835_restart(&wdt->restart_handler, REBOOT_HARD, NULL);
 }
=20
+static void rpi_power_off(void)
+{
+	struct device_node *np =3D
+		of_find_compatible_node(NULL, NULL, "brcm,raspberrypi-pm-wdt");
+	struct platform_device *pdev =3D of_find_device_by_node(np);
+	struct bcm2835_wdt *wdt =3D platform_get_drvdata(pdev);
+	u32 val;
+
+	val =3D readl_relaxed(wdt->base + PM_RSTS);
+	val |=3D PM_PASSWORD | PM_RSTS_RASPBERRYPI_HALT;
+	writel_relaxed(val, wdt->base + PM_RSTS);
+
+	/* Continue with normal reset mechanism */
+	bcm2835_restart(&wdt->restart_handler, REBOOT_HARD, NULL);
+}
+
+static const struct of_device_id bcm2835_wdt_of_match[];
+
 static int bcm2835_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev =3D &pdev->dev;
@@ -192,8 +217,12 @@ static int bcm2835_wdt_probe(struct platform_devic=
e *pdev)
 	wdt->restart_handler.notifier_call =3D bcm2835_restart;
 	wdt->restart_handler.priority =3D 128;
 	register_restart_handler(&wdt->restart_handler);
-	if (pm_power_off =3D=3D NULL)
-		pm_power_off =3D bcm2835_power_off;
+	if (!pm_power_off) {
+		const struct of_device_id *match;
+
+		match =3D of_match_node(bcm2835_wdt_of_match, pdev->dev.of_node);
+		pm_power_off =3D match->data;
+	}
=20
 	dev_info(dev, "Broadcom BCM2835 watchdog timer");
 	return 0;
@@ -204,7 +233,7 @@ static int bcm2835_wdt_remove(struct platform_devic=
e *pdev)
 	struct bcm2835_wdt *wdt =3D platform_get_drvdata(pdev);
=20
 	unregister_restart_handler(&wdt->restart_handler);
-	if (pm_power_off =3D=3D bcm2835_power_off)
+	if (pm_power_off =3D=3D bcm2835_power_off || pm_power_off =3D=3D rpi_=
power_off)
 		pm_power_off =3D NULL;
 	watchdog_unregister_device(&bcm2835_wdt_wdd);
 	iounmap(wdt->base);
@@ -218,7 +247,8 @@ static void bcm2835_wdt_shutdown(struct platform_de=
vice *pdev)
 }
=20
 static const struct of_device_id bcm2835_wdt_of_match[] =3D {
-	{ .compatible =3D "brcm,bcm2835-pm-wdt", },
+	{ .compatible =3D "brcm,bcm2835-pm-wdt", .data =3D bcm2835_power_off =
},
+	{ .compatible =3D "brcm,raspberrypi-pm-wdt", .data =3D rpi_power_off =
},
 	{},
 };
 MODULE_DEVICE_TABLE(of, bcm2835_wdt_of_match);
--=20
2.2.2

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdo=
g" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
