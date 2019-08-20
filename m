From: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 04/10] mailbox: sunxi-msgbox: Add a new
 mailbox driver
Date: Tue, 20 Aug 2019 08:07:53 -0500
Message-ID: <bc09e14c-1cf5-8124-fc34-c651b78577ce@sholland.org>
References: <20190820032311.6506-1-samuel@sholland.org>
 <20190820032311.6506-5-samuel@sholland.org>
 <20190820111825.2w55fleehrnon27u@core.my.home>
Reply-To: samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDA2PU6QWEARBLPB57VAKGQEFKZTYJA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190820111825.2w55fleehrnon27u-9v8tmBix7cb9zxVx7UNMDg@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 8/20/19 6:18 AM, Ond=C5=99ej Jirman wrote:
> Hi Samuel,
>=20
> On Mon, Aug 19, 2019 at 10:23:05PM -0500, Samuel Holland wrote:
>> Allwinner sun8i, sun9i, and sun50i SoCs contain a hardware message box
>> used for communication between the ARM CPUs and the ARISC management
>> coprocessor. The hardware contains 8 unidirectional 4-message FIFOs.
>>
>> Add a driver for it, so it can be used for SCPI or other communication
>> protocols.
>>
>> Signed-off-by: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
>> ---
>>  drivers/mailbox/Kconfig        |  10 +
>>  drivers/mailbox/Makefile       |   2 +
>>  drivers/mailbox/sunxi-msgbox.c | 323 +++++++++++++++++++++++++++++++++
>>  3 files changed, 335 insertions(+)
>>  create mode 100644 drivers/mailbox/sunxi-msgbox.c
>>
>> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
>> index ab4eb750bbdd..57d12936175e 100644
>> --- a/drivers/mailbox/Kconfig
>> +++ b/drivers/mailbox/Kconfig
>> @@ -227,4 +227,14 @@ config ZYNQMP_IPI_MBOX
>>  	  message to the IPI buffer and will access the IPI control
>>  	  registers to kick the other processor or enquire status.
>> =20
>> +config SUNXI_MSGBOX
>> +	tristate "Allwinner sunxi Message Box"
>> +	depends on ARCH_SUNXI || COMPILE_TEST
>> +	default ARCH_SUNXI
>> +	help
>> +	  Mailbox implementation for the hardware message box present in
>> +	  Allwinner sun8i, sun9i, and sun50i SoCs. The hardware message box is
>> +	  used for communication between the application CPUs and the power
>> +	  management coprocessor.
>> +
>>  endif
>> diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
>> index c22fad6f696b..bec2d50b0976 100644
>> --- a/drivers/mailbox/Makefile
>> +++ b/drivers/mailbox/Makefile
>> @@ -48,3 +48,5 @@ obj-$(CONFIG_STM32_IPCC) 	+=3D stm32-ipcc.o
>>  obj-$(CONFIG_MTK_CMDQ_MBOX)	+=3D mtk-cmdq-mailbox.o
>> =20
>>  obj-$(CONFIG_ZYNQMP_IPI_MBOX)	+=3D zynqmp-ipi-mailbox.o
>> +
>> +obj-$(CONFIG_SUNXI_MSGBOX)	+=3D sunxi-msgbox.o
>> diff --git a/drivers/mailbox/sunxi-msgbox.c b/drivers/mailbox/sunxi-msgb=
ox.c
>> new file mode 100644
>> index 000000000000..29a5101a5390
>> --- /dev/null
>> +++ b/drivers/mailbox/sunxi-msgbox.c
>> @@ -0,0 +1,323 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +//
>> +// Copyright (c) 2017-2019 Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
>> +
>> +#include <linux/bitops.h>
>> +#include <linux/clk.h>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/mailbox_controller.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/reset.h>
>> +#include <linux/spinlock.h>
>> +
>> +#define NUM_CHANS		8
>> +
>> +#define CTRL_REG(n)		(0x0000 + 0x4 * ((n) / 4))
>> +#define CTRL_RX(n)		BIT(0 + 8 * ((n) % 4))
>> +#define CTRL_TX(n)		BIT(4 + 8 * ((n) % 4))
>> +
>> +#define REMOTE_IRQ_EN_REG	0x0040
>> +#define REMOTE_IRQ_STAT_REG	0x0050
>> +#define LOCAL_IRQ_EN_REG	0x0060
>> +#define LOCAL_IRQ_STAT_REG	0x0070
>> +
>> +#define RX_IRQ(n)		BIT(0 + 2 * (n))
>> +#define RX_IRQ_MASK		0x5555
>> +#define TX_IRQ(n)		BIT(1 + 2 * (n))
>> +#define TX_IRQ_MASK		0xaaaa
>> +
>> +#define FIFO_STAT_REG(n)	(0x0100 + 0x4 * (n))
>> +#define FIFO_STAT_MASK		GENMASK(0, 0)
>> +
>> +#define MSG_STAT_REG(n)		(0x0140 + 0x4 * (n))
>> +#define MSG_STAT_MASK		GENMASK(2, 0)
>> +
>> +#define MSG_DATA_REG(n)		(0x0180 + 0x4 * (n))
>> +
>> +#define mbox_dbg(mbox, ...)	dev_dbg((mbox)->controller.dev, __VA_ARGS__=
)
>> +
>> +struct sunxi_msgbox {
>> +	struct mbox_controller controller;
>> +	struct clk *clk;
>> +	spinlock_t lock;
>> +	void __iomem *regs;
>> +};
>> +
>> +static bool sunxi_msgbox_last_tx_done(struct mbox_chan *chan);
>> +static bool sunxi_msgbox_peek_data(struct mbox_chan *chan);
>> +
>> +static inline int channel_number(struct mbox_chan *chan)
>> +{
>> +	return chan - chan->mbox->chans;
>> +}
>> +
>> +static inline struct sunxi_msgbox *channel_to_msgbox(struct mbox_chan *=
chan)
>> +{
>> +	return chan->con_priv;
>> +}
>> +
>> +static irqreturn_t sunxi_msgbox_irq(int irq, void *dev_id)
>> +{
>> +	struct sunxi_msgbox *mbox =3D dev_id;
>> +	uint32_t status;
>> +	int n;
>> +
>> +	/* Only examine channels that are currently enabled. */
>> +	status =3D readl(mbox->regs + LOCAL_IRQ_EN_REG) &
>> +		 readl(mbox->regs + LOCAL_IRQ_STAT_REG);
>> +
>> +	if (!(status & RX_IRQ_MASK))
>> +		return IRQ_NONE;
>> +
>> +	for (n =3D 0; n < NUM_CHANS; ++n) {
>> +		struct mbox_chan *chan =3D &mbox->controller.chans[n];
>> +
>> +		if (!(status & RX_IRQ(n)))
>> +			continue;
>> +
>> +		while (sunxi_msgbox_peek_data(chan)) {
>> +			uint32_t msg =3D readl(mbox->regs + MSG_DATA_REG(n));
>> +
>> +			mbox_dbg(mbox, "Channel %d received 0x%08x\n", n, msg);
>> +			mbox_chan_received_data(chan, &msg);
>> +		}
>> +
>> +		/* The IRQ can be cleared only once the FIFO is empty. */
>> +		writel(RX_IRQ(n), mbox->regs + LOCAL_IRQ_STAT_REG);
>> +	}
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int sunxi_msgbox_send_data(struct mbox_chan *chan, void *data)
>> +{
>> +	struct sunxi_msgbox *mbox =3D channel_to_msgbox(chan);
>> +	int n =3D channel_number(chan);
>> +	uint32_t msg =3D *(uint32_t *)data;
>> +
>> +	/* Using a channel backwards gets the hardware into a bad state. */
>> +	if (WARN_ON_ONCE(!(readl(mbox->regs + CTRL_REG(n)) & CTRL_TX(n))))
>> +		return 0;
>> +
>> +	/* We cannot post a new message if the FIFO is full. */
>> +	if (readl(mbox->regs + FIFO_STAT_REG(n)) & FIFO_STAT_MASK) {
>> +		mbox_dbg(mbox, "Channel %d busy sending 0x%08x\n", n, msg);
>> +		return -EBUSY;
>> +	}
>> +
>> +	writel(msg, mbox->regs + MSG_DATA_REG(n));
>> +	mbox_dbg(mbox, "Channel %d sent 0x%08x\n", n, msg);
>> +
>> +	return 0;
>> +}
>> +
>> +static int sunxi_msgbox_startup(struct mbox_chan *chan)
>> +{
>> +	struct sunxi_msgbox *mbox =3D channel_to_msgbox(chan);
>> +	int n =3D channel_number(chan);
>> +
>> +	/* The coprocessor is responsible for setting channel directions. */
>> +	if (readl(mbox->regs + CTRL_REG(n)) & CTRL_RX(n)) {
>> +		/* Flush the receive FIFO. */
>> +		while (sunxi_msgbox_peek_data(chan))
>> +			readl(mbox->regs + MSG_DATA_REG(n));
>> +		writel(RX_IRQ(n), mbox->regs + LOCAL_IRQ_STAT_REG);
>> +
>> +		/* Enable the receive IRQ. */
>> +		spin_lock(&mbox->lock);
>> +		writel(readl(mbox->regs + LOCAL_IRQ_EN_REG) | RX_IRQ(n),
>> +		       mbox->regs + LOCAL_IRQ_EN_REG);
>> +		spin_unlock(&mbox->lock);
>> +	}
>> +
>> +	mbox_dbg(mbox, "Channel %d startup complete\n", n);
>> +
>> +	return 0;
>> +}
>> +
>> +static void sunxi_msgbox_shutdown(struct mbox_chan *chan)
>> +{
>> +	struct sunxi_msgbox *mbox =3D channel_to_msgbox(chan);
>> +	int n =3D channel_number(chan);
>> +
>> +	if (readl(mbox->regs + CTRL_REG(n)) & CTRL_RX(n)) {
>> +		/* Disable the receive IRQ. */
>> +		spin_lock(&mbox->lock);
>> +		writel(readl(mbox->regs + LOCAL_IRQ_EN_REG) & ~RX_IRQ(n),
>> +		       mbox->regs + LOCAL_IRQ_EN_REG);
>> +		spin_unlock(&mbox->lock);
>> +
>> +		/* Attempt to flush the FIFO until the IRQ is cleared. */
>> +		do {
>> +			while (sunxi_msgbox_peek_data(chan))
>> +				readl(mbox->regs + MSG_DATA_REG(n));
>> +			writel(RX_IRQ(n), mbox->regs + LOCAL_IRQ_STAT_REG);
>> +		} while (readl(mbox->regs + LOCAL_IRQ_STAT_REG) & RX_IRQ(n));
>> +	}
>> +
>> +	mbox_dbg(mbox, "Channel %d shutdown complete\n", n);
>> +}
>> +
>> +static bool sunxi_msgbox_last_tx_done(struct mbox_chan *chan)
>> +{
>> +	struct sunxi_msgbox *mbox =3D channel_to_msgbox(chan);
>> +	int n =3D channel_number(chan);
>> +
>> +	/*
>> +	 * The hardware allows snooping on the remote user's IRQ statuses.
>> +	 * We consider a message to be acknowledged only once the receive IRQ
>> +	 * for that channel is cleared. Since the receive IRQ for a channel
>> +	 * cannot be cleared until the FIFO for that channel is empty, this
>> +	 * ensures that the message has actually been read. It also gives the
>> +	 * recipient an opportunity to perform minimal processing before
>> +	 * acknowledging the message.
>> +	 */
>> +	return !(readl(mbox->regs + REMOTE_IRQ_STAT_REG) & RX_IRQ(n));
>> +}
>> +
>> +static bool sunxi_msgbox_peek_data(struct mbox_chan *chan)
>> +{
>> +	struct sunxi_msgbox *mbox =3D channel_to_msgbox(chan);
>> +	int n =3D channel_number(chan);
>> +
>> +	return readl(mbox->regs + MSG_STAT_REG(n)) & MSG_STAT_MASK;
>> +}
>> +
>> +static const struct mbox_chan_ops sunxi_msgbox_chan_ops =3D {
>> +	.send_data    =3D sunxi_msgbox_send_data,
>> +	.startup      =3D sunxi_msgbox_startup,
>> +	.shutdown     =3D sunxi_msgbox_shutdown,
>> +	.last_tx_done =3D sunxi_msgbox_last_tx_done,
>> +	.peek_data    =3D sunxi_msgbox_peek_data,
>> +};
>> +
>> +static int sunxi_msgbox_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev =3D &pdev->dev;
>> +	struct mbox_chan *chans;
>> +	struct reset_control *reset;
>> +	struct resource *res;
>> +	struct sunxi_msgbox *mbox;
>> +	int i, ret;
>> +
>> +	mbox =3D devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
>> +	if (!mbox)
>> +		return -ENOMEM;
>> +
>> +	chans =3D devm_kcalloc(dev, NUM_CHANS, sizeof(*chans), GFP_KERNEL);
>> +	if (!chans)
>> +		return -ENOMEM;
>> +
>> +	for (i =3D 0; i < NUM_CHANS; ++i)
>> +		chans[i].con_priv =3D mbox;
>> +
>> +	mbox->clk =3D devm_clk_get(dev, NULL);
>> +	if (IS_ERR(mbox->clk)) {
>> +		ret =3D PTR_ERR(mbox->clk);
>> +		dev_err(dev, "Failed to get clock: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret =3D clk_prepare_enable(mbox->clk);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to enable clock: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	reset =3D devm_reset_control_get(dev, NULL);
>> +	if (IS_ERR(reset)) {
>> +		ret =3D PTR_ERR(reset);
>> +		dev_err(dev, "Failed to get reset control: %d\n", ret);
>> +		goto err_disable_unprepare;
>> +	}
>> +
>> +	ret =3D reset_control_deassert(reset);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to deassert reset: %d\n", ret);
>> +		goto err_disable_unprepare;
>> +	}
>=20
> You need to assert the reset again from now on, in error paths. devm
> will not do that for you.

I know, and that's intentional. This same message box device is used for AT=
F to
communicate with SCP firmware (on a different channel). This could be happe=
ning
on a different core while Linux is running. So Linux is not allowed to deas=
sert
the reset. clk_disable_unprepare() is only okay because the clock is marked=
 as
critical.

>> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	if (!res) {
>> +		ret =3D -ENODEV;
>> +		goto err_disable_unprepare;
>> +	}
>> +
>> +	mbox->regs =3D devm_ioremap_resource(&pdev->dev, res);
>> +	if (IS_ERR(mbox->regs)) {
>> +		ret =3D PTR_ERR(mbox->regs);
>> +		dev_err(dev, "Failed to map MMIO resource: %d\n", ret);
>> +		goto err_disable_unprepare;
>> +	}
>> +
>> +	/* Disable all IRQs for this end of the msgbox. */
>> +	writel(0, mbox->regs + LOCAL_IRQ_EN_REG);
>> +
>> +	ret =3D devm_request_irq(dev, irq_of_parse_and_map(dev->of_node, 0),
>> +			       sunxi_msgbox_irq, 0, dev_name(dev), mbox);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to register IRQ handler: %d\n", ret);
>> +		goto err_disable_unprepare;
>> +	}
>> +
>> +	mbox->controller.dev           =3D dev;
>> +	mbox->controller.ops           =3D &sunxi_msgbox_chan_ops;
>> +	mbox->controller.chans         =3D chans;
>> +	mbox->controller.num_chans     =3D NUM_CHANS;
>> +	mbox->controller.txdone_irq    =3D false;
>> +	mbox->controller.txdone_poll   =3D true;
>> +	mbox->controller.txpoll_period =3D 5;
>> +
>> +	spin_lock_init(&mbox->lock);
>> +	platform_set_drvdata(pdev, mbox);
>> +
>> +	ret =3D mbox_controller_register(&mbox->controller);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to register controller: %d\n", ret);
>> +		goto err_disable_unprepare;
>> +	}
>> +
>> +	return 0;
>> +
>> +err_disable_unprepare:
>> +	clk_disable_unprepare(mbox->clk);
>> +
>> +	return ret;
>> +}
>> +
>> +static int sunxi_msgbox_remove(struct platform_device *pdev)
>> +{
>> +	struct sunxi_msgbox *mbox =3D platform_get_drvdata(pdev);
>> +
>> +	mbox_controller_unregister(&mbox->controller);
>> +	clk_disable_unprepare(mbox->clk);
>=20
> Also, assert the reset here.

Same comment as above. This is intentional.

Thanks,
Samuel

>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id sunxi_msgbox_of_match[] =3D {
>> +	{ .compatible =3D "allwinner,sun6i-a31-msgbox", },
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(of, sunxi_msgbox_of_match);
>> +
>> +static struct platform_driver sunxi_msgbox_driver =3D {
>> +	.driver =3D {
>> +		.name =3D "sunxi-msgbox",
>> +		.of_match_table =3D sunxi_msgbox_of_match,
>> +	},
>> +	.probe  =3D sunxi_msgbox_probe,
>> +	.remove =3D sunxi_msgbox_remove,
>> +};
>> +module_platform_driver(sunxi_msgbox_driver);
>> +
>> +MODULE_AUTHOR("Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>");
>> +MODULE_DESCRIPTION("Allwinner sunxi Message Box");
>> +MODULE_LICENSE("GPL v2");
>> --=20
>> 2.21.0

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/bc09e14c-1cf5-8124-fc34-c651b78577ce%40sholland.org.
