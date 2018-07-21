From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v4 4/4] mailbox: Add support for i.MX7D messaging unit
Date: Sat, 21 Jul 2018 13:40:09 +0200
Message-ID: <20180721114009.flgmof3pfimu6v5m@pengutronix.de>
References: <20180718071251.8857-1-o.rempel@pengutronix.de>
 <20180718071251.8857-5-o.rempel@pengutronix.de>
 <87a4624e-35a6-3529-90ce-71ea9fb1cf7e@mentor.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7011101345385945070=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <87a4624e-35a6-3529-90ce-71ea9fb1cf7e@mentor.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============7011101345385945070==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mo4fpdtk3hngxqkn"
Content-Disposition: inline


--mo4fpdtk3hngxqkn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Vladimir,

On Wed, Jul 18, 2018 at 10:57:42AM +0300, Vladimir Zapolskiy wrote:
> Hi Oleksij,
>=20
> On 07/18/2018 10:12 AM, Oleksij Rempel wrote:
> > The Mailbox controller is able to send messages (up to 4 32 bit words)
> > between the endpoints.
> >=20
> > This driver was tested using the mailbox-test driver sending messages
> > between the Cortex-A7 and the Cortex-M4.
> >=20
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > ---
> >  drivers/mailbox/Kconfig       |   6 +
> >  drivers/mailbox/Makefile      |   2 +
> >  drivers/mailbox/imx-mailbox.c | 300 ++++++++++++++++++++++++++++++++++
> >  3 files changed, 308 insertions(+)
> >  create mode 100644 drivers/mailbox/imx-mailbox.c
> >=20
> > diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> > index a2bb27446dce..79060ddc380d 100644
> > --- a/drivers/mailbox/Kconfig
> > +++ b/drivers/mailbox/Kconfig
> > @@ -15,6 +15,12 @@ config ARM_MHU
> >  	  The controller has 3 mailbox channels, the last of which can be
> >  	  used in Secure mode only.
> > =20
> > +config IMX_MBOX
> > +	tristate "i.MX Mailbox"
> > +	depends on ARCH_MXC || COMPILE_TEST
> > +	help
> > +	  Mailbox implementation for i.MX Messaging Unit (MU).
> > +
> >  config PLATFORM_MHU
> >  	tristate "Platform MHU Mailbox"
> >  	depends on OF
> > diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> > index cc23c3a43fcd..ba2fe1b6dd62 100644
> > --- a/drivers/mailbox/Makefile
> > +++ b/drivers/mailbox/Makefile
> > @@ -7,6 +7,8 @@ obj-$(CONFIG_MAILBOX_TEST)	+=3D mailbox-test.o
> > =20
> >  obj-$(CONFIG_ARM_MHU)	+=3D arm_mhu.o
> > =20
> > +obj-$(CONFIG_IMX_MBOX)	+=3D imx-mailbox.o
> > +
> >  obj-$(CONFIG_PLATFORM_MHU)	+=3D platform_mhu.o
> > =20
> >  obj-$(CONFIG_PL320_MBOX)	+=3D pl320-ipc.o
> > diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbo=
x.c
> > new file mode 100644
> > index 000000000000..ad8797127b1f
> > --- /dev/null
> > +++ b/drivers/mailbox/imx-mailbox.c
> > @@ -0,0 +1,300 @@
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
> > +#define IMX_MU_xTRn(x)		(0x00 + 4 * (x))
> > +/* Receive Register */
> > +#define IMX_MU_xRRn(x)		(0x10 + 4 * (x))
> > +/* Status Register */
> > +#define IMX_MU_xSR		0x20
> > +#define IMX_MU_xSR_TEn(x)	BIT(20 + (3 - (x)))
> > +#define IMX_MU_xSR_RFn(x)	BIT(24 + (3 - (x)))
> > +#define IMX_MU_xSR_BRDIP	BIT(9)
> > +
> > +/* Control Register */
> > +#define IMX_MU_xCR		0x24
> > +/* Transmit Interrupt Enable */
> > +#define IMX_MU_xCR_TIEn(x)	BIT(20 + (3 - (x)))
> > +/* Receive Interrupt Enable */
> > +#define IMX_MU_xCR_RIEn(x)	BIT(24 + (3 - (x)))
> > +
> > +#define IMX_MU_MAX_CHANS	4u
> > +
> > +struct imx_mu_priv;
> > +
> > +struct imx_mu_cfg {
> > +	unsigned int		chans;
>=20
> Basically this field is not used, everywhere in the driver its usage can
> be replaced by IMX_MU_MAX_CHANS, and it makes sense to rename the latter,
> and 'chan' local variable from .probe is also removed.

except of one channel implementation for SCU which should be added as
next step.
But for now, sure, I can remove it.

> I suggest that you add this field at the time when you to add controller
> specific data other than 'imx_mu_cfg_generic'.=20
>=20
> > +	void (*init_hw)(struct imx_mu_priv *priv);
> > +};
> > +
> > +struct imx_mu_con_priv {
> > +	int			irq;
> > +	unsigned int		idx;
> > +	char			*irq_desc;
> > +};
> > +
> > +struct imx_mu_priv {
> > +	struct device		*dev;
> > +	const struct imx_mu_cfg	*dcfg;
> > +	void __iomem		*base;
> > +
> > +	struct mbox_controller	mbox;
> > +	struct mbox_chan	mbox_chans[IMX_MU_MAX_CHANS];
> > +
> > +	struct imx_mu_con_priv  con_priv[IMX_MU_MAX_CHANS];
> > +	struct clk		*clk;
> > +
> > +	bool			side_b;
> > +};
> > +
> > +static struct imx_mu_priv *to_imx_mu_priv(struct mbox_controller *mbox)
> > +{
> > +	return container_of(mbox, struct imx_mu_priv, mbox);
> > +}
> > +
> > +static void imx_mu_write(struct imx_mu_priv *priv, u32 val, u32 offs)
> > +{
> > +	iowrite32(val, priv->base + offs);
> > +}
> > +
> > +static u32 imx_mu_read(struct imx_mu_priv *priv, u32 offs)
> > +{
> > +	return ioread32(priv->base + offs);
> > +}
> > +
> > +static u32 imx_mu_rmw(struct imx_mu_priv *priv, u32 offs, u32 set, u32=
 clr)
