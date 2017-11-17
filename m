From: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: Add the support for display5 equipped
 with Mitsubishi (800x480) display
Date: Fri, 17 Nov 2017 15:13:34 +0100
Message-ID: <20171117151334.041c4684@jawa>
References: <20171117102404.6678-1-lukma@denx.de>
        <20171117131047.GE25390@dragon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/F1p_Ww8cX4C6MBE_eVcsaro"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171117131047.GE25390@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Sig_/F1p_Ww8cX4C6MBE_eVcsaro
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

> On Fri, Nov 17, 2017 at 11:24:03AM +0100, Lukasz Majewski wrote:
> > This is the support for aa070mc01-ca1 Mitsubishi display.
> >=20
> > Signed-off-by: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/Makefile                         |  1 +
> >  .../imx6q-display5-mitsubishi-aa070-800x480.dts    | 51
> > ++++++++++++++++++++++ 2 files changed, 52 insertions(+)
> >  create mode 100644
> > arch/arm/boot/dts/imx6q-display5-mitsubishi-aa070-800x480.dts
> >=20
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index d9d0c82e7d20..10b3ad078dea 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -407,6 +407,7 @@ dtb-$(CONFIG_SOC_IMX6Q) +=3D \
> >  	imx6q-cm-fx6.dtb \
> >  	imx6q-cubox-i.dtb \
> >  	imx6q-dfi-fs700-m60.dtb \
> > +	imx6q-display5-mitsubishi-aa070-800x480.dtb \
> >  	imx6q-display5-tianma-tm070-1280x768.dtb \
> >  	imx6q-dmo-edmqmx6.dtb \
> >  	imx6q-evi.dtb \ =20
>=20
> <snip>
>=20
> > +#include "imx6q-display5.dtsi"
> > +
> > +&panel {
> > +	compatible =3D "mitsubishi,aa070mc01-ca1";
> > +}; =20
>=20
> How many DTB files do you want to add for this display5 board? =20

This is a single board, which can support panels which I've posted.

Those dtbs I do pack to u-boot' FIT image and don't need to worry that
some display is not working (after setting bootloader env variable).

> It's
> obvious no fun to maintain a bunch of DTB files for all the panels
> this board can support.

Please note that those files excessively use #include directive, and
there is not so much code added (the longest part is license and
comments).

>  Let's stop right here.

If I may ask - how shall I proceed? What would be your suggestion to
move on (dtb overlays) ?


>=20
> Shawn
>=20
> > +
> > +&ldb {
> > +	lvds0: lvds-channel@0 {
> > +		fsl,data-mapping =3D "spwg";
> > +		fsl,data-width =3D <24>;
> > +	};
> > +};
> > --=20
> > 2.11.0
> >  =20



Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd-ynQEQJNshbs@public.gmane.org

--Sig_/F1p_Ww8cX4C6MBE_eVcsaro
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAloO7o8ACgkQAR8vZIA0
zr3XjAgApq39ZzhUxZZZ7n/F6CK+QENoHjrkngH1IY+kTr3vzdiT4YeZK7p5A+86
5ezDJyYugzyhmT3TGHzxYFQCfK+w7vG6IpxqyD73DLVbR+y20qaTpQY/cnRwvp06
C7VvdCb3mVdH5sMm7JGBGmPCf4N0RUa/efVSTbEZ3Cy4Fj/tRYsWH1TXbiG7+bzt
p62RIpFknfCWO65T3haCqgs05ijM21VM9CHuXRJR5vffh3f/gI8g0Wyy6dHwJiGT
wOYNf9XiBaSzr9UOjjmDcJcs4vmJ8B9Xsad8nDJVMsMquyalKHRdepghaE2LLNhB
E7Xj2QFuogQYgJ2WcY7+oa1CZQhMew==
=i3YU
-----END PGP SIGNATURE-----

--Sig_/F1p_Ww8cX4C6MBE_eVcsaro--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
