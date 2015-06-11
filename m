From: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 2/2] NFC: nfcmrvl: add UART driver
Date: Thu, 11 Jun 2015 14:00:20 +0200
Message-ID: <1434024020-17048-3-git-send-email-cuissard@marvell.com>
References: <1434024020-17048-1-git-send-email-cuissard@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434024020-17048-1-git-send-email-cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support of Marvell NFC chip controlled over UART

Signed-off-by: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
---
 .../devicetree/bindings/net/nfc/nfcmrvl.txt        |  29 +++
 drivers/nfc/nfcmrvl/Kconfig                        |  11 +
 drivers/nfc/nfcmrvl/Makefile                       |   3 +
 drivers/nfc/nfcmrvl/nfcmrvl.h                      |   7 +
 drivers/nfc/nfcmrvl/uart.c                         | 225 +++++++++++++++++++++
 include/linux/platform_data/nfcmrvl.h              |   9 +
 net/nfc/nci/uart.c                                 |   1 -
 7 files changed, 284 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
 create mode 100644 drivers/nfc/nfcmrvl/uart.c

diff --git a/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt b/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
new file mode 100644
index 0000000..7c4a0cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
@@ -0,0 +1,29 @@
+* Marvell International Ltd. NCI NFC Controller
+
+Required properties:
+- compatible: Should be "mrvl,nfc-uart".
+
+Optional SoC specific properties:
+- pinctrl-names: Contains only one value - "default".
+- pintctrl-0: Specifies the pin control groups used for this controller.
+- reset-n-io: Output GPIO pin used to reset the chip (active low).
+- hci-muxed: Specifies that the chip is muxing NCI over HCI frames.
+
+Optional UART-based chip specific properties:
+- flow-control: Specifies that the chip is using RTS/CTS.
+- break-control: Specifies that the chip needs specific break management.
+
+Example (for ARM-based BeagleBoard Black with 88W8887 on UART5):
+
+&uart5 {
+	status = "okay";
+
+	nfcmrvluart: nfcmrvluart@5 {
+		compatible = "mrvl,nfc-uart";
+
+		reset-n-io = <&gpio3 16 0>;
+
+		hci-muxed;
+		flow-control;
+        }
+};
diff --git a/drivers/nfc/nfcmrvl/Kconfig b/drivers/nfc/nfcmrvl/Kconfig
index 5e18afd..796be24 100644
--- a/drivers/nfc/nfcmrvl/Kconfig
+++ b/drivers/nfc/nfcmrvl/Kconfig
@@ -21,3 +21,14 @@ config NFC_MRVL_USB
 
 	  Say Y here to compile support for Marvell NFC-over-USB driver
 	  into the kernel or say M to compile it as module.
+
+config NFC_MRVL_UART
+	tristate "Marvell NFC-over-UART driver"
+	depends on NFC_MRVL && NFC_NCI_UART
+	help
+	  Marvell NFC-over-UART driver.
+
+	  This driver provides support for Marvell NFC-over-UART devices
+
+	  Say Y here to compile support for Marvell NFC-over-UART driver
+	  into the kernel or say M to compile it as module.
diff --git a/drivers/nfc/nfcmrvl/Makefile b/drivers/nfc/nfcmrvl/Makefile
index 97a0de7..7751962 100644
--- a/drivers/nfc/nfcmrvl/Makefile
+++ b/drivers/nfc/nfcmrvl/Makefile
@@ -7,3 +7,6 @@ obj-$(CONFIG_NFC_MRVL) += nfcmrvl.o
 
 nfcmrvl_usb-y += usb.o
 obj-$(CONFIG_NFC_MRVL_USB) += nfcmrvl_usb.o
+
+nfcmrvl_uart-y += uart.o
+obj-$(CONFIG_NFC_MRVL_UART) += nfcmrvl_uart.o
diff --git a/drivers/nfc/nfcmrvl/nfcmrvl.h b/drivers/nfc/nfcmrvl/nfcmrvl.h
index 214412b..09780d5 100644
--- a/drivers/nfc/nfcmrvl/nfcmrvl.h
+++ b/drivers/nfc/nfcmrvl/nfcmrvl.h
@@ -43,6 +43,11 @@
 #define NFCMRVL_HCI_OGF				0x81
 #define NFCMRVL_HCI_OCF				0xFE
 
