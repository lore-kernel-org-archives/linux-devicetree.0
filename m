From: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 07/12] usb: chipidea: add a usb2 driver for ci13xxx
Date: Thu, 11 Sep 2014 17:31:19 +0200
Message-ID: <20140911153119.GA11275@kwain>
References: <1409730511-16101-1-git-send-email-antoine.tenart@free-electrons.com>
 <1409730511-16101-8-git-send-email-antoine.tenart@free-electrons.com>
 <20140911010709.GE3609@peterchendt>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140911010709.GE3609@peterchendt>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Peter,

On Thu, Sep 11, 2014 at 09:07:10AM +0800, Peter Chen wrote:
> On Wed, Sep 03, 2014 at 09:48:26AM +0200, Antoine Tenart wrote:
> > +
> > +static int ci_hdrc_usb2_dt_probe(struct device *dev,
> > +				 struct ci_hdrc_platform_data *ci_pdata)
> > +{
> > +	ci_pdata->phy =3D of_phy_get(dev->of_node, 0);
> > +	if (IS_ERR(ci_pdata->phy)) {
> > +		if (PTR_ERR(ci_pdata->phy) =3D=3D -EPROBE_DEFER)
> > +			return -EPROBE_DEFER;
> > +
> > +		/* PHY is optional */
> > +		ci_pdata->phy =3D NULL;
> > +	}
> > +
> > +	return 0;
> > +}
>=20
> You may also need to consider usb_phy case.

Don't we try using the generic PHY framework for new drivers?

Since there is no need for supporting an usb_phy case I don't think we
have to consider this case yet. And no doing so could encourage people
to add PHY drivers to the common PHY framework.

> > +
> > +	if (dev->of_node) {
> > +		ret =3D ci_hdrc_usb2_dt_probe(dev, ci_pdata);
> > +		if (ret)
> > +			return ret;
> > +	} else {
> > +		ret =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> > +		if (ret)
> > +			return ret;
> > +	}
>=20
> You may need to do clk_disable_unprepare for above error cases.

Sure, I'll fix that.

> > +
> > +	ci_pdata->name =3D dev_name(&pdev->dev);
> > +
> > +	priv->ci_pdev =3D ci_hdrc_add_device(dev, pdev->resource,
> > +					   pdev->num_resources, ci_pdata);
> > +	if (IS_ERR(priv->ci_pdev)) {
> > +		ret =3D PTR_ERR(priv->ci_pdev);
> > +		if (ret !=3D -EPROBE_DEFER)
> > +			dev_err(dev,
> > +				"failed to register ci_hdrc platform device: %d\n",
> > +				ret);
>=20
> Why you don't want the error message for deferral probe?

A driver can return an EPROBE_DEFER error and still probe successfully
later. This would be confusing to have this kind of error message in
this case. And when a driver returns -EPROBE_DEFER, there is an error
message already.

Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
