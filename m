Return-Path: <SRS0=V+Gz=O3=gmail.com=thierry.reding@kernel.org>
Date: Tue, 18 Dec 2018 22:32:56 +0100
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: media: tegra-cec: Document Tegra186
 and Tegra194
Message-ID: <20181218213255.GA4227@mithrandir>
References: <20181211094841.16027-1-thierry.reding@gmail.com>
 <20181218164230.GA18480@bogus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline
In-Reply-To: <20181218164230.GA18480@bogus>
To: Rob Herring <robh@kernel.org>
Cc: Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 18, 2018 at 10:42:30AM -0600, Rob Herring wrote:
> On Tue, Dec 11, 2018 at 10:48:39AM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The Tegra186 and Tegra194 contain a CEC controller that is identical to
> > that found in earlier generations. Document the compatible strings for
> > these newer chips.
>=20
> If identical, why don't you have a fallback compatible?

That's a good point. I think it would be fine to always fall back to the
nvidia,tegra20-cec compatible.

Thierry

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlwZZ4QACgkQ3SOs138+
s6Gwdg/+MrBxsR3iE+f5eAzdUfDoEeBN5qmqJwFTVfGbgcixVe7rNbD+DtjTeKl3
72ocbucBfPpGNg9LNjJu1Oz0MODUzg6kq8/zUeub0T67xHkEUzh62Qu4WIDEo0YT
gaDUCleglmcACskmIEbjfO1lFqT3XfgDWriaPRsbE/ZfkX19hrZQvOEnMdaBRJ89
1WfIcZ0/0iTDjdeOfTqkIz905p6yC3wFbzXLZlRgI9O+7mjp3W3S9ZWrP5nGb2Z+
aFQ10Dm4S2wJ27TeFN+Wr3Lcz/QO7O2iZtwG5abHH62c8fyF0soJDjWnM3cwN0Gy
xlMqdLPn2cZfsQW9EGrnTtlnsjo6v+jOeophcC4QSZcGHWHA3KaNLEul654fYT8e
4dkhA062CEsJ7vu6HbkVMbzhdxBwDXgAHxqGZWW0jHAmfAF0zaKNpYkp5eDePHyh
wQA/SgzRNzR8D/V2lb8PkJG+FsDA41SbSf2Vtad62Qb5VzAHD+nfo0M2ObAn8M1c
KyHCGC+AvS8zOjafA/Ky8RYtAa69CqjpC2vt68UItxQIJg54+kYUXNNrDkLF3Rgh
rKsu4IbxXp1YOkKYFHYjjiH5pGhyT5smnjDdcxBBK5XVMMVVhbo4I2i2gHEtBpjM
lVOcMLXils+iO+aNg50I38IFGSl7GXQBrZDh2EYg6nKfIJu7pQc=
=KsX4
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
