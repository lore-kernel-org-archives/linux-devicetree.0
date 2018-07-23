From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v6 5/5] mailbox: Add support for i.MX7D messaging unit
Date: Mon, 23 Jul 2018 21:11:26 +0200
Message-ID: <20180723191126.cptpzzpl6vcd4rzk@pengutronix.de>
References: <20180722063923.30222-1-o.rempel@pengutronix.de>
 <20180722063923.30222-6-o.rempel@pengutronix.de>
 <1532366380.3163.109.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7213390923232677151=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1532366380.3163.109.camel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============7213390923232677151==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w4vrfcehep7qlaza"
Content-Disposition: inline


--w4vrfcehep7qlaza
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 23, 2018 at 07:19:40PM +0200, Lucas Stach wrote:
> Am Sonntag, den 22.07.2018, 08:39 +0200 schrieb Oleksij Rempel:
> > The Mailbox controller is able to send messages (up to 4 32 bit words)
> > between the endpoints.
> >=20
> > This driver was tested using the mailbox-test driver sending messages
> > between the Cortex-A7 and the Cortex-M4.
> >=20
> > > Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > ---
> > =A0drivers/mailbox/Kconfig=A0=A0=A0=A0=A0=A0=A0|=A0=A0=A06 +
> > =A0drivers/mailbox/Makefile=A0=A0=A0=A0=A0=A0|=A0=A0=A02 +
> > =A0drivers/mailbox/imx-mailbox.c | 273 ++++++++++++++++++++++++++++++++=
++
> > =A03 files changed, 281 insertions(+)
> > =A0create mode 100644 drivers/mailbox/imx-mailbox.c
> >=20
> > diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> > index a2bb27446dce..79060ddc380d 100644
> > --- a/drivers/mailbox/Kconfig
> > +++ b/drivers/mailbox/Kconfig
> > @@ -15,6 +15,12 @@ config ARM_MHU
> > > =A0	=A0=A0The controller has 3 mailbox channels, the last of which ca=
n be
> > > =A0	=A0=A0used in Secure mode only.
> > =A0
> > +config IMX_MBOX
> > > +	tristate "i.MX Mailbox"
> > > +	depends on ARCH_MXC || COMPILE_TEST
> > > +	help
> > > +	=A0=A0Mailbox implementation for i.MX Messaging Unit (MU).
> > +
> > =A0config PLATFORM_MHU
> > > =A0	tristate "Platform MHU Mailbox"
> > > =A0	depends on OF
> > diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> > index cc23c3a43fcd..ba2fe1b6dd62 100644
> > --- a/drivers/mailbox/Makefile
> > +++ b/drivers/mailbox/Makefile
> > > @@ -7,6 +7,8 @@ obj-$(CONFIG_MAILBOX_TEST)	+=3D mailbox-test.o
> > =A0
> > > =A0obj-$(CONFIG_ARM_MHU)	+=3D arm_mhu.o
> > =A0
> > > +obj-$(CONFIG_IMX_MBOX)	+=3D imx-mailbox.o
> > +
> > > =A0obj-$(CONFIG_PLATFORM_MHU)	+=3D platform_mhu.o
> > =A0
> > > =A0obj-$(CONFIG_PL320_MBOX)	+=3D pl320-ipc.o
> > diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbo=
x.c
> > new file mode 100644
> > index 000000000000..29cf2876db01
> > --- /dev/null
> > +++ b/drivers/mailbox/imx-mailbox.c
> > @@ -0,0 +1,273 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2018 Pengutronix, Oleksij Rempel <o.rempel@pengutroni=
x.de>
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mailbox_controller.h>
> > +#include <linux/module.h>
> > +#include <linux/of_device.h>
> > +
> > +/* Transmit Register */
> > > +#define IMX_MU_xTRn(x)		(0x00 + 4 * (x))
> > +/* Receive Register */
> > > +#define IMX_MU_xRRn(x)		(0x10 + 4 * (x))
> > +/* Status Register */
> > > +#define IMX_MU_xSR		0x20
> > > +#define IMX_MU_xSR_TEn(x)	BIT(20 + (3 - (x)))
> > > +#define IMX_MU_xSR_RFn(x)	BIT(24 + (3 - (x)))
> > > +#define IMX_MU_xSR_BRDIP	BIT(9)
> > +
> > +/* Control Register */
> > > +#define IMX_MU_xCR		0x24
> > +/* Transmit Interrupt Enable */
> > > +#define IMX_MU_xCR_TIEn(x)	BIT(20 + (3 - (x)))
> > +/* Receive Interrupt Enable */
> > > +#define IMX_MU_xCR_RIEn(x)	BIT(24 + (3 - (x)))
> > +
> > > +#define IMX_MU_CHANS	4u
> > +
> > +struct imx_mu_con_priv {
> > > > +	int			irq;
> > > > +	unsigned int		idx;
> > > > +	char			*irq_desc;
> > +};
> > +
> > +struct imx_mu_priv {
> > > > +	struct device		*dev;
> > > > +	void __iomem		*base;
> > +
> > > > +	struct mbox_controller	mbox;
> > > > +	struct mbox_chan	mbox_chans[IMX_MU_CHANS];
> > +
> > > +	struct imx_mu_con_priv=A0=A0con_priv[IMX_MU_CHANS];
> > > > +	struct clk		*clk;
> > +
> > > > +	bool			side_b;
> > +};
> > +
> > +static struct imx_mu_priv *to_imx_mu_priv(struct mbox_controller *mbox)
> > +{
> > > +	return container_of(mbox, struct imx_mu_priv, mbox);
> > +}
> > +
> > +static void imx_mu_write(struct imx_mu_priv *priv, u32 val, u32 offs)
> > +{
> > +	iowrite32(val, priv->base + offs);
>=20
> This driver is never going to be used on a device with port based IO,
> so iowrite doesn't make much sense here, just use writel. Same comment
> applies to the below read function.

I read this and do not understand what is actual problem:
https://lwn.net/Articles/102232/
"By default, these functions are simply wrappers around readb() and friends.
The explicit pointer type for the argument will generate warnings, however,
if a driver passes in an integer type."

So, is it wrong or not? If yes, why?

> Also, given that those functions are not really shortening the code in
> the user they may also be removed completely IMHO.

Is it subjective or technical issue?

> > +}
> > +
> > +static u32 imx_mu_read(struct imx_mu_priv *priv, u32 offs)
> > +{
> > > +	return ioread32(priv->base + offs);
> > +}
> > +
> > +static u32 imx_mu_rmw(struct imx_mu_priv *priv, u32 offs, u32 set, u32=
 clr)
