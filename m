From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 2/2] drm/panel: Add driver for sitronix ST7789V LCD
 controller
Date: Thu, 6 Apr 2017 23:53:07 +0200
Message-ID: <20170406215307.GF27728@ulmo.ba.sec>
References: <cover.74614dd427b0214d0ba7ccfe75bdd7506b42e61d.1491226701.git-series.maxime.ripard@free-electrons.com>
 <fb8ed97ce3e32b6d292fef4715cde188dff6a8a5.1491226701.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1546518640=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <fb8ed97ce3e32b6d292fef4715cde188dff6a8a5.1491226701.git-series.maxime.ripard@free-electrons.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>
List-Id: devicetree@vger.kernel.org


--===============1546518640==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ExXT7PjY8AI4Hyfa"
Content-Disposition: inline


--ExXT7PjY8AI4Hyfa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 03, 2017 at 03:38:32PM +0200, Maxime Ripard wrote:
> The Sitronix ST7789v controller is used to drive 240x320 LCD panels throu=
gh
> various interfaces, including SPI and RGB/Parallel.
>=20
> The current driver is configuring it for the latter. Support for tinyDRM
> can always be added later.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                  |   7 +-
>  drivers/gpu/drm/panel/Makefile                 |   1 +-
>  drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 449 ++++++++++++++++++-
>  3 files changed, 457 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/gpu/drm/panel/panel-sitronix-st7789v.c

Applied, thanks.

Thierry

--ExXT7PjY8AI4Hyfa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljmuMMACgkQ3SOs138+
s6F6iBAAkU+WZK1bdViUniHxXLfeHfd5vrkDAe4OSykSoT5QQMv2V7PIKlfsamKQ
DLpf41+/AxPb9m0Y3deRZ3fxA08GA/qTElFxdnkSgNd+fvhoCP4YxejeqgcUI+DZ
lla9OmUWUgH1SiYMJNddhTPAwN+m1gZ1zvoIztJ12DnarlUhulR4ykenvh74CIUJ
aPcRuVnWCRiRr3OLZlfP8ZuJdmPEirHzEIdso33U8hiOu+/r9YdkW49hWk2GfLgA
ZiILjn//E+pVL6l1tkPYrkxiDfZuOt/wQjO5uKU0uQMoy0Vjmm30l9FMYrHy732a
3BX8j7YXRe99ASnmYtSv6ORDvPpKhGdZcLias1fXhZ1iZBWAVtt4IcqmoS39b1Pe
pGquiOAjYv5lpB/4sMNR9+Jttx2ACYA1ae0s4eG/laCtjIrmivfCPlvXVav1ot2I
BqrqBnP6qxmPkyN5uactnOAk4FQwNYMnwLuTEaENsAsGfaM9KpWJRHQhQ7L1zTKd
liGz5Pd8hC/gsNZU7+S7beRqpyhE3yYfqJC5RkfNTLuE1tZZ5Wl+LzINIzQDjjag
tquIu5TY0xQyFNanoGiTjuAteHYWNuckjCUVkNbB9KbDpFm4QQTqkcG3iAfURw0J
zTr3zWvddvMgs37Y+1Bop5aRtnMDZ1lUpoAi8sGzVmtPRwAhiWQ=
=iXiM
-----END PGP SIGNATURE-----

--ExXT7PjY8AI4Hyfa--

--===============1546518640==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1546518640==--
