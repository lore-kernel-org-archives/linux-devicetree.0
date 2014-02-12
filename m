From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] regulator: ti-abb-regulator: do not open-code
 counting and access of dt array elements
Date: Wed, 12 Feb 2014 15:50:06 +0000
Message-ID: <20140212155006.GY28112@sirena.org.uk>
References: <2573561.oCYNnnL0gm@phil>
 <2193931.Kqcd3TrslU@phil>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nSY6dmU9u4MMxp1o"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2193931.Kqcd3TrslU@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--nSY6dmU9u4MMxp1o
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2014 at 01:01:42AM +0100, Heiko St=FCbner wrote:
> From: Heiko Stuebner <heiko.stuebner-HCpLIkUQxWGakBO8gow8eQ@public.gmane.org>
>=20
> Open coding the counting of elements in a dt-property is abstracted by th=
e newly
> introduced of_property_count_uXX_elems functions. Additionally the raw it=
eration
> over the states element exposes the endian conversion and dtb-format deta=
ils,
> which according to Mark Rutland "would be nice to limit [...] to of_ help=
er
> functions".

Applied, thanks.

--nSY6dmU9u4MMxp1o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS+5grAAoJELSic+t+oim9EAkQAJn7aNfA+njghBy9NcAuyyJT
+Z2HlBW3tFUyulrH1OMQ8z5Ee6zOzI5zFUWsMWwOGiM/IAE0McwjjLz6M5ya1nF+
ZhEYlygOY23uvEWp2NKSk5VwUodhGsjxSppIP0QZAU3OBWMnEIYQ3GdrzfJy2KAb
bATwFEmmfrldxsSuFkG0XvyFjpJYWDpS9r0PhUrNHoAPoBr8z8UwVwAMc58tnKSQ
9RsRyJswJwEWSYDNA3/e16cB3KmG5urvoB9d2P2yeXROTMp52Mn1bkx2IIN78m6p
XHVf3ON7+0vqsOcfEWIyB2B1y+yvtNx5FAWAfURepuNNXxtHCYuqRIA7oyV/hLxQ
28SVvKO2GjWeZXZVfCuHs4Gw2WydhC/rRDzDZWuasbicKnpAEPsT72dPZ5X3tzyd
yGlLl3WIoQ5z2nZiMbm8dArCPBoDL+1o5gr7c+WTy2tRQ1ajDyoxpw1UB4eFcyik
WZFbGgYvlyrflMDWo1Dcq4nUdyfaeHy5b+ZFO+vhK8K6qWTILOU/L5gSZ8s3mXbh
rmKM5D6kUAZisDr/9HqP/kIDWBrI6FzDiOZuifpMDtaEDYAurzmkFv42Pw3boF9t
lyfCzxFRIAgivq8TwrehFjQ50CWEJtmqvU1X6+mFHjSh6K/QyJwpJqDWk0rZ/kAe
qGgqq5FLP+wBFKwBQebM
=JAbe
-----END PGP SIGNATURE-----

--nSY6dmU9u4MMxp1o--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
