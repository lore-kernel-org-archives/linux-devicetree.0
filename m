From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 0/4] drm/panel: Support for OSD101T2045-53TS and
 OSD101T2587-53TS
Date: Tue, 23 Apr 2019 15:18:53 +0200
Message-ID: <20190423131853.GP23448@ulmo>
References: <20190226075523.28997-1-peter.ujfalusi@ti.com>
 <20190423115506.GE23448@ulmo>
 <c25a9364-f69f-17b4-34d6-ec29e68118d3@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ssZxAlvqSOvXAj81"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c25a9364-f69f-17b4-34d6-ec29e68118d3@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, tomi.valkeinen@ti.com, sam@ravnborg.org
List-Id: devicetree@vger.kernel.org


--ssZxAlvqSOvXAj81
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2019 at 04:00:26PM +0300, Peter Ujfalusi wrote:
> Hi Thierry,
>=20
> On 23/04/2019 14.55, Thierry Reding wrote:
> > On Tue, Feb 26, 2019 at 09:55:19AM +0200, Peter Ujfalusi wrote:
> >> Hi,
> >>
> >> Changes since v2:
> >> - Added Reviewed-by from Rob to the binding patches
> >> - Added help text to Kconfig (osd101t2587-53ts)
> >> - Print the error values in dev_err/warn
> >> - Added Reviewed-by from Sam to the osd101t2587-53ts patch
> >>
> >> Changes since v1 (only panel-osd-osd101t2587-53ts changed):
> >> - Removed unused members from struct osd101t2587_panel
> >> - Use backlight_enable/backlight_disable
> >> - Use devm_of_find_backlight()
> >> - osd101t2587_of_match table standardized=20
> >> - osd101t2587_panel_unprepare() added to shutdown and remove callbacks=
 to turn
> >>   power off
> >> - Fix probe in case mipi_dsi_attach() would fail
> >>
> >> Add support for OSD101T2045-53TS and OSD101T2587-53TS from One Stop Di=
splays.
> >>
> >> The two panel is similar with one big difference: OSD101T2587-53TS req=
uires the
> >> MIPI_DSI_TURN_ON_PERIPHERAL message, thus can not be handled by panel-=
simple.
> >>
> >> Regards,
> >> Peter
> >> ---
> >> Peter Ujfalusi (4):
> >>   dt-bindings: display: Add bindings for OSD101T2045-53TS
> >>   drm/panel: simple: Add support for OSD101T2045-53TS
> >>   dt-bindings: display: Add bindings for OSD101T2587-53TS panel
> >>   drm/panel: Add OSD101T2587-53TS driver
> >>
> >>  .../display/panel/osd,osd101t2045-53ts.txt    |  11 +
> >>  .../display/panel/osd,osd101t2587-53ts.txt    |  14 +
> >>  drivers/gpu/drm/panel/Kconfig                 |   9 +
> >>  drivers/gpu/drm/panel/Makefile                |   1 +
> >>  .../drm/panel/panel-osd-osd101t2587-53ts.c    | 254 ++++++++++++++++++
> >>  drivers/gpu/drm/panel/panel-simple.c          |  34 +++
> >>  6 files changed, 323 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/display/panel/os=
d,osd101t2045-53ts.txt
> >>  create mode 100644 Documentation/devicetree/bindings/display/panel/os=
d,osd101t2587-53ts.txt
> >>  create mode 100644 drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
> >=20
> > Applied all four patches. Note that I had to change the osd vendor
> > string to osddisplays, which is the one that is documented in
> > vendor-prefixes.txt.
>=20
> I recall checking the vendor-prefixes.txt and not finding OSD in there.
> Odd, as it is indeed there.
>=20
> > I'm assuming that this is the same vendor, based on the model names. If
> > this is a different vendor, do let me know.
>=20
> Yes it is the same one.
>=20
> Thank you and sorry for missing it,

No worries, it was merged (March 18) after you sent out your series
(February 26).

Thierry

--ssZxAlvqSOvXAj81
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly/ELoACgkQ3SOs138+
s6FHLA//Z+8DwLFrB4bWhdcg9OxhdrF8C2hXzDH0yE1a1rPgcxuAEu/MQvivhvTc
S2RSk1C+epMUDsHM5eqgSPgGGU4P0vU8tcLWui/ZV1vYIGNgQy0BXFW8jXv5j9E3
Tj6Hi0fJDeVmUHGo9zr//NBwNSpMFsvNpuhT9nLxXeqFVg1iS9m0grfy6KkX3xUG
ECfXmSnIKzZQnVeOfvPSNpCzcVJ/6AggRCYsrdX/yQOUMbwqwop3KIBjRm9CmMpa
gIJj98Ji2U6DOOksNYoSYvBioyWBZ9oZeMepNYHK5iKH8s7BQfT+0TVTEVXXw5EJ
ide+e4l7JqFtx/Rmb00DytsthMwLsDrv+e542ojPGsAkjkDpNQrEECK3JgEWS50a
VOujE7LRGrLMglA8iAEjyUKlbbU6Pg1MSj963NN5gSgdO7elOyFtFVFXZVn3B8n+
KZLhGQxOjoG5RnBY4hJo5CQWirsfQ55VfewxLOeIGLKHwCd0WmrLcFopdakioZ3L
c7+vmOYir2tHNckW/phpqnoOhW7HiWO1aNn0Bl3GGcUHauoYGUDHMkjCamJYjBSp
xRhgVZZDWIQBEwIlBhdwFuziebK+95paaXek9At+OHOfibLuAiW1/5CZFqm5DrHW
hIG0lT9CNfs5gso9qJlHezKcZ5oF+ZS+REmRqbecbTOknTXpzuU=
=/ZJs
-----END PGP SIGNATURE-----

--ssZxAlvqSOvXAj81--
