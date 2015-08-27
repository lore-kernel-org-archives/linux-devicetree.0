From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] remoteproc: Supply controller driver for ST's Remote
 Processors
Date: Thu, 27 Aug 2015 07:45:39 +0100
Message-ID: <20150827064539.GD19409@x1>
References: <1440594483-29601-1-git-send-email-lee.jones@linaro.org>
 <1440594483-29601-3-git-send-email-lee.jones@linaro.org>
 <55DDF252.2010901@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55DDF252.2010901-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nathan Lynch <Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 26 Aug 2015, Nathan Lynch wrote:

> On 08/26/2015 08:08 AM, Lee Jones wrote:
> > --- /dev/null
> > +++ b/drivers/remoteproc/st_remoteproc.c
> > @@ -0,0 +1,300 @@
> > +/*
> > + * ST's Remote Processor Control Driver
> > + *
> > + * Copyright (C) 2015 STMicroelectronics - All Rights Reserved
> > + *
> > + * Author: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
>=20
> When submitting code you didn't write, I'd say it's better practice t=
o
> clearly indicate its provenance in the commit message.  E.g. somethin=
g
> like "Driver based on code authored by Ludovic Barre for ST".  And
> obtain signoffs etc if possible.
>=20
>=20
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License as publish=
ed by
> > + * the Free Software Foundation; either version 2 of the License.
>=20
> Please review the wording here.  It's unclear whether this is intende=
d
> to be v2-only or v2 or later.
>=20
>=20
> > +static int st_rproc_stop(struct rproc *rproc)
> > +{
> > +	struct st_rproc *st_rproc =3D rproc->priv;
> > +	int err =3D 0;
> > +
> > +	if (st_rproc->config->sw_reset) {
> > +		err =3D reset_control_assert(st_rproc->sw_reset);
> > +		if (err)
> > +			dev_warn(&rproc->dev, "Failed to assert S/W Reset\n");
> > +	}
> > +
> > +	if (st_rproc->config->pwr_reset) {
> > +		err =3D reset_control_assert(st_rproc->pwr_reset);
> > +		if (err)
> > +			dev_warn(&rproc->dev, "Failed to assert Power Reset\n");
> > +	}
> > +
> > +	clk_disable(st_rproc->clk);
> > +
> > +	return 0;
> > +}
>=20
> Seems like st_rproc_stop should propagate errors back to its caller
> instead of always returning 0.

Good points, will fix.

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
