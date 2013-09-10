From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 5/8] spi: Add Freescale QuadSpi driver
Date: Tue, 10 Sep 2013 19:09:23 +0100
Message-ID: <20130910180923.GC29403@sirena.org.uk>
References: <1377828449-18912-1-git-send-email-b32955@freescale.com>
 <1377828449-18912-6-git-send-email-b32955@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J1XbgJTRJ3MoyE5N"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1377828449-18912-6-git-send-email-b32955@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Huang Shijie <b32955@freescale.com>
Cc: dwmw2@infradead.org, dedekind1@gmail.com, computersforpeace@gmail.com, shawn.guo@linaro.org, kernel@pengutronix.de, b18965@freescale.com, b44548@freescale.com, lznuaa@gmail.com, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--J1XbgJTRJ3MoyE5N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2013 at 10:07:26AM +0800, Huang Shijie wrote:
> (0) What is the Quadspi controller?
>=20
>     The Quadspi(Quad Serial Peripheral Interface) acts as an interface to
>     one single or two external serial flash devices, each with up to 4
>     bidirectional data lines.

For review and merge it would be much easier to send a patch which
implements just the basic SPI support for this device then add the
support for quad mode separately.

--J1XbgJTRJ3MoyE5N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSL2BQAAoJELSic+t+oim9naMP/jEQM+BNo8EYq3eMcA0hubCs
zmXEyNChALMpF5deesbymHqLjXCcQtWq03M2H2hQRCWDj2UudgPAT3eqhY8ARpWu
rndXxqDjZO0udP8FSPkNcZ5kTefFHAbO6RXB8OABoGP1IUVuhsBbYCXDnWYtjgM5
z/86yKV/gFB72GSor8aRR2+BkAjBYqJRMnPrDno6SNDX6eVo25PC9mo1EnH3ZBgw
EGEKF2+ObUNpeOotlvISOEsZJ4+2Z6AkYzY9e+KNDLhzVNkAKr9Ju6AUdstg798Y
p5gYerRbgXUqGzUpVzsRBt8KWfwA/ktw9ML/VlfCW38HeL3FJwVfOho/q8vPfj9y
qL0dzImeprqyYy0fiQLRrxbC3qugI/w4EqkO0BjV8XerRfIDDHsKzYqjEajTMA6Z
ey6piGPucYT8vkhhMkMaA55wPa5+DuywKqzxkTAAnTkWoY8CLVKsPOIbXBXi73un
eVrdusEVGBHTJA8mqQQkwYrkuySRWcWVHukgj5H6t8k/O0xw0TvLEZSrzxwtXxAg
RtTbyX1CF+Aw5/nHCh8BnC3fjFu0jcVqZYvOZZ2wqQnfPTVzv/PyNpdVm4bDOqTO
uZM0a5u1I3ElCHJjpce1lcDQgGPpzG9kINwH6tkIoLt+6KYzF1xWlMzv9uFJUL8b
ddEOKIIuj7Ruww8pbjCO
=2/Q8
-----END PGP SIGNATURE-----

--J1XbgJTRJ3MoyE5N--
