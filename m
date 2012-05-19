From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V2] regulator: dt: fix the name of regulator supply
Date: Sat, 19 May 2012 11:43:03 +0100
Message-ID: <20120519104303.GQ4039@opensource.wolfsonmicro.com>
References: <1337369652-27094-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sBcizk6cgRZY6rnJ"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1337369652-27094-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, lrg@ti.com, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--sBcizk6cgRZY6rnJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 19, 2012 at 01:04:12AM +0530, Laxman Dewangan wrote:
> If there is any input supply for regulator then the name
> of supply need to provided by init_data->supply_regulator.
> In dt case, the input supply is searched by the <name>-supply
> and here it is require to fix the name so that correct device
> node can be identified at the time of regulator registration.

> Fixing the name for input supply as "regulator-supply".

No, supply_regulator is a legacy thing.  Regulators should set
supply_name in their regulator_desc to tell the framework what name
the parent has, allowing these supplies to behave in the same way
as other supplies as far as the binding goes.

--sBcizk6cgRZY6rnJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPt3kxAAoJEBus8iNuMP3d3ScP/11QujY7F6TVrtKGiRWde8eU
WVMiz5XxLDD/QiSjnMWpJv/mT70E9YMoRKmlGlRH0U211pHoyKpfTLw5TqbtbwQZ
pn1G3wFmaZL0jKcRA8b/6nDE++m2ZktQZB4SQiW0ju+dEWELT1IBTO1PqfV1HInT
1DXlxjTie7v8snJYETmZsKC3WdrUUJERMASSbRuRoiKF5AetWF4/Mf3sYvqtyXRW
mh3fmI8zlrHNkYSDHBd749OFQHvk+3/ojpEzKcgdCZXtMF6Myj/mU4FjAeYHpNcR
YtMjHnU91XJc7t0YMlePpq+hDHUBASOoRXSXgnapdChqv89h9yYmxSE63dhmCbDV
xOlLL0p9ONkbMtayPM/1NHgWPFqelWYcb1emYDubZOUAZDisJX6SG5jHmGu4OYpJ
N4LwWEcJwohaawKR9Cyr3lDjNh66W9CvSxGT0q7g33l0YMx6vUgaX6XjRqf5Xxf9
5XKxhM0px9AsSvXQqpVTLqKXhhfHv/N3aZmigriKPoX7QKv6BL8IYqwSVZT0fdVG
VaHq0WI5lSb0bfuC6PhPfrLrkvo6ccSr4tTNMGHViZBIBpvLjv0ZGwgshAm6VVZ7
RAum7fU8kBkKvbzZDqUSps/fNxFoSbzCqGH9hlqglcg2w/8lg47fjE26WFnjsyb1
ZSCp0yhawKf8v4jj3H05
=3Yzs
-----END PGP SIGNATURE-----

--sBcizk6cgRZY6rnJ--
