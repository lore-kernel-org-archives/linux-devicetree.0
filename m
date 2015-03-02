From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 05/10] ARM: bcm2835: Add the mailbox power channel driver.
Date: Mon,  2 Mar 2015 12:54:39 -0800
Message-ID: <1425329684-23968-6-git-send-email-eric@anholt.net>
References: <1425329684-23968-1-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425329684-23968-1-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This just enables the power to the USB controller, so that DWC2 can
initialize.

The downstream tree has an interface to this channel for tracking
enables from multiple clients, except it doesn't have any clients as
far as I can see.  For now, just make the simplest thing that gets USB
working.

Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
---
 drivers/mailbox/Makefile                |   1 +
 drivers/mailbox/bcm2835-mailbox-power.c | 127 ++++++++++++++++++++++++=
++++++++
 2 files changed, 128 insertions(+)
 create mode 100644 drivers/mailbox/bcm2835-mailbox-power.c

diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 7feb8da..619d815 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_PCC)		+=3D pcc.o
 obj-$(CONFIG_ALTERA_MBOX)	+=3D mailbox-altera.o
=20
 obj-$(CONFIG_BCM2835_MBOX)	+=3D bcm2835-mailbox.o
+obj-$(CONFIG_BCM2835_MBOX)	+=3D bcm2835-mailbox-power.o
diff --git a/drivers/mailbox/bcm2835-mailbox-power.c b/drivers/mailbox/=
bcm2835-mailbox-power.c
new file mode 100644
index 0000000..f09c855
--- /dev/null
+++ b/drivers/mailbox/bcm2835-mailbox-power.c
@@ -0,0 +1,127 @@
+/*
+ *  Copyright =C2=A9 2015 Broadcom
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+/*
+ * Defines a module for accessing the power channel of the
+ * BCM2835 mailbox.
+ *
+ * For now, we just turn on the USB power so that DWC2 can initialize.
+ * At a later time we may extend this into a driver that actually does
+ * runtime power management on the other channels.
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/mailbox_client.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#define BCM_POWER_USB (1 << 3)
+#define BCM_MBOX_DATA_SHIFT 4
+
+struct bcm_mbox_power {
+	struct device *dev;
+	struct mbox_client cl;
+	struct mbox_chan *chan;
+	struct completion c;
+	uint32_t response;
+};
+
+struct bcm_mbox_power *mbox_power;
+
+static void response_callback(struct mbox_client *cl, void *mssg)
+{
+	mbox_power->response =3D (uint32_t)mssg;
+	complete(&mbox_power->c);
+}
+
+/*
+ * Submits a set of concatenated tags to the VPU firmware through the
+ * mailbox power interface.
+ *
+ * The buffer header and the ending tag are added by this function and
+ * don't need to be supplied, just the actual tags for your operation.
+ * See struct bcm_mbox_power_tag_header for the per-tag structure.
+ */
+static int bcm_mbox_set_power(uint32_t power_enables)
+{
+	int ret;
+
+	reinit_completion(&mbox_power->c);
+	ret =3D mbox_send_message(mbox_power->chan,
+				(void *)(power_enables << BCM_MBOX_DATA_SHIFT));
+	if (ret >=3D 0)
+		wait_for_completion(&mbox_power->c);
+
+	return ret;
+}
+
+static int bcm2835_mbox_power_probe(struct platform_device *pdev)
+{
+	struct device *dev =3D &pdev->dev;
+	int ret =3D 0;
+
+	mbox_power =3D devm_kzalloc(dev, sizeof(*mbox_power),
+				       GFP_KERNEL);
+	if (!mbox_power) {
+		dev_err(dev, "Failed to allocate device memory\n");
+		return -ENOMEM;
+	}
+
+	mbox_power->cl.dev =3D dev;
+	mbox_power->cl.rx_callback =3D response_callback;
+	mbox_power->cl.tx_block =3D true;
+
+	mbox_power->chan =3D mbox_request_channel(&mbox_power->cl, 0);
+	if (!mbox_power->chan) {
+		dev_err(dev, "Failed to get mbox channel\n");
+		return -ENODEV;
+	}
+
+	init_completion(&mbox_power->c);
+
+	platform_set_drvdata(pdev, mbox_power);
+	mbox_power->dev =3D dev;
+
+	/* Enable power to the USB phy. */
+	if (IS_ENABLED(CONFIG_USB_DWC2)) {
+		bcm_mbox_set_power(BCM_POWER_USB);
+		bcm2835_mbox_power_initialized =3D true;
+	}
+
+	return ret;
+}
+
+static int bcm2835_mbox_power_remove(struct platform_device *pdev)
+{
+	bcm_mbox_set_power(0);
+
+	mbox_free_channel(mbox_power->chan);
+
+	return 0;
+}
+
+static const struct of_device_id bcm2835_mbox_power_of_match[] =3D {
+	{ .compatible =3D "brcm,bcm2835-mbox-power", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, bcm2835_mbox_power_of_match);
+
+static struct platform_driver bcm2835_mbox_power_driver =3D {
+	.driver =3D {
+		.name =3D "bcm2835-mbox-power",
+		.owner =3D THIS_MODULE,
+		.of_match_table =3D bcm2835_mbox_power_of_match,
+	},
+	.probe		=3D bcm2835_mbox_power_probe,
+	.remove		=3D bcm2835_mbox_power_remove,
+};
+module_platform_driver(bcm2835_mbox_power_driver);
+
+MODULE_AUTHOR("Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>");
+MODULE_DESCRIPTION("BCM2835 mailbox power channel");
+MODULE_LICENSE("GPL v2");
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
