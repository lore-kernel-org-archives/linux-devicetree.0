From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] drm/panel: Add driver for sitronix ST7789V panel
Date: Mon, 6 Feb 2017 13:25:40 +0100
Message-ID: <20170206122540.GA32331@ulmo.ba.sec>
References: <cover.d573d2c400f1a8ef8d2696fda74f3e860bff50ca.1486115846.git-series.maxime.ripard@free-electrons.com>
 <8194211279dd2d1b1c2e88a3c17d154c356bbbc7.1486115846.git-series.maxime.ripard@free-electrons.com>
 <6c4db243-59fc-f7a4-96e0-8fefef253bac@tronnes.org>
 <20170206105037.sxtx5o3tocfqq7tq@lukather>
 <8096d309-d341-a3ba-8ddb-096a13967f64@tronnes.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8096d309-d341-a3ba-8ddb-096a13967f64-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 06, 2017 at 01:13:19PM +0100, Noralf Tr=C3=B8nnes wrote:
>=20
> Den 06.02.2017 11.50, skrev Maxime Ripard:
> > Hi Noralf,
> >=20
> > On Fri, Feb 03, 2017 at 07:53:58PM +0100, Noralf Tr=C3=B8nnes wrote:
> > > Den 03.02.2017 10.59, skrev Maxime Ripard:
> > > > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > > > ---
> > > >    drivers/gpu/drm/panel/Kconfig                  |   4 +-
> > > >    drivers/gpu/drm/panel/Makefile                 |   1 +-
> > > >    drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 435 +++++++++++=
+++++++-
> > > >    3 files changed, 440 insertions(+), 0 deletions(-)
> > > >    create mode 100644 drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> > > >=20
> > > > diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/=
Kconfig
> > > > index 62aba976e744..d07b996a07b8 100644
> > > > --- a/drivers/gpu/drm/panel/Kconfig
> > > > +++ b/drivers/gpu/drm/panel/Kconfig
> > > > @@ -81,4 +81,8 @@ config DRM_PANEL_SHARP_LS043T1LE01
> > > >    	  Say Y here if you want to enable support for Sharp LS043T1LE0=
1 qHD
> > > >    	  (540x960) DSI panel as found on the Qualcomm APQ8074 Dragonbo=
ard
> > > > +config DRM_PANEL_SITRONIX_ST7789V
> > > > +	tristate "Sitronx ST7789V panel"
> > > > +	depends on OF && SPI
> > > > +
> > > >    endmenu
> > > > diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel=
/Makefile
> > > > index a5c7ec0236e0..41b245d39984 100644
> > > > --- a/drivers/gpu/drm/panel/Makefile
> > > > +++ b/drivers/gpu/drm/panel/Makefile
> > > > @@ -6,3 +6,4 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) +=3D panel-s=
amsung-ld9040.o
> > > >    obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) +=3D panel-samsung-s6e8a=
a0.o
> > > >    obj-$(CONFIG_DRM_PANEL_SHARP_LQ101R1SX01) +=3D panel-sharp-lq101=
r1sx01.o
> > > >    obj-$(CONFIG_DRM_PANEL_SHARP_LS043T1LE01) +=3D panel-sharp-ls043=
t1le01.o
> > > > +obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) +=3D panel-sitronix-st778=
9v.o
> > > > diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drive=
rs/gpu/drm/panel/panel-sitronix-st7789v.c
> > > > new file mode 100644
> > > > index 000000000000..aab817b55aa6
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> > > > @@ -0,0 +1,435 @@
> > > > +/*
> > > > + * Copyright (C) 2017 Free Electrons
> > > > + *
> > > > + * This program is free software; you can redistribute it and/or
> > > > + * modify it under the terms of the GNU General Public License ver=
sion
> > > > + * 2 as published by the Free Software Foundation.
> > > > + */
> > > > +
> > > > +#include <drm/drmP.h>
> > > > +#include <drm/drm_panel.h>
> > > > +
> > > > +#include <linux/gpio/consumer.h>
> > > > +#include <linux/spi/spi.h>
> > > > +
> > > > +#define ST7789V_SLPIN_CMD		0x10
> > > > +
> > > > +#define ST7789V_SLPOUT_CMD		0x11
> > > > +
> > > > +#define ST7789V_INVON_CMD		0x21
> > > > +
> > > > +#define ST7789V_DISPOFF_CMD		0x28
> > > > +
> > > > +#define ST7789V_DISPON_CMD		0x29
> > > > +
> > > > +#define ST7789V_MADCTL_CMD		0x36
> > > > +
> > > > +#define ST7789V_COLMOD_CMD		0x3a
> > > You can use these from include/video/mipi_display.h:
> > >=20
> > >          MIPI_DCS_ENTER_SLEEP_MODE       =3D 0x10,
> > >          MIPI_DCS_EXIT_SLEEP_MODE        =3D 0x11,
> > >          MIPI_DCS_ENTER_INVERT_MODE      =3D 0x21,
> > >          MIPI_DCS_SET_DISPLAY_OFF        =3D 0x28,
> > >          MIPI_DCS_SET_DISPLAY_ON         =3D 0x29,
> > >          MIPI_DCS_SET_ADDRESS_MODE       =3D 0x36,
> > >          MIPI_DCS_SET_PIXEL_FORMAT       =3D 0x3A,
> > I don't know, that controller cannot do MIPI DSI at all, and we would
> > have to define all the other commands anyway.
>=20
> MIPI DCS commands can be sent over both Display Serial Interface (DSI)
> and in your case Display Bus Interface (DBI) (not quite sure if the
> Control Interface can be outside of DBI). So Display Command Set (DCS)
> is not specific to the interface, but to the controller.
>=20
> It's up to you if you want to use them though.

