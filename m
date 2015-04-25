From: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: [PATCH 2/4] misc: ti-st: use of_get_named_gpio_flags for nshutdown
Date: Sat, 25 Apr 2015 15:15:16 -0700
Message-ID: <1430000118-26386-2-git-send-email-eric.nelson@boundarydevices.com>
References: <1430000118-26386-1-git-send-email-eric.nelson@boundarydevices.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430000118-26386-1-git-send-email-eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, der.herr-kA1LtwSENNE@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bvijay-l0cyMroinI0@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, gigi.joseph-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, eyalr-l0cyMroinI0@public.gmane.org, robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, eliad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
---
 drivers/misc/ti-st/st_kim.c  | 21 +++++++++++++--------
 include/linux/ti_wilink_st.h |  6 +++---
 2 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/misc/ti-st/st_kim.c b/drivers/misc/ti-st/st_kim.c
index aaa17b0..c5a0e15 100644
--- a/drivers/misc/ti-st/st_kim.c
+++ b/drivers/misc/ti-st/st_kim.c
@@ -32,6 +32,7 @@
 #include <linux/sched.h>
 #include <linux/sysfs.h>
 #include <linux/tty.h>
+#include <linux/of_gpio.h>
 
 #include <linux/skbuff.h>
 #include <linux/ti_wilink_st.h>
@@ -482,9 +483,9 @@ long st_kim_start(void *kim_data)
 			pdata->chip_enable(kim_gdata);
 
 		/* Configure BT nShutdown to HIGH state */
-		gpio_set_value(kim_gdata->nshutdown, GPIO_LOW);
+		gpio_set_value(kim_gdata->nshutdown, kim_gdata->shutdown_val);
 		mdelay(5);	/* FIXME: a proper toggle */
-		gpio_set_value(kim_gdata->nshutdown, GPIO_HIGH);
+		gpio_set_value(kim_gdata->nshutdown, !kim_gdata->shutdown_val);
 		mdelay(100);
 		/* re-initialize the completion */
 		reinit_completion(&kim_gdata->ldisc_installed);
@@ -566,11 +567,11 @@ long st_kim_stop(void *kim_data)
 	}
 
 	/* By default configure BT nShutdown to LOW state */
-	gpio_set_value(kim_gdata->nshutdown, GPIO_LOW);
+	gpio_set_value(kim_gdata->nshutdown, kim_gdata->shutdown_val);
 	mdelay(1);
-	gpio_set_value(kim_gdata->nshutdown, GPIO_HIGH);
+	gpio_set_value(kim_gdata->nshutdown, !kim_gdata->shutdown_val);
 	mdelay(1);
-	gpio_set_value(kim_gdata->nshutdown, GPIO_LOW);
+	gpio_set_value(kim_gdata->nshutdown, kim_gdata->shutdown_val);
 
 	/* platform specific disable */
 	if (pdata->chip_disable)
@@ -749,6 +750,7 @@ static struct ti_st_plat_data *get_platform_data(struct device *dev)
 {
 	struct device_node *np = dev->of_node;
 	const u32 *dt_property;
+	enum of_gpio_flags flags;
 	int len;
 
 	dt_pdata = kzalloc(sizeof(*dt_pdata), GFP_KERNEL);
@@ -759,8 +761,9 @@ static struct ti_st_plat_data *get_platform_data(struct device *dev)
 	dt_property = of_get_property(np, "dev_name", &len);
 	if (dt_property)
 		memcpy(&dt_pdata->dev_name, dt_property, len);
-	of_property_read_u32(np, "nshutdown_gpio",
-			     &dt_pdata->nshutdown_gpio);
+	dt_pdata->nshutdown_gpio = of_get_named_gpio_flags
+					(np, "nshutdown_gpio", 0, &flags);
+	dt_pdata->shutdown_val = !(flags & OF_GPIO_ACTIVE_LOW);
 	of_property_read_u32(np, "flow_cntrl", &dt_pdata->flow_cntrl);
 	of_property_read_u32(np, "baud_rate", &dt_pdata->baud_rate);
 
@@ -810,6 +813,7 @@ static int kim_probe(struct platform_device *pdev)
 
 	/* Claim the chip enable nShutdown gpio from the system */
 	kim_gdata->nshutdown = pdata->nshutdown_gpio;
+	kim_gdata->shutdown_val = pdata->shutdown_val;
 	err = gpio_request(kim_gdata->nshutdown, "kim");
 	if (unlikely(err)) {
 		pr_err(" gpio %d request failed ", kim_gdata->nshutdown);
@@ -817,7 +821,8 @@ static int kim_probe(struct platform_device *pdev)
 	}
 
 	/* Configure nShutdown GPIO as output=0 */
-	err = gpio_direction_output(kim_gdata->nshutdown, GPIO_LOW);
+	err = gpio_direction_output(kim_gdata->nshutdown,
+				    kim_gdata->shutdown_val);
 	if (unlikely(err)) {
 		pr_err(" unable to configure gpio %d", kim_gdata->nshutdown);
 		return err;
diff --git a/include/linux/ti_wilink_st.h b/include/linux/ti_wilink_st.h
index c78dcfe..7154194 100644
--- a/include/linux/ti_wilink_st.h
+++ b/include/linux/ti_wilink_st.h
@@ -212,9 +212,6 @@ void gps_chrdrv_stub_init(void);
 #define MAKEWORD(a, b)  ((unsigned short)(((unsigned char)(a)) \
 	| ((unsigned short)((unsigned char)(b))) << 8))
 
-#define GPIO_HIGH 1
-#define GPIO_LOW  0
-
 /* the Power-On-Reset logic, requires to attempt
  * to download firmware onto chip more than once
  * since the self-test for chip takes a while
@@ -263,6 +260,7 @@ struct kim_data_s {
 	char resp_buffer[30];
 	const struct firmware *fw_entry;
 	unsigned nshutdown;
+	unsigned shutdown_val;
 	unsigned long rx_state;
 	unsigned long rx_count;
 	struct sk_buff *rx_skb;
@@ -418,6 +416,7 @@ struct gps_event_hdr {
  * struct ti_st_plat_data - platform data shared between ST driver and
  *	platform specific board file which adds the ST device.
  * @nshutdown_gpio: Host's GPIO line to which chip's BT_EN is connected.
+ * @shutdown_val: shutdown state (0/1) of gpio
  * @dev_name: The UART/TTY name to which chip is interfaced. (eg: /dev/ttyS1)
  * @flow_cntrl: Should always be 1, since UART's CTS/RTS is used for PM
  *	purposes.
@@ -438,6 +437,7 @@ struct gps_event_hdr {
  */
 struct ti_st_plat_data {
 	u32 nshutdown_gpio;
+	int shutdown_val;
 	unsigned char dev_name[UART_DEV_NAME_LEN]; /* uart name */
 	u32 flow_cntrl; /* flow control flag */
 	u32 baud_rate;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
