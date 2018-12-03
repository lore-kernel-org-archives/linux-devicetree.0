From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 1/4] drm/panel: simple: Add AUO G101EVN010 panel
 support
Date: Mon, 3 Dec 2018 17:08:37 +0100
Message-ID: <20181203160837.GA10037@ulmo>
References: <1540480173-12009-1-git-send-email-alex.gonzalez@digi.com>
 <1540480173-12009-2-git-send-email-alex.gonzalez@digi.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1540480173-12009-2-git-send-email-alex.gonzalez@digi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Gonzalez <alex.gonzalez@digi.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, shawnguo@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-imx@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 25, 2018 at 05:09:30PM +0200, Alex Gonzalez wrote:
> The change adds support for the AU Optronics G101EVN010 10.1" TFT LCD
> panel.
>=20
> Signed-off-by: Alex Gonzalez <alex.gonzalez@digi.com>
> ---
>  .../bindings/display/panel/auo,g101evn010          | 12 ++++++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 27 ++++++++++++++++=
++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/auo,g=
101evn010

Two things to keep in mind for next time: please split up DT bindings
and driver changes into two separate patches (checkpatch.pl warns about
this) and keep entries in panel-simple sorted alphabetically.

I fixed the sorting myself and also added a .txt suffix to the DT
binding documentation for consistency with other files in that
directory.

Applied to drm-misc-next, thanks.

Thierry

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlwFVQEACgkQ3SOs138+
s6Gt/Q//fW3RY8o0MJeeWb5pyty3d3BVcUWDLS9phurF90m/1HbMIWE7/8d53bBV
DavgsKBPmhRlqy1Lu1O3940r+xS6WtlDXzFbt5Iiqd5DtwP+gftTzLND71wohAKc
Pc9lGjzdbeIndY8VcB/oBAEd62DD5BZsn6gMewARCpvT/VcLRCo5Ks/pkGl8QGbe
Ze3tzeAQwWMumzrdJLqbyBE72QA0/9/1ql8iqujmyFHZ5A1vlMozihUcnQ6cyyAt
p9MEJ/TVfKGu42sLc5OW+oPb9f3tLO+G/jVoZ9lLgfRyQH7nyucJPqZ1SPXmI9AR
OI9g34RCqnldcEjh2QPtCchpZBT9Ip55B/GJxZpFonZVjK1Fty9bpSQ5ZZLo03cT
OL1psLujcsLAb3TrkKfCt0fROv9xix0qo954o61E5LjmOx3o8OkKvsM68CuSvUVC
1CrjVZzacco5DeGO5z8NZ4SsmF2hRyzmGNvSAv19toqjXvvrZMasUmSrU+pdBYgW
aZipFthJkw/jlXnk1UTVvMfd/OHfrwDBiXuLvQSfMJ4aVpti2Kq/q8NF2eZw1OWU
cJngTfAVPVD1uHVjJSSDv93u/A43hvJMHcVD0gd0Rpu+AXePbHdfPje5Nmni+QZK
b4S2QNnwsTHZP5pvKP7ai1/OXv/Qjo2DSBQAFLR2Gi7gcRcVRXw=
=/9Nx
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
