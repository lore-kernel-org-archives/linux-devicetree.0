From: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 8/9] NFC: nfcmrvl: add spi driver
Date: Mon, 26 Oct 2015 10:27:44 +0100
Message-ID: <1445851665-2497-9-git-send-email-cuissard@marvell.com>
References: <1445851665-2497-1-git-send-email-cuissard@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445851665-2497-1-git-send-email-cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This driver adds the support of SPI-based Marvell NFC controller.

Signed-off-by: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
---
 .../devicetree/bindings/net/nfc/nfcmrvl.txt        |  25 +++
 drivers/nfc/nfcmrvl/Kconfig                        |  10 +
 drivers/nfc/nfcmrvl/Makefile                       |   3 +
 drivers/nfc/nfcmrvl/main.c                         |   6 +-
 drivers/nfc/nfcmrvl/spi.c                          | 226 +++++++++++++++++++++
 5 files changed, 269 insertions(+), 1 deletion(-)
 create mode 100644 drivers/nfc/nfcmrvl/spi.c

diff --git a/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt b/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
index 0fa20cc..41058fc 100644
--- a/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
+++ b/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
@@ -4,6 +4,7 @@ Required properties:
 - compatible: Should be:
   - "mrvl,nfc-uart" for UART devices
   - "mrvl,nfc-i2c" for I2C devices
+  - "mrvl,nfc-spi" for SPI devices
 
 Optional SoC specific properties:
 - pinctrl-names: Contains only one value - "default".
@@ -59,3 +60,27 @@ Example (for ARM-based BeagleBoard Black with 88W8887 on I2C1):
 		reset-n-io = <&gpio3 19 0>;
 	};
 };
+
+
+Example (for ARM-based BeagleBoard Black on SPI0):
+
+&spi0 {
+
+	mrvlnfcspi0: spi@0 {
+		compatible = "mrvl,nfc-spi";
+
+		reg = <0>;
+
+		/* SPI Bus configuration */
+		spi-max-frequency = <3000000>;
+		spi-cpha;
+		spi-cpol;
+
+		/* SPI INT configuration */
+		interrupt-parent = <&gpio1>;
+		interrupts = <17 0>;
+
+		/* Reset IO */
+       		reset-n-io = <&gpio3 19 0>;
+	};
+};
diff --git a/drivers/nfc/nfcmrvl/Kconfig b/drivers/nfc/nfcmrvl/Kconfig
index e18a979..444ca94 100644
--- a/drivers/nfc/nfcmrvl/Kconfig
+++ b/drivers/nfc/nfcmrvl/Kconfig
@@ -42,3 +42,13 @@ config NFC_MRVL_I2C
 	  Say Y here to compile support for Marvell NFC-over-I2C driver
 	  into the kernel or say M to compile it as module.
 
+config NFC_MRVL_SPI
+	tristate "Marvell NFC-over-SPI driver"
+	depends on NFC_MRVL && SPI
+	help
+	  Marvell NFC-over-SPI driver.
+
+	  This driver provides support for Marvell NFC-over-SPI devices.
+
+	  Say Y here to compile support for Marvell NFC-over-SPI driver
+	  into the kernel or say M to compile it as module.
diff --git a/drivers/nfc/nfcmrvl/Makefile b/drivers/nfc/nfcmrvl/Makefile
index 895866a..fa07c78 100644
--- a/drivers/nfc/nfcmrvl/Makefile
+++ b/drivers/nfc/nfcmrvl/Makefile
@@ -13,3 +13,6 @@ obj-$(CONFIG_NFC_MRVL_UART) += nfcmrvl_uart.o
 
 nfcmrvl_i2c-y += i2c.o
 obj-$(CONFIG_NFC_MRVL_I2C) += nfcmrvl_i2c.o
+
+nfcmrvl_spi-y += spi.o
+obj-$(CONFIG_NFC_MRVL_SPI) += nfcmrvl_spi.o
diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
index 0c27de6..8079ae0 100644
--- a/drivers/nfc/nfcmrvl/main.c
+++ b/drivers/nfc/nfcmrvl/main.c
@@ -132,7 +132,11 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(enum nfcmrvl_phy phy,
 			nfc_err(dev, "failed to request reset_n io\n");
 	}
 
