From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/panel: simple: Add DLC1010GIG panel
Date: Thu, 27 Sep 2018 14:23:52 +0200
Message-ID: <20180927122352.GI29102@ulmo>
References: <20180924152610.25939-1-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0393334650=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180924152610.25939-1-m.felsch@pengutronix.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, kernel@pengutronix.de, dri-devel@lists.freedesktop.org, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org


--===============0393334650==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o7gdRJTuwFmWapyH"
Content-Disposition: inline


--o7gdRJTuwFmWapyH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 24, 2018 at 05:26:10PM +0200, Marco Felsch wrote:
> Add support for the DLC DLC1010GIG 1280x800 10.1" LVDS panel to the
> simple-panel driver.
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  .../bindings/display/panel/dlc,dlc1010gig.txt | 12 +++++++
>  drivers/gpu/drm/panel/panel-simple.c          | 33 +++++++++++++++++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/dlc,d=
lc1010gig.txt

Please make DT bindings and driver changes separate patches next time,
otherwise checkpatch complains when applying.

Applied, thanks.

Thierry

--o7gdRJTuwFmWapyH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlusy9gACgkQ3SOs138+
s6HVPhAArkKk+glP6gXTsCGjtmGRfPlkkrSHjwR0dyBiHyGfIim8lM+D+dE8T0EL
OIygIu1UC2W6fEruRNH4h1T0eXxgy2nT9LIZDEjlphjsTU6dDh88780YjPVUgfVj
xBiNjnfPMy2MfoVnhHcRoskvNuNqznj9edQXR9KRPEsS7ZAKS7lfxzK4WD0JQU++
xjyVeLKVD6ws3+AT9vM40Dc69O5SlfS38uKM2Obs1oxhnnFTl1OrOMB+fVYV9QGn
9Wnm7D+WxTORIdIj8wl7Lfa2X5Rore/sKer9fKRjb6DXn6NsDVBVOjkay2Fi2LhU
2sh0Jw/Kxf4cJwaqjv+LiwuWsuRFkncRlLY5utgZuLcq5V39sUPvEj1A3C9VtH0S
61a84i7gLDTjUS3u0hw1WAfzQpO/P8rsNpdjqBywo7lctqM7Q4kHnc6LJOLPvasb
kTyutsJzdrbtO24/AKSHIOPP6XqK9kzBXPGroAx2EdWQkpIgEs8KSYOxC45RaG0b
2a2EjEeH+CywvJddkpiODPB8ti5Si9MxIpt81irCycZH8duMTdpL23xguoVwu73b
ErFEHctBZpsNyzIQ2D8PZIxEleuQTa9nf1V7uq3ZsySSxaZ2HzKJZCfblDRIG12A
vQIICYnqB1s8JdQdr9uYRyFvYoByL57oBpRKZAjTwbSvYMEWRcc=
=DDA7
-----END PGP SIGNATURE-----

--o7gdRJTuwFmWapyH--

--===============0393334650==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0393334650==--
