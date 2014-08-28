From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] watchdog: add driver for Ricoh RN5T618 watchdog
Date: Thu, 28 Aug 2014 08:19:46 +0100
Message-ID: <20140828071946.GF24579@lee--X1>
References: <1409091237-16722-1-git-send-email-b.galvani@gmail.com>
 <1409091237-16722-4-git-send-email-b.galvani@gmail.com>
 <20140827190135.GA18849@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140827190135.GA18849-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 27 Aug 2014, Guenter Roeck wrote:
> On Wed, Aug 27, 2014 at 12:13:56AM +0200, Beniamino Galvani wrote:
> > This adds a driver for the watchdog timer available in Ricoh RN5T61=
8
> > PMIC. The device supports a programmable expiration time of 1, 8, 3=
2
> > or 128 seconds.
> >=20
> > Signed-off-by: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  drivers/watchdog/Kconfig       |   11 +++
> >  drivers/watchdog/Makefile      |    1 +
> >  drivers/watchdog/rn5t618_wdt.c |  196 ++++++++++++++++++++++++++++=
++++++++++++
> >  include/linux/mfd/rn5t618.h    |    4 +
> >  4 files changed, 212 insertions(+)
> >  create mode 100644 drivers/watchdog/rn5t618_wdt.c

[...]

> > +++ b/drivers/watchdog/rn5t618_wdt.c
> > @@ -0,0 +1,196 @@

[...]

> > +static int rn5t618_wdt_set_timeout(struct watchdog_device *wdt_dev=
,
> > +				   unsigned int timeout)
> > +{
> > +	struct rn5t618_wdt *wdt =3D watchdog_get_drvdata(wdt_dev);
> > +	int ret, i;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(rn5t618_wdt_map); i++) {
> > +		if (rn5t618_wdt_map[i].time + 1 >=3D timeout)
> > +			break;
> > +	}
> > +
> > +	if (i =3D=3D ARRAY_SIZE(rn5t618_wdt_map))
> > +		ret =3D -EINVAL;
>=20
> Can you simplify this a bit ? If you use
>=20
> 	if (i =3D=3D ARRAY_SIZE(rn5t618_wdt_map))
> 		return -EINVAL;

This changes the semantics.

> > +	else
>=20
> You can drop this else statement.
>=20
> > +		ret =3D regmap_update_bits(wdt->rn5t618->regmap, RN5T618_WATCHDO=
G,
> > +					 RN5T618_WATCHDOG_WDOGTIM_M,
> > +					 rn5t618_wdt_map[i].reg_val);
> > +	if (!ret)
> > +		wdt_dev->timeout =3D rn5t618_wdt_map[i].time;

=2E.. Isn't this important?

> > +	return ret;
> > +}

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
