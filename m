From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Wed, 11 Sep 2013 13:35:53 +0100
Message-ID: <20130911123553.GS29403@sirena.org.uk>
References: <522817D7.1010206@freescale.com>
 <522D3B79.3060707@freescale.com>
 <20130909151450.GI29403@sirena.org.uk>
 <522EC33B.9000009@freescale.com>
 <20130910180704.GB29403@sirena.org.uk>
 <522FD78A.6080900@freescale.com>
 <20130911104126.GN29403@sirena.org.uk>
 <52304BFF.4060007@freescale.com>
 <20130911113002.GP29403@sirena.org.uk>
 <20980858CB6D3A4BAE95CA194937D5E73EA0EAA7@DBDE04.ent.ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="P1JQkLuGKYyNXo1a"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA0EAA7@DBDE04.ent.ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: "Gupta, Pekon" <pekon@ti.com>
Cc: Huang Shijie <b32955@freescale.com>, Huang Shijie <shijie8@gmail.com>, "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "b44548@freescale.com" <b44548@freescale.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "b18965@freescale.com" <b18965@freescale.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "lznuaa@gmail.com" <lznuaa@gmail.com>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--P1JQkLuGKYyNXo1a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 11, 2013 at 12:26:10PM +0000, Gupta, Pekon wrote:
> Hi Mark, Shijie,

> > Indeed - what I was wondering was if those opcodes could be requested
> > from the flash driver rather than coded in there.

> As the talk is going in SPI framework direction, therefore requesting again..
> please do not clutter the *generic* SPI framework to pass on opcodes from
> flash-driver (like m25p80). (Q)SPI framework should remain generic and
> independent of any upper layer drivers.

No, this isn't about the SPI framework doing this - this is about
something outside the SPI framework being able tell the SPI controllers
that want to know what the opcodes are so we don't have to do this in
every driver that may be affected.

--P1JQkLuGKYyNXo1a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSMGOmAAoJELSic+t+oim9DxgP/1jg0CSr2Rawl3g96b0xvuxw
v8JJYQ22eBTzjqDlWed7tKITRAkbO54uWOv16G9AwlwuKPuMFgMaeMALnyJ1QVdh
RuMRHwpN6NWfDKSSe/ikyqaxUGVS/V23hU1lay/FidlH/vO6w++BfJiBmBpkam3E
rHyPXbAbt3J2OaokzL/I8Yh+A2sEHKip42qe00stxSVwZkStQs9vDZDqn+wej+7z
Mv1VlwSRb0cYDU819jGaBuy/dTSiUJ1qRnVhHvgAQNK6CyyO54Dks7VFiyc5PBUT
px5ItJBsIagizFqgmfb/rkOyXz1+/0r8XP+ANrfEOumYkGNerUsZwFGBATzHjVDL
pFiTaNZhEB4evzMC2xSLZQCLIZexAWLfUzSqegbqjFxZ62UEBI4oUcTy/Bz7/F/w
BLZmekeiomuemHalCTFrFUtumSk46/gmvzklE/ioW/OFkdHYcDiZFIHzLRNagtzb
YEfiLtbE8Lf0KbvPwIxRzrbmB/3yye/KRKK8GMAHzWYrdwcFsm29r7GjaXk1bOqH
lOZytmu82eRUhyl/CJgK1caa+Uqfro02wmSuiTcBjJnG198aLn6Idin/APel7kgq
lQKxroBwbt1X2iRkbw3LkFIn6p/Fdt7XvlIA8f6yX6gjwBWd70csyO1PpXRrdGuo
G9HAT51H7Wq9ztTMLEIG
=00wZ
-----END PGP SIGNATURE-----

--P1JQkLuGKYyNXo1a--
