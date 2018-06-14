From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v1 4/4] mailbox: Add support for i.MX7D messaging unit
Date: Thu, 14 Jun 2018 12:24:54 +0200
Message-ID: <20180614102454.yoqgr6xl7asmdinf@pengutronix.de>
References: <20180601065821.28234-1-o.rempel@pengutronix.de>
 <20180601065821.28234-5-o.rempel@pengutronix.de>
 <CAA+hA=RpoRXUK+jB18F4OeYE9PG73SDa_NLYeN5Q2G3B1bC-JA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4151401719429867505=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAA+hA=RpoRXUK+jB18F4OeYE9PG73SDa_NLYeN5Q2G3B1bC-JA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dong Aisheng <dongas86@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============4151401719429867505==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jay7zl3zrbrofiyc"
Content-Disposition: inline


--jay7zl3zrbrofiyc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 13, 2018 at 08:21:10PM +0800, Dong Aisheng wrote:
> Hi Oleksij,
>=20
> On Fri, Jun 1, 2018 at 2:58 PM, Oleksij Rempel <o.rempel@pengutronix.de> =
wrote:
> > The Mailbox controller is able to send messages (up to 4 32 bit words)
> > between the endpoints.
>=20
> Could we really be able to send up to 4 42bit words with this driver?
>=20
> It looks to me the current Mailbox framework is more designed for share m=
em
> transfer which does not fit i.MX MU well.

It is possible to set mbox_chan_txdone as soon as one of 4 regs is
written. Even more, it looks like, it should be possible to make a 8
channel mailbox on top of one MU. But i don't have any reason or use
case to implement and test it now.

> >
> > This driver was tested using the mailbox-test driver sending messages
> > between the Cortex-A7 and the Cortex-M4.
>=20
> Would you please provide a guide on how to test it quickly?
> I may want to give a test.

I use Linux on both side. The linux on M4 is booted over remoteproc.
Currently not all needed parts are upstream. I'll prepare a BSP to build
all components as soon as possible.

>=20
> >
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > ---
> >  drivers/mailbox/Kconfig       |   6 +
> >  drivers/mailbox/Makefile      |   2 +
> >  drivers/mailbox/imx-mailbox.c | 289 ++++++++++++++++++++++++++++++++++
> >  3 files changed, 297 insertions(+)
> >  create mode 100644 drivers/mailbox/imx-mailbox.c
> >
> > diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> > index a2bb27446dce..e1d2738a2e4c 100644
> > --- a/drivers/mailbox/Kconfig
> > +++ b/drivers/mailbox/Kconfig
> > @@ -15,6 +15,12 @@ config ARM_MHU
> >           The controller has 3 mailbox channels, the last of which can =
be
> >           used in Secure mode only.
> >
> > +config IMX_MBOX
> > +       tristate "iMX Mailbox"
> > +       depends on SOC_IMX7D || COMPILE_TEST
> > +       help
> > +         Mailbox implementation for iMX7D Messaging Unit (MU).
> > +
> >  config PLATFORM_MHU
> >         tristate "Platform MHU Mailbox"
> >         depends on OF
> > diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> > index cc23c3a43fcd..ba2fe1b6dd62 100644
> > --- a/drivers/mailbox/Makefile
> > +++ b/drivers/mailbox/Makefile
> > @@ -7,6 +7,8 @@ obj-$(CONFIG_MAILBOX_TEST)      +=3D mailbox-test.o
> >
> >  obj-$(CONFIG_ARM_MHU)  +=3D arm_mhu.o
> >
> > +obj-$(CONFIG_IMX_MBOX) +=3D imx-mailbox.o
> > +
> >  obj-$(CONFIG_PLATFORM_MHU)     +=3D platform_mhu.o
> >
> >  obj-$(CONFIG_PL320_MBOX)       +=3D pl320-ipc.o
> > diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbo=
x.c
> > new file mode 100644
> > index 000000000000..2bc9f11393b1
> > --- /dev/null
> > +++ b/drivers/mailbox/imx-mailbox.c
> > @@ -0,0 +1,289 @@
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
> > +#define IMX_MU_xTRn(x)         (0x00 + 4 * (x))
> > +/* Receive Register */
> > +#define IMX_MU_xRRn(x)         (0x10 + 4 * (x))
> > +/* Status Register */
> > +#define IMX_MU_xSR             0x20
> > +#define IMX_MU_xSR_TEn(x)      BIT(20 + (x))
> > +#define IMX_MU_xSR_RFn(x)      BIT(24 + (x))
> > +#define IMX_MU_xSR_BRDIP       BIT(9)
> > +
> > +/* Control Register */
> > +#define IMX_MU_xCR             0x24
> > +/* Transmit Interrupt Enable */
> > +#define IMX_MU_xCR_TIEn(x)     BIT(20 + (x))
> > +/* Receive Interrupt Enable */
> > +#define IMX_MU_xCR_RIEn(x)     BIT(24 + (x))
> > +
> > +#define IMX_MU_MAX_CHANS       4u
> > +
> > +struct imx_mu_priv;
> > +
> > +struct imx_mu_cfg {
> > +       unsigned int            chans;
> > +       void (*init_hw)(struct imx_mu_priv *priv);
> > +};
> > +
> > +struct imx_mu_con_priv {
> > +       int                     irq;
> > +       unsigned int            bidx;
> > +       unsigned int            idx;
> > +};
> > +
> > +struct imx_mu_priv {
> > +       struct device           *dev;
> > +       const struct imx_mu_cfg *dcfg;
> > +       void __iomem            *base;
> > +
> > +       struct mbox_controller  mbox;
> > +       struct mbox_chan        mbox_chans[IMX_MU_MAX_CHANS];
> > +
> > +       struct imx_mu_con_priv  con_priv[IMX_MU_MAX_CHANS];
> > +       struct clk              *clk;
> > +};
> > +
> > +static struct imx_mu_priv *to_imx_mu_priv(struct mbox_controller *mbox)
> > +{
> > +       return container_of(mbox, struct imx_mu_priv, mbox);
> > +}
> > +
> > +static void imx_mu_write(struct imx_mu_priv *priv, u32 val, u32 offs)
> > +{
> > +       iowrite32(val, priv->base + offs);
> > +}
> > +
> > +static u32 imx_mu_read(struct imx_mu_priv *priv, u32 offs)
> > +{
> > +       return ioread32(priv->base + offs);
> > +}
> > +
> > +static u32 imx_mu_rmw(struct imx_mu_priv *priv, u32 offs, u32 set, u32=
 clr)
