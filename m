From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] mfd: cros ec: spi: Add delay for raising CS
Date: Fri, 22 Nov 2013 19:05:50 +0100
Message-ID: <1385143550-31901-1-git-send-email-treding@nvidia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Bernie Thompson <bhthompson-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The EC has specific timing it requires. Add support for an optional delay
after raising CS to fix timing issues. This is configurable based on
a DT property "google,cros-ec-spi-msg-delay".

If this property isn't set, then no delay will be added. However, if set
it will cause a delay equal to the value passed to it to be inserted at
the end of a transaction.

Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Bernie Thompson <bhthompson-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Reviewed-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
- make property description more verbose

 Documentation/devicetree/bindings/mfd/cros-ec.txt |  9 +++++++
 drivers/mfd/cros_ec_spi.c                         | 30 +++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/cros-ec.txt b/Documentation/devicetree/bindings/mfd/cros-ec.txt
index 5f229c5f6da9..8009c3d87f33 100644
--- a/Documentation/devicetree/bindings/mfd/cros-ec.txt
+++ b/Documentation/devicetree/bindings/mfd/cros-ec.txt
@@ -17,6 +17,15 @@ Required properties (SPI):
 - compatible: "google,cros-ec-spi"
 - reg: SPI chip select
 
+Optional properties (SPI):
+- google,cros-ec-spi-msg-delay: Some implementations of the EC require some
+  additional processing time in order to accept new transactions. If the delay
+  between transactions is not long enough the EC may not be able to respond
+  properly to subsequent transactions and cause them to hang. This property
+  specifies the delay, in usecs, introduced between transactions to account
+  for the time required by the EC to get back into a state in which new data
+  can be accepted.
+
 Required properties (LPC):
 - compatible: "google,cros-ec-lpc"
 - reg: List of (IO address, size) pairs defining the interface uses
diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
index 27be73523b9c..e3690fcb86ae 100644
--- a/drivers/mfd/cros_ec_spi.c
+++ b/drivers/mfd/cros_ec_spi.c
@@ -18,6 +18,7 @@
 #include <linux/module.h>
 #include <linux/mfd/cros_ec.h>
 #include <linux/mfd/cros_ec_commands.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/spi/spi.h>
@@ -62,10 +63,13 @@
  * @spi: SPI device we are connected to
  * @last_transfer_ns: time that we last finished a transfer, or 0 if there
  *	if no record
+ * @end_of_msg_delay: used to set the delay_usecs on the spi_transfer that
+ *      is sent when we want to turn off CS at the end of a transaction.
  */
 struct cros_ec_spi {
 	struct spi_device *spi;
 	s64 last_transfer_ns;
+	unsigned int end_of_msg_delay;
 };
 
 static void debug_packet(struct device *dev, const char *name, u8 *ptr,
@@ -238,6 +242,17 @@ static int cros_ec_command_spi_xfer(struct cros_ec_device *ec_dev,
 
 	/* turn off CS */
 	spi_message_init(&msg);
+
+	if (ec_spi->end_of_msg_delay) {
+		/*
+		 * Add delay for last transaction, to ensure the rising edge
+		 * doesn't come too soon after the end of the data.
+		 */
+		memset(&trans, '\0', sizeof(trans));
+		trans.delay_usecs = ec_spi->end_of_msg_delay;
+		spi_message_add_tail(&trans, &msg);
+	}
+
 	final_ret = spi_sync(ec_spi->spi, &msg);
 	ktime_get_ts(&ts);
 	ec_spi->last_transfer_ns = timespec_to_ns(&ts);
@@ -284,6 +299,17 @@ static int cros_ec_command_spi_xfer(struct cros_ec_device *ec_dev,
 	return 0;
 }
 
+static void cros_ec_probe_spi_dt(struct cros_ec_spi *ec_spi, struct device *dev)
+{
+	struct device_node *np = dev->of_node;
+	u32 val;
+	int ret;
+
+	ret = of_property_read_u32(np, "google,cros-ec-spi-msg-delay", &val);
+	if (!ret)
+		ec_spi->end_of_msg_delay = val;
+}
+
 static int cros_ec_probe_spi(struct spi_device *spi)
 {
 	struct device *dev = &spi->dev;
@@ -305,6 +331,10 @@ static int cros_ec_probe_spi(struct spi_device *spi)
 	if (!ec_dev)
 		return -ENOMEM;
 
+	/* Check for any DT properties */
+	if (IS_ENABLED(CONFIG_OF) && dev->of_node)
+		cros_ec_probe_spi_dt(ec_spi, dev);
+
 	spi_set_drvdata(spi, ec_dev);
 	ec_dev->name = "SPI";
 	ec_dev->dev = dev;
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
