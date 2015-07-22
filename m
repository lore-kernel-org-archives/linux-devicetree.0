From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] Revert "ti-st: add device tree support"
Date: Wed, 22 Jul 2015 13:17:15 -0500
Message-ID: <1437589035-14178-1-git-send-email-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Gigi Joseph <gigi.joseph-l0cyMroinI0@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This reverts commit 46d0d33350e9b32642d745a8b46a954910196b4d.

This binding is horrible and never should have been merged. It is not
documented nor are there any in tree users, so reverting it will not
break anything we care about. Lets revert it before we do have users.

The problems with it are:

- It is not documented.

- The GPIO connection is described with a custom property and uses Linux
GPIO numbering.

- The UART connection is described using the Linux tty device name.

Cc: Gigi Joseph <gigi.joseph-l0cyMroinI0@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/misc/ti-st/st_kim.c  | 96 ++++----------------------------------------
 drivers/misc/ti-st/st_ll.c   | 17 +-------
 include/linux/ti_wilink_st.h |  1 -
 3 files changed, 9 insertions(+), 105 deletions(-)

diff --git a/drivers/misc/ti-st/st_kim.c b/drivers/misc/ti-st/st_kim.c
index 18e7a03..c828282 100644
--- a/drivers/misc/ti-st/st_kim.c
+++ b/drivers/misc/ti-st/st_kim.c
@@ -36,8 +36,6 @@
 #include <linux/skbuff.h>
 #include <linux/ti_wilink_st.h>
 #include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
 
 #define MAX_ST_DEVICES	3	/* Imagine 1 on each UART for now */
 static struct platform_device *st_kim_devices[MAX_ST_DEVICES];
@@ -45,9 +43,6 @@ static struct platform_device *st_kim_devices[MAX_ST_DEVICES];
 /**********************************************************************/
 /* internal functions */
 
-struct ti_st_plat_data	*dt_pdata;
-static struct ti_st_plat_data *get_platform_data(struct device *dev);
-
 /**
  * st_get_plat_device -
  *	function which returns the reference to the platform device
@@ -469,12 +464,7 @@ long st_kim_start(void *kim_data)
 	struct kim_data_s	*kim_gdata = (struct kim_data_s *)kim_data;
 
 	pr_info(" %s", __func__);
-	if (kim_gdata->kim_pdev->dev.of_node) {
-		pr_debug("use device tree data");
-		pdata = dt_pdata;
-	} else {
-		pdata = kim_gdata->kim_pdev->dev.platform_data;
-	}
+	pdata = kim_gdata->kim_pdev->dev.platform_data;
 
 	do {
 		/* platform specific enabling code here */
