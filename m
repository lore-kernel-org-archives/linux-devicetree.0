From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/3] of: add URT UMSH-8596MD-xT panel DT bindings
Date: Thu, 8 Oct 2015 10:27:59 +0200
Message-ID: <20151008082759.GD3820@ulmo>
References: <56158803.9000300@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1148540510=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <56158803.9000300@maciej.szmigiero.name>
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


--===============1148540510==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Qrgsu6vtpU/OV/zm"
Content-Disposition: inline


--Qrgsu6vtpU/OV/zm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2015 at 11:00:51PM +0200, Maciej S. Szmigiero wrote:
> This patch adds DT bindings for United Radiant Technology
> UMSH-8596MD-xT 7.0" WVGA TFT LCD panels.
>=20
> Signed-off-by: Maciej Szmigiero <mail@maciej.szmigiero.name>
> ---
>  Documentation/devicetree/bindings/panel/urt,umsh-8596md.txt | 12 +++++++=
+++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/urt,umsh-8596=
md.txt
>=20
> diff --git a/Documentation/devicetree/bindings/panel/urt,umsh-8596md.txt =
b/Documentation/devicetree/bindings/panel/urt,umsh-8596md.txt
> new file mode 100644
> index 0000000..57c5fa4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/urt,umsh-8596md.txt
> @@ -0,0 +1,12 @@
> +United Radiant Technology UMSH-8596MD-xT 7.0" WVGA TFT LCD panel
> +
> +Supported are LVDS versions (-11T, -19T) and parallel ones
> +(-T, -1T, -7T, -20T).
> +
> +Required properties:
> +- compatible: should be one of:
> +  "urt,umsh-8596md-t", "urt,umsh-8596md-1t", "urt,umsh-8596md-7t",
> +  "urt,umsh-8596md-11t", "urt,umsh-8596md-19t" or "urt,umsh-8596md-20t".

I'd probably list each of these on a single line for slightly more
clarity, but no need to respin because of that.

Rob, I remember there was some discussion a while back on whether or not
there should be a standard way of describing lists of compatible values,
do you know if anything was ever concluded on that topic?

Thierry

--Qrgsu6vtpU/OV/zm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWFikOAAoJEN0jrNd/PrOhpWQQALmujsUPw+atpRZF3Uuz/qVS
HfDNZTm45U+lJy5Bq9yLz7GX1DUHvYAGZDjckNl/FT/14ST0UoCURSMSGABcmH9h
JpdrQrojnlA432TCjg9/nDnYELpyDo+WUhDMrPglIiwuvMK5L0OF/wqveDNymQdh
GSOISCz0RtEpMc4AhJlDA4iH5nvq0OkKwHVVweGpsNXYJ78OioJ/vj1mvpLnbQA8
awjsVBQ/bUD7mcYaL8L/iNbDKrV22L4ppfP9vrv77PfeYQ8qOzt7xMgADb9D29J1
lPmK349P0kFvxqkxJCYA6D7A1i0YqHEP+l3/eCqkPQ5nsUWJPgn33djSoQPtZ+WE
mEV34zcwEZUl1VnE5EXIpRJTqDCf1u/AJY8pVmsC0jXLcB/A4m+ITWOcx5DdGXkX
zmuAIKkPWkHwBI7CHlNh8nlDLWvSxDuLMcwDdKFn4cws1aY/YUnMK0IlYcAU82e/
jhYcG/KH+M09VoW3EARAn6pcXshNnLPNbShS0o/3aOtX7CT4E4x6NccmNg1YTB/X
QOTzRx8SrCZxXNgjkBrXIKDrSQSDB4p4R/fqqfJgEyu1pstS6Kp40dmwo7iRpcTR
K7O5WUffBzGp8XuZjmY/AC30qzhsUqyfbts7lyMcpBUz5ooHjlSboUGOTPGRLgOv
4tOLRwn8ZilIOGFXhoJF
=bMHM
-----END PGP SIGNATURE-----

--Qrgsu6vtpU/OV/zm--

--===============1148540510==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1148540510==--
