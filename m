From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Thu, 5 Sep 2013 14:50:32 +0100
Message-ID: <20130905135032.GB3084@sirena.org.uk>
References: <20130904113322.GA5859@sirena.org.uk>
 <20130905014350.GA2261@gmail.com>
 <593AEF6C47F46446852B067021A273D6D984000B@MUCSE039.lantiq.com>
 <20130905020435.GA3970@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA0C7F4@DBDE04.ent.ti.com>
 <522817D7.1010206@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA0C885@DBDE04.ent.ti.com>
 <5228369A.9000904@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA0C907@DBDE04.ent.ti.com>
 <52284F32.2020302@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aNVYTE9V2LY2iLDz"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <52284F32.2020302@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Huang Shijie <b32955@freescale.com>
Cc: "Gupta, Pekon" <pekon@ti.com>, Huang Shijie <shijie8@gmail.com>, "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "b44548@freescale.com" <b44548@freescale.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "b18965@freescale.com" <b18965@freescale.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "lznuaa@gmail.com" <lznuaa@gmail.com>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--aNVYTE9V2LY2iLDz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2013 at 05:30:26PM +0800, Huang Shijie wrote:
> =E4=BA=8E 2013=E5=B9=B409=E6=9C=8805=E6=97=A5 17:11, Gupta, Pekon =E5=86=
=99=E9=81=93:

> >Anyway, if you really want to continue with this is, then please re-name
> >include/linux/mtd/spi-nor.h to
> >include/linux/mtd/spi-fsl-quadspi.h
> >because something specific for your driver should not conflict with
> >generic spi-nor framework added later.

> i think there is no specific thing for this driver. The S25FL128S is
> a common flash,
> other person may uses it too. Could you show me what is specific?

> so, i prefer to spi-nor.h.

Looking at the current header there just seem to be defines in there, no
abstraction for the chips.  Perhaps that is what is missing?

--aNVYTE9V2LY2iLDz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSKIwdAAoJELSic+t+oim9m1wP/jyT+YWxdxlEc1I5aRC3p4sm
iXeNqA8HphFYUjFuUrWi/+VItT7H61LMwC7mqsYRI4KqWEWOJR5vkFhI2MoENY78
Hw1kpNEVuV6H/bXmumJEPF8A4D6imRNMvBYh/rX6kbO2owVEB2od5ExsZr1o7a10
3gRafagL4eiMjTxMhuOmrGUb1zGrxEvvHrT/WOyQ2gIQg5lRrBxK4A5X+31nafMA
MqWWc1zV9aHMaPuHy/z2QN62Uw6bPset86q3Huio338S6eFXJVxzN8IDUrjG65fy
Hlb6TxIRRu/XwSlNEjJ9YL2QiYK/u53dFYGGF6DlXbceozH6P7phVNRPskdOoaqn
/r/q7NjrF4R9zBvs6Nd36KLwplbvlUhtEPASm0uEHygFpY5HogkSyxF3WXZNPgeP
ButtWxVWLx+aHleq3MrLHWX7LIaeXtaS45Ox1Nd45dGYwOuEhz4CfDjjHvVZWKtd
VvrdX3QvA5wCXGl109XW3m9/eyuhmFaZ+spVmFyKHa7fI8N7z+YfMlIorkzAvuAW
VC9yj1+aLAE8lMkcdsH1TsbA57TL62Y2TjxAD9iG9o2klZ/R2cQgEGiGEXTCd2Rb
1ep9rWHMgftdgYbYxXtZi4IrXcvXgv/j5vxHCQG0WC6KzFMV/NzpENTudYEQypz7
rLLzm3OHARXdKWi1roOY
=N3yd
-----END PGP SIGNATURE-----

--aNVYTE9V2LY2iLDz--
