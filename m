From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] Adding Skyworks SKY81452 MFD driver
Date: Thu, 21 Aug 2014 12:19:40 +0100
Message-ID: <20140821111940.GX4266@lee--X1>
References: <1407488899-31065-1-git-send-email-jack.yoo@skyworksinc.com>
 <20140821094502.GV4266@lee--X1>
 <20140821095935.GB21848@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140821095935.GB21848@ulmo>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Gyungoh Yoo <gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, heiko.stuebner-HCpLIkUQxWGakBO8gow8eQ@public.gmane.org, florian.vaussard-p8DiymsW2f8@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, silvio.fricke-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 21 Aug 2014, Thierry Reding wrote:

> On Thu, Aug 21, 2014 at 10:45:02AM +0100, Lee Jones wrote:
> [...]
> > > diff --git a/drivers/mfd/sky81452.c b/drivers/mfd/sky81452.c
> [...]
> > > + * This program is free software; you can redistribute it and/or=
 modify it
> > > + * under the terms of the GNU General Public License as publishe=
d by the
> > > + * Free Software Foundation; either version 2, or (at your optio=
n) any
> > > + * later version.
> [...]
> > > +	{ }
> > > +};
> > > +MODULE_DEVICE_TABLE(i2c, sky81452_ids);
> > > +
> > > +#ifdef CONFIG_OF
> > > +static const struct of_device_id sky81452_of_match[] =3D {
> > > +	{ .compatible =3D "skyworks,sky81452", },
> > > +	{ }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, sky81452_of_match);
> > > +#endif
> >=20
> > You can drop the #differy the compiler should sort that out on the
> > back of of_match_ptr().
>=20
> It won't, unfortunately. If !OF, then of_match_ptr(x) will evaluate t=
o
> NULL, therefore sky81452_of_match will become unreferenced and cause =
the
> compiler to output a warning. I guess it could be made __maybe_unused=
,
> but I don't see that as much of an advantage over the #ifdef.

Yes, I suppose it would.  That's sad.

> > > +static struct i2c_driver sky81452_driver =3D {
> > > +	.driver =3D {
> > > +		.name =3D "sky81452",
> > > +		.of_match_table =3D of_match_ptr(sky81452_of_match),
> > > +	},
> > > +	.probe =3D sky81452_probe,
> > > +	.remove =3D sky81452_remove,
> > > +	.id_table =3D sky81452_ids,
> > > +};
> > > +
> > > +module_i2c_driver(sky81452_driver);
> > > +
> > > +MODULE_DESCRIPTION("Skyworks SKY81452 MFD driver");
> > > +MODULE_AUTHOR("Gyungoh Yoo <jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>");
> > > +MODULE_LICENSE("GPL");
> >=20
> > I think you want v2.
>=20
> The header comment says "... version 2, or (at your option) any later
> version.", so I think "GPL" is the right one here.

=46air enough.  Withdrawn.

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