> > +{
> > +	u32 val;
> > +
> > +	val =3D imx_mu_read(priv, offs);
> > +	val &=3D ~clr;
> > +	val |=3D set;
> > +	imx_mu_write(priv, val, offs);
> > +
> > +	return val;
> > +}
> > +
> > +static irqreturn_t imx_mu_isr(int irq, void *p)
> > +{
> > +	struct mbox_chan *chan =3D p;
> > +	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
> > +	struct imx_mu_con_priv *cp =3D chan->con_priv;
> > +	u32 val, ctrl, dat;
> > +
> > +	ctrl =3D imx_mu_read(priv, IMX_MU_xCR);
> > +	val =3D imx_mu_read(priv, IMX_MU_xSR);
> > +	val &=3D IMX_MU_xSR_TEn(cp->idx) | IMX_MU_xSR_RFn(cp->idx);
> > +	val &=3D ctrl & (IMX_MU_xCR_TIEn(cp->idx) | IMX_MU_xCR_RIEn(cp->idx));
> > +	if (!val)
> > +		return IRQ_NONE;
> > +
> > +	if (val & IMX_MU_xSR_TEn(cp->idx)) {
> > +		imx_mu_rmw(priv, IMX_MU_xCR, 0, IMX_MU_xCR_TIEn(cp->idx));
> > +		mbox_chan_txdone(chan, 0);
> > +	}
> > +
> > +	if (val & IMX_MU_xSR_RFn(cp->idx)) {
> > +		dat =3D imx_mu_read(priv, IMX_MU_xRRn(cp->idx));
> > +		mbox_chan_received_data(chan, (void *)&dat);
> > +	}
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static bool imx_mu_last_tx_done(struct mbox_chan *chan)
> > +{
> > +	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
> > +	struct imx_mu_con_priv *cp =3D chan->con_priv;
> > +	u32 val;
> > +
> > +	val =3D imx_mu_read(priv, IMX_MU_xSR);
> > +	/* test if transmit register is empty */
> > +	return (!!(val & IMX_MU_xSR_TEn(cp->idx)));
>=20
> Because the function returns bool value, double negation is not needed.
>=20
> 	return val & IMX_MU_xSR_TEn(cp->idx);
>=20
> is good enough.

Here is objdump of two version build for cortex m4.
My version:
        return readl(addr);
   c:   f3bf 8f4f       dsb     sy
        return (!!(val & IMX_MU_xSR_TEn(cp->idx)));
  10:   6844            ldr     r4, [r0, #4]
        u32 *arg =3D data;

        if (!imx_mu_last_tx_done(chan))
  12:   f1c4 0517       rsb     r5, r4, #23
  16:   40ea            lsrs    r2, r5
  18:   07d2            lsls    r2, r2, #31
  1a:   d51b            bpl.n   54 <imx_mu_send_data+0x54>
        iowrite32(val, priv->base + offs);
  1c:   f853 2c08       ldr.w   r2, [r3, #-8]
                return -EBUSY;

Your version:
   c:   f3bf 8f4f       dsb     sy
        return val & IMX_MU_xSR_TEn(cp->idx);
  10:   6865            ldr     r5, [r4, #4]
        u32 *arg =3D data;

        if (!imx_mu_last_tx_done(chan))
  12:   2201            movs    r2, #1
  14:   f1c5 0017       rsb     r0, r5, #23
  18:   fa02 f000       lsl.w   r0, r2, r0
  1c:   4230            tst     r0, r6
  1e:   d019            beq.n   54 <imx_mu_send_data+0x54>
        iowrite32(val, priv->base + offs);
  20:   f853 0c08       ldr.w   r0, [r3, #-8]
                return -EBUSY;

Why your suggestion need more instructions?


> > +}
> > +
> > +static int imx_mu_send_data(struct mbox_chan *chan, void *data)
> > +{
> > +	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
> > +	struct imx_mu_con_priv *cp =3D chan->con_priv;
> > +	u32 *arg =3D data;
> > +
> > +	if (!imx_mu_last_tx_done(chan))
> > +		return -EBUSY;
> > +
> > +	imx_mu_write(priv, *arg, IMX_MU_xTRn(cp->idx));
> > +	imx_mu_rmw(priv, IMX_MU_xCR, IMX_MU_xSR_TEn(cp->idx), 0);
> > +
> > +	return 0;
> > +}
> > +
> > +static int imx_mu_startup(struct mbox_chan *chan)
> > +{
> > +	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
> > +	struct imx_mu_con_priv *cp =3D chan->con_priv;
> > +	int ret;
> > +
> > +	cp->irq_desc =3D devm_kasprintf(priv->dev, GFP_KERNEL, "imx_mu_chan[%=
i]",
> > +				      cp->idx);
> > +	if (!cp->irq_desc)
> > +		return -ENOMEM;
> > +
> > +	ret =3D devm_request_irq(priv->dev, cp->irq, imx_mu_isr,
> > +			       IRQF_SHARED, cp->irq_desc, chan);
> > +	if (ret) {
> > +		dev_err(priv->dev,
> > +			"Unable to acquire IRQ %d\n", cp->irq);
> > +		return ret;
> > +	}
> > +
> > +	imx_mu_rmw(priv, IMX_MU_xCR, IMX_MU_xCR_RIEn(cp->idx), 0);
> > +
> > +	return 0;
> > +}
> > +
> > +static void imx_mu_shutdown(struct mbox_chan *chan)
> > +{
> > +	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
> > +	struct imx_mu_con_priv *cp =3D chan->con_priv;
> > +
> > +	imx_mu_rmw(priv, IMX_MU_xCR, 0,
> > +		   IMX_MU_xCR_TIEn(cp->idx) | IMX_MU_xCR_RIEn(cp->idx));
> > +
> > +	devm_free_irq(priv->dev, cp->irq, chan);
> > +	devm_kfree(priv->dev, cp->irq_desc);
> > +}
> > +
> > +static const struct mbox_chan_ops imx_mu_ops =3D {
> > +	.send_data =3D imx_mu_send_data,
> > +	.startup =3D imx_mu_startup,
> > +	.shutdown =3D imx_mu_shutdown,
> > +};
> > +
> > +static int imx_mu_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev =3D &pdev->dev;
> > +	struct device_node *np =3D dev->of_node;
> > +	struct resource *iomem;
> > +	struct imx_mu_priv *priv;
> > +	const struct imx_mu_cfg *dcfg;
> > +	unsigned int i, chans;
> > +	int irq, ret;
> > +
> > +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +
> > +	dcfg =3D of_device_get_match_data(dev);
> > +	if (!dcfg)
> > +		return -EINVAL;
> > +
> > +	priv->dcfg =3D dcfg;
> > +	priv->dev =3D dev;
> > +
> > +	iomem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	priv->base =3D devm_ioremap_resource(&pdev->dev, iomem);
> > +	if (IS_ERR(priv->base))
> > +		return PTR_ERR(priv->base);
> > +
> > +	irq =3D platform_get_irq(pdev, 0);
> > +	if (irq <=3D 0)
> > +		return irq < 0 ? irq : -EINVAL;
>=20
> Please don't check or handle 'irq =3D=3D 0' case specially, it is dead co=
de.
>=20
> 	if (irq < 0)
> 		return irq;
>=20
> is good enough.

ok

> > +
> > +	priv->clk =3D devm_clk_get(dev, NULL);
> > +	if (IS_ERR(priv->clk)) {
> > +		if (PTR_ERR(priv->clk) !=3D -ENOENT)
> > +			return PTR_ERR(priv->clk);
> > +
> > +		priv->clk =3D NULL;
> > +	}
> > +
> > +	ret =3D clk_prepare_enable(priv->clk);
> > +	if (ret) {
> > +		dev_err(dev, "Failed to enable clock\n");
> > +		return ret;
> > +	}
> > +
> > +	chans =3D min(dcfg->chans, IMX_MU_MAX_CHANS);
> > +	/* Initialize channel identifiers */
>=20
> The comment above is trivial, please remove it.

ok

> > +	for (i =3D 0; i < chans; i++) {
> > +		struct imx_mu_con_priv *cp =3D &priv->con_priv[i];
> > +
> > +		cp->idx =3D i;
> > +		cp->irq =3D irq;
>=20
> I read it as a single irq for all channels.
>=20
> Why do you dynamically init more channel data imx_mu_startup() based on i=
rq value?
> Aren't 'cp->irq_desc' all equal? Isn't just a single devm_request_irq() i=
n .probe
> sufficient?

See previous discussion on v3

> > +		priv->mbox_chans[i].con_priv =3D cp;
> > +	}
> > +
> > +	if (of_property_read_bool(np, "fsl,mu-side-b"))
> > +		priv->side_b =3D true;
> > +
> > +	priv->mbox.dev =3D dev;
> > +	priv->mbox.ops =3D &imx_mu_ops;
> > +	priv->mbox.chans =3D priv->mbox_chans;
> > +	priv->mbox.num_chans =3D chans;
> > +	priv->mbox.txdone_irq =3D true;
> > +
> > +	platform_set_drvdata(pdev, priv);
> > +
> > +	if (priv->dcfg->init_hw)
> > +		priv->dcfg->init_hw(priv);
> > +
> > +	return mbox_controller_register(&priv->mbox);
> > +}
> > +
> > +static int imx_mu_remove(struct platform_device *pdev)
> > +{
> > +	struct imx_mu_priv *priv =3D platform_get_drvdata(pdev);
> > +
> > +	mbox_controller_unregister(&priv->mbox);
> > +	clk_disable_unprepare(priv->clk);
> > +
> > +	return 0;
> > +}
> > +
> > +static void imx_mu_init_generic(struct imx_mu_priv *priv)
> > +{
> > +	if (priv->side_b)
> > +		return;
> > +
> > +	/* Set default MU configuration */
> > +	imx_mu_write(priv, 0, IMX_MU_xCR);
> > +}
> > +
> > +static const struct imx_mu_cfg imx_mu_cfg_generic =3D {
> > +	.chans =3D IMX_MU_MAX_CHANS,
>=20
> Here IMX_MU_MAX_CHANS macro name is questionable, see my top comment.
> For clarity here 'MAX' is not expected, it shall be the exact controller
> specific value, something like s/MAX/NUM/ may be considered.

this MU provide 4+4 interrupts for TX/RX registers and 4 general purpose in=
terrupts
which can be reused for mailbox with shared memory or as irq controller.
The NXP implementation of SCU on i.MX8 is using one MU as one channel.

I'm not sure how many channels should be defined as it is endproduct
specific. So far MAX =3D=3D 4 until other already existing implementations =
go
upstream.

> > +	.init_hw =3D imx_mu_init_generic,
> > +};
> > +
> > +static const struct of_device_id imx_mu_dt_ids[] =3D {
> > +	{ .compatible =3D "fsl,imx6sx-mu", .data =3D &imx_mu_cfg_generic },
> > +	{ .compatible =3D "fsl,imx7d-mu", .data =3D &imx_mu_cfg_generic },
> > +	{ .compatible =3D "fsl,imx7s-mu", .data =3D &imx_mu_cfg_generic },
> > +	{ .compatible =3D "fsl,imx7ulp-mu", .data =3D &imx_mu_cfg_generic },
> > +	{ .compatible =3D "fsl,imx8qm-mu", .data =3D &imx_mu_cfg_generic },
> > +	{ .compatible =3D "fsl,imx8qxp-mu", .data =3D &imx_mu_cfg_generic },
>=20
> It sounds like the list will be constantly extending. Is there any chance
> to introduce just one generic compatible in the driver, and describe
> the whole set of compatibles in documentation section only?

Experience with iMX* IPs showed - it is worth do describe each IP in each
SoC with SoC specific name. See SPI, UART and other iMX driver. Why we
should make here an exception?

> > +	{ },
> > +};
> > +MODULE_DEVICE_TABLE(of, imx_mu_dt_ids);
> > +
> > +static struct platform_driver imx_mu_driver =3D {
> > +	.probe		=3D imx_mu_probe,
> > +	.remove		=3D imx_mu_remove,
> > +	.driver =3D {
> > +		.name	=3D "imx_mu",
> > +		.of_match_table =3D imx_mu_dt_ids,
> > +	},
> > +};
> > +module_platform_driver(imx_mu_driver);
> > +
> > +MODULE_AUTHOR("Oleksij Rempel <o.rempel@pengutronix.de>");
> > +MODULE_DESCRIPTION("Message Unit driver for i.MX");
> > +MODULE_LICENSE("GPL v2");
> >=20
>=20
> --
> Best wishes,
> Vladimir
>=20

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--mo4fpdtk3hngxqkn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAltTG5UACgkQdQOiSHVI
77RBPgf8DOU3NBE445weYL321TlX6yej0SjK30LSweereiiFq7MO1y1XFCGQumSu
zgcKPKI0qXltdRFj0a1YNrB1g5ZzX6xt7kMvXQjcihM/1XubxS4B/UXNWltdgcwt
xTDRYX6z0QnN8tUe2BgPawu+M7t+i8kcvF9YVjbDvVP5ddvapw8hpe4O0BB170wh
pgVaqJmDgo3liX8Pj8zqmtm9kF+5V6ALhzIx1RN9MMD2XNAgLYG3tupyVNCyOrUJ
t/B+Badb6ZbELhBHzls6p7YKZn4CtnqAIADASASXeP6+Ed7d09/wBw50oXyF7aw2
cTfWOmCQXoQv4l1fEjdlEYhxqDpMYg==
=MsCj
-----END PGP SIGNATURE-----

--mo4fpdtk3hngxqkn--


--===============7011101345385945070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7011101345385945070==--
