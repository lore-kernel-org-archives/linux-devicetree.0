From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 4/6] drm/of: Make drm_of_find_panel_or_bridge() fail
 when the device is disabled
Date: Fri, 4 May 2018 12:20:49 +0200
Message-ID: <20180504102049.GI13459@ulmo>
References: <20180503164009.14395-1-boris.brezillon@bootlin.com>
 <20180503164009.14395-5-boris.brezillon@bootlin.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1240500399=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180503164009.14395-5-boris.brezillon@bootlin.com>
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


--===============1240500399==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l0l+eSofNeLXHSnY"
Content-Disposition: inline


--l0l+eSofNeLXHSnY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 03, 2018 at 06:40:07PM +0200, Boris Brezillon wrote:
> There's no point searching for a drm_bridge or drm_panel if the OF node
> we're pointing has a status property that is not "okay" or "ok". Just
> return -ENODEV in this case.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/gpu/drm/drm_of.c | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Thierry Reding <treding@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>

--l0l+eSofNeLXHSnY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlrsNAEACgkQ3SOs138+
s6GCeA//c8l/Lv0bK1IXJdrh/9oYz+avzlLQh2bw53qCV0fJSTSVG6TlJcI/BB8/
exni01FdQu1A2AVULNpypIB3ZhfUc61pctbxgtrjfCMOvqKWIHJEIGo/VOhsmhXL
sj7BzdqXWsXMxYxy/h/f/OGFrXkVj7hIx/WSzOUdtDYyR0dK3+nm9QT9oXtca6vZ
PMWGjkY1Bx0woFrCCtHFjp8pzXq5HIoz+b66MjkAynvBnNSP/tcDoNYptEKONKh/
LECo49ikhehyYjl6zeOu+mTM6BnLM2XsBaBYPQzFOfPbasuoosasb1Ef7G+lOJs7
wvSWC7xIFsj9OCN4hBBGwGTJdKXOWZmqjgjUCFgmpLsezr/iZJPELK3q2jX2KKtR
gYaGD5mUDWHPs0h3GyCbD7NxqLUDrkFrtNOCICHPcYzsxw0WtgEDEESQcQSo+D71
DzOMV2nIdUrLcXurBN93eun8O9PVRmJ5VaAtR64pwqb46bs7kNcg/RKRngpxSw93
YfmNDoxjKoHX+uRbuKcv4QYNcUVhMx7iML5+MAy6jWsJ59MO2thLamWjHaoNLZBI
W+1VeWTqVXM/gZQnHa4K0z1yXaCpj5ReJacyE3n2RlqTlvQ16JKDBFugCZUvvxRG
B9MAj/PrA+t32V8VK8zhd4m6Ky7/xFvvnwx2GsV89rkeb+AiyDw=
=tf8d
-----END PGP SIGNATURE-----

--l0l+eSofNeLXHSnY--

--===============1240500399==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1240500399==--
