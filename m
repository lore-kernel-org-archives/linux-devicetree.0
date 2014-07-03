From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/5] regulator: act8865: set correct number of regulators
 in pdata
Date: Thu, 3 Jul 2014 16:58:53 +0100
Message-ID: <20140703155853.GH410@sirena.org.uk>
References: <1403451105-31929-1-git-send-email-b.galvani@gmail.com>
 <1403451105-31929-3-git-send-email-b.galvani@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OUFKJBnicyeI7VqU"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1403451105-31929-3-git-send-email-b.galvani@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Beniamino Galvani <b.galvani@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Wenyou Yang <wenyou.yang@atmel.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--OUFKJBnicyeI7VqU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 22, 2014 at 05:31:42PM +0200, Beniamino Galvani wrote:
> When platform data is populated from DT all the regulators are
> instantiated and the value of num_regulators should be the number of
> all available regulators rather than the number of matched ones.

Applied, thanks.

--OUFKJBnicyeI7VqU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTtX25AAoJELSic+t+oim9sGgQAIpfZcSIWMeVc/yzHJQ0mMXi
or7ZADZaOS0DNetatf+YH2jpKjY0+EZPOdSzNI3lbtelXLriwAk5VJ0K8a/civpl
FSBQz8U1pbJfF3FLgb2RIG/Gw+aANPkw05kmxeM6EsEXhm2y0QiYiOIbezmnoKhz
uGvXeAqa+wd32ncCnDsIkzVrfQmjndtEUBBSinlE/5v0PoSlYTR4wxGp6H1N96vK
RHjEIqdTeL9Tr9rShjz/6K0EzT1Aksu5Bq77c0E8nN7fl43vvy3uW163p2/r4sKz
US9trKEdMNJ8dbrVbsCeLcLigsK3fU/KluNASS8s4OH2OrTkpNbNa/jOAIAC0fzo
80QrZebEhVdQQF1IXDgyjLU1ymxKjWkuzaQKSuJPzvJpWWMcjbI3hl0NHfjgPk0s
97GyN6/SdNbm5GhqYCOioOyB5erWeLaj5zu64N9DCtoQufRV2rbQnGDkH+xKvzjH
7AQf/77U6q6rRzZ6qSiWgisyOtyqRqEkHMmPRGzJlxsaEhZW55dKE1TeyCwvpkDX
tYVvRSZvYFlxhB8zN1QPlRmO5GYdDKoKA7MBIE6syak36jsCQHQmSKn6Vk3MdD0k
1HxBKdufSa0SfQLV81hTo9ZQlgHrr/Qt8geC0camax/dmhgvgjx4HWtMruFXxxuj
S1K0LrfmneI8eS5Nh8er
=97YU
-----END PGP SIGNATURE-----

--OUFKJBnicyeI7VqU--
