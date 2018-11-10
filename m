From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH RFC] bluetooth: add uart h4 devices via serdev/devicetree
Date: Sun, 11 Nov 2018 00:20:34 +0100
Message-ID: <20181110232034.17277-1-andreas@kemnade.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: marcel@holtmann.org, johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, letux-kernel@openphoenux.org
Cc: Andreas Kemnade <andreas@kemnade.info>
List-Id: devicetree@vger.kernel.org

This is a first try to be able to use h4 devices specified in
the devicetree, so you do not need to call hciattach and
it can be automatically probed.

Of course, proper devicetree bindings documentation is
missing. And also you would extend that by regulator/
enable gpio settings.

But before proceeding further it should be checked if the
general way of doing things is right.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/bluetooth/hci_h4.c | 78 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/drivers/bluetooth/hci_h4.c b/drivers/bluetooth/hci_h4.c
index fb97a3bf069b..8df0611d976c 100644
--- a/drivers/bluetooth/hci_h4.c
+++ b/drivers/bluetooth/hci_h4.c
@@ -39,6 +39,8 @@
 #include <linux/string.h>
 #include <linux/signal.h>
 #include <linux/ioctl.h>
+#include <linux/of.h>
+#include <linux/serdev.h>
 #include <linux/skbuff.h>
 #include <asm/unaligned.h>
 
@@ -47,6 +49,11 @@
 
 #include "hci_uart.h"
 
+struct h4_device {
+	struct hci_uart hu;
+	bool flow;
+};
+
 struct h4_struct {
 	struct sk_buff *rx_skb;
 	struct sk_buff_head txq;
@@ -146,9 +153,76 @@ static struct sk_buff *h4_dequeue(struct hci_uart *hu)
 	return skb_dequeue(&h4->txq);
 }
 
+#if IS_ENABLED(CONFIG_SERIAL_DEV_BUS)
+static int h4_setup(struct hci_uart *hu)
+{
+	struct h4_device *h4dev;
+	struct serdev_device *serdev = hu->serdev;
+
+	if (!serdev)
+		return 0;
+
+	h4dev = serdev_device_get_drvdata(serdev);
+
+	serdev_device_set_flow_control(serdev, h4dev->flow);
+
+	return 0;
+}
+
+static const struct hci_uart_proto h4p;
+
+static int hci_h4_probe(struct serdev_device *serdev)
+{
+	struct hci_uart *hu;
+	struct h4_device *h4dev;
+	u32 speed = 3000000;
+
+	h4dev = devm_kzalloc(&serdev->dev, sizeof(struct h4_device),
+			     GFP_KERNEL);
+	if (!h4dev)
+		return -ENOMEM;
+	hu = &h4dev->hu;
+
+	serdev_device_set_drvdata(serdev, h4dev);
+	hu->serdev = serdev;
+
+	h4dev->flow = of_property_read_bool(serdev->dev.of_node, "flow");
+
+	of_property_read_u32(serdev->dev.of_node, "speed", &speed);
+	hci_uart_set_speeds(hu, speed, speed);
+
+	return hci_uart_register_device(hu, &h4p);
+}
+
+static void hci_h4_remove(struct serdev_device *serdev)
+{
+	struct h4_device *h4dev = serdev_device_get_drvdata(serdev);
+
+	hci_uart_unregister_device(&h4dev->hu);
+}
+
+static const struct of_device_id hci_h4_of_match[] = {
+	{ .compatible = "wi2wi,w2cbw003-bluetooth"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, hci_h4_of_match);
+
+static struct serdev_device_driver hci_h4_drv = {
+	.driver		= {
+		.name	= "hci-h4",
+		.of_match_table = of_match_ptr(hci_h4_of_match),
+	},
+	.probe = hci_h4_probe,
+	.remove = hci_h4_remove
+};
+#else
+#define h4_setup NULL
+#endif
+
 static const struct hci_uart_proto h4p = {
 	.id		= HCI_UART_H4,
 	.name		= "H4",
+	.setup		= h4_setup,
 	.open		= h4_open,
 	.close		= h4_close,
 	.recv		= h4_recv,
@@ -159,11 +233,15 @@ static const struct hci_uart_proto h4p = {
 
 int __init h4_init(void)
 {
+	serdev_device_driver_register(&hci_h4_drv);
+
 	return hci_uart_register_proto(&h4p);
 }
 
 int __exit h4_deinit(void)
 {
+	serdev_device_driver_unregister(&hci_h4_drv);
+
 	return hci_uart_unregister_proto(&h4p);
 }
 
-- 
2.11.0
