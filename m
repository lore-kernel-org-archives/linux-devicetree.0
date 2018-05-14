From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH v4 1/3] drm/panel: Add RGB666 variant of
 Innolux AT070TN90
Date: Mon, 14 May 2018 22:40:15 +0200
Message-ID: <abeac1ee792b8f063001c4c280ca7f0167ac59be.camel@paulk.fr>
References: <20180507220413.21990-1-contact@paulk.fr>
	 <20180509071226.ivh4s3wtczg2u7zw@flea>
	 <c8ab5f472881063b90abe9461933baf6ee325dcd.camel@paulk.fr>
	 <20180511085938.wjmdsdjfvdxd4shk@flea>
Reply-To: contact-W9ppeneeCTY@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-viS6L8A31GZMGGCmnqJq"
Return-path: <linux-sunxi+bncBC75HK6WUAEBBOPI47LQKGQEYC2RZ4I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180511085938.wjmdsdjfvdxd4shk@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-viS6L8A31GZMGGCmnqJq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 11 mai 2018 =C3=A0 10:59 +0200, Maxime Ripard a =C3=A9crit :
> On Wed, May 09, 2018 at 01:31:23PM +0200, Paul Kocialkowski wrote:
> > On Wed, 2018-05-09 at 09:12 +0200, Maxime Ripard wrote:
> > > On Tue, May 08, 2018 at 12:04:11AM +0200, Paul Kocialkowski wrote:
> > > > This adds timings for the RGB666 variant of the Innolux AT070TN90 p=
anel,
> > > > as found on the Ainol AW1 tablet.
> > > >=20
> > > > The panel also supports RGB888 output. When RGB666 mode is used ins=
tead,
> > > > the two extra lanes per component are grounded.
> > > >=20
> > > > In the future, it might become necessary to introduce a dedicated
> > > > device-tree property to specify the bus format to use instead of th=
e
> > > > default one for the panel. This will allow supporting different bus
> > > > formats for the same panel modes.
> > > >=20
> > > > Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> > > > ---
> > > >  drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++=
++
> > > >  1 file changed, 26 insertions(+)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm=
/panel/panel-simple.c
> > > > index cbf1ab404ee7..32e30d5a8f08 100644
> > > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > > @@ -1063,6 +1063,29 @@ static const struct panel_desc innolux_at043=
tn24 =3D {
> > > >  	.bus_flags =3D DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDG=
E,
> > > >  };
> > > > =20
> > > > +static const struct drm_display_mode innolux_at070tn90_mode =3D {
> > > > +	.clock =3D 40000,
> > > > +	.hdisplay =3D 800,
> > > > +	.hsync_start =3D 800 + 112,
> > > > +	.hsync_end =3D 800 + 112 + 1,
> > > > +	.htotal =3D 800 + 112 + 1 + 87,
> > > > +	.vdisplay =3D 480,
> > > > +	.vsync_start =3D 480 + 141,
> > > > +	.vsync_end =3D 480 + 141 + 1,
> > > > +	.vtotal =3D 480 + 141 + 1 + 38,
> > > > +	.vrefresh =3D 60,
> > > > +};
> > > > +
> > > > +static const struct panel_desc innolux_at070tn90 =3D {
> > > > +	.modes =3D &innolux_at070tn90_mode,
> > > > +	.num_modes =3D 1,
> > > > +	.size =3D {
> > > > +		.width =3D 154,
> > > > +		.height =3D 86,
> > > > +	},
> > > > +	.bus_format =3D MEDIA_BUS_FMT_RGB666_1X18,
> > > > +};
> > > > +
> > >=20
> > > I'm not really convinced this is the right approach. You said it
> > > yourself, the panel is using a 24-bits interface, and you just happen
> > > to have a tablet that routed it using a 18-bits interface instead.
> > >=20
> > > That doesn't belong in the driver, especially associated to the
> > > compatible, but where the routing is described: in the device
> > > tree. And given that the panel interface is a 24 bits panel, if we
> > > were to have a default, we should have this one, and not the one
> > > fitting your use case.
> >=20
> > I fully agree, this is why I suggested introducing a dedicated dt
> > property for selecting the bus format (in the commit message). I still
> > proposed this patch as a temporary solution, but I'm definitely willing
> > to craft a proper solution as well.
> >=20
> > Here is an initial proposition:
> > 1. Making bus_format an array in struct panel_desc and listing all the
> > relevant bus formats that the panel can support there;
>=20
> I'm not sure this is needed, the input format is always the same in
> your case, the panel will always take a 24 bits RGB value. What you
> want to change is the encoder output format (and I guess you want that
> to be meaningful to enable or not the dithering).

Isn't the panel format supposed to match what the encoder's output
should be aiming for? In my case, that would be RGB666, so the idea
would be specifying both MEDIA_BUS_FMT_RGB666_1X18 and
MEDIA_BUS_FMT_RGB888_1X24 in a list of supported bus formats for the
panel. This way, both my setup and RGB888 setups can be supported.

> > 2. Introducing an optional "bus-format" dt property that indicates whic=
h
> > bus format to use, and using the first index of the bus formats array i=
f
> > the property is not present;
>=20
> I guess the width would be enough, and that way we can take the
> bus-width format that is already defined (but used in the v4l2
> framework, not in DRM yet).

Well, we already have bus-format defines on the DRM side and it feels
like mapping these directly in device-tree would be more useful as a
description of the hardware than just having the bus width.

Cheers,

Paul

--=20
Developer of free digital technology and hardware support.

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--=-viS6L8A31GZMGGCmnqJq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAlr59C8ACgkQhP3B6o/u
lQw8rA/+O1nbscogyRVKWs96j8i+PkNZYCFqCTiffAvqmsTA5uIVMgEZnePoGEJn
3QQ+aBMcsNku7CeQSx3pnfjD87is4g1f/XCMHrtS1Q3R4zb6W9hUS5KqLxSClPd2
ehqOh9lgueEpYrvy2tvO2RE1J9kOIlvsexfdainyfXUrpeGLenTPMJ/81gtJIH2t
zoo7FKlNvwrv4POEivip/CpvK3GuzZRZ3VVXNOcjWjjyjlL698RRCSagclwwxpI4
k3EvEOS9CoV7lK69eXWqMTKAqn/WtTv8o4oJWxaGf83nafI0Sp8SQhDjmuuK/QLZ
eNfELyCB2rn543qAEjUV2oyjMF9MMHts+B3hbMnBHdZbDl5e19pe8wvPQlX8cjXa
ZZPcHgjVyzsVGyFUsodbPcMpZ8zCzzgHHVwlWtbg0NZWhqp6giSLwsWElYgY2uli
aqvOjEYZKyl7YKT47Y0qGK2zVd7t0TmVFp6Szin/pYcFo8rh6KLJdQZeBO9k3t7n
VWCyTmVMNHdL1eGTo+zTVtDFmX5UMEv4Muj54Ma3I5NkPYtc2criVExADk19bqRX
O6JkEsDKxNNEDHm2F8UjYg8zVyOUYL220dtRTQvUxuU8Bwpe77gfCSoVfM0hm9Vi
LnQEwRW28SmheCaxeR2yX1/NZFvOAXPypuvVlacS+HIVXIwi30A=
=q9Ob
-----END PGP SIGNATURE-----

--=-viS6L8A31GZMGGCmnqJq--