@@ -534,18 +524,12 @@ long st_kim_stop(void *kim_data)
 {
 	long err = 0;
 	struct kim_data_s	*kim_gdata = (struct kim_data_s *)kim_data;
-	struct ti_st_plat_data	*pdata;
+	struct ti_st_plat_data	*pdata =
+		kim_gdata->kim_pdev->dev.platform_data;
 	struct tty_struct	*tty = kim_gdata->core_data->tty;
 
 	reinit_completion(&kim_gdata->ldisc_installed);
 
-	if (kim_gdata->kim_pdev->dev.of_node) {
-		pr_debug("use device tree data");
-		pdata = dt_pdata;
-	} else
-		pdata = kim_gdata->kim_pdev->dev.platform_data;
-
-
 	if (tty) {	/* can be called before ldisc is installed */
 		/* Flush any pending characters in the driver and discipline. */
 		tty_ldisc_flush(tty);
@@ -737,53 +721,13 @@ static const struct file_operations list_debugfs_fops = {
  * board-*.c file
  */
 
-static const struct of_device_id kim_of_match[] = {
-{
-	.compatible = "kim",
-	},
-	{}
-};
-MODULE_DEVICE_TABLE(of, kim_of_match);
-
-static struct ti_st_plat_data *get_platform_data(struct device *dev)
-{
-	struct device_node *np = dev->of_node;
-	const u32 *dt_property;
-	int len;
-
-	dt_pdata = kzalloc(sizeof(*dt_pdata), GFP_KERNEL);
-
-	if (!dt_pdata)
-		pr_err("Can't allocate device_tree platform data\n");
-
-	dt_property = of_get_property(np, "dev_name", &len);
-	if (dt_property)
-		memcpy(&dt_pdata->dev_name, dt_property, len);
-	of_property_read_u32(np, "nshutdown_gpio",
-			     &dt_pdata->nshutdown_gpio);
-	of_property_read_u32(np, "flow_cntrl", &dt_pdata->flow_cntrl);
-	of_property_read_u32(np, "baud_rate", &dt_pdata->baud_rate);
-
-	return dt_pdata;
-}
-
 static struct dentry *kim_debugfs_dir;
 static int kim_probe(struct platform_device *pdev)
 {
 	struct kim_data_s	*kim_gdata;
-	struct ti_st_plat_data	*pdata;
+	struct ti_st_plat_data	*pdata = pdev->dev.platform_data;
 	int err;
 
-	if (pdev->dev.of_node)
-		pdata = get_platform_data(&pdev->dev);
-	else
-		pdata = pdev->dev.platform_data;
-
-	if (pdata == NULL) {
-		dev_err(&pdev->dev, "Platform Data is missing\n");
-		return -ENXIO;
-	}
-
 	if ((pdev->id != -1) && (pdev->id < MAX_ST_DEVICES)) {
 		/* multiple devices could exist */
 		st_kim_devices[pdev->id] = pdev;
@@ -864,16 +808,9 @@ err_core_init:
 static int kim_remove(struct platform_device *pdev)
 {
 	/* free the GPIOs requested */
-	struct ti_st_plat_data	*pdata;
+	struct ti_st_plat_data	*pdata = pdev->dev.platform_data;
 	struct kim_data_s	*kim_gdata;
 
-	if (pdev->dev.of_node) {
-		pr_debug("use device tree data");
-		pdata = dt_pdata;
-	} else {
-		pdata = pdev->dev.platform_data;
-	}
-
 	kim_gdata = platform_get_drvdata(pdev);
 
 	/* Free the Bluetooth/FM/GPIO
@@ -891,22 +828,12 @@ static int kim_remove(struct platform_device *pdev)
 
 	kfree(kim_gdata);
 	kim_gdata = NULL;
-	kfree(dt_pdata);
-	dt_pdata = NULL;
-
 	return 0;
 }
 
 static int kim_suspend(struct platform_device *pdev, pm_message_t state)
 {
-	struct ti_st_plat_data	*pdata;
-
-	if (pdev->dev.of_node) {
-		pr_debug("use device tree data");
-		pdata = dt_pdata;
-	} else {
-		pdata = pdev->dev.platform_data;
-	}
+	struct ti_st_plat_data	*pdata = pdev->dev.platform_data;
 
 	if (pdata->suspend)
 		return pdata->suspend(pdev, state);
@@ -916,14 +843,7 @@ static int kim_suspend(struct platform_device *pdev, pm_message_t state)
 
 static int kim_resume(struct platform_device *pdev)
 {
-	struct ti_st_plat_data	*pdata;
-
-	if (pdev->dev.of_node) {
-		pr_debug("use device tree data");
-		pdata = dt_pdata;
-	} else {
-		pdata = pdev->dev.platform_data;
-	}
+	struct ti_st_plat_data	*pdata = pdev->dev.platform_data;
 
 	if (pdata->resume)
 		return pdata->resume(pdev);
@@ -940,8 +860,6 @@ static struct platform_driver kim_platform_driver = {
 	.resume = kim_resume,
 	.driver = {
 		.name = "kim",
-		.owner = THIS_MODULE,
-		.of_match_table = of_match_ptr(kim_of_match),
 	},
 };
 
diff --git a/drivers/misc/ti-st/st_ll.c b/drivers/misc/ti-st/st_ll.c
index 518e1b7..93b4d67 100644
--- a/drivers/misc/ti-st/st_ll.c
+++ b/drivers/misc/ti-st/st_ll.c
@@ -26,7 +26,6 @@
 #include <linux/ti_wilink_st.h>
 
 /**********************************************************************/
-
 /* internal functions */
 static void send_ll_cmd(struct st_data_s *st_data,
 	unsigned char cmd)
@@ -54,13 +53,7 @@ static void ll_device_want_to_sleep(struct st_data_s *st_data)
 
 	/* communicate to platform about chip asleep */
 	kim_data = st_data->kim_data;
-	if (kim_data->kim_pdev->dev.of_node) {
-		pr_debug("use device tree data");
-		pdata = dt_pdata;
-	} else {
-		pdata = kim_data->kim_pdev->dev.platform_data;
-	}
-
+	pdata = kim_data->kim_pdev->dev.platform_data;
 	if (pdata->chip_asleep)
 		pdata->chip_asleep(NULL);
 }
@@ -93,13 +86,7 @@ static void ll_device_want_to_wakeup(struct st_data_s *st_data)
 
 	/* communicate to platform about chip wakeup */
 	kim_data = st_data->kim_data;
-	if (kim_data->kim_pdev->dev.of_node) {
-		pr_debug("use device tree data");
-		pdata = dt_pdata;
-	} else {
-		pdata = kim_data->kim_pdev->dev.platform_data;
-	}
-
+	pdata = kim_data->kim_pdev->dev.platform_data;
 	if (pdata->chip_awake)
 		pdata->chip_awake(NULL);
 }
diff --git a/include/linux/ti_wilink_st.h b/include/linux/ti_wilink_st.h
index c78dcfe..d4217ef 100644
--- a/include/linux/ti_wilink_st.h
+++ b/include/linux/ti_wilink_st.h
@@ -86,7 +86,6 @@ struct st_proto_s {
 extern long st_register(struct st_proto_s *);
 extern long st_unregister(struct st_proto_s *);
 
-extern struct ti_st_plat_data   *dt_pdata;
 
 /*
  * header information used by st_core.c
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
