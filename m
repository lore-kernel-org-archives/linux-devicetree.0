From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/4] remoteproc: Supply controller driver for ST's
 Remote Processors
Date: Tue, 1 Sep 2015 08:55:38 +0100
Message-ID: <20150901075538.GJ4796@x1>
References: <1440757911-9120-1-git-send-email-lee.jones@linaro.org>
 <1440757911-9120-4-git-send-email-lee.jones@linaro.org>
 <55E08B34.9080102@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55E08B34.9080102-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nathan Lynch <Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 28 Aug 2015, Nathan Lynch wrote:

> On 08/28/2015 05:31 AM, Lee Jones wrote:
> > diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfi=
g
> > index 28c711f..72e97d7 100644
> > --- a/drivers/remoteproc/Kconfig
> > +++ b/drivers/remoteproc/Kconfig
> > @@ -77,4 +77,13 @@ config DA8XX_REMOTEPROC
> >  	  It's safe to say n here if you're not interested in multimedia
> >  	  offloading.
> > =20
> > +config ST_REMOTEPROC
> > +	tristate "ST remoteproc support"
> > +	depends on ARCH_STI
> > +	select REMOTEPROC
> > +	help
> > +	  Say y here to support ST's adjunct processors via the remote
> > +	  processor framework.
> > +	  This can be either built-in or a loadable module.
> > +
>=20
> The code uses reset_control_* APIs, so this should depend on
> RESET_CONTROLLER, no?

There's no need to explicitly depend on RESET_CONTROLLER.

With !RESET_CONTROLLER the user is WARN()ed about using the reset_*
API.

> > +/*
> > + * ST's Remote Processor Control Driver
> > + *
> > + * Copyright (C) 2015 STMicroelectronics - All Rights Reserved
> > + *
> > + * Author: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License as publish=
ed by
> > + * the Free Software Foundation; either version 2, or (at your opt=
ion)
> > + * any later version.
> > + */
>=20
> OK, but:
>=20
> > +MODULE_LICENSE("GPL v2");
>=20
> These are not in agreement.  You want "GPL" for MODULE_LICENSE if you
> intend v2 or later.

Right, good spot.

I will clarify this with ST and make the necessary changes.

> > +static int st_rproc_stop(struct rproc *rproc)
> > +{
> > +	struct st_rproc *st_rproc =3D rproc->priv;
> > +	int ret, err =3D 0;
> > +
> > +	if (st_rproc->config->sw_reset) {
> > +		ret =3D reset_control_assert(st_rproc->sw_reset);
> > +		if (ret)
> > +			dev_err(&rproc->dev, "Failed to assert S/W Reset\n");
> > +	}
> > +
> > +	if (st_rproc->config->pwr_reset) {
> > +		err =3D reset_control_assert(st_rproc->pwr_reset);
> > +		if (err)
> > +			dev_err(&rproc->dev, "Failed to assert Power Reset\n");
> > +	}
> > +
> > +	clk_disable(st_rproc->clk);
> > +
> > +	return ret ?: err;
> > +}
>=20
> Sorry, but I think this is a stylistically inadequate response to my
> earlier comments.  At least name the status variables sw_ret and pwr_=
ret
> or something.  And it looks like ret could be used uninitialized.
>=20
> Also, do you want to unconditionally call clk_disable even if you've
> encountered errors?

Again this is something I need to clarify.  However, it doesn't strike
me as incorrect to gate the IP's clock just because the reset lines
haven't been successfully asserted.

Will check with the guys who know this IP and make suggested changes.

> > +static int st_rproc_start(struct rproc *rproc)
> > +{
> > +	struct st_rproc *st_rproc =3D rproc->priv;
> > +	int err;
> > +
> > +	regmap_update_bits(st_rproc->boot_base, st_rproc->boot_offset,
> > +			   st_rproc->config->bootaddr_mask, rproc->bootaddr);
> > +
> > +	err =3D clk_enable(st_rproc->clk);
> > +	if (err) {
> > +		dev_err(&rproc->dev, "Failed to enable clock\n");
> > +		return err;
> > +	}
> > +
> > +	if (st_rproc->config->sw_reset) {
> > +		err =3D reset_control_deassert(st_rproc->sw_reset);
> > +		if (err) {
> > +			dev_err(&rproc->dev, "Failed to deassert S/W Reset\n");
> > +			return err;
> > +		}
> > +	}
> > +
> > +	if (st_rproc->config->pwr_reset) {
> > +		err =3D reset_control_deassert(st_rproc->pwr_reset);
> > +		if (err) {
> > +			dev_err(&rproc->dev, "Failed to deassert Power Reset\n");
> > +			return err;
> > +		}
> > +	}
> > +
> > +	dev_info(&rproc->dev, "Started from 0x%x\n", rproc->bootaddr);
> > +
> > +	return 0;
> > +}
>=20
> Does this want to unwind any of its operations if it encounters a fai=
lure?

Sounds sensible.  Will adapt.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
