From: Jules Maselbas <jules.maselbas-l+/54qjP3hgoQXW8ST3Jvw@public.gmane.org>
Subject: [PATCH v2 1/2] usb: max3421: Add devicetree support
Date: Mon, 16 Oct 2017 01:43:05 +0200
Message-ID: <d15f42b50a82ba8829162f37f47f83a87be8ea4d.1508108927.git.jules.maselbas@grenoble-inp.org>
References: <cover.1508108927.git.jules.maselbas@grenoble-inp.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1508108927.git.jules.maselbas-l+/54qjP3hgoQXW8ST3Jvw@public.gmane.org>
In-Reply-To: <cover.1508108927.git.jules.maselbas-l+/54qjP3hgoQXW8ST3Jvw@public.gmane.org>
References: <cover.1508108927.git.jules.maselbas-l+/54qjP3hgoQXW8ST3Jvw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: julia.lawall-L2FTfq7BK8M@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jules Maselbas <jules.maselbas-l+/54qjP3hgoQXW8ST3Jvw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adds support for devicetree to the max3421 driver.

Signed-off-by: Jules Maselbas <jules.maselbas-l+/54qjP3hgoQXW8ST3Jvw@public.gmane.org>
---
 drivers/usb/host/max3421-hcd.c | 75 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
index 0ece9a9341e5..d77b3f27c6e7 100644
--- a/drivers/usb/host/max3421-hcd.c
+++ b/drivers/usb/host/max3421-hcd.c
@@ -60,6 +60,7 @@
 #include <linux/spi/spi.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
+#include <linux/of.h>
 
 #include <linux/platform_data/max3421-hcd.h>
 
@@ -85,6 +86,8 @@
 			  USB_PORT_STAT_C_OVERCURRENT | \
 			  USB_PORT_STAT_C_RESET) << 16)
 
+#define MAX3421_GPOUT_COUNT	8
+
 enum max3421_rh_state {
 	MAX3421_RH_RESET,
 	MAX3421_RH_SUSPENDED,
@@ -1672,7 +1675,7 @@ max3421_gpout_set_value(struct usb_hcd *hcd, u8 pin_number, u8 value)
 	u8 mask, idx;
 
 	--pin_number;
-	if (pin_number > 7)
+	if (pin_number >= MAX3421_GPOUT_COUNT)
 		return;
 
 	mask = 1u << (pin_number % 4);
@@ -1831,11 +1834,35 @@ static const struct hc_driver max3421_hcd_desc = {
 	.bus_resume =		max3421_bus_resume,
 };
 
+static int
+max3421_of_vbus_en_pin(struct device *dev, struct max3421_hcd_platform_data *pdata)
+{
+	int retval;
+	uint32_t value[2];
+
+	if (!pdata)
+		return -EINVAL;
+
+	retval = of_property_read_u32_array(dev->of_node, "maxim,vbus-en-pin", value, 2);
+	if (retval) {
+		dev_err(dev, "device tree node property 'maxim,vbus-en-pin' is missing\n");
+		return retval;
+	}
+	dev_info(dev, "property 'maxim,vbus-en-pin' value is <%d %d>\n", value[0], value[1]);
+
+	pdata->vbus_gpout = value[0];
+	pdata->vbus_active_level = value[1];
+
+	return 0;
+}
+
 static int
 max3421_probe(struct spi_device *spi)
 {
+	struct device *dev = &spi->dev;
 	struct max3421_hcd *max3421_hcd;
 	struct usb_hcd *hcd = NULL;
+	struct max3421_hcd_platform_data *pdata = NULL;
 	int retval = -ENOMEM;
 
 	if (spi_setup(spi) < 0) {
@@ -1843,6 +1870,40 @@ max3421_probe(struct spi_device *spi)
 		return -EFAULT;
 	}
 
+	if (!spi->irq) {
+		dev_err(dev, "Failed to get SPI IRQ");
+		return -EFAULT;
+	}
+
+	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
+		pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+		if (!pdata) {
+			retval = -ENOMEM;
+			goto error;
+		}
+		retval = max3421_of_vbus_en_pin(dev, pdata);
+		if (retval)
+			goto error;
+		spi->dev.platform_data = pdata;
+	}
+
+	pdata = dev->platform_data;
+	if (!pdata) {
+		dev_err(dev, "driver configuration data is not provided\n");
+		retval = -EFAULT;
+		goto error;
+	}
+	if (pdata->vbus_active_level > 1) {
+		dev_err(dev, "vbus active level value %d is out of range (0/1)\n", pdata->vbus_active_level);
+		retval = -EINVAL;
+		goto error;
+	}
+	if (pdata->vbus_gpout < 1 || pdata->vbus_gpout > MAX3421_GPOUT_COUNT) {
+		dev_err(dev, "vbus gpout value %d is out of range (1..8)\n", pdata->vbus_gpout);
+		retval = -EINVAL;
+		goto error;
+	}
+
 	hcd = usb_create_hcd(&max3421_hcd_desc, &spi->dev,
 			     dev_name(&spi->dev));
 	if (!hcd) {
@@ -1885,6 +1946,11 @@ max3421_probe(struct spi_device *spi)
 	return 0;
 
 error:
+	if (IS_ENABLED(CONFIG_OF) && dev->of_node && pdata) {
+		devm_kfree(&spi->dev, pdata);
+		spi->dev.platform_data = NULL;
+	}
+
 	if (hcd) {
 		kfree(max3421_hcd->tx);
 		kfree(max3421_hcd->rx);
@@ -1929,11 +1995,18 @@ max3421_remove(struct spi_device *spi)
 	return 0;
 }
 
+static const struct of_device_id max3421_of_match_table[] = {
+	{ .compatible = "maxim,max3421", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, max3421_of_match_table);
+
 static struct spi_driver max3421_driver = {
 	.probe		= max3421_probe,
 	.remove		= max3421_remove,
 	.driver		= {
 		.name	= "max3421-hcd",
+		.of_match_table = of_match_ptr(max3421_of_match_table),
 	},
 };
 
-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
