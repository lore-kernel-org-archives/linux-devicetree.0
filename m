From: Antoine =?iso-8859-1?Q?T=E9nart?=
	<antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 07/12] usb: chipidea: add a usb2 driver for ci13xxx
Date: Fri, 25 Jul 2014 10:07:38 +0200
Message-ID: <20140725080738.GA9756@kwain>
References: <1405499166-6726-1-git-send-email-antoine.tenart@free-electrons.com>
 <1405499166-6726-8-git-send-email-antoine.tenart@free-electrons.com>
 <20140725021853.GA11052@shlinux1.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140725021853.GA11052-KgLukfWpBlCctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Peter,

On Fri, Jul 25, 2014 at 10:18:54AM +0800, Peter Chen wrote:
> On Wed, Jul 16, 2014 at 10:26:01AM +0200, Antoine T=E9nart wrote:
> > Add a USB2 ChipIdea driver for ci13xxx, with optional PHY, clock
> > and DMA mask, to support USB2 ChipIdea controllers that don't need
> > specific functions.
>=20
> You may need to indicate it is a generic usb2 glue layer driver at bo=
th
> subject and context.

"USB2 ChipIdea driver for ci13xxx" seemed quite generic to me.

> >=20
> > Needed for the Marvell Berlin SoCs USB controllers.
>=20
> You can say it is tested at Marvell Berlin SoCs USB controllers.

Ok, I'll explicitly say it.

> > +
> > +static int ci_hdrc_usb2_dt_probe(struct device *dev,
> > +				    struct ci_hdrc_platform_data *ci_pdata,
> > +				    struct ci_hdrc_usb2_priv *priv)
> > +{
> > +	u32 mask;
> > +	int ret;
> > +
> > +	priv->clk =3D devm_clk_get(dev, NULL);
> > +	if (!IS_ERR(priv->clk)) {
> > +		ret =3D clk_prepare_enable(priv->clk);
> > +		if (ret) {
> > +			dev_err(dev, "failed to enable the clock: %d\n", ret);
> > +			return ret;
> > +		}
> > +	}
>=20
> The clk API may be needed for both DT and non-DT cases.

Yes sure, I'll move this to the ci_hdrc_usb2_probe().

>=20
> > +
> > +	ci_pdata->phy =3D of_phy_get(dev->of_node, 0);
> > +	if (IS_ERR(ci_pdata->phy)) {
> > +		if (PTR_ERR(ci_pdata->phy) =3D=3D -EPROBE_DEFER)
> > +			return -EPROBE_DEFER;
> > +
> > +		/* PHY is optional */
> > +		ci_pdata->phy =3D NULL;
> > +	}
> > +
> > +	if (of_property_read_u32(dev->of_node, "dma-mask", &mask))
> > +		priv->dma_mask =3D mask;
> > +
> According to discussion, you may not need dma_mask in driver any more=
,
> and use below API for both DT and non-DT case.
>=20
>         err =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32=
));
>         if (err)
>         	                handle error;

This would only be needed in non-dt cases, as the DMA mask is configure=
d
in drivers/of/platform.c otherwise.

Thanks!

Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
