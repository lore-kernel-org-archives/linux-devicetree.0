From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 0/3] drm/panel: Support Rocktech jh057n00900 DSI panel
Date: Wed, 3 Apr 2019 18:17:35 +0200
Message-ID: <20190403161735.GN5238@ulmo>
References: <cover.1554114302.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="b1ERR0FXR0PvNIRE"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1554114302.git.agx@sigxcpu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Johan Hovold <johan@kernel.org>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
List-Id: devicetree@vger.kernel.org


--b1ERR0FXR0PvNIRE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 01, 2019 at 12:35:32PM +0200, Guido G=C3=BCnther wrote:
> v4 fixes up the DT binding example and uses a wider cc list since I
> failed to extend that when touching more files.
>=20
> The panel is a 5.5" 720x1440 TFT LCD MIPI DSI panel with built in
> touchscreen and backlight as found in the Librem 5 devkit.
>=20
> These patches are against linux next as of 2019-03-22. v3 got acked by Sam
> Ravnborg:
>=20
>   https://lists.freedesktop.org/archives/dri-devel/2019-March/209326.html
>=20
> Changes from v4
> * As per review comments from Fabio Estevam
>   * Add missing unit name in dt binding docs
>=20
> Changes from v3
> * Forward to next-20190322
> * Add MAINTAINERS entry
>=20
> Changes from v2
> * As per review comments from Sam Ravnborg
>   * Lowercase sentinel
>   * Drop '_panel' postfix
>   * DRM_DEV_ logging instead of plain DRM_
> * Add Reviewed-by:
> * Add "panel-rocktech-" to the driver name following
>   the pattern from other drm panel drivers.
>=20
> Changes from v1
> * As per review comments from Sam Ravnborg
>   * Make SPDX-License-Identifier match MODULE_LICENSE
>   * Sort include files alphabetically
>   * Drop drmP.h and use individual includes
>   * Drop superfuous 'x' in mode printout on error path
>   * Allpixelson_set: Add proper space around '*'
>   * Drop superfluous put_device(&ctx->backlight->dev);
>   * Add /* Sentinel */ in jh057n_of_match
>   * Drop jh057n->enabled
>   * Drop drm_display_info_set_bus_formats
> * Kconfig: Depend on BACKLIGHT_CLASS_DEVICE which somehow got lost
> * Move jh057n_enable close to jh057n_disable
>=20
> Guido G=C3=BCnther (3):
>   dt-bindings: Add vendor prefix for ROCKTECH DISPLAYS LIMITED
>   dt-bindings: Add Rocktech jh057n00900 panel bindings
>   drm/panel: Add Rocktech jh057n00900 panel driver
>=20
>  .../display/panel/rocktech,jh057n00900.txt    |  18 +
>  .../devicetree/bindings/vendor-prefixes.txt   |   1 +
>  MAINTAINERS                                   |   6 +
>  drivers/gpu/drm/panel/Kconfig                 |  13 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../drm/panel/panel-rocktech-jh057n00900.c    | 386 ++++++++++++++++++
>  6 files changed, 425 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/rockt=
ech,jh057n00900.txt
>  create mode 100644 drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c

Applied, thanks.

checkpatch does complain about the dsi_generic_write_seq() macro
definition, because it uses flow control statements, but there are
already similar macros in other drivers, so I let this slide. We may
want to eventually come up with something better and then replace these
macros for the other drivers as well.

Thierry

--b1ERR0FXR0PvNIRE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyk3J8ACgkQ3SOs138+
s6GjLhAAnlOcK7nVdxLerCVp6PbKYuFKj+kqR4AJLx5c6Yt4kPZa5WOI2auCCMzb
eutooizMPZ4mmA7WVjk+hWlSoAysJBA9Os0WLqweEOCNG744AAavSDkg8tG8lBNM
/yGo9FmB19EMnjaYZyGyhJfLqR9j3LzIj1rFICtDAip9SDqS1elHR6C4TsykvF3O
Twk3UQP6Hs8oSq6ltaVJo2MV2bKx5Jq4pqs/JjNV62zsFX7tawJH9RdQYWqXeK/g
/39tOV+U/kyZTWHoQXuYJo4XaakbQxmf0wXHulaXke9mGjANMPvIRdz8rOFn7i4S
q7PrdSVkc/zhb2zI6QqUzwmcp/kDl0hYKB+QtxcOtSYCopBr2zAUen2tdRHburRK
UTJcLknCaMO1V9ALMGdwkFZoM/aHqbyq+Sb97cWkxMzZEg/Y/6OWj29R//jEHeOs
p26fsQIvUTiH+NrNA5J4wFX+alGcm+YuGF9kYdo9Hu7WfK+8r0tDC2823klwC9lc
QBLTb4DrWAk+u0Lxu3KDNAaj7J1GGWFtMUx6zdZhRm+hJE4bcJH266gPhZ7XE4Sw
vWbfF6+9Izj5EUAM8p1/W9wRgNkg+8xASjiaFKpfa++HZXnkSJ2GKcSgxHWOdEks
AsoSbXg92quaf7DhctKysF9dOVKfEVoUa73QAdxt6D85OATPwlA=
=jk8g
-----END PGP SIGNATURE-----

--b1ERR0FXR0PvNIRE--
