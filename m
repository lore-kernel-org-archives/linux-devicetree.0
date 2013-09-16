From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Mon, 16 Sep 2013 11:19:12 +0100
Message-ID: <20130916101912.GY29403@sirena.org.uk>
References: <522D3B79.3060707@freescale.com>
 <52318953.6090405@freescale.com>
 <1378979431.2627.402.camel@shinybook.infradead.org>
 <20130913025827.GA3051@gmail.com>
 <1378999322.4210.95.camel@i7.infradead.org>
 <20130913041208.GD3051@gmail.com>
 <20130912205644.GW29403@sirena.org.uk>
 <52329AD3.2050608@freescale.com>
 <20130913102127.GD29403@sirena.org.uk>
 <52366F97.5030402@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KSBkawELapQe4tEB"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <52366F97.5030402@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Huang Shijie <b32955@freescale.com>
Cc: Huang Shijie <shijie8@gmail.com>, David Woodhouse <dwmw2@infradead.org>, "Gupta, Pekon" <pekon@ti.com>, "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "b44548@freescale.com" <b44548@freescale.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "b18965@freescale.com" <b18965@freescale.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "lznuaa@gmail.com" <lznuaa@gmail.com>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--KSBkawELapQe4tEB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2013 at 10:40:23AM +0800, Huang Shijie wrote:
> =E4=BA=8E 2013=E5=B9=B409=E6=9C=8813=E6=97=A5 18:21, Mark Brown =E5=86=99=
=E9=81=93:
> > You will need to create them.

> thanks. I will try to do it if i have to do.

> I just wonder : what other SPI controller driver would like if the
> controllers is going to support the
> quad-read ?

I would expect that most controllers would look just the same as they do
now except for the additional ability to do quad transfers - it'd just
get told that some transfers should use more data lines.

With this controller it looks like even for normal SPI transfers it's
going to work better knowing that it's doing flash operations.

--KSBkawELapQe4tEB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSNtsdAAoJELSic+t+oim9mGkP/1992DC4BiXxbY69xPfxxoyP
IlY8v2d+4ZVfuoDF1TMQqmrrUF0hvzHGlo8KwfGn+oqL7CTVP+6dHHkl9pa9JaGs
8+bvJfTMRx7h0I5g4yiTdGB376HEZApTyeecthMdLO9Is8iEqrttomTeCN08y5Bu
iUO+BxzYMy482XZwu9ZnlzHakGsl7ikbe6cHi09tSj4al+vFCaKAZ5ZW7oqfa4MN
BcjJJkZbQmFSzsiXrak2Za8zz7u6O40tofqYEl0It6cQAdMnXg0cV99I/19kUY5b
zFN944HVLa6dADTRJYe5eho3IBCE3lPH2PKAc1ujBRrL8UwTAn4LYja6Q/bvHhae
YzDV5dpP5NzAUX67YhnmB0oyiU5M8o9SIs1tMwlkH2ixUcUC91RnbhCMB7go+HLq
zBG6Rrflk+LnnSO9woopoUTsBlTKuQW1k33387BYaZMOq1HO98Rgq52CP/kHPDWY
1mfeR+SEhUZ1b6VeeeYLrfGLrQOVplJDows3pKoRbmyNqSxOiZNg7YvHveRoN6oH
d13hVwvcvFsqDYSQGDJvEOw41/J3Fa8Rqs7dq2Z8L1ZVLRDG4Q+4pZWZlqtPPPg5
EF0HesVJqt3JEFwGGWbHlweTx7kEJEp9LP923LCnwqFWTMpzmivpLnqNwHpvyDzk
bjey0oMby8KxcvfPDiaA
=ZNQO
-----END PGP SIGNATURE-----

--KSBkawELapQe4tEB--
