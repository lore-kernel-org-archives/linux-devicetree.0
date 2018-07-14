From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v2 4/4] mailbox: Add support for i.MX7D messaging unit
Date: Sat, 14 Jul 2018 11:41:41 +0200
Message-ID: <20180714094141.j7l2byvmsiygg32g@pengutronix.de>
References: <20180615095107.24610-1-o.rempel@pengutronix.de>
 <20180615095107.24610-5-o.rempel@pengutronix.de>
 <AM0PR04MB421141DA6AD8E6EFB74A8D6E80590@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <20180714070227.ifmpc5vxpehqxp6x@pengutronix.de>
 <AM0PR04MB42113A7842135CDB53698510805F0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4312879183885088631=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AM0PR04MB42113A7842135CDB53698510805F0@AM0PR04MB4211.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "A.s. Dong" <aisheng.dong@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============4312879183885088631==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c5cuarrev3lpwppf"
Content-Disposition: inline


--c5cuarrev3lpwppf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 14, 2018 at 08:49:28AM +0000, A.s. Dong wrote:
> > -----Original Message-----
> > From: Oleksij Rempel [mailto:o.rempel@pengutronix.de]
> > Sent: Saturday, July 14, 2018 3:02 PM
> > To: A.s. Dong <aisheng.dong@nxp.com>
> > Cc: Shawn Guo <shawnguo@kernel.org>; Fabio Estevam
> > <fabio.estevam@nxp.com>; Rob Herring <robh+dt@kernel.org>; Mark
> > Rutland <mark.rutland@arm.com>; devicetree@vger.kernel.org; dl-linux-
> > imx <linux-imx@nxp.com>; linux-arm-kernel@lists.infradead.org;
> > kernel@pengutronix.de; linux-clk@vger.kernel.org
> > Subject: Re: [PATCH v2 4/4] mailbox: Add support for i.MX7D messaging u=
nit
> >=20
> > Hi,
> >=20
> > Beside, what is equivalent of name and family name is in your name?
> > I know it is different in China, so I won't to avoid confusion with:
> > "Hi $name," format :)
> >=20
>=20
> Dong is my family name. Either Hi A.S or Hi Dong is fine to me. :)
>=20
> > On Thu, Jul 12, 2018 at 11:28:16AM +0000, A.s. Dong wrote:
> > > Hi Oleksij,
> > >
> > > > -----Original Message-----
> > > > From: Oleksij Rempel [mailto:o.rempel@pengutronix.de]
> > > > Sent: Friday, June 15, 2018 5:51 PM
> > > > To: Shawn Guo <shawnguo@kernel.org>; Fabio Estevam
> > > > <fabio.estevam@nxp.com>; Rob Herring <robh+dt@kernel.org>; Mark
> > > > Rutland <mark.rutland@arm.com>; A.s. Dong <aisheng.dong@nxp.com>
> > > > Cc: Oleksij Rempel <o.rempel@pengutronix.de>;
> > kernel@pengutronix.de;
> > > > linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org;
> > > > linux- clk@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> > > > Subject: [PATCH v2 4/4] mailbox: Add support for i.MX7D messaging
> > > > unit
> > > >
> > > > The Mailbox controller is able to send messages (up to 4 32 bit
> > > > words) between the endpoints.
> > > >
> > >
> > > This is not correct according to current implementation as we abstract
> > > them into 4 virtual channels while each 'channel' can send only one w=
ord
> > one time.
> > > We probably need explain such limitation in commit message as well.
> > >
> > > I'm not strongly against this way. But it makes the controller lose
> > > the HW capability to send up to 4 words. I'd just like to know a bit
> > > history or reason why we decided to do that. Do we design it for spec=
ific
> > users case for M4?
> >=20
> > no, it is R&D.
> >=20
>=20
> Got it
>=20
> > > And are we assuming there will be no real users of multi words send
> > requirement?
> >=20
> > no. In my experience, each imaginable Brainfuck configuration will actu=
ally
> > happen some day in some design for $reasons.
> > So, no assumptions, just currently working configuration of my R&D proj=
ect.
> >=20
>=20
> I'm fine with as it is currently. We don't have to address all possible
> Issues in one time.
>=20
> > > > This driver was tested using the mailbox-test driver sending
> > > > messages between the Cortex-A7 and the Cortex-M4.
> > > >
> > > > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > > > ---
> > > >  drivers/mailbox/Kconfig       |   6 +
> > > >  drivers/mailbox/Makefile      |   2 +
> > > >  drivers/mailbox/imx-mailbox.c | 288
> > > > ++++++++++++++++++++++++++++++++++
> > > >  3 files changed, 296 insertions(+)
> > > >  create mode 100644 drivers/mailbox/imx-mailbox.c
> > > >
> > > > diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig index
> > > > a2bb27446dce..e1d2738a2e4c 100644
> > > > --- a/drivers/mailbox/Kconfig
> > > > +++ b/drivers/mailbox/Kconfig
> > > > @@ -15,6 +15,12 @@ config ARM_MHU
> > > >  	  The controller has 3 mailbox channels, the last of which can be
> > > >  	  used in Secure mode only.
> > > >
> > > > +config IMX_MBOX
> > > > +	tristate "iMX Mailbox"
> > > > +	depends on SOC_IMX7D || COMPILE_TEST
> > >
> > > Better change to ARCH_MXC as other platform does.
> >=20
> > ok
> >=20
> > > > +	help
> > > > +	  Mailbox implementation for iMX7D Messaging Unit (MU).
> > >
> > > Ditto
> >=20
> > ok
> >=20
> > > > +
> > > >  config PLATFORM_MHU
> > > >  	tristate "Platform MHU Mailbox"
> > > >  	depends on OF
> > > > diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> > > > index
> > > > cc23c3a43fcd..ba2fe1b6dd62 100644
> > > > --- a/drivers/mailbox/Makefile
> > > > +++ b/drivers/mailbox/Makefile
> > > > @@ -7,6 +7,8 @@ obj-$(CONFIG_MAILBOX_TEST)	+=3D mailbox-test.o
> > > >
> > > >  obj-$(CONFIG_ARM_MHU)	+=3D arm_mhu.o
> > > >
> > > > +obj-$(CONFIG_IMX_MBOX)	+=3D imx-mailbox.o
> > > > +
> > > >  obj-$(CONFIG_PLATFORM_MHU)	+=3D platform_mhu.o
> > > >
> > > >  obj-$(CONFIG_PL320_MBOX)	+=3D pl320-ipc.o
> > > > diff --git a/drivers/mailbox/imx-mailbox.c
> > > > b/drivers/mailbox/imx-mailbox.c new file mode 100644 index
> > > > 000000000000..e3f621cb1d30
> > > > --- /dev/null
> > > > +++ b/drivers/mailbox/imx-mailbox.c
> > > > @@ -0,0 +1,288 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * Copyright (c) 2018 Pengutronix, Oleksij Rempel
> > > > +<o.rempel@pengutronix.de>  */
> > > > +
> > > > +#include <linux/clk.h>
> > > > +#include <linux/interrupt.h>
> > > > +#include <linux/io.h>
> > > > +#include <linux/kernel.h>
> > > > +#include <linux/mailbox_controller.h> #include <linux/module.h>
> > > > +#include <linux/of_device.h>
> > > > +
> > > > +/* Transmit Register */
> > > > +#define IMX_MU_xTRn(x)		(0x00 + 4 * (x))
> > > > +/* Receive Register */
> > > > +#define IMX_MU_xRRn(x)		(0x10 + 4 * (x))
> > > > +/* Status Register */
> > > > +#define IMX_MU_xSR		0x20
> > > > +#define IMX_MU_xSR_TEn(x)	BIT(20 + (x))
> > > > +#define IMX_MU_xSR_RFn(x)	BIT(24 + (x))
> > > > +#define IMX_MU_xSR_BRDIP	BIT(9)
> > > > +
> > > > +/* Control Register */
> > > > +#define IMX_MU_xCR		0x24
> > > > +/* Transmit Interrupt Enable */
> > > > +#define IMX_MU_xCR_TIEn(x)	BIT(20 + (x))
> > > > +/* Receive Interrupt Enable */
> > > > +#define IMX_MU_xCR_RIEn(x)	BIT(24 + (x))
> > > > +
> > > > +#define IMX_MU_MAX_CHANS	4u
> > > > +
> > > > +struct imx_mu_priv;
> > > > +
> > > > +struct imx_mu_cfg {
> > > > +	unsigned int		chans;
> > > > +	void (*init_hw)(struct imx_mu_priv *priv); };
> > > > +
> > > > +struct imx_mu_con_priv {
> > > > +	int			irq;
> > > > +	unsigned int		bidx;
> > > > +	unsigned int		idx;
> > > > +};
> > > > +
> > > > +struct imx_mu_priv {
> > > > +	struct device		*dev;
> > > > +	const struct imx_mu_cfg	*dcfg;
> > > > +	void __iomem		*base;
> > > > +
> > > > +	struct mbox_controller	mbox;
> > > > +	struct mbox_chan	mbox_chans[IMX_MU_MAX_CHANS];
> > > > +
> > > > +	struct imx_mu_con_priv  con_priv[IMX_MU_MAX_CHANS];
> > > > +	struct clk		*clk;
> > > > +};
> > > > +
> > > > +static struct imx_mu_priv *to_imx_mu_priv(struct mbox_controller
> > > > +*mbox) {
> > > > +	return container_of(mbox, struct imx_mu_priv, mbox); }
> > > > +
> > > > +static void imx_mu_write(struct imx_mu_priv *priv, u32 val, u32 of=
fs) {
> > > > +	iowrite32(val, priv->base + offs); }
> > > > +
> > > > +static u32 imx_mu_read(struct imx_mu_priv *priv, u32 offs) {
> > > > +	return ioread32(priv->base + offs); }
> > > > +
> > > > +static u32 imx_mu_rmw(struct imx_mu_priv *priv, u32 offs, u32 set,
> > > > +u32
> > > > +clr) {
> > > > +	u32 val;
> > > > +
> > > > +	val =3D imx_mu_read(priv, offs);
> > > > +	val &=3D ~clr;
> > > > +	val |=3D set;
> > > > +	imx_mu_write(priv, val, offs);
> > > > +
> > > > +	return val;
> > > > +}
> > > > +
> > > > +static irqreturn_t imx_mu_isr(int irq, void *p) {
> > > > +	struct mbox_chan *chan =3D p;
> > > > +	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
> > > > +	struct imx_mu_con_priv *cp =3D chan->con_priv;
> > > > +
> > > > +	u32 val, dat;
> > > > +
> > > > +	val =3D imx_mu_read(priv, IMX_MU_xSR);
> > > > +	val &=3D IMX_MU_xSR_TEn(cp->bidx) | IMX_MU_xSR_RFn(cp->bidx);
> > > > +	if (!val)
> > > > +		return IRQ_NONE;
> > > > +
> > > > +	if (val & IMX_MU_xSR_TEn(cp->bidx)) {
> > > > +		imx_mu_rmw(priv, IMX_MU_xCR, 0, IMX_MU_xCR_TIEn(cp-
> > > > >bidx));
> > > > +		mbox_chan_txdone(chan, 0);
> > > > +	}
> > > > +
> > > > +	if (val & IMX_MU_xSR_RFn(cp->bidx)) {
> > > > +		dat =3D imx_mu_read(priv, IMX_MU_xRRn(cp->idx));
> > > > +		mbox_chan_received_data(chan, (void *)&dat);
> > > > +	}
> > > > +
> > > > +	return IRQ_HANDLED;
> > > > +}
> > > > +
> > > > +static bool imx_mu_last_tx_done(struct mbox_chan *chan) {
> > > > +	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
> > > > +	struct imx_mu_con_priv *cp =3D chan->con_priv;
> > > > +	u32 val;
> > > > +
> > > > +	val =3D imx_mu_read(priv, IMX_MU_xSR);
> > > > +	/* test if transmit register is empty */
> > > > +	return (!!(val & IMX_MU_xSR_TEn(cp->bidx))); }
> > > > +
> > > > +static int imx_mu_send_data(struct mbox_chan *chan, void *data) {
> > > > +	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
> > > > +	struct imx_mu_con_priv *cp =3D chan->con_priv;
> > > > +	u32 *arg =3D data;
> > > > +
> > > > +	if (!imx_mu_last_tx_done(chan))
> > > > +		return -EBUSY;
> > > > +
> > > > +	imx_mu_write(priv, *arg, IMX_MU_xTRn(cp->idx));
> > > > +	imx_mu_rmw(priv, IMX_MU_xCR, IMX_MU_xSR_TEn(cp->bidx), 0);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int imx_mu_startup(struct mbox_chan *chan) {
> > > > +	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
> > > > +	struct imx_mu_con_priv *cp =3D chan->con_priv;
> > > > +	int ret;
> > > > +
> > > > +	ret =3D request_irq(cp->irq, imx_mu_isr,
> > > > +			  IRQF_SHARED, "imx_mu_chan", chan);
> > >
> > > I guess no need to assign the irq for each cp as we have only one irq.
> >=20
> > all irq chip controller have one sink and number of source limited to
> > imagination or amount of bits in a register. May be we will need some d=
ay to
> > write a irqchip driver to make it work as chained irq controller.
> >=20
>=20
> We do need write an irqchip driver later because MU still supports another
> four general purpose interrupts which will be used by SCU firmware.
> But I don't think it's necessary to abstract them for TX/RX interrutps.
> This makes thing simple.

You just gave me one more reason to keep current version :)

> > So, I don't see any technical reason to not do it. Are you?
> >=20
> > > > +	if (ret) {
> > > > +		dev_err(chan->mbox->dev,
> > > > +			"Unable to acquire IRQ %d\n", cp->irq);
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	imx_mu_rmw(priv, IMX_MU_xCR, IMX_MU_xCR_RIEn(cp->bidx), 0);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static void imx_mu_shutdown(struct mbox_chan *chan) {
> > > > +	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
> > > > +	struct imx_mu_con_priv *cp =3D chan->con_priv;
> > > > +
> > > > +	imx_mu_rmw(priv, IMX_MU_xCR, 0,
> > > > +		   IMX_MU_xCR_TIEn(cp->bidx) | IMX_MU_xCR_RIEn(cp-
> > > > >bidx));
> > > > +
> > > > +	free_irq(cp->irq, chan);
> > > > +}
> > > > +
> > > > +static const struct mbox_chan_ops imx_mu_ops =3D {
> > > > +	.send_data =3D imx_mu_send_data,
> > > > +	.startup =3D imx_mu_startup,
> > > > +	.shutdown =3D imx_mu_shutdown,
> > > > +};
> > > > +
> > > > +static int imx_mu_probe(struct platform_device *pdev) {
> > > > +	struct device *dev =3D &pdev->dev;
> > > > +	struct resource *iomem;
> > > > +	struct imx_mu_priv *priv;
> > > > +	const struct imx_mu_cfg *dcfg;
> > > > +	unsigned int i, chans;
> > > > +	int irq, ret;
> > > > +
> > > > +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > > > +	if (!priv)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	dcfg =3D of_device_get_match_data(dev);
> > > > +	if (!dcfg)
> > > > +		return -EINVAL;
> > > > +
> > > > +	priv->dcfg =3D dcfg;
> > > > +	priv->dev =3D dev;
> > > > +
> > > > +	iomem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > > +	priv->base =3D devm_ioremap_resource(&pdev->dev, iomem);
> > > > +	if (IS_ERR(priv->base))
> > > > +		return PTR_ERR(priv->base);
> > > > +
> > > > +	irq =3D platform_get_irq(pdev, 0);
> > > > +	if (irq <=3D 0)
> > > > +		return irq < 0 ? irq : -EINVAL;
> > > > +
> > > > +	priv->clk =3D devm_clk_get(dev, NULL);
> > > > +	if (IS_ERR(priv->clk)) {
> > > > +		if (PTR_ERR(priv->clk) =3D=3D -ENOENT) {
> > > > +			priv->clk =3D NULL;
> > > > +		} else {
> > > > +			dev_err(dev, "Failed to get clock\n");
> > >
> > > I guess we may not need print it for DEFER_PROBE error case.
> >=20
> > ok.
> >=20
> > > > +			return PTR_ERR(priv->clk);
> > > > +		}
> > > > +	}
> > > > +
> > > > +	ret =3D clk_prepare_enable(priv->clk);
> > > > +	if (ret) {
> > > > +		dev_err(dev, "Failed to enable clock\n");
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	chans =3D min(dcfg->chans, IMX_MU_MAX_CHANS);
> > > > +	/* Initialize channel identifiers */
> > > > +	for (i =3D 0; i < chans; i++) {
> > > > +		struct imx_mu_con_priv *cp =3D &priv->con_priv[i];
> > > > +
> > > > +		cp->bidx =3D 3 - i;
> > >
> > > We may not need it if we improve the macro to calculate bidx by idx?
> >=20
> > Are all implementation of NXP MU have reversed bit order?
>=20
> AFAIK NXP MU library is used for all known platforms with MUs.
> So I guess yes.
>=20
> > Will it fit good for one channel implementation?
>=20
> If you see the SCU MU patches I sent, you will see I also need
> convert the channel index to channel mask. But here you're
> using bidx where SCU MU does have. So have a common
> channel index to mask macro may be good for both using.

ok

> >=20
> > > > +		cp->idx =3D i;
> > > > +		cp->irq =3D irq;
> > > > +		priv->mbox_chans[i].con_priv =3D cp;
> > > > +	}
> > > > +
> > > > +	priv->mbox.dev =3D dev;
> > > > +	priv->mbox.ops =3D &imx_mu_ops;
> > > > +	priv->mbox.chans =3D priv->mbox_chans;
> > > > +	priv->mbox.num_chans =3D chans;
> > > > +	priv->mbox.txdone_irq =3D true;
> > > > +
> > > > +	platform_set_drvdata(pdev, priv);
> > > > +
> > > > +	if (priv->dcfg->init_hw)
> > > > +		priv->dcfg->init_hw(priv);
> > > > +
> > > > +	return mbox_controller_register(&priv->mbox);
> > > > +}
> > > > +
> > > > +static int imx_mu_remove(struct platform_device *pdev) {
> > > > +	struct imx_mu_priv *priv =3D platform_get_drvdata(pdev);
> > > > +
> > > > +	mbox_controller_unregister(&priv->mbox);
> > > > +	clk_disable_unprepare(priv->clk);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +
> > > > +static void imx_mu_init_imx7d_a(struct imx_mu_priv *priv) {
> > > > +	/* Set default config */
> > > > +	imx_mu_write(priv, 0, IMX_MU_xCR);
> > >
> > > This will reset both MU Side A and B.
> > > So we may need make sure Side B is initialized after A?
> >=20
> > I assume it is implementation specific, as soon as it will be needed, w=
e may
> > introduce extra DT flag. No need to cover all possible cases if we don'=
t have
> > to.
> >=20
>=20
> We shouldn't reset SCU side, but SCU MU is not using it. So I'm okay.
> We just need to know the limitation later. Probably a note added here
> is better.

ok

> > > > +}
> > > > +
> > > > +static const struct imx_mu_cfg imx_mu_cfg_imx7d_a =3D {
> > > > +	.chans =3D IMX_MU_MAX_CHANS,
> > > > +	.init_hw =3D imx_mu_init_imx7d_a,
> > > > +};
> > > > +
> > > > +static const struct imx_mu_cfg imx_mu_cfg_imx7d_b =3D {
> > > > +	.chans =3D IMX_MU_MAX_CHANS,
> > > > +};
> > > > +
> > > > +static const struct of_device_id imx_mu_dt_ids[] =3D {
> > > > +	{ .compatible =3D "fsl,imx7s-mu-a", .data =3D &imx_mu_cfg_imx7d_a=
 },
> > > > +	{ .compatible =3D "fsl,imx7s-mu-b", .data =3D &imx_mu_cfg_imx7d_b=
 },
> > >
> > > I'm not sure whether we already have the decision to use fsl,<soc>-mu
> > > compatible String and use property to specify the mu side.
> > > Can you double check if we can switch to that way?
> >=20
> > ok.
> >=20
> > > And would you update the binding doc for M4 support according to the
> > > qxp mu one Which Is already signed by Rob's tag?
> >=20
> > ok.
> >=20
> > So, should I update my patch set including DT binding documentation pri=
or to
> > yours?
> >=20
>=20
> I guess you can pick that patch and send with yours. Once your part is
> reviewed ok (should be quick) then I can send the SCU part based on your
> Patch series.

Normally it is preferred to squash all history for newly created files.
I'll take your patch as base with minimal changes and send some comments
to Rob.

> Finally, I'm glad that we meet an agreement now. As we're trying to
> Speed up the mx8qxp support and targets to hit v4.19 kernel.
> So hopefully you could help send the updated patch series soon.
> Then I can follow up with my work. :)

I'll try to finish it and resend new version at Monday. Ok?

> Regards
> Dong Aisheng
>=20
> > If yes, can you please contact Rob to avoid confusions.
> >=20
> > --
> > Pengutronix e.K.                           |                           =
  |
> > Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
> > Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
> > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |
>=20

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--c5cuarrev3lpwppf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAltJxVIACgkQdQOiSHVI
77QrLAgAn+tM72M+Y1r3DjViOCnFuYQjcDtuRhQiZTAjHXrjTSGuv7jtIJIiVnKh
LX2yBIfAJpSDqr1Y4b8UXkTm7U1I1JVyxgZr1RiDERQuG8nrzGEXbcJeKfnh6chG
x62CjAO11zPHpYMTt5gl3wMUxuGcy5G6/Qx/uTIbdmntMd8yL59l9m9OSKTr5KH+
QkLf05atXDH11uOXVYozHUiIU21eoca20j1iRyi6MKOybsno1hFGx6JzVWODwLFu
TCoNYeXGHPtRRPzvaoIZkBmK2FrXKTNpXz0AVAHfFLklzSrS2riHdcuFrT211Jk4
fgu3i71kXbKw5X+DAu+DIk8VWoTkPA==
=wiK9
-----END PGP SIGNATURE-----

--c5cuarrev3lpwppf--


--===============4312879183885088631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4312879183885088631==--