> > +{
> > > +	u32 val;
> > +
> > > +	val =3D imx_mu_read(priv, offs);
> > > +	val &=3D ~clr;
> > > +	val |=3D set;
> > > +	imx_mu_write(priv, val, offs);
> > +
> > > +	return val;
> > +}
> > +
> > +static irqreturn_t imx_mu_isr(int irq, void *p)
> > +{
> > > +	struct mbox_chan *chan =3D p;
> > > +	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
> > > +	struct imx_mu_con_priv *cp =3D chan->con_priv;
> > > +	u32 val, ctrl, dat;
> > +
> > > +	ctrl =3D imx_mu_read(priv, IMX_MU_xCR);
> > > +	val =3D imx_mu_read(priv, IMX_MU_xSR);
> > > +	val &=3D IMX_MU_xSR_TEn(cp->idx) | IMX_MU_xSR_RFn(cp->idx);
> > > +	val &=3D ctrl & (IMX_MU_xCR_TIEn(cp->idx) | IMX_MU_xCR_RIEn(cp->idx=
));
> > > +	if (!val)
> > > +		return IRQ_NONE;
> > +
> > > +	if (val & IMX_MU_xSR_TEn(cp->idx)) {
> > > +		imx_mu_rmw(priv, IMX_MU_xCR, 0, IMX_MU_xCR_TIEn(cp->idx));
> > > +		mbox_chan_txdone(chan, 0);
> > > +	}
> > +
> > > +	if (val & IMX_MU_xSR_RFn(cp->idx)) {
> > > +		dat =3D imx_mu_read(priv, IMX_MU_xRRn(cp->idx));
> > > +		mbox_chan_received_data(chan, (void *)&dat);
> > > +	}
> > +
> > > +	return IRQ_HANDLED;
> > +}
> > +
> > +static bool imx_mu_last_tx_done(struct mbox_chan *chan)
> > +{
> > > +	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
> > > +	struct imx_mu_con_priv *cp =3D chan->con_priv;
> > > +	u32 val;
> > +
> > > +	val =3D imx_mu_read(priv, IMX_MU_xSR);
> > > +	/* test if transmit register is empty */
> > +	return val & IMX_MU_xSR_TEn(cp->idx);
>=20
> I guess
> "return imx_mu_read(priv, IMX_MU_xSR) & IMX_MU_xSR_TEn(cp->idx);" is
> shorter and equally well understood.

Same as before:
Is it subjective or technical issue?

> > +}
> > +
> > +static int imx_mu_send_data(struct mbox_chan *chan, void *data)
> > +{
> > > +	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
> > > +	struct imx_mu_con_priv *cp =3D chan->con_priv;
> > > +	u32 *arg =3D data;
> > +
> > > +	if (!imx_mu_last_tx_done(chan))
> > > +		return -EBUSY;
> > +
> > > +	imx_mu_write(priv, *arg, IMX_MU_xTRn(cp->idx));
> > +	imx_mu_rmw(priv, IMX_MU_xCR, IMX_MU_xSR_TEn(cp->idx), 0);
>=20
> In multi-channel mode this RMW cycle needs some kind of locking. As
> this register is also changed from the irq handler, this probably needs
> to be a irqsave spinlock.

ok.

> > +
> > > +	return 0;
> > +}
> > +
> > +static int imx_mu_startup(struct mbox_chan *chan)
> > +{
> > > +	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
> > > +	struct imx_mu_con_priv *cp =3D chan->con_priv;
> > > +	int ret;
> > +
> > > +	cp->irq_desc =3D devm_kasprintf(priv->dev, GFP_KERNEL, "imx_mu_chan=
[%i]",
> > > +				=A0=A0=A0=A0=A0=A0cp->idx);
> > > +	if (!cp->irq_desc)
> > > +		return -ENOMEM;
> > +
> > > +	ret =3D devm_request_irq(priv->dev, cp->irq, imx_mu_isr,
> > +			=A0=A0=A0=A0=A0=A0=A0IRQF_SHARED, cp->irq_desc, chan);
>=20
> Using the devm_ variants of those functions doesn't make sense when the
> resources aren't tied to the device lifetime. As you are tearing them
> down manually in imx_mu_shutdown anyways, just use the raw variants of
> those functions.

So, it is not a problem and there is no advantage. Right?

> > +	if (ret) {
> > > +		dev_err(priv->dev,
> > > +			"Unable to acquire IRQ %d\n", cp->irq);
> > > +		return ret;
> > > +	}
> > +
> > > +	imx_mu_rmw(priv, IMX_MU_xCR, IMX_MU_xCR_RIEn(cp->idx), 0);
> > +
> > > +	return 0;
> > +}
> > +
> > +static void imx_mu_shutdown(struct mbox_chan *chan)
> > +{
> > > +	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
> > > +	struct imx_mu_con_priv *cp =3D chan->con_priv;
> > +
> > > +	imx_mu_rmw(priv, IMX_MU_xCR, 0,
> > > +		=A0=A0=A0IMX_MU_xCR_TIEn(cp->idx) | IMX_MU_xCR_RIEn(cp->idx));
> > +
> > > +	devm_free_irq(priv->dev, cp->irq, chan);
> > > +	devm_kfree(priv->dev, cp->irq_desc);
> > +}
> > +
> > +static const struct mbox_chan_ops imx_mu_ops =3D {
> > > +	.send_data =3D imx_mu_send_data,
> > > +	.startup =3D imx_mu_startup,
> > > +	.shutdown =3D imx_mu_shutdown,
> > +};
> > +
> > +static void imx_mu_init_generic(struct imx_mu_priv *priv)
> > +{
> > > +	if (priv->side_b)
> > > +		return;
> > +
> > > +	/* Set default MU configuration */
> > > +	imx_mu_write(priv, 0, IMX_MU_xCR);
> > +}
> > +
> > +static int imx_mu_probe(struct platform_device *pdev)
> > +{
> > > +	struct device *dev =3D &pdev->dev;
> > > +	struct device_node *np =3D dev->of_node;
> > > +	struct resource *iomem;
> > > +	struct imx_mu_priv *priv;
> > > +	unsigned int i;
> > > +	int irq, ret;
> > +
> > > +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > > +	if (!priv)
> > > +		return -ENOMEM;
> > +
> > > +	priv->dev =3D dev;
> > +
> > > +	iomem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +	priv->base =3D devm_ioremap_resource(&pdev->dev, iomem);
> > > +	if (IS_ERR(priv->base))
> > > +		return PTR_ERR(priv->base);
> > +
> > > +	irq =3D platform_get_irq(pdev, 0);
> > > +	if (irq < 0)
> > > +		return irq;
> > +
> > > +	priv->clk =3D devm_clk_get(dev, NULL);
> > > +	if (IS_ERR(priv->clk)) {
> > > +		if (PTR_ERR(priv->clk) !=3D -ENOENT)
> > > +			return PTR_ERR(priv->clk);
> > +
> > > +		priv->clk =3D NULL;
> > > +	}
> > +
> > > +	ret =3D clk_prepare_enable(priv->clk);
> > > +	if (ret) {
> > > +		dev_err(dev, "Failed to enable clock\n");
> > > +		return ret;
> > > +	}
> > +
> > > +	for (i =3D 0; i < IMX_MU_CHANS; i++) {
> > > +		struct imx_mu_con_priv *cp =3D &priv->con_priv[i];
> > +
> > > +		cp->idx =3D i;
> > > +		cp->irq =3D irq;
> > > +		priv->mbox_chans[i].con_priv =3D cp;
> > > +	}
> > +
> > > +	if (of_property_read_bool(np, "fsl,mu-side-b"))
> > +		priv->side_b =3D true;
>=20
> No need for the if clause here. Just assign the return value from
> of_property_read_bool to priv->side_b.

Not against kernel style and not broken.
Is it subjective or technical issue? I assume I like more red color...

> > +
> > > +	priv->mbox.dev =3D dev;
> > > +	priv->mbox.ops =3D &imx_mu_ops;
> > > +	priv->mbox.chans =3D priv->mbox_chans;
> > > +	priv->mbox.num_chans =3D IMX_MU_CHANS;
> > > +	priv->mbox.txdone_irq =3D true;
> > +
> > > +	platform_set_drvdata(pdev, priv);
> > +
> > > +	imx_mu_init_generic(priv);
> > +
> > > +	return mbox_controller_register(&priv->mbox);
> > +}
> > +
> > +static int imx_mu_remove(struct platform_device *pdev)
> > +{
> > > +	struct imx_mu_priv *priv =3D platform_get_drvdata(pdev);
> > +
> > > +	mbox_controller_unregister(&priv->mbox);
> > > +	clk_disable_unprepare(priv->clk);
> > +
> > > +	return 0;
> > +}
> > +
> > +static const struct of_device_id imx_mu_dt_ids[] =3D {
> > > +	{ .compatible =3D "fsl,imx6sx-mu" },
> > > +	{ },
> > +};
> > +MODULE_DEVICE_TABLE(of, imx_mu_dt_ids);
> > +
> > +static struct platform_driver imx_mu_driver =3D {
> > > > +	.probe		=3D imx_mu_probe,
> > > > +	.remove		=3D imx_mu_remove,
> > > +	.driver =3D {
> > > > +		.name	=3D "imx_mu",
> > > +		.of_match_table =3D imx_mu_dt_ids,
> > > +	},
> > +};
> > +module_platform_driver(imx_mu_driver);
> > +
> > > +MODULE_AUTHOR("Oleksij Rempel <o.rempel@pengutronix.de>");
> > +MODULE_DESCRIPTION("Message Unit driver for i.MX");
> > +MODULE_LICENSE("GPL v2");
>=20

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--w4vrfcehep7qlaza
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAltWKFoACgkQdQOiSHVI
77Q6kAf+KxFr7nA47g5uaEnSJCfJ30XneCmnPcnH0cqS1rkp77YuiVcI5VVGF9nr
txfwdo1m30RBwuHfxFGWYeokSMPDffP63XMV/6cq8Gr20V4ZDrwNPqyXq2VQmx18
Bk3Fvr5J9jGXiJq6TsE7uT7hAjSfOqo1uTvwA/QPuajkhhJo943XVAGrf51A3Luc
x8B9/gG1s/74+tYZlWt5Gl9PTngpvZvyq7R64qOEwN2BIfOzDYZZV6IwxILNAwr3
ORWObkrnb+LtdQ3n/EhYT95nVpIbNixr2IW0pL55ghIB55vNSQs9P23UD7Jn9B2n
MGIceROrotHhhmVkIV40I5akoHLqAw==
=6X7Z
-----END PGP SIGNATURE-----

--w4vrfcehep7qlaza--


--===============7213390923232677151==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7213390923232677151==--