> > +{
> > +       u32 val;
> > +
> > +       val =3D imx_mu_read(priv, offs);
> > +       val &=3D ~clr;
> > +       val |=3D set;
> > +       imx_mu_write(priv, val, offs);
> > +
> > +       return val;
> > +}
> > +
> > +static irqreturn_t imx_mu_isr(int irq, void *p)
> > +{
> > +       struct mbox_chan *chan =3D p;
> > +       struct imx_mu_con_priv *cp =3D chan->con_priv;
> > +       struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
>=20
> Please do in reversed order from long to short

done

> > +
> > +       u32 val, dat;
> > +
> > +       val =3D imx_mu_read(priv, IMX_MU_xSR);
> > +       val &=3D IMX_MU_xSR_TEn(cp->bidx) | IMX_MU_xSR_RFn(cp->bidx);
> > +       if (!val)
> > +               return IRQ_NONE;
> > +
> > +       if (val & IMX_MU_xSR_TEn(cp->bidx)) {
> > +               imx_mu_rmw(priv, IMX_MU_xCR, 0, IMX_MU_xCR_TIEn(cp->bid=
x));
> > +               mbox_chan_txdone(chan, 0);
> > +       }
> > +
> > +       if (val & IMX_MU_xSR_RFn(cp->bidx)) {
> > +               dat =3D imx_mu_read(priv, IMX_MU_xRRn(cp->idx));
> > +               mbox_chan_received_data(chan, (void *)&dat);
> > +       }
> > +
> > +       return IRQ_HANDLED;
> > +}
> > +
> > +static bool imx_mu_last_tx_done(struct mbox_chan *chan)
> > +{
> > +       struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
> > +       struct imx_mu_con_priv *cp =3D chan->con_priv;
> > +       u32 val;
> > +
> > +       val =3D imx_mu_read(priv, IMX_MU_xSR);
> > +       /* test if transmit register is empty */
> > +       return (!(val & IMX_MU_xSR_TEn(cp->bidx)));
> > +}
> > +
> > +static int imx_mu_send_data(struct mbox_chan *chan, void *data)
> > +{
> > +       struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
> > +       struct imx_mu_con_priv *cp =3D chan->con_priv;
> > +       u32 *arg =3D data;
> > +
> > +       if (imx_mu_last_tx_done(chan))
>=20
> return true for tx_done?
> Or maybe better imx_mu_is_busy?

I'll the name and rework the logic. For polling, if this will be ever
used.

> > +               return -EBUSY;
> > +
> > +       imx_mu_write(priv, *arg, IMX_MU_xTRn(cp->idx));
> > +       imx_mu_rmw(priv, IMX_MU_xCR, IMX_MU_xSR_TEn(cp->bidx), 0);
> > +
> > +       return 0;
> > +}
> > +
> > +static int imx_mu_startup(struct mbox_chan *chan)
> > +{
> > +       struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
> > +       struct imx_mu_con_priv *cp =3D chan->con_priv;
> > +       int ret;
> > +
> > +       ret =3D request_irq(cp->irq, imx_mu_isr,
> > +                         IRQF_SHARED, "imx_mu_chan", chan);
>=20
> This looks me to a bit strange as all virtual channels interrupts
> line actually are the same. And we request that same irq line
> repeatedly here with the same irq handler.

Why not? Code is simple and performance should not be noticeable.

> > +       if (ret) {
> > +               dev_err(chan->mbox->dev,
> > +                       "Unable to acquire IRQ %d\n", cp->irq);
> > +               return ret;
> > +       }
> > +
> > +       imx_mu_rmw(priv, IMX_MU_xCR, IMX_MU_xCR_RIEn(cp->bidx), 0);
> > +
> > +       return 0;
> > +}
> > +
> > +static void imx_mu_shutdown(struct mbox_chan *chan)
> > +{
> > +       struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
> > +       struct imx_mu_con_priv *cp =3D chan->con_priv;
> > +
> > +       imx_mu_rmw(priv, IMX_MU_xCR, 0,
> > +                  IMX_MU_xCR_TIEn(cp->bidx) | IMX_MU_xCR_RIEn(cp->bidx=
));
> > +
> > +       free_irq(cp->irq, chan);
> > +}
> > +
> > +static const struct mbox_chan_ops imx_mu_ops =3D {
> > +       .send_data =3D imx_mu_send_data,
> > +       .startup =3D imx_mu_startup,
> > +       .shutdown =3D imx_mu_shutdown,
> > +       .last_tx_done =3D imx_mu_last_tx_done,
>=20
> Do we really need this?
> Looking at the code, it seems .last_tx_done() is only called for polling =
mode.
> But what you set below is:
> priv->mbox.txdone_irq =3D true;
>=20
> Or am i missed something?

no. I'll remove it for now.

>=20
> > +};
> > +
> > +static int imx_mu_probe(struct platform_device *pdev)
> > +{
> > +       struct device *dev =3D &pdev->dev;
> > +       struct resource *iomem;
> > +       struct imx_mu_priv *priv;
> > +       const struct imx_mu_cfg *dcfg;
> > +       unsigned int i, chans;
> > +       int irq, ret;
> > +
> > +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +       if (!priv)
> > +               return -ENOMEM;
> > +
> > +       dcfg =3D of_device_get_match_data(dev);
> > +       if (!dcfg)
> > +               return -EINVAL;
> > +
> > +       priv->dcfg =3D dcfg;
> > +       priv->dev =3D dev;
> > +
> > +       iomem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +       priv->base =3D devm_ioremap_resource(&pdev->dev, iomem);
> > +       if (IS_ERR(priv->base))
> > +               return PTR_ERR(priv->base);
> > +
> > +       irq =3D platform_get_irq(pdev, 0);
> > +       if (irq <=3D 0)
> > +               return irq < 0 ? irq : -EINVAL;
>=20
> Is it possible =3D=3D 0?

no:
https://elixir.bootlin.com/linux/latest/source/drivers/base/platform.c#L86
or do I miss some thing?

> > +
> > +       priv->clk =3D devm_clk_get(dev, NULL);
> > +       if (IS_ERR(priv->clk)) {
> > +               if (PTR_ERR(priv->clk) =3D=3D -ENOENT) {
> > +                       priv->clk =3D NULL;
> > +               } else {
> > +                       dev_err(dev, "Failed to get clock\n");
>=20
> The line looks not be quite meaningful as it may be defer probe.

What is your suggestion?

> > +                       return PTR_ERR(priv->clk);
> > +               }
> > +       }
> > +
> > +       ret =3D clk_prepare_enable(priv->clk);
> > +       if (ret) {
> > +               dev_err(dev, "Failed to enable clock\n");
> > +               return ret;
> > +       }
> > +
> > +       chans =3D min(dcfg->chans, IMX_MU_MAX_CHANS);
> > +       /* Initialize channel identifiers */
> > +       for (i =3D 0; i < chans; i++) {
> > +               struct imx_mu_con_priv *cp =3D &priv->con_priv[i];
> > +
> > +               cp->bidx =3D 3 - i;
> > +               cp->idx =3D i;
> > +               cp->irq =3D irq;
> > +               priv->mbox_chans[i].con_priv =3D cp;
> > +       }
> > +
> > +       priv->mbox.dev =3D dev;
> > +       priv->mbox.ops =3D &imx_mu_ops;
> > +       priv->mbox.chans =3D priv->mbox_chans;
> > +       priv->mbox.num_chans =3D chans;
> > +       priv->mbox.txdone_irq =3D true;
> > +
> > +       platform_set_drvdata(pdev, priv);
> > +
> > +       if (priv->dcfg->init_hw)
> > +               priv->dcfg->init_hw(priv);
> > +
> > +       return mbox_controller_register(&priv->mbox);
> > +}
> > +
> > +static int imx_mu_remove(struct platform_device *pdev)
> > +{
> > +       struct imx_mu_priv *priv =3D platform_get_drvdata(pdev);
> > +
> > +       mbox_controller_unregister(&priv->mbox);
> > +       clk_disable_unprepare(priv->clk);
> > +
> > +       return 0;
> > +}
> > +
> > +
> > +static void imx_mu_init_imx7d_a(struct imx_mu_priv *priv)
> > +{
> > +       /* Set default config */
> > +       imx_mu_write(priv, 0, IMX_MU_xCR);
> > +}
> > +
> > +static const struct imx_mu_cfg imx_mu_cfg_imx7d_a =3D {
> > +       .chans =3D IMX_MU_MAX_CHANS,
> > +       .init_hw =3D imx_mu_init_imx7d_a,
> > +};
> > +
> > +static const struct imx_mu_cfg imx_mu_cfg_imx7d_b =3D {
> > +       .chans =3D IMX_MU_MAX_CHANS,
> > +};
> > +
> > +static const struct of_device_id imx_mu_dt_ids[] =3D {
> > +       { .compatible =3D "fsl,imx7s-mu-a", .data =3D &imx_mu_cfg_imx7d=
_a },
> > +       { .compatible =3D "fsl,imx7s-mu-b", .data =3D &imx_mu_cfg_imx7d=
_b },
> > +       { },
> > +};
> > +MODULE_DEVICE_TABLE(of, imx_mu_dt_ids);
> > +
> > +static struct platform_driver imx_mu_driver =3D {
> > +       .probe          =3D imx_mu_probe,
> > +       .remove         =3D imx_mu_remove,
> > +       .driver =3D {
> > +               .name   =3D "imx_mu",
> > +               .of_match_table =3D imx_mu_dt_ids,
> > +       },
> > +};
> > +module_platform_driver(imx_mu_driver);
> > +
> > +MODULE_AUTHOR("Oleksij Rempel <o.rempel@pengutronix.de>");
> > +MODULE_DESCRIPTION("Message Unit driver for i.MX7");
>=20
> s/i.MX7/i.MX

ok

> Regards
> Dong Aisheng

thank you for review.

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--jay7zl3zrbrofiyc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAlsiQnIACgkQdQOiSHVI
77QIwwf+JJk3/dn3DaIKequz8RMoGbgx6g5awhfE3ornEwHFdVCFp22/RkbaTe/6
fKWIKEjTMVrzCdBp5/FumuTLEPXEdB4BoSVV4PMFFDHM8iIRy2nFbiJoCIrZMtY5
qOvtjpkt2olu+BXjff+hjDZjKcosrbf7VBzY5z8tV7YrjM5fATvtm8w81PRjvL3B
qJLk8tAMYVbxcCtkHycCJUKT93Nq3Pbl0Sg54gQpKKYdnD3hTnqynUtqL1e7PhHl
L6oYXeMq1wtatSHAbmmXI+/w0fPMJbibulL8UdINtsB2nvnScFB5+x5qVas0VMoi
3aGxqR1Xrbr9DE8B4nXqYYmReHrdtg==
=O5TF
-----END PGP SIGNATURE-----

--jay7zl3zrbrofiyc--


--===============4151401719429867505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4151401719429867505==--
