From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Wed, 11 Sep 2013 11:41:26 +0100
Message-ID: <20130911104126.GN29403@sirena.org.uk>
References: <593AEF6C47F46446852B067021A273D6D984000B@MUCSE039.lantiq.com>
 <20130905020435.GA3970@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA0C7F4@DBDE04.ent.ti.com>
 <522817D7.1010206@freescale.com>
 <522D3B79.3060707@freescale.com>
 <20130909151450.GI29403@sirena.org.uk>
 <522EC33B.9000009@freescale.com>
 <20130910180704.GB29403@sirena.org.uk>
 <522FD78A.6080900@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wjfWYMzGYPVGkkPO"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <522FD78A.6080900@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Huang Shijie <b32955@freescale.com>
Cc: Huang Shijie <shijie8@gmail.com>, "Gupta, Pekon" <pekon@ti.com>, "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "b44548@freescale.com" <b44548@freescale.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "b18965@freescale.com" <b18965@freescale.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "lznuaa@gmail.com" <lznuaa@gmail.com>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--wjfWYMzGYPVGkkPO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2013 at 10:38:02AM +0800, Huang Shijie wrote:
> =E4=BA=8E 2013=E5=B9=B409=E6=9C=8811=E6=97=A5 02:07, Mark Brown =E5=86=99=
=E9=81=93:

> > don't need to reimplement the logic and new chips with new opcodes don't
> > need to be added to multiple drivers.

> Since there is no standard for SPI-NOR commands, we _should_ add new
> code for
> new chips with new opcodes. For example, if a new chip supports the
> quad-read with
> a new command 0xef, we can submit a small patch for m25p80 to fix it.

> We have to do it in such way, no shortcut.

So why does the SPI driver have references to the opcodes in it?

--wjfWYMzGYPVGkkPO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSMEjSAAoJELSic+t+oim97HUQAJY+pN3Let8YAuzEBveGCVnZ
kDkH2KjQ4t/r34fP8hkAIfdJzomluGLR9yMqkmNPRrceAUNgOf3VUb1YllGJWool
UgDmlE5PuXcvhT4r7T2MswdylopHFrpIzCnvc24xdkipqncd5XFboJHMoSAcMU83
KXWXW/aJRbtJkIDktnsznIQ3eAt1Jp4e58jkElxjID6iyewm0tgI8Hc16PsapaSr
h7/6x3xxvG7SPolKdRfful/xTUyU4NI6YkY1ZJWCN7jwxP9LofWEujHp1yp8VKua
KgTPIGvTSvx+NYedaAQ6bdKoeVZLcAhpLuXv8tZl6Mt6zgRupJEJZqlxdnmfEijR
U7WmvViz6sMnngcRZELHViAH4bintqkuipoCefnGKC/ON7fbVQx/nO8AhxhoRSbL
8OlIVj4jyNjcYZkXZCrV8FSwf92ymy/2J694V2cjnTv++QXlPANubeBx0lyaehcG
uNDi8f36XgfIamUWQtdnN29KdM0cZIxPVINsU+9i0woK8ATcfVSokakUh8dAwnoV
KY0dpeLIuQXcafLD7VJ8BSrxcySDrNKYMRk+6+uQOjpJc+YWRj99faTmMr9weCBP
69U31VaFsdKurNDAhasxsHyLiXXQRggnZbY6bqjnbtTpJYhf+tkdtunFotEXk2X2
xiOMT7kySAOGDo8QIT6c
=0lyZ
-----END PGP SIGNATURE-----

--wjfWYMzGYPVGkkPO--