+enum nfcmrvl_phy {
+	NFCMRVL_PHY_USB		= 0,
+	NFCMRVL_PHY_UART	= 1,
+};
+
 
 struct nfcmrvl_private {
 
@@ -61,6 +66,8 @@ struct nfcmrvl_private {
 	void *drv_data;
 	/* PHY device */
 	struct device *dev;
+	/* PHY type */
+	enum nfcmrvl_phy phy;
 	/* Low level driver ops */
 	struct nfcmrvl_if_ops *if_ops;
 };
diff --git a/drivers/nfc/nfcmrvl/uart.c b/drivers/nfc/nfcmrvl/uart.c
new file mode 100644
index 0000000..61442d6
--- /dev/null
+++ b/drivers/nfc/nfcmrvl/uart.c
@@ -0,0 +1,225 @@
+/**
+ * Marvell NFC-over-UART driver
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
+ */
+
+#include <linux/module.h>
+#include <linux/delay.h>
+#include <linux/of_gpio.h>
+#include <net/nfc/nci.h>
+#include <net/nfc/nci_core.h>
+#include "nfcmrvl.h"
+
+static unsigned int hci_muxed;
+static unsigned int flow_control;
+static unsigned int break_control;
+static unsigned int reset_n_io;
+
+/*
+** NFCMRVL NCI OPS
+*/
+
+static int nfcmrvl_uart_nci_open(struct nfcmrvl_private *priv)
+{
+	return 0;
+}
+
+static int nfcmrvl_uart_nci_close(struct nfcmrvl_private *priv)
+{
+	return 0;
+}
+
+static int nfcmrvl_uart_nci_send(struct nfcmrvl_private *priv,
+				 struct sk_buff *skb)
+{
+	struct nci_uart *nu = priv->drv_data;
+
+	return nu->ops.send(nu, skb);
+}
+
+static struct nfcmrvl_if_ops uart_ops = {
+	.nci_open = nfcmrvl_uart_nci_open,
+	.nci_close = nfcmrvl_uart_nci_close,
+	.nci_send = nfcmrvl_uart_nci_send,
+};
+
+#ifdef CONFIG_OF
+
+static int nfcmrvl_uart_parse_dt(struct device_node *node,
+				 struct nfcmrvl_platform_data *pdata)
+{
+	struct device_node *matched_node;
+	int ret;
+
+	matched_node = of_find_compatible_node(node, NULL, "mrvl,nfc-uart");
+	if (!matched_node)
+		return -ENODEV;
+
+	ret = nfcmrvl_parse_dt(matched_node, pdata);
+	if (ret < 0) {
+		pr_err("Failed to get generic entries\n");
+		return ret;
+	}
+
+	if (of_find_property(matched_node, "flow-control", NULL))
+		pdata->flow_control = 1;
+	else
+		pdata->flow_control = 0;
+
+	if (of_find_property(matched_node, "break-control", NULL))
+		pdata->break_control = 1;
+	else
+		pdata->break_control = 0;
+
+	return 0;
+}
+
+#else
+
+static int nfcmrvl_uart_parse_dt(struct device_node *node,
+				 struct nfcmrvl_platform_data *pdata)
+{
+	return -ENODEV;
+}
+
+#endif
+
+/*
+** NCI UART OPS
+*/
+
+static int nfcmrvl_nci_uart_open(struct nci_uart *nu)
+{
+	struct nfcmrvl_private *priv;
+	struct nfcmrvl_platform_data *pdata = NULL;
+	struct nfcmrvl_platform_data config;
+
+	/*
+	 * Platform data cannot be used here since usually it is already used
+	 * by low level serial driver. We can try to retrieve serial device
+	 * and check if DT entries were added.
+	 */
+
+	if (nu->tty->dev->parent && nu->tty->dev->parent->of_node)
+		if (nfcmrvl_uart_parse_dt(nu->tty->dev->parent->of_node,
+					  &config) == 0)
+			pdata = &config;
+
+	if (!pdata) {
+		pr_info("No platform data / DT -> fallback to module params\n");
+		config.hci_muxed = hci_muxed;
+		config.reset_n_io = reset_n_io;
+		config.flow_control = flow_control;
+		config.break_control = break_control;
+		pdata = &config;
+	}
+
+	priv = nfcmrvl_nci_register_dev(nu, &uart_ops, nu->tty->dev, pdata);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
+
+	priv->phy = NFCMRVL_PHY_UART;
+
+	nu->drv_data = priv;
+	nu->ndev = priv->ndev;
+
+	/* Set BREAK */
+	if (priv->config.break_control && nu->tty->ops->break_ctl)
+		nu->tty->ops->break_ctl(nu->tty, -1);
+
+	return 0;
+}
+
+static void nfcmrvl_nci_uart_close(struct nci_uart *nu)
+{
+	nfcmrvl_nci_unregister_dev((struct nfcmrvl_private *)nu->drv_data);
+}
+
+static int nfcmrvl_nci_uart_recv(struct nci_uart *nu, struct sk_buff *skb)
+{
+	return nfcmrvl_nci_recv_frame((struct nfcmrvl_private *)nu->drv_data,
+				      skb);
+}
+
+static void nfcmrvl_nci_uart_tx_start(struct nci_uart *nu)
+{
+	struct nfcmrvl_private *priv = (struct nfcmrvl_private *)nu->drv_data;
+
+	/* Remove BREAK to wake up the NFCC */
+	if (priv->config.break_control && nu->tty->ops->break_ctl) {
+		nu->tty->ops->break_ctl(nu->tty, 0);
+		usleep_range(3000, 5000);
+	}
+}
+
+static void nfcmrvl_nci_uart_tx_done(struct nci_uart *nu)
+{
+	struct nfcmrvl_private *priv = (struct nfcmrvl_private *)nu->drv_data;
+
+	/*
+	** To ensure that if the NFCC goes in DEEP SLEEP sate we can wake him
+	** up. we set BREAK. Once we will be ready to send again we will remove
+	** it.
+	*/
+	if (priv->config.break_control && nu->tty->ops->break_ctl)
+		nu->tty->ops->break_ctl(nu->tty, -1);
+}
+
+static struct nci_uart nfcmrvl_nci_uart = {
+	.owner  = THIS_MODULE,
+	.name   = "nfcmrvl_uart",
+	.driver = NCI_UART_DRIVER_MARVELL,
+	.ops	= {
+		.open		= nfcmrvl_nci_uart_open,
+		.close		= nfcmrvl_nci_uart_close,
+		.recv		= nfcmrvl_nci_uart_recv,
+		.tx_start	= nfcmrvl_nci_uart_tx_start,
+		.tx_done	= nfcmrvl_nci_uart_tx_done,
+	}
+};
+
+/*
+** Module init
+*/
+
+static int nfcmrvl_uart_init_module(void)
+{
+	return nci_uart_register(&nfcmrvl_nci_uart);
+}
+
+static void nfcmrvl_uart_exit_module(void)
+{
+	nci_uart_unregister(&nfcmrvl_nci_uart);
+}
+
+module_init(nfcmrvl_uart_init_module);
+module_exit(nfcmrvl_uart_exit_module);
+
+MODULE_AUTHOR("Marvell International Ltd.");
+MODULE_DESCRIPTION("Marvell NFC-over-UART");
+MODULE_LICENSE("GPL v2");
+
+module_param(flow_control, uint, 0);
+MODULE_PARM_DESC(flow_control, "Tell if UART needs flow control at init.");
+
+module_param(break_control, uint, 0);
+MODULE_PARM_DESC(break_control, "Tell if UART driver must drive break signal.");
+
+module_param(hci_muxed, uint, 0);
+MODULE_PARM_DESC(hci_muxed, "Tell if transport is muxed in HCI one.");
+
+module_param(reset_n_io, uint, 0);
+MODULE_PARM_DESC(reset_n_io, "GPIO that is wired to RESET_N signal.");
diff --git a/include/linux/platform_data/nfcmrvl.h b/include/linux/platform_data/nfcmrvl.h
index 106cfe5..ac91707 100644
--- a/include/linux/platform_data/nfcmrvl.h
+++ b/include/linux/platform_data/nfcmrvl.h
@@ -26,6 +26,15 @@ struct nfcmrvl_platform_data {
 	unsigned int reset_n_io;
 	/* Tell if transport is muxed in HCI one */
 	unsigned int hci_muxed;
+
+	/*
+	 * UART specific
+	 */
+
+	/* Tell if UART needs flow control at init */
+	unsigned int flow_control;
+	/* Tell if firmware supports break control for power management */
+	unsigned int break_control;
 };
 
 #endif /* _NFCMRVL_PTF_H_ */
diff --git a/net/nfc/nci/uart.c b/net/nfc/nci/uart.c
index bd96f97..3592b3d 100644
--- a/net/nfc/nci/uart.c
+++ b/net/nfc/nci/uart.c
@@ -12,7 +12,6 @@
  * IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE
  * ARE EXPRESSLY DISCLAIMED.  The License provides additional details about
  * this warranty disclaimer.
-
  */
 
 /*
-- 
2.2.0.33.gc18b867

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
