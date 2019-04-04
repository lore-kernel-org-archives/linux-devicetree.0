From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/panel: Rocktech jh057n00900: Add terminating
 newlines to logging
Date: Thu, 4 Apr 2019 19:08:01 +0200
Message-ID: <20190404170801.GA3078@ulmo>
References: <cover.1554114302.git.agx@sigxcpu.org>
 <20190403161735.GN5238@ulmo>
 <1ed5eb3af4df6b2dd1544c7b696e034ed5c94f06.camel@perches.com>
 <20190404105359.GA8255@bogon.m.sigxcpu.org>
 <da6f2344396555034cf2476c8338b0ce1c56e0a7.camel@perches.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <da6f2344396555034cf2476c8338b0ce1c56e0a7.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Johan Hovold <johan@kernel.org>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
List-Id: devicetree@vger.kernel.org


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 04, 2019 at 08:06:09AM -0700, Joe Perches wrote:
> These were missing '\n' terminations, add them.
>=20
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c | 19 ++++++++++------=
---
>  1 file changed, 10 insertions(+), 9 deletions(-)

Applied, thanks.

Thierry

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlymOegACgkQ3SOs138+
s6HOdw/+MJEKiLIvtJE7XqzgTE6sS8iV9oUxqR7a2oIHGRYLdyU40n+42nAuvdgI
4CKn6d19gWTtmJFUK+29oNv3kJ8LUJ/gIfuton7sivHUKZtUUh3YORLwnhmTzUCk
VWlJCTXmopkefZklTZ4BOFiGD9PM7BsCPMgz/deHbOp4TafnrGERJE2DfroKMmLo
Dit6wFLtFaYPNi7M1fGcpLkJsDn8GFKL/SyiU7HmbvIEqwyCvk4iPdQF7RCx5a2x
/GD/Z+pzmBwCp9scHeO54ajoy+MMxZ0uIaRp0a5l/Rc4qECnhnCRXeQSuNAvD2kq
Rp0bgd3xe0x8MIhr6HTR95hNQrWbiYFjTpIuoYKudLSg9Ji8a5mO1UEPzPCPPNpH
dTyW/FvLiknCRNyieec4y1bXdE1ill0l+5BOuQM9IQj2kJb8tKtQOnD0WMBFq+UB
WM95pA54e3PVMMljP6tMxOBp8bsEyH+YHwyimhIsCVwQ40HTrwe3VMm/IiH+OzPH
15Fwyu5NuxFNXSstaZtXmQad9iBUJomkGcFBvHdE27ZIdSy30oAQmpY3ssKPEy6x
571D/TuUiV9ZrWeA2nnsOK4L6w5dO//vC1hGxSO1+vgOVBDhfQX65U6B/TjTWZFX
AWqKHv46EvlTk9vHHoObpcN1xKKxRSTDBR3twjNx9/uNlf7FQwM=
=YxVM
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