-	headroom = tailroom = 0;
+	if (phy == NFCMRVL_PHY_SPI) {
+		headroom = NCI_SPI_HDR_LEN;
+		tailroom = 1;
+	} else
+		headroom = tailroom = 0;
 
 	if (priv->config.hci_muxed)
 		headroom += NFCMRVL_HCI_EVENT_HEADER_SIZE;
diff --git a/drivers/nfc/nfcmrvl/spi.c b/drivers/nfc/nfcmrvl/spi.c
new file mode 100644
index 0000000..19154c8
--- /dev/null
+++ b/drivers/nfc/nfcmrvl/spi.c
@@ -0,0 +1,226 @@
+/**
+ * Marvell NFC-over-SPI driver: SPI interface related functions
+ *
+ * Copyright (C) 2015, Marvell International Ltd.
+ *
+ * This software file (the "File") is distributed by Marvell International
+ * Ltd. under the terms of the GNU General Public License Version 2, June 1991
+ * (the "License").  You may use, redistribute and/or modify this File in
+ * accordance with the terms and conditions of the License, a copy of which
+ * is available on the worldwide web at
+ * http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
+ *
+ * THE FILE IS DISTRIBUTED AS-IS, WITHOUT WARRANTY OF ANY KIND, AND THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE
+ * ARE EXPRESSLY DISCLAIMED.  The License provides additional details about
+ * this warranty disclaimer.
+ **/
+
+#include <linux/module.h>
+#include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
+#include <linux/nfc.h>
+#include <linux/gpio.h>
+#include <linux/of_irq.h>
+#include <linux/of_gpio.h>
+#include <net/nfc/nci.h>
+#include <net/nfc/nci_core.h>
+#include <linux/spi/spi.h>
+#include <linux/gpio.h>
+#include "nfcmrvl.h"
+
+#define SPI_WAIT_HANDSHAKE	1
+
+struct nfcmrvl_spi_drv_data {
+	unsigned long flags;
+	struct spi_device *spi;
+	struct nci_spi *nci_spi;
+	struct completion handshake_completion;
+	struct nfcmrvl_private *priv;
+};
+
+static irqreturn_t nfcmrvl_spi_int_irq_thread_fn(int irq, void *drv_data_ptr)
+{
+	struct nfcmrvl_spi_drv_data *drv_data = drv_data_ptr;
+	struct sk_buff *skb;
+
+	/*
+	 * Special case where we are waiting for SPI_INT deassertion to start a
+	 * transfer.
+	 */
+	if (test_and_clear_bit(SPI_WAIT_HANDSHAKE, &drv_data->flags)) {
+		complete(&drv_data->handshake_completion);
+		return IRQ_HANDLED;
+	}
+
+	/* Normal case, SPI_INT deasserted by slave to trigger a master read */
+
+	skb = nci_spi_read(drv_data->nci_spi);
+	if (!skb) {
+		nfc_err(&drv_data->spi->dev, "failed to read spi packet");
+		return IRQ_HANDLED;
+	}
+
+	if (nfcmrvl_nci_recv_frame(drv_data->priv, skb) < 0)
+		nfc_err(&drv_data->spi->dev, "corrupted RX packet");
+
+	return IRQ_HANDLED;
+}
+
+static int nfcmrvl_spi_nci_open(struct nfcmrvl_private *priv)
+{
+	return 0;
+}
+
+static int nfcmrvl_spi_nci_close(struct nfcmrvl_private *priv)
+{
+	return 0;
+}
+
+static int nfcmrvl_spi_nci_send(struct nfcmrvl_private *priv,
+				struct sk_buff *skb)
+{
+	struct nfcmrvl_spi_drv_data *drv_data = priv->drv_data;
+	int err;
+
+	/* Reinit completion for slave handshake */
+	reinit_completion(&drv_data->handshake_completion);
+	set_bit(SPI_WAIT_HANDSHAKE, &drv_data->flags);
+
+	/* Append a dummy byte at the end of SPI frame. This is due to a
+	   specific DMA implementation in the controller */
+	skb_put(skb, 1);
+
+	/* Send the SPI packet */
+	err = nci_spi_send(drv_data->nci_spi, &drv_data->handshake_completion,
+			   skb);
+	if (err != 0) {
+		nfc_err(priv->dev, "spi_send failed %d", err);
+		kfree_skb(skb);
+	}
+	return err;
+}
+
+static void nfcmrvl_spi_nci_update_config(struct nfcmrvl_private *priv,
+					  const void *param)
+{
+	struct nfcmrvl_spi_drv_data *drv_data = priv->drv_data;
+	const struct nfcmrvl_fw_spi_config *config = param;
+
+	drv_data->nci_spi->xfer_speed_hz = config->clk;
+}
+
+static struct nfcmrvl_if_ops spi_ops = {
+	.nci_open = nfcmrvl_spi_nci_open,
+	.nci_close = nfcmrvl_spi_nci_close,
+	.nci_send = nfcmrvl_spi_nci_send,
+	.nci_update_config = nfcmrvl_spi_nci_update_config,
+};
+
+static int nfcmrvl_spi_parse_dt(struct device_node *node,
+				struct nfcmrvl_platform_data *pdata)
+{
+	int ret;
+
+	ret = nfcmrvl_parse_dt(node, pdata);
+	if (ret < 0) {
+		pr_err("Failed to get generic entries\n");
+		return ret;
+	}
+
+	ret = irq_of_parse_and_map(node, 0);
+	if (ret < 0) {
+		pr_err("Unable to get irq, error: %d\n", ret);
+		return ret;
+	}
+	pdata->irq = ret;
+
+	return 0;
+}
+
+static int nfcmrvl_spi_probe(struct spi_device *spi)
+{
+	struct nfcmrvl_platform_data *pdata;
+	struct nfcmrvl_platform_data config;
+	struct nfcmrvl_spi_drv_data *drv_data;
+	int ret = 0;
+
+	drv_data = devm_kzalloc(&spi->dev, sizeof(*drv_data), GFP_KERNEL);
+	if (!drv_data)
+		return -ENOMEM;
+
+	drv_data->spi = spi;
+	drv_data->priv = NULL;
+	spi_set_drvdata(spi, drv_data);
+
+	pdata = spi->dev.platform_data;
+
+	if (!pdata && spi->dev.of_node)
+		if (nfcmrvl_spi_parse_dt(spi->dev.of_node, &config) == 0)
+			pdata = &config;
+
+	if (!pdata)
+		return -EINVAL;
+
+	ret = devm_request_threaded_irq(&drv_data->spi->dev, pdata->irq,
+					NULL, nfcmrvl_spi_int_irq_thread_fn,
+					IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+					"nfcmrvl_spi_int", drv_data);
+	if (ret < 0) {
+		nfc_err(&drv_data->spi->dev, "Unable to register IRQ handler");
+		return -ENODEV;
+	}
+
+	drv_data->priv = nfcmrvl_nci_register_dev(NFCMRVL_PHY_SPI,
+						  drv_data, &spi_ops,
+						  &drv_data->spi->dev,
+						  pdata);
+	if (IS_ERR(drv_data->priv))
+		return PTR_ERR(drv_data->priv);
+
+	drv_data->priv->support_fw_dnld = true;
+
+	drv_data->nci_spi = nci_spi_allocate_spi(drv_data->spi, 0, 10,
+						 drv_data->priv->ndev);
+
+	/* Init completion for slave handshake */
+	init_completion(&drv_data->handshake_completion);
+	return 0;
+}
+
+static int nfcmrvl_spi_remove(struct spi_device *spi)
+{
+	struct nfcmrvl_spi_drv_data *drv_data = spi_get_drvdata(spi);
+
+	nfcmrvl_nci_unregister_dev(drv_data->priv);
+	return 0;
+}
+
+static const struct of_device_id of_nfcmrvl_spi_match[] = {
+	{ .compatible = "mrvl,nfc-spi", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, of_nfcmrvl_spi_match);
+
+static const struct spi_device_id nfcmrvl_spi_id_table[] = {
+	{ "nfcmrvl_spi", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, nfcmrvl_spi_id_table);
+
+static struct spi_driver nfcmrvl_spi_driver = {
+	.probe		= nfcmrvl_spi_probe,
+	.remove		= nfcmrvl_spi_remove,
+	.id_table	= nfcmrvl_spi_id_table,
+	.driver		= {
+		.name		= "nfcmrvl_spi",
+		.owner		= THIS_MODULE,
+		.of_match_table	= of_match_ptr(of_nfcmrvl_spi_match),
+	},
+};
+
+module_spi_driver(nfcmrvl_spi_driver);
+
+MODULE_AUTHOR("Marvell International Ltd.");
+MODULE_DESCRIPTION("Marvell NFC-over-SPI driver");
+MODULE_LICENSE("GPL v2");
-- 
2.2.0.33.gc18b867

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
