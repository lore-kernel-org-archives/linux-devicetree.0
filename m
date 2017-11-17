From: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: Add the support for display5 equipped
 with Mitsubishi (800x480) display
Date: Fri, 17 Nov 2017 16:03:47 +0100
Message-ID: <20171117160347.5c78be6e@jawa>
References: <20171117102404.6678-1-lukma@denx.de>
        <20171117131047.GE25390@dragon>
        <20171117151334.041c4684@jawa>
        <1510929383.8104.3.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/gKMACXka+++v4+8DCVgKczd"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1510929383.8104.3.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Sig_/gKMACXka+++v4+8DCVgKczd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Lucas,

> Am Freitag, den 17.11.2017, 15:13 +0100 schrieb Lukasz Majewski:
> > Hi Shawn,
> >  =20
> > > On Fri, Nov 17, 2017 at 11:24:03AM +0100, Lukasz Majewski wrote: =20
> > > > This is the support for aa070mc01-ca1 Mitsubishi display.
> > > >=20
> > > > Signed-off-by: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
> > > > ---
> > > > =C2=A0arch/arm/boot/dts/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A01 +
> > > > =C2=A0.../imx6q-display5-mitsubishi-aa070-800x480.dts=C2=A0=C2=A0=
=C2=A0=C2=A0| 51
> > > > ++++++++++++++++++++++ 2 files changed, 52 insertions(+)
> > > > =C2=A0create mode 100644
> > > > arch/arm/boot/dts/imx6q-display5-mitsubishi-aa070-800x480.dts
> > > >=20
> > > > diff --git a/arch/arm/boot/dts/Makefile
> > > > b/arch/arm/boot/dts/Makefile
> > > > index d9d0c82e7d20..10b3ad078dea 100644
> > > > --- a/arch/arm/boot/dts/Makefile
> > > > +++ b/arch/arm/boot/dts/Makefile
> > > > @@ -407,6 +407,7 @@ dtb-$(CONFIG_SOC_IMX6Q) +=3D \
> > > > =C2=A0	imx6q-cm-fx6.dtb \
> > > > =C2=A0	imx6q-cubox-i.dtb \
> > > > =C2=A0	imx6q-dfi-fs700-m60.dtb \
> > > > +	imx6q-display5-mitsubishi-aa070-800x480.dtb \
> > > > =C2=A0	imx6q-display5-tianma-tm070-1280x768.dtb \
> > > > =C2=A0	imx6q-dmo-edmqmx6.dtb \
> > > > =C2=A0	imx6q-evi.dtb \=C2=A0=C2=A0 =20
> > >=20
> > > <snip>
> > >  =20
> > > > +#include "imx6q-display5.dtsi"
> > > > +
> > > > +&panel {
> > > > +	compatible =3D "mitsubishi,aa070mc01-ca1";
> > > > +};=C2=A0=C2=A0 =20
> > >=20
> > > How many DTB files do you want to add for this display5 board?=C2=A0=
=C2=A0 =20
> >=20
> > This is a single board, which can support panels which I've posted.
> >=20
> > Those dtbs I do pack to u-boot' FIT image and don't need to worry
> > that
> > some display is not working (after setting bootloader env variable).
> >  =20
> > > It's
> > > obvious no fun to maintain a bunch of DTB files for all the panels
> > > this board can support. =20
> >=20
> > Please note that those files excessively use #include directive, and
> > there is not so much code added (the longest part is license and
> > comments).
> >  =20
> > > =C2=A0Let's stop right here. =20
> >=20
> > If I may ask - how shall I proceed? What would be your suggestion to
> > move on (dtb overlays) ? =20
>=20
> The solution we use for the ZII RDU1 and RDU2 boards is to have the
> bootloader patch in the correct panel compatible strings.=20

Do you mean adjusting the DTB accordingly in u-boot for each display -
change panel/compatible to new display name ?

> This is
> quite a bit simpler than using overlays and if you already have a
> environment variable for this it should be easy to do.
>=20
> > >=20
> > > Shawn
> > >  =20
> > > > +
> > > > +&ldb {
> > > > +	lvds0: lvds-channel@0 {
> > > > +		fsl,data-mapping =3D "spwg";
> > > > +		fsl,data-width =3D <24>;
> > > > +	};
> > > > +}; =20
>=20
> This isn't needed. The panel compatible implies the data mapping and
> bus width (at least if you properly filled in this information in the
> panel driver).
>=20
> Regards,
> Lucas



Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd-ynQEQJNshbs@public.gmane.org

--Sig_/gKMACXka+++v4+8DCVgKczd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAloO+lMACgkQAR8vZIA0
zr2t5ggAtiIOiR025C/lJZTIEWKAaR9uLlbi6+BGgAawC3/FzyBlLn1v2LCVlpWH
pOX23Y9hIYt+JiP0Fqo7Xr1n23114EtG8zv/Tt19hOjbeiOp466afk1LV59kL80I
24tkeCiag5fk/R+4FXNSoueHtsptPNW0GCt45Mq/dbd1p4z4Jzde2UKvXvPKubDw
J1QhmMPIzLhuRsqmhTK0U9QqTrqzu/xKtmDYlChBhLSkzQEcpC/c3WHAOz8J8LG9
NrZh5WTMbhYh+vfN5ax0pE+W5aaK5YiNpsD0lh9ofEXTy4JbMTLELjMaTnnVN6h4
zW7vElbVGvH+okqO251WRhrzK2rl8Q==
=vpf0
-----END PGP SIGNATURE-----

--Sig_/gKMACXka+++v4+8DCVgKczd--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
