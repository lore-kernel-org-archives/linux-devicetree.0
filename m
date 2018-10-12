Return-Path: <SRS0=J+7f=MY=the-dreams.de=wsa@kernel.org>
Date: Fri, 12 Oct 2018 14:13:07 +0200
From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v3 2/3] mmc: renesas_sdhi_internal_dmac: Add R7S9210
 support
Message-ID: <20181012121307.u3hwqmthoqllxd7r@ninjato>
References: <20181010150642.73890-1-chris.brandt@renesas.com>
 <20181010150642.73890-3-chris.brandt@renesas.com>
 <20181012110755.qdnevfoyq5qymf42@ninjato>
 <TY1PR01MB1562B5DCB7298E72C96B92998AE20@TY1PR01MB1562.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="67l76gewuthmtrwx"
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1562B5DCB7298E72C96B92998AE20@TY1PR01MB1562.jpnprd01.prod.outlook.com>
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>


--67l76gewuthmtrwx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Even after you pointed that out...I had to stare real hard to see it. I=
=20
> guess the brain corrects what you see.

Yes. c57d3e7a9391 ("i2c-dev: Fix typo in ioctl name reference") fixed
something in 2015 which was around forever. I had to look twice at this
patch as well.

> I was getting information through someone that was not in the design
> team. So to be fair to the chip design guys, I want to avoid the word
> "broken". They took the bit out of the hardware manual, and since the
> HW was designed to work either way (and the default register setting
> is for fixed), I consider it an 'unsupported feature'.
>=20
> So, how about a compromise of:
>=20
> #define SDHI_INTERNAL_DMAC_ADDR_MODE_FIXED_ONLY 2

Perfect. Now we nailed it, I think.

> I don't think this applies to Gen3. This is just a RZ/A2 thing.

OK. Thanks for the heads up!


--67l76gewuthmtrwx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvAj88ACgkQFA3kzBSg
KbYuaxAArFozp5f24+QVGZNC4XF4NEZSJtz+JO5yJMOOtU5w+hBrIVPV+aF5ae6E
T9znsxnPUV26TOBJeEvCGMSFyx5JQCfm9KlQ1ynKzpqtCk7fWd67ib+y34+tyRWh
X16ygX0r7BV3PCyypwb+3Taat4hOntaEYPQjU8L1Yu5cG9o0P0OF9ESMz7gvNkJg
NsGYsWtdqCtjiFviYyZvBaTHRdJ3oE1LNk04dTP2HG1ypziqutxB6s/dJJh3+5us
rQHq/5jS8NJkQf3e129YCdN+YJr0zMd9ixZX2iMK0dXP5OxjUp/gW781uyxDL0OW
RsRMKb1eywoOrWfrcgJ30/vaCpLHPaLK8FG4YsPBZ7lWE7OKoGFB0ZIo1rDyvDAi
bX50ZHWMdFHWU7t3Ob2Vh917Lrjckgi28bFanfubodxb6Z9e1leEzstyFv54N4W/
PN8dSEC+YTlvFLztOyFe4VJYgNO3gMQpQuAzKXyTm5aWW86YeZoXQ0Pi/vzx3MWu
JWKEJXOMtJFU7TwDghXPFq8SpNTn2/Ou+pIGmXUcxJxB4WVdW52UjVqi2uGfRCun
YDS4R0X+s7GEhvWhhvN6TsKigfKY2fPrjTCb0gO5cE8xZv10egs51rlOLuKUPlmJ
I2pEG+icOeSWusj/lvyvruMe9gzpTQIN2CbZ24LmyZ70YYEtOVo=
=O0B3
-----END PGP SIGNATURE-----

--67l76gewuthmtrwx--
