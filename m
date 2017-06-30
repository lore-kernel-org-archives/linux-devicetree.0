From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH 0/4] pinctrl: Add USB support for Aspeed SoCs
Date: Fri, 30 Jun 2017 10:54:58 +0930
Message-ID: <1498785898.5203.12.camel@aj.id.au>
References: <20170627021214.23323-1-andrew@aj.id.au>
         <CACRpkdZpJuaedE=04we_bcLB7qzOdvJAz4QmTfnuZA=5PrMf0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-4p9Wm0Z7u8HgnG5MYdFt"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZpJuaedE=04we_bcLB7qzOdvJAz4QmTfnuZA=5PrMf0g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Ryan Chen <ryan_chen@aspeedtech.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org


--=-4p9Wm0Z7u8HgnG5MYdFt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-06-29 at 14:53 +0200, Linus Walleij wrote:
> > On Tue, Jun 27, 2017 at 4:12 AM, Andrew Jeffery <andrew@aj.id.au> wrote=
:
>=20
> > With recent interest in the USB virtual hub in the Aspeed SoCs[1] it is=
 a good
> > time to add pinmux support for the USB ports and controllers. The earli=
er
> > series of pinmux patches for the Aspeed SoCs focussed on supporting pin=
s which
> > were capable of GPIO. This is not the case for the USB pins, hence they=
 have
> > been unsupported until now.
> >=20
> > Rob: I know you've mentioned previously you desired complete bindings t=
o be
> > provided up front, so apologies for continuing to add functionality. Th=
is looks
> > to be the last of it.
>=20
> Waiting for DT review and addressing of Beji's comment for these.

Okay, Rob's now ack'ed the bindings and Ben's comments should amount to
a commit message change. I've reworked it.

>=20
> Please resend after the merge window.

Will do.

Thanks,

Andrew

>=20
> Yours,
> Linus Walleij
--=-4p9Wm0Z7u8HgnG5MYdFt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZVahqAAoJEJ0dnzgO5LT5D4YP/1S7guRRVEWH2SvVIrGDDBtf
XQFaQsj1aaT30HCoeBUAVU0c+oQ5CILU5o34Sgix2LFugm+Ef0THj9RueQe3q8yk
JrTTekw1Y+a9E1pvn0oF4Hn62xxQldHMS654rFxa6E01XXu2LUa4vDUN+5OTp143
6rsGngKy6dJCs37TgGrD/jUbMSyvqtfJpE40FXIczc5e8YUudNA+lhdnCp7THV85
K2I5uW2RWuNu3Yeu54pCbfveritsepRFVH3bqR6KVxq5ZufMl2Fj4/woZEzADdai
w0ddbtbpAMYkj3RbMa2x3FyvjrXwXvBqPdSEyKE7T442n7KDdKHvPVzm0lGdaMXn
C1zK3/3Y3aplKsI5f3DIbnVlP/YDxRiJopL4AxFfAL2aeZQ//hu4YRirK2uA0jP4
tKsZQvGOVImVmEpv3SsZYxj9/UO0REguBJlsyhpNTZmvO3Tg3dF833WEdJzMvlmP
DKRureS52I8POvwNM1ANTRFpFTNeD8fbGmmbB92LGZCSTnX9J0jibvwM1BJbtKOd
0HMIP3haOD8fUYdh+ekKSTLVpbVhd+vc34jHMl4cw6C334V4Cv4YhepBnCPif40G
r3i4FWHLBCL9jBXfn0tfNDf3/67idy/vsa3c2B1Jpepwe51Ni9D6RZmMzWikD5R4
WPrP1HH8GvlSVNYxeGI1
=6zej
-----END PGP SIGNATURE-----

--=-4p9Wm0Z7u8HgnG5MYdFt--
