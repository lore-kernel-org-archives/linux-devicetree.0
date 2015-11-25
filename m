From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/3] of: Add United Radiant Technology Corporation vendor
 prefix
Date: Wed, 25 Nov 2015 16:07:15 +0100
Message-ID: <20151125150715.GA31460@ulmo.nvidia.com>
References: <561587C9.2000207@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1746833636=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <561587C9.2000207@maciej.szmigiero.name>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org


--===============1746833636==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2015 at 10:59:53PM +0200, Maciej S. Szmigiero wrote:
> This adds vendor prefix for United Radiant Technology Corporation,
> a provider of liquid crystal display technologies.
>=20
> Signed-off-by: Maciej Szmigiero <mail@maciej.szmigiero.name>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Docu=
mentation/devicetree/bindings/vendor-prefixes.txt
> index 82d2ac9..01e3cee 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -223,6 +223,7 @@ toshiba	Toshiba Corporation
>  toumaz	Toumaz
>  tplink	TP-LINK Technologies Co., Ltd.
>  truly	Truly Semiconductors Limited
> +urt	United Radiant Technology Corporation
>  usi	Universal Scientific Industrial Co., Ltd.
>  v3	V3 Semiconductor
>  variscite	Variscite Ltd.

Hi Rob,

Acked-by on this?

Thierry

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWVc6fAAoJEN0jrNd/PrOhh2UP/R3kGasD4wYLA/IEeyr0zaPD
9j33GRUYkQTETHEIR8cgFXt7zwE2scOjpJiKC9Ad/rzElq+hswvPPZ4k+ufGwlTl
9utB8lxT5mR3Yts7RP73Yw8W7rFDgmM0JpOLpw5r8mCQcxfmxM9xy/Gp03ZCV568
DwZpxlVXX8xESf5zDJ6tFHW3h0sNKOJlOTlwMiriUUM4pBBpK6PWYpZeJ0o+JB0A
aPdihWXIRBs/SXbmh7q4vIjA13I05anU/ZEYeKu3reR0GguaOoVu/GuneejT/LZr
ANqVfoeh3YxHq6wvyfMC5UReIgvC/LJcJ5cVkXJmPpTXueTMqTXoQvK+KCnh31Di
biErc1i5UfUt+xfFI00lNJwCTaHZTIt/3fb0cPWqrYb1/kHz+7k+olg3PautzG/e
/1ONMMWUDlViBau4fEu7v+aDLagQ7SEQoVCoAoDkHUIszRokCfGAv5sETQN4Dczv
/aaBP8g04jRMQzGqYtM8H/Phee0IBqMEV5Mf7CushfkI28kqpj6+HPUW6tVbSqry
7zdVdSaZeNLNIQahwC/Kcoc0M+PeyBXpiIajcAPUhWiGLSEGZvfyyPijSxRVBuWD
GYV3ddsvF9uBwgrULv9fcQQ2L8cmGrxR1BnoSqE+J1qVqnnT8wlclhk3VSlHST43
g2G3RMeeoVVP5u3+KB+1
=RDYH
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--

--===============1746833636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1746833636==--
