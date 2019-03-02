From: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 12/15] [NOT FOR MERGE] irqchip/mbox:
 Introduce a mailbox-backed irqchip driver
Date: Fri,  1 Mar 2019 22:29:48 -0600
Message-ID: <20190302042951.53671-13-samuel@sholland.org>
References: <20190302042951.53671-1-samuel@sholland.org>
Reply-To: samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDA2PU6QWEARBSEN5DRQKGQEAJ3CA4I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190302042951.53671-1-samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This driver implements a simple interrupt controller using message
passing over a mailbox channel. The intention is for the other end of
the channel to be implemented in firmware. This allows filtering and
forwarding interrupts from one processor to another.

Signed-off-by: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
---
 drivers/irqchip/Kconfig    |   9 ++
 drivers/irqchip/Makefile   |   1 +
 drivers/irqchip/irq-mbox.c | 199 +++++++++++++++++++++++++++++++++++++
 3 files changed, 209 insertions(+)
 create mode 100644 drivers/irqchip/irq-mbox.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 3d1e60779078..d22921276797 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -406,6 +406,15 @@ config IMX_IRQSTEER
 	help
 	  Support for the i.MX IRQSTEER interrupt multiplexer/remapper.
 
+config IRQ_MBOX
+	tristate "Simple mailbox-backed interrupt controller"
+	depends on MAILBOX
+	select IRQ_DOMAIN
+	help
+	  Support for interrupt controllers attached via a mailbox channel.
+	  This allows a coprocessor to inject interrupts via a simple
+	  message-based protocol.
+
 endmenu
 
 config SIFIVE_PLIC
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index c93713d24b86..9de16ab4e69a 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -94,3 +94,4 @@ obj-$(CONFIG_CSKY_APB_INTC)		+= irq-csky-apb-intc.o
 obj-$(CONFIG_SIFIVE_PLIC)		+= irq-sifive-plic.o
 obj-$(CONFIG_IMX_IRQSTEER)		+= irq-imx-irqsteer.o
 obj-$(CONFIG_MADERA_IRQ)		+= irq-madera.o
