From: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 05/10] mailbox: sunxi-msgbox: Add a new
 mailbox driver
Date: Thu, 28 Feb 2019 23:29:42 -0600
Message-ID: <20190301052947.32032-6-samuel@sholland.org>
References: <20190301052947.32032-1-samuel@sholland.org>
Reply-To: samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDA2PU6QWEARBUMG4PRQKGQE2AI2SYI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190301052947.32032-1-samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allwinner sun8i, sun9i, and sun50i SoCs contain a hardware message box
used for communication between the ARM CPUs and the ARISC management
coprocessor. The hardware contains 8 unidirectional 4-message FIFOs.

Add a driver for it, so it can be used for SCPI or other communication
protocols.

Signed-off-by: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
---
 drivers/mailbox/Kconfig        |  11 ++
 drivers/mailbox/Makefile       |   2 +
 drivers/mailbox/sunxi-msgbox.c | 315 +++++++++++++++++++++++++++++++++
 3 files changed, 328 insertions(+)
 create mode 100644 drivers/mailbox/sunxi-msgbox.c

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 3eeb12e93e98..6309e755d04a 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -205,4 +205,15 @@ config MTK_CMDQ_MBOX
 	  mailbox driver. The CMDQ is used to help read/write registers with
 	  critical time limitation, such as updating display configuration
 	  during the vblank.
+
+config SUNXI_MSGBOX
+	tristate "Allwinner sunxi Message Box"
+	depends on ARCH_SUNXI || COMPILE_TEST
+	default ARCH_SUNXI
+	help
+	  Mailbox implementation for the hardware message box present in
+	  Allwinner sun8i, sun9i, and sun50i SoCs. The hardware message box is
+	  used for communication between the application CPUs and the power
+	  management coprocessor.
+
 endif
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index c818b5d011ae..f29a119a3fac 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -44,3 +44,5 @@ obj-$(CONFIG_TEGRA_HSP_MBOX)	+= tegra-hsp.o
 obj-$(CONFIG_STM32_IPCC) 	+= stm32-ipcc.o
 
 obj-$(CONFIG_MTK_CMDQ_MBOX)	+= mtk-cmdq-mailbox.o