I think it makes sense to unify as much as possible to make it easier to
spot similarities between controllers. Also, we've already got these
definitions in one place, no use in duplicating them. They are obviously
used for the same purposes.

Thierry

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliYa0IACgkQ3SOs138+
s6ErYRAAoY3neGB1VBqsT2+v6nQbaQkqhGd96M/uJdAYPO55Ht7sUSy1i4v4ahqe
oW53NHDHIse3gdS3dDlmSDZgDd4D9f5vXTvT04ZPwwlESCz7lz7PsJEw+AUnXyVw
fAN9cUWaybVQ+hu+wHT9KArxNCcDmok4nYSQ8MhCOZoXAueHZIgMVtN8Ru0leFW9
vYAnsQrj8SsL4kY3SJYTtVYOcgMthbgEFiMz/r1EKOZ5aaEkLq9bEHS68uJVJ9p+
vilgFLPVft9w/UxtkEehZVib+0M/i0nC+yOkfPNdmmfEJn4CUpnqA7Rg/AC2cAGj
WsuXLOkHbWZ4NN+HbHUMXNIFfkkU03Y067cW/l8avB1qRbb+sICNyKkQiDDOFFX6
e12h/YGv2qR3Grgt2Zq33v+5G1Xa4iFlj92ZmFJYpg5J+8upXmW/7Y/AxXnNDbQ9
yIv/69cd3f1aXkXeDsda5ssrKkIDrOE6cEXZBM9bBuX6q/79zkjRvISLwfblvnwF
J6rWZUNmTCIXGvWa9jbgmGt5/K+ZKk1rELeyFogEwP/bYyUcifZ5dO0wGD5zOihf
3hZfTzQ8NLA4ro2qPNhmof/iHhpQwM/i1/aSEE83jtxDvFC+0e9ApDBz27V/kXyg
FcUij6FmgbdzaOoz/MofDA7sT7MkLJ7wtYtZaW2WwUsbHuxhhwM=
=EhwR
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
