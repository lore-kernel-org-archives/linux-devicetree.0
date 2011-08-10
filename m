From: Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Subject: [PATCH RESEND 1/2] olpc_battery: bind to device tree
Date: Wed, 10 Aug 2011 21:45:36 +0100 (BST)
Message-ID: <20110810204536.C6FCA9D401C__25522.5854264156$1313009464$gmane$org@zog.reactivated.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: cbou-JGs/UdohzUI@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is cleaner, and allows suspend/resume (wakeup) handlers to be
added in an upcoming patch.

Signed-off-by: Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Acked-by: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
---
 .../bindings/power_supply/olpc_battery.txt         |    5 ++
 drivers/power/olpc_battery.c                       |   55 ++++++++++++--------
 2 files changed, 39 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power_supply/olpc_battery.txt

diff --git a/Documentation/devicetree/bindings/power_supply/olpc_battery.txt b/Documentation/devicetree/bindings/power_supply/olpc_battery.txt
new file mode 100644
index 0000000..c8901b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/power_supply/olpc_battery.txt
@@ -0,0 +1,5 @@
+OLPC battery
+~~~~~~~~~~~~
+
+Required properties:
+  - compatible : "olpc,xo1-battery"
diff --git a/drivers/power/olpc_battery.c b/drivers/power/olpc_battery.c
index 0b0ff3a..9972268 100644
--- a/drivers/power/olpc_battery.c
+++ b/drivers/power/olpc_battery.c
@@ -519,9 +519,8 @@ static struct device_attribute olpc_bat_error = {
  *		Initialisation
  *********************************************************************/
 
-static struct platform_device *bat_pdev;
-
 static struct power_supply olpc_bat = {
+	.name = "olpc-battery",
 	.get_property = olpc_bat_get_property,
 	.use_for_apm = 1,
 };
@@ -534,14 +533,11 @@ void olpc_battery_trigger_uevent(unsigned long cause)
 		kobject_uevent(&olpc_bat.dev->kobj, KOBJ_CHANGE);
 }
 
-static int __init olpc_bat_init(void)
+static int __devinit olpc_battery_probe(struct platform_device *pdev)
 {
-	int ret = 0;
+	int ret;
 	uint8_t status;
 
-	if (!olpc_platform_info.ecver)
-		return -ENXIO;
-
 	/*
 	 * We've seen a number of EC protocol changes; this driver requires
 	 * the latest EC protocol, supported by 0x44 and above.
@@ -558,15 +554,10 @@ static int __init olpc_bat_init(void)
 
 	/* Ignore the status. It doesn't actually matter */
 
-	bat_pdev = platform_device_register_simple("olpc-battery", 0, NULL, 0);
-	if (IS_ERR(bat_pdev))
-		return PTR_ERR(bat_pdev);
-
-	ret = power_supply_register(&bat_pdev->dev, &olpc_ac);
+	ret = power_supply_register(&pdev->dev, &olpc_ac);
 	if (ret)
-		goto ac_failed;
+		return ret;
 
-	olpc_bat.name = bat_pdev->name;
 	if (olpc_board_at_least(olpc_board_pre(0xd0))) { /* XO-1.5 */
 		olpc_bat.properties = olpc_xo15_bat_props;
 		olpc_bat.num_properties = ARRAY_SIZE(olpc_xo15_bat_props);
@@ -575,7 +566,7 @@ static int __init olpc_bat_init(void)
 		olpc_bat.num_properties = ARRAY_SIZE(olpc_xo1_bat_props);
 	}
 
-	ret = power_supply_register(&bat_pdev->dev, &olpc_bat);
+	ret = power_supply_register(&pdev->dev, &olpc_bat);
 	if (ret)
 		goto battery_failed;
 
@@ -587,7 +578,7 @@ static int __init olpc_bat_init(void)
 	if (ret)
 		goto error_failed;
 
-	goto success;
+	return 0;
 
 error_failed:
 	device_remove_bin_file(olpc_bat.dev, &olpc_bat_eeprom);
@@ -595,22 +586,44 @@ eeprom_failed:
 	power_supply_unregister(&olpc_bat);
 battery_failed:
 	power_supply_unregister(&olpc_ac);
-ac_failed:
-	platform_device_unregister(bat_pdev);
-success:
 	return ret;
 }
 
-static void __exit olpc_bat_exit(void)
+static int __devexit olpc_battery_remove(struct platform_device *pdev)
 {
 	device_remove_file(olpc_bat.dev, &olpc_bat_error);
 	device_remove_bin_file(olpc_bat.dev, &olpc_bat_eeprom);
 	power_supply_unregister(&olpc_bat);
 	power_supply_unregister(&olpc_ac);
-	platform_device_unregister(bat_pdev);
+	return 0;
 }
 
+static const struct of_device_id olpc_battery_ids[] __devinitconst = {
+	{ .compatible = "olpc,xo1-battery" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, olpc_battery_ids);
+
+static struct platform_driver olpc_battery_drv = {
+	.driver = {
+		.name = "olpc-battery",
+		.owner = THIS_MODULE,
+		.of_match_table = olpc_battery_ids,
+	},
+	.probe = olpc_battery_probe,
+	.remove = __devexit_p(olpc_battery_remove),
+};
+
+static int __init olpc_bat_init(void)
+{
+	return platform_driver_register(&olpc_battery_drv);
+}
 module_init(olpc_bat_init);
+
+static void __exit olpc_bat_exit(void)
+{
+	platform_driver_unregister(&olpc_battery_drv);
+}
 module_exit(olpc_bat_exit);
 
 MODULE_AUTHOR("David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>");
-- 
1.7.6
