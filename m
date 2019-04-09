Return-Path: <sre@kernel.org>
Date: Wed, 10 Apr 2019 00:45:06 +0200
From: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH v3 2/2] power: supply: ltc3651-charger: Fix device name
 (rename files)
Message-ID: <20190409224506.wy26tk5fxywim565@earth.universe>
References: <1554791081-10950-1-git-send-email-michael.hennerich@analog.com>
 <1554791081-10950-2-git-send-email-michael.hennerich@analog.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="it54iirjvr5zofhb"
Content-Disposition: inline
In-Reply-To: <1554791081-10950-2-git-send-email-michael.hennerich@analog.com>
To: michael.hennerich@analog.com
Cc: mike.looijmans@topic.nl, robh+dt@kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, robin.getz@analog.com
List-ID: <devicetree@vger.kernel.org>


--it54iirjvr5zofhb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 09, 2019 at 08:24:41AM +0200, michael.hennerich@analog.com wrot=
e:
> From: Michael Hennerich <michael.hennerich@analog.com>
>=20
> rename only - no functional changes
>=20
> Signed-off-by: Michael Hennerich <michael.hennerich@analog.com>
> ---

Thanks, queued.

-- Sebastian

>  .../bindings/power/supply/{ltc3651-charger.txt =3D> lt3651-charger.txt} =
  | 0
>  drivers/power/supply/Makefile                                           =
| 2 +-
>  drivers/power/supply/{ltc3651-charger.c =3D> lt3651-charger.c}          =
  | 0
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/power/supply/{ltc3651-charger.t=
xt =3D> lt3651-charger.txt} (100%)
>  rename drivers/power/supply/{ltc3651-charger.c =3D> lt3651-charger.c} (1=
00%)
>=20
> diff --git a/Documentation/devicetree/bindings/power/supply/ltc3651-charg=
er.txt b/Documentation/devicetree/bindings/power/supply/lt3651-charger.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/power/supply/ltc3651-charge=
r.txt
> rename to Documentation/devicetree/bindings/power/supply/lt3651-charger.t=
xt
> diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefile
> index 714c602..a2b3ab1 100644
> --- a/drivers/power/supply/Makefile
> +++ b/drivers/power/supply/Makefile
> @@ -67,7 +67,7 @@ obj-$(CONFIG_CHARGER_LP8727)	+=3D lp8727_charger.o
>  obj-$(CONFIG_CHARGER_LP8788)	+=3D lp8788-charger.o
>  obj-$(CONFIG_CHARGER_GPIO)	+=3D gpio-charger.o
>  obj-$(CONFIG_CHARGER_MANAGER)	+=3D charger-manager.o
> -obj-$(CONFIG_CHARGER_LT3651)	+=3D ltc3651-charger.o
> +obj-$(CONFIG_CHARGER_LT3651)	+=3D lt3651-charger.o
>  obj-$(CONFIG_CHARGER_MAX14577)	+=3D max14577_charger.o
>  obj-$(CONFIG_CHARGER_DETECTOR_MAX14656)	+=3D max14656_charger_detector.o
>  obj-$(CONFIG_CHARGER_MAX77693)	+=3D max77693_charger.o
> diff --git a/drivers/power/supply/ltc3651-charger.c b/drivers/power/suppl=
y/lt3651-charger.c
> similarity index 100%
> rename from drivers/power/supply/ltc3651-charger.c
> rename to drivers/power/supply/lt3651-charger.c
> --=20
> 2.7.4
>=20

--it54iirjvr5zofhb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlytIHIACgkQ2O7X88g7
+pqHCBAAhnMQS0necHFrzQXynhx/l7bD60OxcIzo6YkhoJ9/76USJUQxIuwhiDp+
Je712lLnEIOH+nv0wBfSl6sjsOQqEATnRcqZ9U8jrFyZfaVTEqkGZMNfenLrkZkH
+T1tjIZLEKCas4defWKRTSmsw+uAaq8RfWAtb4xcwVSNLv5WVuVv4uXL5TZMUU4d
zvUBqHjoxm6S+mNLDg0CS+0kkQ+UkXyRXw7ybLneXR+I7nvdACNUsAQhCWRdwZFP
p1a8B7Unhrjfa5EffvrgqnluTKpQg2Ehip5SBfvnU51arnHlG2mYmIxx31MWiumZ
nUkKU3CXuqcUVXWhV3fZFJYhR/rUtnxU/2VJaRdf2/4+ievE7YqVTW+DB9R7oQA8
AfjQZFP6uMvdylCm9Jr1PWhRIB++2jxEP7tDbvfRR7kPiLJmLIp+wtXA4eb+6B1j
frP20sCS+LUIT7h0UGVkgQuS4e/oVOlD9//GGsbLmoNGahqnWWBoc0gYbim2A+jd
rxcIcAKmcOlCwdQQDMty6uBq7bsj3B6+uvLMNy0/ZReQgOg5sd7xBgZvqKZsFhP3
0Ydo1neePuOztbBhRASlQGxCiWLGH9EyDEglG7OIxvvg8b2iEO3qLsm74xr+mt0z
TAhoz8Uepw1h2TJojAseHZme08Rc6/un9X5FfmPFsQRoq8vx1HE=
=717F
-----END PGP SIGNATURE-----

--it54iirjvr5zofhb--
