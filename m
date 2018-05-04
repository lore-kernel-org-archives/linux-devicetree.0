From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 5/6] drm/vc4: Support the case where the DSI device is
 disabled
Date: Fri, 4 May 2018 12:30:25 +0200
Message-ID: <20180504103025.GK13459@ulmo>
References: <20180503164009.14395-1-boris.brezillon@bootlin.com>
 <20180503164009.14395-6-boris.brezillon@bootlin.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0740234064=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180503164009.14395-6-boris.brezillon@bootlin.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org


--===============0740234064==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vk/v8fjDPiDepTtA"
Content-Disposition: inline


--vk/v8fjDPiDepTtA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 03, 2018 at 06:40:08PM +0200, Boris Brezillon wrote:
> Having a device with a status property !=3D "okay" in the DT is a valid
> use case, and we should not prevent the registration of the DRM device
> when the DSI device connected to the DSI controller is disabled.
>=20
> Consider the ENODEV return code as a valid result and do not expose the
> DSI encoder/connector when it happens.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/gpu/drm/vc4/vc4_dsi.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> index 8aa897835118..db2f137f8b7b 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -1606,8 +1606,18 @@ static int vc4_dsi_bind(struct device *dev, struct=
 device *master, void *data)
> =20
>  	ret =3D drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
>  					  &panel, &dsi->bridge);
> -	if (ret)
> +	if (ret) {
> +		/* If the bridge or panel pointed by dev->of_node is not
> +		 * enabled, just return 0 here so that we don't prevent the DRM
> +		 * dev from being registered. Of course that means the DSI
> +		 * encoder won't be exposed, but that's not a problem since
> +		 * nothing is connected to it.
> +		 */

Also, nit: this isn't the correct style for block comments.

Thierry

--vk/v8fjDPiDepTtA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlrsNkAACgkQ3SOs138+
s6F/HxAAnAJEZOvCziptXFtaIa7HO5boY0PU2N54ROPge0qXvK1ndu9dAN+hcDN5
gCdPvBn8/CbrvHHJQMVX2YNWh+GRmq0v9/bluT9b9erHDNyAMDnuh0koNYFgUaAA
JfXQY5s8hNLWEMeu1Ao625/NhtWTNde61oKKz1epeuxZAtLLK46eBMbeZ7Mco68r
3osRB7z7tzQvCyxxwl1/7c6jAWLnDJ0sDFRfmJlkPsA7CTZX+Yte88FrVThU8hJ0
KE7mSaiW+4cQwKmKvmFJFTGvUB38md4CshK+y00J0vs6JlO6SoSTC3pXzftXVS/g
ls5WxaaPtJtMGf6z4wU8SmoJl1azT9KWGm/mbWO7UT/bGT2ey2MN5adSvfukJEv9
7RMx9ps7LbUsx/+0JGNmlpsVplHjESauE2RYD/KaiCdkiHX9y7I7tp0N1fXCk4BB
+kCm//KQ5q5ck1+MjKsFpHhzbLiLTAeoXxWVft+DcH9NsxSgTN9ncRUQPOLzIKzA
xO3naKslrxDWipLa7iGIhKGow5+/aI9FXJrcpeOYnccXnz8z0Fm62HdJZ+BCweYU
mtO6bIwFmnnAXtmW6U5m4f1FWHESR9EXXtN5i7zjcNQTRjFmbF+FWz8d9ZyPRuSn
b349c+UBi6L8wdl2/NrMXSTc+jHjT2XY1LZlkr7cBOAAiQvYwu8=
=CHgk
-----END PGP SIGNATURE-----

--vk/v8fjDPiDepTtA--

--===============0740234064==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0740234064==--
