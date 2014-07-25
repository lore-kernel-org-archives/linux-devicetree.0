From: Peter Chen <Peter.Chen@freescale.com>
Subject: RE: [PATCH v3 07/12] usb: chipidea: add a usb2 driver for ci13xxx
Date: Fri, 25 Jul 2014 08:22:40 +0000
Message-ID: <055ba866a1ac4d9385360bf51ab73f80@BN1PR0301MB0772.namprd03.prod.outlook.com>
References: <1405499166-6726-1-git-send-email-antoine.tenart@free-electrons.com>
 <1405499166-6726-8-git-send-email-antoine.tenart@free-electrons.com>
 <20140725021853.GA11052@shlinux1.ap.freescale.net>
 <20140725080738.GA9756@kwain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140725080738.GA9756@kwain>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?Antoine_T=E9nart?= <antoine.tenart@free-electrons.com>
Cc: "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>, "balbi@ti.com" <balbi@ti.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "alexandre.belloni@free-electrons.com" <alexandre.belloni@free-electrons.com>, "thomas.petazzoni@free-electrons.com" <thomas.petazzoni@free-electrons.com>, "zmxu@marvell.com" <zmxu@marvell.com>, "jszhang@marvell.com" <jszhang@marvell.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

=20
>=20
> On Fri, Jul 25, 2014 at 10:18:54AM +0800, Peter Chen wrote:
> > On Wed, Jul 16, 2014 at 10:26:01AM +0200, Antoine T=E9nart wrote:
> > > Add a USB2 ChipIdea driver for ci13xxx, with optional PHY, clock =
and
> > > DMA mask, to support USB2 ChipIdea controllers that don't need
> > > specific functions.
> >
> > You may need to indicate it is a generic usb2 glue layer driver at
> > both subject and context.
>=20
> "USB2 ChipIdea driver for ci13xxx" seemed quite generic to me.
>=20

ok

> > >
> > > Needed for the Marvell Berlin SoCs USB controllers.
> >
> > You can say it is tested at Marvell Berlin SoCs USB controllers.
>=20
> Ok, I'll explicitly say it.
>=20
> > > +
> > > +static int ci_hdrc_usb2_dt_probe(struct device *dev,
> > > +				    struct ci_hdrc_platform_data *ci_pdata,
> > > +				    struct ci_hdrc_usb2_priv *priv) {
> > > +	u32 mask;
> > > +	int ret;
> > > +
> > > +	priv->clk =3D devm_clk_get(dev, NULL);
> > > +	if (!IS_ERR(priv->clk)) {
> > > +		ret =3D clk_prepare_enable(priv->clk);
> > > +		if (ret) {
> > > +			dev_err(dev, "failed to enable the clock: %d\n", ret);
> > > +			return ret;
> > > +		}
> > > +	}
> >
> > The clk API may be needed for both DT and non-DT cases.
>=20
> Yes sure, I'll move this to the ci_hdrc_usb2_probe().
>=20
=20
> > > +
> > > +	if (of_property_read_u32(dev->of_node, "dma-mask", &mask))
> > > +		priv->dma_mask =3D mask;
> > > +
> > According to discussion, you may not need dma_mask in driver any mo=
re,
> > and use below API for both DT and non-DT case.
> >
> >         err =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(=
32));
> >         if (err)
> >         	                handle error;
>=20
> This would only be needed in non-dt cases, as the DMA mask is configu=
red
> in drivers/of/platform.c otherwise.
>=20
=20
Get it, thanks.

Peter
