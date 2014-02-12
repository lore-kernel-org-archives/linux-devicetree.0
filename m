From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] regulator: gpio-regulator: do not open-code counting
 and access of dt array elements
Date: Wed, 12 Feb 2014 15:51:08 +0000
Message-ID: <20140212155108.GZ28112@sirena.org.uk>
References: <2573561.oCYNnnL0gm@phil>
 <1553563.pNlhnjkCFL@phil>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zOTFI1MayFoZtDo5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1553563.pNlhnjkCFL@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: grant.likely@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
List-Id: devicetree@vger.kernel.org


--zOTFI1MayFoZtDo5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2014 at 01:01:08AM +0100, Heiko St=FCbner wrote:
> From: Heiko Stuebner <heiko.stuebner@bqreaders.com>
>=20
> Open coding the counting of elements in a dt-property is abstracted by th=
e newly
> introduced of_property_count_uXX_elems functions. Additionally the raw it=
eration

Applied, thanks.

--zOTFI1MayFoZtDo5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS+5hpAAoJELSic+t+oim9zcwP/3MbB3U3gXYeTXLqz1ZFQiGV
s23UsUwjpOINZUs92aPQ1JjcSZe4xuDsvX47iA7oJUpaFIw5VC78oSseoa53UryU
piQmly5TlKJJESEkShLy0fu0YsqxLaFIQoqJwwGqD8BZnK/7+R99IacPnrDIl6Qj
bj7BcX/qTZzTI/UZ7udlPBtxcLgWEtfO8gjGg5Ghd6pTqyQn42s6k/WrNqJGUYxt
AmtY3OOhxcrrRq+gBC7KTSDHSf11W5b+rrmqM0hx2JHwMR83jjg6t31Ihkm/gHx0
1u8USnBYj/PlvYMFxb6+lgHJhq0cNXfxu2AsFPQWBkPT5m+p8kWyPcPsTZLYJvCV
6oNq42FMWMaD6CGPh1at+ul/Qd6bEBy4em4B7UUZyXwls43qAzy79sQmEcIQlg4e
P17VE588bwHRbg3oJ1iHtRNrv7Ofmo3gUpKHq6rL8ARuPO//7d/gd+FkmU8K7If+
1U7RIQPMK5/HJhVIRaFEqDavC4km4DZs6Sui0kp89XVogMq9UEtBFocAdVfkblWZ
iN+XM30WxW1xk/cpk4EFETUqsoRmzFoPS6aW9hEl7O1VsXAI0BvttMM8Mmbbn2z+
gI8Qx6uzToIh9iDMu5Bc1FaYPr9Lc6G13ZBiz5w7TWR80uQAdkS5cPRefACfLXA6
pqBnoc2pLoojbR8KHkcQ
=EpLO
-----END PGP SIGNATURE-----

--zOTFI1MayFoZtDo5--
