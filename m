From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 2/2] drm/panel: Add display timing for Okaya
 RS800480T-7X0GP
Date: Thu, 13 Aug 2015 14:32:39 +0200
Message-ID: <20150813123238.GE11095@ulmo>
References: <1432827466-8104-1-git-send-email-gary.bisson@boundarydevices.com>
 <1433954663-31444-1-git-send-email-gary.bisson@boundarydevices.com>
 <1433954663-31444-3-git-send-email-gary.bisson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0156029400=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1433954663-31444-3-git-send-email-gary.bisson@boundarydevices.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Gary Bisson <gary.bisson@boundarydevices.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, eric.nelson@boundarydevices.com, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, galak@codeaurora.org
List-Id: devicetree@vger.kernel.org


--===============0156029400==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tVmo9FyGdCe4F4YN"
Content-Disposition: inline


--tVmo9FyGdCe4F4YN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2015 at 06:44:23PM +0200, Gary Bisson wrote:
> Add support for the Okaya RS800480T-7X0GP to the DRM simple panel
> driver.
>=20
> The RS800480T-7X0GP is a WVGA (800x480) panel with an 18-bit parallel
> LCD interface. It supports pixel clocks in the range of 30-40 MHz.
>=20
> This panel details can be found at:
> http://boundarydevices.com/product/7-800x480-display/
>=20
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  .../bindings/panel/okaya,rs800480t_7x0gp.txt       |  7 +++++
>  drivers/gpu/drm/panel/panel-simple.c               | 33 ++++++++++++++++=
++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/okaya,rs80048=
0t_7x0gp.txt
>=20
> diff --git a/Documentation/devicetree/bindings/panel/okaya,rs800480t_7x0g=
p.txt b/Documentation/devicetree/bindings/panel/okaya,rs800480t_7x0gp.txt
> new file mode 100644
> index 0000000..f7c729d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/okaya,rs800480t_7x0gp.txt
> @@ -0,0 +1,7 @@
> +OKAYA Electric America, Inc. RS800480T-7X0GP 7" WVGA LCD panel
> +
> +Required properties:
> +- compatible: should be "okaya,rs800480t_7x0gp"

Underscores are not typically used in compatible strings, so I've
changed this to "okaya,rs800480t-7x0gp".

Thierry

--tVmo9FyGdCe4F4YN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVzI5mAAoJEN0jrNd/PrOhZisP/2qbQdE8kh161Jh52+1y71Q8
LDMS170GNY0Tmq8vNB6uzlTOMuiXaysmmkGjtXj3uBQ6dXgaO+8jMR0OGyf2Xe2Z
1DAK5VmR64kf+XKwFJUhXAFi2OgrHZjFS8CVHtY0ySp+aqSmGAK0/1h7fZOQJKfs
A6ruROwPqxmKjSo4KYa7z48JTth0DJtbaHb1dtPGZiICeSLkR1zswhs1pVJPF6gq
OIfadWM+Y5FNW/PEy+Kbnugvx11DwNYSlKRLuKgnsv0itpHqPWIuZ7/zt92K3MOO
joEgZ7ogWlgehzZ7TurIfWmUea87v1QT7ULIYrowQ38Ibs07HyY51ZisK8IXtSho
4gv5q5cT/93tSHeA2umS7x7Fv01wzp/7UU52XR3f0nkDAHUVPJLkw+8n0ejvPv2s
JSln6snzkvKwmrlpiDfmPy66vZP8wtjKRd3Tq+D+jK7yQptQFh8V9d+aNp909w8X
40lGgBPNakq0fLlZVXOTEetWquRNKxEGW4xcHn4Fv+VhWN2JO/QZkGwkypGuzzb/
FGRy4bOXc2og7yHk3yS4YP0lS/SuSsrqi411Up72ox5rfUv1bsn33kWmAoW0s69v
9MKcdCXbF5QdLJRy34dXTP9jHtg0O7iaVX2zga06IfhE/IixA9XOBDEbvRH6rjgH
HSzHuUTtFChQChwUTPxU
=cRpI
-----END PGP SIGNATURE-----

--tVmo9FyGdCe4F4YN--

--===============0156029400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0156029400==--