+
+obj-$(CONFIG_SUNXI_MSGBOX)	+= sunxi-msgbox.o
diff --git a/drivers/mailbox/sunxi-msgbox.c b/drivers/mailbox/sunxi-msgbox.c
new file mode 100644
index 000000000000..fb0d733dd3b4
--- /dev/null
+++ b/drivers/mailbox/sunxi-msgbox.c
@@ -0,0 +1,315 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2017-2019 Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
+
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mailbox_controller.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/spinlock.h>
+
+#define NUM_CHANS		8
+
+#define CTRL_REG(n)		(0x0000 + 0x4 * ((n) / 4))
+#define CTRL_RX(n)		BIT(0 + 8 * ((n) % 4))
+#define CTRL_TX(n)		BIT(4 + 8 * ((n) % 4))
+
+#define REMOTE_IRQ_EN_REG	0x0040
+#define REMOTE_IRQ_STATUS_REG	0x0050
+#define LOCAL_IRQ_EN_REG	0x0060
+#define LOCAL_IRQ_STATUS_REG	0x0070
+
+#define RX_IRQ(n)		BIT(0 + 2 * (n))
+#define RX_IRQ_MASK		0x5555
+#define TX_IRQ(n)		BIT(1 + 2 * (n))
+#define TX_IRQ_MASK		0xaaaa
+
+#define FIFO_STATUS_REG(n)	(0x0100 + 0x4 * (n))
+#define FIFO_STATUS_MASK	BIT(0)
+
+#define MSG_STATUS_REG(n)	(0x0140 + 0x4 * (n))
+#define MSG_STATUS_MASK		GENMASK(2, 0)
+
+#define MSG_DATA_REG(n)		(0x0180 + 0x4 * (n))
+
+#define mbox_dbg(mbox, ...)	dev_dbg((mbox)->controller.dev, __VA_ARGS__)
+
+struct sunxi_msgbox {
+	struct mbox_controller controller;
+	struct clk *clk;
+	spinlock_t lock;
+	void __iomem *regs;
+};
+
+static bool sunxi_msgbox_last_tx_done(struct mbox_chan *chan);
+static bool sunxi_msgbox_peek_data(struct mbox_chan *chan);
+
+static inline int channel_number(struct mbox_chan *chan)
+{
+	return chan - chan->mbox->chans;
+}
+
+static inline struct sunxi_msgbox *channel_to_msgbox(struct mbox_chan *chan)
+{
+	return (struct sunxi_msgbox *)chan->con_priv;
+}
+
+static irqreturn_t sunxi_msgbox_irq(int irq, void *dev_id)
+{
+	struct mbox_chan *chan;
+	struct sunxi_msgbox *mbox = dev_id;
+	int n;
+	uint32_t msg, status;
+
+	status = readl(mbox->regs + LOCAL_IRQ_STATUS_REG);
+	if (!(status & RX_IRQ_MASK))
+		return IRQ_NONE;
+
+	for (n = 0; n < NUM_CHANS; ++n) {
+		if (!(status & RX_IRQ(n)))
+			continue;
+		chan = &mbox->controller.chans[n];
+		while (sunxi_msgbox_peek_data(chan)) {
+			msg = readl(mbox->regs + MSG_DATA_REG(n));
+			mbox_dbg(mbox, "Channel %d received 0x%08x\n", n, msg);
+			mbox_chan_received_data(chan, &msg);
+		}
+		/* The IRQ can be cleared only when the FIFO is empty. */
+		writel(RX_IRQ(n), mbox->regs + LOCAL_IRQ_STATUS_REG);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int sunxi_msgbox_send_data(struct mbox_chan *chan, void *data)
+{
+	struct sunxi_msgbox *mbox = channel_to_msgbox(chan);
+	int n = channel_number(chan);
+	uint32_t msg = *(uint32_t *)data;
+
+	/* Using a channel backwards gets the hardware into a bad state. */
+	if (WARN_ON_ONCE(!(readl(mbox->regs + CTRL_REG(n)) & CTRL_TX(n))))
+		return 0;
+
+	/* We cannot post a new message if the FIFO is full. */
+	if (readl(mbox->regs + FIFO_STATUS_REG(n)) & FIFO_STATUS_MASK) {
+		mbox_dbg(mbox, "Channel %d busy sending 0x%08x\n", n, msg);
+		return -EBUSY;
+	}
+
+	writel(msg, mbox->regs + MSG_DATA_REG(n));
+	mbox_dbg(mbox, "Channel %d sent 0x%08x\n", n, msg);
+
+	return 0;
+}
+
+static int sunxi_msgbox_startup(struct mbox_chan *chan)
+{
+	struct sunxi_msgbox *mbox = channel_to_msgbox(chan);
+	int n = channel_number(chan);
+
+	/* The coprocessor is responsible for setting channel directions. */
+	if (readl(mbox->regs + CTRL_REG(n)) & CTRL_RX(n)) {
+		/* Clear existing messages in the receive FIFO. */
+		while (sunxi_msgbox_peek_data(chan))
+			readl(mbox->regs + MSG_DATA_REG(n));
+		writel(RX_IRQ(n), mbox->regs + LOCAL_IRQ_STATUS_REG);
+
+		/* Enable the receive interrupt. */
+		spin_lock(&mbox->lock);
+		writel(readl(mbox->regs + LOCAL_IRQ_EN_REG) | RX_IRQ(n),
+		       mbox->regs + LOCAL_IRQ_EN_REG);
+		spin_unlock(&mbox->lock);
+	}
+
+	mbox_dbg(mbox, "Channel %d startup\n", n);
+
+	return 0;
+}
+
+static void sunxi_msgbox_shutdown(struct mbox_chan *chan)
+{
+	struct sunxi_msgbox *mbox = channel_to_msgbox(chan);
+	int n = channel_number(chan);
+
+	if (readl(mbox->regs + CTRL_REG(n)) & CTRL_RX(n)) {
+		/* Disable the receive interrupt. */
+		spin_lock(&mbox->lock);
+		writel(readl(mbox->regs + LOCAL_IRQ_EN_REG) & ~RX_IRQ(n),
+		       mbox->regs + LOCAL_IRQ_EN_REG);
+		spin_unlock(&mbox->lock);
+
+		/* Clear existing messages in the receive FIFO. */
+		while (sunxi_msgbox_peek_data(chan))
+			readl(mbox->regs + MSG_DATA_REG(n));
+		writel(RX_IRQ(n), mbox->regs + LOCAL_IRQ_STATUS_REG);
+	}
+
+	mbox_dbg(mbox, "Channel %d shutdown\n", n);
+}
+
+static bool sunxi_msgbox_last_tx_done(struct mbox_chan *chan)
+{
+	struct sunxi_msgbox *mbox = channel_to_msgbox(chan);
+	int n = channel_number(chan);
+
+	/*
+	 * The hardware allows snooping on the remote user's IRQ status. We
+	 * consider a message to be acknowledged only when the receive IRQ for
+	 * that channel is cleared. As the hardware only allows clearing the
+	 * IRQ for a channel when the FIFO is empty, this still ensures that
+	 * the message has actually been read. It also gives the receiver an
+	 * opportunity to perform minimal processing before acknowledging a
+	 * message.
+	 */
+	return !(readl(mbox->regs + REMOTE_IRQ_STATUS_REG) & RX_IRQ(n));
+}
+
+static bool sunxi_msgbox_peek_data(struct mbox_chan *chan)
+{
+	struct sunxi_msgbox *mbox = channel_to_msgbox(chan);
+	int n = channel_number(chan);
+
+	return (readl(mbox->regs + MSG_STATUS_REG(n)) & MSG_STATUS_MASK) > 0;
+}
+
+static const struct mbox_chan_ops sunxi_msgbox_chan_ops = {
+	.send_data    = sunxi_msgbox_send_data,
+	.startup      = sunxi_msgbox_startup,
+	.shutdown     = sunxi_msgbox_shutdown,
+	.last_tx_done = sunxi_msgbox_last_tx_done,
+	.peek_data    = sunxi_msgbox_peek_data,
+};
+
+static int sunxi_msgbox_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mbox_chan *chans;
+	struct reset_control *reset;
+	struct resource *res;
+	struct sunxi_msgbox *mbox;
+	int i, ret;
+
+	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
+	if (!mbox)
+		return -ENOMEM;
+
+	chans = devm_kcalloc(dev, NUM_CHANS, sizeof(*chans), GFP_KERNEL);
+	if (!chans)
+		return -ENOMEM;
+
+	for (i = 0; i < NUM_CHANS; ++i)
+		chans[i].con_priv = mbox;
+
+	mbox->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(mbox->clk)) {
+		ret = PTR_ERR(mbox->clk);
+		dev_err(dev, "Failed to get clock: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(mbox->clk);
+	if (ret) {
+		dev_err(dev, "Failed to enable clock: %d\n", ret);
+		return ret;
+	}
+
+	reset = devm_reset_control_get(dev, NULL);
+	if (IS_ERR(reset)) {
+		ret = PTR_ERR(reset);
+		dev_err(dev, "Failed to get reset control: %d\n", ret);
+		goto err_disable_unprepare;
+	}
+
+	ret = reset_control_deassert(reset);
+	if (ret) {
+		dev_err(dev, "Failed to deassert reset: %d\n", ret);
+		goto err_disable_unprepare;
+	}
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		ret = -ENODEV;
+		goto err_disable_unprepare;
+	}
+
+	mbox->regs = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(mbox->regs)) {
+		ret = PTR_ERR(mbox->regs);
+		dev_err(dev, "Failed to map MMIO resource: %d\n", ret);
+		goto err_disable_unprepare;
+	}
+
+	/* Disable all interrupts for this end of the msgbox. */
+	writel(0, mbox->regs + LOCAL_IRQ_EN_REG);
+
+	ret = devm_request_irq(dev, irq_of_parse_and_map(dev->of_node, 0),
+			       sunxi_msgbox_irq, 0, dev_name(dev), mbox);
+	if (ret) {
+		dev_err(dev, "Failed to register IRQ handler: %d\n", ret);
+		goto err_disable_unprepare;
+	}
+
+	mbox->controller.dev           = dev;
+	mbox->controller.ops           = &sunxi_msgbox_chan_ops;
+	mbox->controller.chans         = chans;
+	mbox->controller.num_chans     = NUM_CHANS;
+	mbox->controller.txdone_irq    = false;
+	mbox->controller.txdone_poll   = true;
+	mbox->controller.txpoll_period = 5;
+
+	spin_lock_init(&mbox->lock);
+	platform_set_drvdata(pdev, mbox);
+
+	ret = mbox_controller_register(&mbox->controller);
+	if (ret) {
+		dev_err(dev, "Failed to register controller: %d\n", ret);
+		goto err_disable_unprepare;
+	}
+
+	return 0;
+
+err_disable_unprepare:
+	clk_disable_unprepare(mbox->clk);
+
+	return ret;
+}
+
+static int sunxi_msgbox_remove(struct platform_device *pdev)
+{
+	struct sunxi_msgbox *mbox = platform_get_drvdata(pdev);
+
+	mbox_controller_unregister(&mbox->controller);
+	clk_disable_unprepare(mbox->clk);
+
+	return 0;
+}
+
+static const struct of_device_id sunxi_msgbox_of_match[] = {
+	{ .compatible = "allwinner,sun6i-a31-msgbox", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, sunxi_msgbox_of_match);
+
+static struct platform_driver sunxi_msgbox_driver = {
+	.driver = {
+		.name = "sunxi-msgbox",
+		.of_match_table = sunxi_msgbox_of_match,
+	},
+	.probe  = sunxi_msgbox_probe,
+	.remove = sunxi_msgbox_remove,
+};
+module_platform_driver(sunxi_msgbox_driver);
+
+MODULE_AUTHOR("Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>");
+MODULE_DESCRIPTION("Allwinner sunxi Message Box");
+MODULE_LICENSE("GPL v2");
-- 
2.19.2
