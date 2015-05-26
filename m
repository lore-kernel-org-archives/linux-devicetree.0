From: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 36/37] MIPS: ingenic: initial JZ4780 support
Date: Tue, 26 May 2015 08:25:48 +0100
Message-ID: <20150526072548.GS13811@NP-P-BURTON>
References: <1432480307-23789-1-git-send-email-paul.burton@imgtec.com>
 <1432480307-23789-37-git-send-email-paul.burton@imgtec.com>
 <5563019A.2050702@hauke-m.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ISKrrfpKsPiF35CV"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5563019A.2050702-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joshua Kinard <kumba-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Leonid Yegoshin <Leonid.Yegoshin-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Deng-Cheng Zhu <dengcheng.zhu-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Markos Chandras <markos.chandras-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Andreas Herrmann <andreas.herrmann-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--ISKrrfpKsPiF35CV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2015 at 01:03:54PM +0200, Hauke Mehrtens wrote:
> > diff --git a/arch/mips/jz4740/setup.c b/arch/mips/jz4740/setup.c
> > index 1bed3cb..510fc0d 100644
> > --- a/arch/mips/jz4740/setup.c
> > +++ b/arch/mips/jz4740/setup.c
> > @@ -83,6 +83,9 @@ arch_initcall(populate_machine);
> > =20
> >  const char *get_system_type(void)
> >  {
> > +	if (config_enabled(CONFIG_MACH_JZ4780))
> > +		return "JZ4780";
> > +
> >  	return "JZ4740";
> >  }
>=20
> Shouldn't this be provided by device tree, now it depends on your kernel
> config.

At some point, when the kernel is generic enough that one binary works
across multiple SoCs, yes definitely. Even better might be to detect it
at runtime. The kernel can currently only be built for a single SoC
though, so the code as-is works just fine & gets things working on the
CI20 without making an already lengthy patchset longer than it needs to
be.

> > diff --git a/arch/mips/jz4740/time.c b/arch/mips/jz4740/time.c
> > index 9172553..7ab47fe 100644
> > --- a/arch/mips/jz4740/time.c
> > +++ b/arch/mips/jz4740/time.c
> > @@ -102,7 +102,12 @@ static struct clock_event_device jz4740_clockevent=
 =3D {
> >  	.set_next_event =3D jz4740_clockevent_set_next,
> >  	.set_mode =3D jz4740_clockevent_set_mode,
> >  	.rating =3D 200,
> > +#ifdef CONFIG_MACH_JZ4740
> >  	.irq =3D JZ4740_IRQ_TCU0,
> > +#endif
> > +#ifdef CONFIG_MACH_JZ4780
> > +	.irq =3D JZ4780_IRQ_TCU2,
> > +#endif
> >  };
>=20
> same here.

Same response :)

Thanks,
    Paul

--ISKrrfpKsPiF35CV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVZB/3AAoJENzvn0paErs5TjQP/3jxzdlliT7qvgmEycMweXzh
h706mxyUxYhg2PzAzH7XMqFXGUShi/vy6RZkp0Sj1b8A4nnvpISQWXpC+V8mooAJ
xyxVuZFvVRdDMLcKD/Rw9a4k2kgsOdwkIaLSmqLUN+HAMbjCl5kzpvTGBrQh8Rwi
dwMl/hB/9rHf4dX4YbMXwgy2e3iBHoeNzfkCC5To5NC5yiDnO0dZRskMOlKS4LE2
lwgxMJcO7aMGs6Q/nRE8TocVYi+4GLRl9dnPSu4hag8PZokd91yF+ZmAuuXwa97u
stW5SHIcdABgPPbdsyXSUlbw4mguohY1ZQYXvKXrE11Acpl3FpWn74LUvx+I1qtg
2NNbIsj4Iklm0KltwouNdZuFMBM1AZweJ7vNmOaOWP3KV0fNA7WtxdBVGYCOtLvv
qsCJ3Y6t8i8s9JKJ1/7C4HKlDnSercgYG81nMprnPr16dcUtAyHchj/uPB0BBPgW
RInzipmWTMO8K7+0VrvU3gModh290VkuMgFtl9iIVT+wMhdqb+Y/BKThZTYC69OB
GxyIwVqB2xN2qVT1n6ZKRbSBL8JvQRhWxIANabpHR21IH9buzuRobjOrqq8pugtT
Z5nRoKDGG3iZoZbPLVA5JGZSmj1n+vQ4v3woI+084FVIVCa92eHRbLYDeFilCT5h
A6l+tI8FbTYEsnO+t7Sn
=Huf8
-----END PGP SIGNATURE-----

--ISKrrfpKsPiF35CV--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
