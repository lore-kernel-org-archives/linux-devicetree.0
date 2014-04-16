From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/6] mfd: arizona: Factor out read of device tree GPIOs
Date: Wed, 16 Apr 2014 10:25:40 +0100
Message-ID: <20140416092540.GE4754@lee--X1>
References: <1396340845-24060-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1396340845-24060-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20140415102527.GD27091@lee--X1>
 <20140415130140.GA27294@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140415130140.GA27294-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> > > This patch factors out the reading of GPIOs for the Arizona devic=
es
> > > into a helper function.
> > >=20
> > > Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxiMEWR6Nv5iY@public.gmane.org=
m>
> > > ---
> > >  drivers/mfd/arizona-core.c       |   33 ++++++++++++++++++++++++=
---------
> > >  include/linux/mfd/arizona/core.h |    3 +++
> > >  2 files changed, 27 insertions(+), 9 deletions(-)

[...]

> > > +EXPORT_SYMBOL_GPL(arizona_of_get_named_gpio);
> > > +
> >=20
> > Are you sure you're going to use this externally?
> >=20
> > NB: I haven't looked at the remainder of the set yet.
>=20
> Yeah we move the ldoena gpio into the LDO driver, and later we
> will be adding a polarity GPIO into the extcon driver.

Okay, just checking.

> > >  static int arizona_of_get_core_pdata(struct arizona *arizona)
> > >  {
> > > +	struct arizona_pdata *pdata =3D &arizona->pdata;
> > >  	int ret, i;
> > > =20
> > > -	arizona->pdata.reset =3D of_get_named_gpio(arizona->dev->of_nod=
e,
> > > -						 "wlf,reset", 0);
> > > -	if (arizona->pdata.reset < 0)
> > > -		arizona->pdata.reset =3D 0;
> > > -
> > > -	arizona->pdata.ldoena =3D of_get_named_gpio(arizona->dev->of_no=
de,
> > > -						  "wlf,ldoena", 0);
> > > -	if (arizona->pdata.ldoena < 0)
> > > -		arizona->pdata.ldoena =3D 0;
> > > +	arizona_of_get_named_gpio(arizona, "wlf,reset", true, &pdata->r=
eset);
> > > +	arizona_of_get_named_gpio(arizona, "wlf,ldoena", true, &pdata->=
ldoena);
> >=20
> > I guess this pdata is populated by DT?
>=20
> Yeah that is correct, the Arizona driver populates the pdata from
> the DT then the rest of the driver just uses the pdata in both DT
> and pdata cases.

Sounds ugly when you put it like that, but I know that a _lot_ of
other drivers do the same thing.

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
