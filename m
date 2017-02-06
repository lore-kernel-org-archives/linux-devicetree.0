From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 2/2] drm/panel: Add driver for sitronix ST7789V panel
Date: Mon, 6 Feb 2017 11:50:37 +0100
Message-ID: <20170206105037.sxtx5o3tocfqq7tq@lukather>
References: <cover.d573d2c400f1a8ef8d2696fda74f3e860bff50ca.1486115846.git-series.maxime.ripard@free-electrons.com>
 <8194211279dd2d1b1c2e88a3c17d154c356bbbc7.1486115846.git-series.maxime.ripard@free-electrons.com>
 <6c4db243-59fc-f7a4-96e0-8fefef253bac@tronnes.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1665316553=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <6c4db243-59fc-f7a4-96e0-8fefef253bac@tronnes.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org


--===============1665316553==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nzrb3uwqzk56fugn"
Content-Disposition: inline


--nzrb3uwqzk56fugn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Noralf,

On Fri, Feb 03, 2017 at 07:53:58PM +0100, Noralf Tr=F8nnes wrote:
>=20
> Den 03.02.2017 10.59, skrev Maxime Ripard:
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >   drivers/gpu/drm/panel/Kconfig                  |   4 +-
> >   drivers/gpu/drm/panel/Makefile                 |   1 +-
> >   drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 435 ++++++++++++++++=
++-
> >   3 files changed, 440 insertions(+), 0 deletions(-)
> >   create mode 100644 drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> >=20
> > diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kcon=
fig
> > index 62aba976e744..d07b996a07b8 100644
> > --- a/drivers/gpu/drm/panel/Kconfig
> > +++ b/drivers/gpu/drm/panel/Kconfig
> > @@ -81,4 +81,8 @@ config DRM_PANEL_SHARP_LS043T1LE01
> >   	  Say Y here if you want to enable support for Sharp LS043T1LE01 qHD
> >   	  (540x960) DSI panel as found on the Qualcomm APQ8074 Dragonboard
> > +config DRM_PANEL_SITRONIX_ST7789V
> > +	tristate "Sitronx ST7789V panel"
> > +	depends on OF && SPI
> > +
> >   endmenu
> > diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Mak=
efile
> > index a5c7ec0236e0..41b245d39984 100644
> > --- a/drivers/gpu/drm/panel/Makefile
> > +++ b/drivers/gpu/drm/panel/Makefile
> > @@ -6,3 +6,4 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) +=3D panel-samsu=
ng-ld9040.o
> >   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) +=3D panel-samsung-s6e8aa0.o
> >   obj-$(CONFIG_DRM_PANEL_SHARP_LQ101R1SX01) +=3D panel-sharp-lq101r1sx0=
1.o
> >   obj-$(CONFIG_DRM_PANEL_SHARP_LS043T1LE01) +=3D panel-sharp-ls043t1le0=
1.o
> > +obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) +=3D panel-sitronix-st7789v.o
> > diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/g=
pu/drm/panel/panel-sitronix-st7789v.c
> > new file mode 100644
> > index 000000000000..aab817b55aa6
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> > @@ -0,0 +1,435 @@
> > +/*
> > + * Copyright (C) 2017 Free Electrons
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License version
> > + * 2 as published by the Free Software Foundation.
> > + */
> > +
> > +#include <drm/drmP.h>
> > +#include <drm/drm_panel.h>
> > +
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/spi/spi.h>
> > +
> > +#define ST7789V_SLPIN_CMD		0x10
> > +
> > +#define ST7789V_SLPOUT_CMD		0x11
> > +
> > +#define ST7789V_INVON_CMD		0x21
> > +
> > +#define ST7789V_DISPOFF_CMD		0x28
> > +
> > +#define ST7789V_DISPON_CMD		0x29
> > +
> > +#define ST7789V_MADCTL_CMD		0x36
> > +
> > +#define ST7789V_COLMOD_CMD		0x3a
>=20
> You can use these from include/video/mipi_display.h:
>=20
>         MIPI_DCS_ENTER_SLEEP_MODE       =3D 0x10,
>         MIPI_DCS_EXIT_SLEEP_MODE        =3D 0x11,
>         MIPI_DCS_ENTER_INVERT_MODE      =3D 0x21,
>         MIPI_DCS_SET_DISPLAY_OFF        =3D 0x28,
>         MIPI_DCS_SET_DISPLAY_ON         =3D 0x29,
>         MIPI_DCS_SET_ADDRESS_MODE       =3D 0x36,
>         MIPI_DCS_SET_PIXEL_FORMAT       =3D 0x3A,

I don't know, that controller cannot do MIPI DSI at all, and we would
have to define all the other commands anyway.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--nzrb3uwqzk56fugn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYmFT5AAoJEBx+YmzsjxAgCm0P/j0KyDeYe0i32MbSubT4KGQO
uQXfY/MFTHHEW9dH3cP7kloFsanblDhNhw5YbLTeHPYE6eFToyKDElzZdJIEWvNI
9p704pBeyXU524lYKnapNRYfrPsdxrD2+JqiIPBcAmGpcfn+sF7LoBPVrBhHcIvf
RpN5yo8icPaqrcl9GxdtjnLz4s4jDydNWDPIcpIozkQ3ugNW8rYYcIlTeV6fWQIf
+qNoUvIYFS53VEk4DgjdMOdT2TySuslw8eviz8/Z3HthNSyjDb+TY1deygyI0/oU
gAZMsUOnBBlgWHz2fNIQ7DMGgKa4kqzj9opO+KDUcD2Ah1HdJLeAfNLA+Fv7tEvR
xUC8P1wFXM5RbKwdXHj7mvsAtFGRtJ/fxyBteCZL+y5DZWBjcoxreQ5L6+lw85m4
FAWrlRUba0r7ZWBtnZQVaPwJfH8KXv3yDOFJaMJCFOW91xPuUvRdKg6AibsAxUn3
Dom7VnZhpj+GdX/9bXp/+xSpguBdfXCI2P2HIbuCVqwwHc5rS7Uj+i27ZuVZen86
/m3POTYVr612QMLyfi//OD0JMhiPn2kt08D7KZi3r4d5Ljxo3BJWe9s9kCGpS3MG
nF8R5ST88ARiB4dHNPSjFxXo7Rq5R1P/pD6hphFWP3y2T812FHi2lzCtIJk8Kf1Y
50X1RENJh1dzjg3vgdQg
=qWsV
-----END PGP SIGNATURE-----

--nzrb3uwqzk56fugn--

--===============1665316553==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1665316553==--