+obj-$(CONFIG_IRQ_MBOX)			+= irq-mbox.o
diff --git a/drivers/irqchip/irq-mbox.c b/drivers/irqchip/irq-mbox.c
new file mode 100644
index 000000000000..f7f6b47bc5b9
--- /dev/null
+++ b/drivers/irqchip/irq-mbox.c
@@ -0,0 +1,199 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2018-2019 Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
+
+/*
+ * Simple mailbox-backed interrupt controller driver using 32-bit messages.
+ * The mailbox controller is expected to take a (uint32_t *) message argument.
+ *
+ * Client-to-server messages:
+ *   Byte 3 (MSB) : Reserved
+ *   Byte 2       : Reserved
+ *   Byte 1       : Message type (enumerated below)
+ *   Byte 0 (LSB) : IRQ number
+ *
+ * Server-to-client messages:
+ *   Byte 3 (MSB) : Reserved
+ *   Byte 2       : Reserved
+ *   Byte 1       : Message type (must be zero == interrupt received)
+ *   Byte 0 (LSB) : IRQ number
+ *
+ * IRQ lines must be unmasked before they can be used (generic irqchip code
+ * takes care of that in this driver).
+ */
+
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqdomain.h>
+#include <linux/mailbox_client.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+
+#define MBOX_INTC_MAX_IRQS 32
+
+enum {
+	MSG_EOI    = 0,
+	MSG_MASK   = 1,
+	MSG_UNMASK = 2,
+};
+
+struct mbox_intc {
+	struct irq_chip chip;
+	struct irq_domain *domain;
+	struct mbox_chan *rx_chan;
+	struct mbox_chan *tx_chan;
+	struct mbox_client cl;
+};
+
+static int mbox_intc_map(struct irq_domain *domain, unsigned int virq,
+			 irq_hw_number_t hwirq)
+{
+	struct mbox_intc *intc = domain->host_data;
+
+	if (hwirq >= MBOX_INTC_MAX_IRQS)
+		return -ENODEV;
+
+	irq_set_chip_data(virq, intc);
+	irq_set_chip_and_handler(virq, &intc->chip, handle_fasteoi_irq);
+	irq_set_status_flags(virq, IRQ_LEVEL);
+
+	return 0;
+}
+
+static const struct irq_domain_ops mbox_intc_domain_ops = {
+	.map   = mbox_intc_map,
+	.xlate = irq_domain_xlate_onecell,
+};
+
+static void mbox_intc_rx_callback(struct mbox_client *cl, void *msg)
+{
+	struct mbox_intc *intc = container_of(cl, struct mbox_intc, cl);
+	uint32_t hwirq = *(uint32_t *)msg;
+
+	if (hwirq >= MBOX_INTC_MAX_IRQS)
+		return;
+
+	generic_handle_irq(irq_linear_revmap(intc->domain, hwirq));
+}
+
+static void mbox_intc_tx_msg(struct irq_data *d, uint8_t request)
+{
+	struct mbox_intc *intc = irq_data_get_irq_chip_data(d);
+	uint32_t msg = (request << 8) | (d->hwirq & GENMASK(0, 7));
+
+	/* Since we don't expect an ACK for this message, immediately complete
+	 * the transmission. This ensures that each message is sent out without
+	 * sleeping, and 'data' remains in scope until actual transmission. */
+	if (mbox_send_message(intc->tx_chan, &msg) >= 0)
+		mbox_client_txdone(intc->tx_chan, 0);
+}
+
+static void mbox_intc_irq_mask(struct irq_data *d)
+{
+	mbox_intc_tx_msg(d, MSG_MASK);
+}
+
+static void mbox_intc_irq_unmask(struct irq_data *d)
+{
+	mbox_intc_tx_msg(d, MSG_UNMASK);
+}
+
+static void mbox_intc_irq_eoi(struct irq_data *d)
+{
+	mbox_intc_tx_msg(d, MSG_EOI);
+}
+
+static int mbox_intc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mbox_intc *intc;
+	int ret;
+
+	intc = devm_kzalloc(dev, sizeof(*intc), GFP_KERNEL);
+	if (!intc)
+		return -ENOMEM;
+
+	intc->cl.dev          = dev;
+	intc->cl.knows_txdone = true;
+	intc->cl.rx_callback  = mbox_intc_rx_callback;
+
+	if (of_get_property(dev->of_node, "mbox-names", NULL)) {
+		intc->rx_chan = mbox_request_channel_byname(&intc->cl, "rx");
+		if (IS_ERR(intc->rx_chan)) {
+			ret = PTR_ERR(intc->rx_chan);
+			dev_err(dev, "Failed to request rx mailbox channel\n");
+			goto err;
+		}
+		intc->tx_chan = mbox_request_channel_byname(&intc->cl, "tx");
+		if (IS_ERR(intc->tx_chan)) {
+			ret = PTR_ERR(intc->tx_chan);
+			dev_err(dev, "Failed to request tx mailbox channel\n");
+			goto err_free_rx_chan;
+		}
+	} else {
+		intc->rx_chan = mbox_request_channel(&intc->cl, 0);
+		intc->tx_chan = intc->rx_chan;
+		if (IS_ERR(intc->tx_chan)) {
+			ret = PTR_ERR(intc->tx_chan);
+			dev_err(dev, "Failed to request mailbox channel\n");
+			goto err;
+		}
+	}
+
+	intc->chip.name       = dev_name(dev);
+	intc->chip.irq_mask   = mbox_intc_irq_mask;
+	intc->chip.irq_unmask = mbox_intc_irq_unmask;
+	intc->chip.irq_eoi    = mbox_intc_irq_eoi;
+
+	intc->domain = irq_domain_add_linear(dev->of_node, MBOX_INTC_MAX_IRQS,
+					     &mbox_intc_domain_ops, intc);
+	if (IS_ERR(intc->domain)) {
+		ret = PTR_ERR(intc->domain);
+		dev_err(dev, "Failed to allocate IRQ domain: %d\n", ret);
+		goto err_free_tx_chan;
+	}
+
+	platform_set_drvdata(pdev, intc);
+
+	return 0;
+
+err_free_tx_chan:
+	if (intc->tx_chan != intc->rx_chan)
+		mbox_free_channel(intc->tx_chan);
+err_free_rx_chan:
+	mbox_free_channel(intc->rx_chan);
+err:
+	return ret;
+}
+
+static int mbox_intc_remove(struct platform_device *pdev)
+{
+	struct mbox_intc *intc = platform_get_drvdata(pdev);
+
+	irq_domain_remove(intc->domain);
+	if (intc->tx_chan != intc->rx_chan)
+		mbox_free_channel(intc->tx_chan);
+	mbox_free_channel(intc->rx_chan);
+
+	return 0;
+}
+
+static const struct of_device_id mbox_intc_of_match[] = {
+	{ .compatible = "allwinner,sunxi-msgbox-intc" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mbox_intc_of_match);
+
+static struct platform_driver mbox_intc_driver = {
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = mbox_intc_of_match,
+	},
+	.probe  = mbox_intc_probe,
+	.remove = mbox_intc_remove,
+};
+module_platform_driver(mbox_intc_driver);
+
+MODULE_AUTHOR("Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>");
+MODULE_DESCRIPTION("Simple mailbox-backed interrupt controller");
+MODULE_LICENSE("GPL v2");
-- 
2.19.2
