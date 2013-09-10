From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Tue, 10 Sep 2013 19:07:04 +0100
Message-ID: <20130910180704.GB29403@sirena.org.uk>
References: <593AEF6C47F46446852B067021A273D6D984000B@MUCSE039.lantiq.com>
 <20130905020435.GA3970@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA0C7F4@DBDE04.ent.ti.com>
 <522817D7.1010206@freescale.com>
 <522D3B79.3060707@freescale.com>
 <20130909151450.GI29403@sirena.org.uk>
 <522EC33B.9000009@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p4I5Bchq69Fe6bBp"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <522EC33B.9000009@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Huang Shijie <b32955@freescale.com>
Cc: Huang Shijie <shijie8@gmail.com>, "Gupta, Pekon" <pekon@ti.com>, "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "b44548@freescale.com" <b44548@freescale.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "b18965@freescale.com" <b18965@freescale.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "lznuaa@gmail.com" <lznuaa@gmail.com>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--p4I5Bchq69Fe6bBp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 10, 2013 at 02:59:07PM +0800, Huang Shijie wrote:

> Since I do not expose any details in the spi-nor.h
> (i only add some commands in this header), how can i hides the details
> with an abstraction?

> could you explain it more clearly?

The code to work out what opcodes to send to the device should be split
out of the device driver so that other drivers talking to these chips
don't need to reimplement the logic and new chips with new opcodes don't
need to be added to multiple drivers.

--p4I5Bchq69Fe6bBp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSL1/FAAoJELSic+t+oim9XCEP/0H9VAyyQT+O7yKYKn22AznN
KeE+6bofaR0/N2/FOAWp3rdqf4DIx/pohzSyHd8ZLNcQwUVXbD3gZaVvY6azcQb4
fwzgR9nohl8iT/Lt6asx7150XVz0YRG5JyZxx/cPL6sgUsoXfA7aPQxKDabsgwXV
/wEHgQK5of7pCR7nW3VWYqm2SZwoAqxz+cTl9QpVn3ueZYhc7KpR03Dpxpf6lD2c
nNUQfep/ORSQoJWlQjpXFcOKtHeA7FzcaR1vwp32mobPzlrI53xJfQ9p8hcPmv2a
1BttBs7Hie7KBAXMatZa/7mStLIaCpXRTFJ6hUlQ7P4+NXQ/uX6p6OsGT4HCmvdx
dhKT4gZIuCspDRrwyUgZplKF3T+gB5NKUxzR+3QOVb4sDwIIKybIyFbOn0fVcEDq
BYQMXWKlWTc9b/j8PXLFRJPkMBVDo2+0QUL24kVUZqT2w3YJySJdOLt0qjFTBQge
QDB5YnaChZfWlsoycvXX+LGMnZ4PaTyNM9tUOpHCg4kSxqdU7zVp+m5I/i7ioaKf
FYQolZk9ESu9GO/6vqm6FnJM+NLJODjW5x44cm0r2LXkSSVNmqyiKTDV2DtxTnx0
iRxim48OGZg78xSvNR9m10oLEVMnIkTq5OvVdgDdn+jIadzWewfvp7KssgXKzkhB
pvLAg6CvzqjRq7kEK7OG
=7pQH
-----END PGP SIGNATURE-----

--p4I5Bchq69Fe6bBp--
