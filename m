From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 3/3] drm: panel-simple: implement URT UMSH-8596MD-xT
 panel support
Date: Thu, 8 Oct 2015 10:24:44 +0200
Message-ID: <20151008082444.GC3820@ulmo>
References: <5615885C.5050505@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1049829019=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5615885C.5050505@maciej.szmigiero.name>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org


--===============1049829019==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RIYY1s2vRbPFwWeW"
Content-Disposition: inline


--RIYY1s2vRbPFwWeW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2015 at 11:02:20PM +0200, Maciej S. Szmigiero wrote:
> This patch implements support for United Radiant Technology
> UMSH-8596MD-xT 7.0" WVGA TFT LCD panels in DRM panel-simple
> driver.
>=20
> Signed-off-by: Maciej Szmigiero <mail@maciej.szmigiero.name>
> ---
> This replaces "drm: panel-simple: add URT UMSH-8596MD-xT panel support"
> submission.
>=20
>  drivers/gpu/drm/panel/panel-simple.c | 54 ++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 54 insertions(+)

Looks good to me. I'll wait for Rob or anyone else to ack the vendor
prefix before merging this.

Thierry

--RIYY1s2vRbPFwWeW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWFihMAAoJEN0jrNd/PrOhGyoQAKYukisUbaj/RlD5tFb2AYPY
p/yFMUykEPJjg41xpWa2ACnbQ2Cnj6Pm0RxsgTqvYWR7bHvtgDcV5H3CxsLSN9W2
jgVePP6/4outF9u7RKd6aIiah8U9LOB29BVhomaxir0cKndPCcf5w8hi2K0I1S3p
UYihUKIdfZo6Y5RUwnkZZryd9b2lIsQ23u84MPk/B3rbhCedpuQKwy7pVCPmpGUY
cLw4j3+MTlTO9e2ppVMueLSLJZ8C/zxACvwuLoyeu3OhfalZR9xq6V1ke6YQu2BN
9KwIX++eRtOtZdUiVIpow4IVI9ndXiBmMc/S6M1c+w6oGEz9OGaDbhpOEGzJqj3x
3eAwqS4a4XEUJYHCh+rq6FqTVgcv17JnfhF58fi3JNk8qdE/9LUB93JHjBomLJ0E
ZKMRNAqscF6mAelZ+QgFZAzxZqYuuftWnd7ghT07DVnXz7nb0tUftc/b7osKNP1d
qZIKKFET26QsRqg5GlbZtZBXG36SYvb2N4yKisPrvXMK/VlWHZJ2KMWYaNRhM+ca
ougD1845/8V/GH9z+g7e5v++10+QFsnCoYvDeamaErdcqRy7Z76hv2uVLhDW+jlX
s46G62zAX+W/Ykk7A4GRvBZeYaIsCuYPiwF76u7cN4DzTnh/G9q/laPLJQTGHk/p
7GaHsIWrfstRp5bT01dC
=qeSG
-----END PGP SIGNATURE-----

--RIYY1s2vRbPFwWeW--

--===============1049829019==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1049829019==--
