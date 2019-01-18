From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 4/8] Bluetooth: hci_h5: Add support for binding RTL8723BS with device tree
Date: Fri, 18 Jan 2019 09:02:28 -0800
Message-ID: <20190118170232.16142-5-anarsoul@gmail.com>
References: <20190118170232.16142-1-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190118170232.16142-1-anarsoul@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Vasily Khoruzhick <anarsoul@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org
List-Id: devicetree@vger.kernel.org

RTL8723BS is often used in ARM boards, so add ability to bind it
using device tree.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/bluetooth/hci_h5.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c
index 7ead8c3d8657..44f848c02c63 100644
--- a/drivers/bluetooth/hci_h5.c
+++ b/drivers/bluetooth/hci_h5.c
@@ -26,6 +26,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/mod_devicetable.h>
+#include <linux/of_device.h>
 #include <linux/serdev.h>
 #include <linux/skbuff.h>
 
@@ -823,6 +824,11 @@ static int h5_serdev_probe(struct serdev_device *serdev)
 		if (h5->vnd->acpi_gpio_map)
 			devm_acpi_dev_add_driver_gpios(dev,
 						       h5->vnd->acpi_gpio_map);
+	} else {
+		h5->vnd = (const struct h5_vnd *)
+				of_device_get_match_data(&serdev->dev);
+		of_property_read_string(serdev->dev.of_node,
+					"firmware-postfix", &h5->id);
 	}
 
 	h5->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
@@ -1024,12 +1030,26 @@ static const struct dev_pm_ops h5_serdev_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(h5_serdev_suspend, h5_serdev_resume)
 };
 
+static struct h5_vnd rtl8723_of_vnd = {
+	.setup		= h5_btrtl_setup,
+	.open		= h5_btrtl_open,
+	.close		= h5_btrtl_close,
+};
+
+static const struct of_device_id h5_of_match[] = {
+	{ .compatible = "realtek,rtl8723bs-bt", .data = &rtl8723_of_vnd },
+	{ .compatible = "realtek,rtl8723cs-bt", .data = &rtl8723_of_vnd },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, h5_of_match);
+
 static struct serdev_device_driver h5_serdev_driver = {
 	.probe = h5_serdev_probe,
 	.remove = h5_serdev_remove,
 	.driver = {
 		.name = "hci_uart_h5",
 		.acpi_match_table = ACPI_PTR(h5_acpi_match),
+		.of_match_table = of_match_ptr(h5_of_match),
 		.pm = &h5_serdev_pm_ops,
 	},
 };
-- 
2.20.1
