From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Thu, 12 Sep 2013 11:19:35 +0100
Message-ID: <20130912101935.GE29403@sirena.org.uk>
References: <593AEF6C47F46446852B067021A273D6D984000B@MUCSE039.lantiq.com>
 <20130905020435.GA3970@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA0C7F4@DBDE04.ent.ti.com>
 <522817D7.1010206@freescale.com>
 <522D3B79.3060707@freescale.com>
 <52318953.6090405@freescale.com>
 <1378979431.2627.402.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QfWJdLrspkYEar8t"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1378979431.2627.402.camel@shinybook.infradead.org>
Sender: linux-doc-owner@vger.kernel.org
To: David Woodhouse <dwmw2@infradead.org>
Cc: Huang Shijie <b32955@freescale.com>, Huang Shijie <shijie8@gmail.com>, "Gupta, Pekon" <pekon@ti.com>, "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "b44548@freescale.com" <b44548@freescale.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "b18965@freescale.com" <b18965@freescale.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "lznuaa@gmail.com" <lznuaa@gmail.com>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--QfWJdLrspkYEar8t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2013 at 10:50:31AM +0100, David Woodhouse wrote:

> Conceptually speaking, could it not be an additional argument to
> spi_write_then_read() ?=20

Note that spi_write_then_read() is just a helper for building up a spi
transfer in a common pattern.

--QfWJdLrspkYEar8t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSMZU0AAoJELSic+t+oim9OgwP/A3NE3wLHszemOMajGaIJ1G5
0RzzyNmrbRq6zsVfe7IWuEJ6aQeZOpR6MqUP5G5F+FugHbmz9XS4Ooixg7kIoxay
szEWH1i9iiYl205oJkCpOHvJmoEMxQCnODT56aRj67tIxjF6l3b/UVQbkRkJfG9u
wse+3wXk9D3NG+8Zhv85/8xmUadr89HlFW4mphmDBBNN9S7S0lvHiYFGI8tcxy3F
+vqN7oshMLI9KBYwf998BSoFjIEjnOHove6dFV2XYyYvSzO6qsuBGCEHO6KUkP4k
QL8gioNcrDIPZmX3D55Ffjhf83C9KbS1W2s48RDTlQjkRdUWq06W7cE7TpcSPND1
iRySOT1rDFMxTT2NkvknaQB8M/6+2YEtH+jQDM8lcWpEGNsGD/8Q0ozvj9nauC+X
J5y/i096Bm/uV8zNOKU9QSPddIXCUIcZi6M06OIMEmeS4ThMAmi5DHTDEXMjJzIk
QAzddXjAgcSWUV/zr5PPWoVSN0Nm+Vab/QgeEmQ5FuzAsba0yTViTQYHWYkA1DRp
gJQnAIRdDqUyzqlu2MCEnnYF1ji3wn31fOGMNu4/GLBjEdnBEkhwBYITTNShhSdx
XlsZLjCDE/OogbqC6iL9+BaWcOKIvLtKuW5VNx4RkX3ILxXuBVXgum8mUu/cVAc0
HwWsOSVcA9c+6F/UrYK7
=lNm/
-----END PGP SIGNATURE-----

--QfWJdLrspkYEar8t--
