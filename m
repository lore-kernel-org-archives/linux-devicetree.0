From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Thu, 12 Sep 2013 21:56:44 +0100
Message-ID: <20130912205644.GW29403@sirena.org.uk>
References: <593AEF6C47F46446852B067021A273D6D984000B@MUCSE039.lantiq.com>
 <20130905020435.GA3970@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA0C7F4@DBDE04.ent.ti.com>
 <522817D7.1010206@freescale.com>
 <522D3B79.3060707@freescale.com>
 <52318953.6090405@freescale.com>
 <1378979431.2627.402.camel@shinybook.infradead.org>
 <20130913025827.GA3051@gmail.com>
 <1378999322.4210.95.camel@i7.infradead.org>
 <20130913041208.GD3051@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/zcpknKq7UV0+s15"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130913041208.GD3051@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Huang Shijie <shijie8@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Huang Shijie <b32955@freescale.com>, "Gupta, Pekon" <pekon@ti.com>, "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "b44548@freescale.com" <b44548@freescale.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "b18965@freescale.com" <b18965@freescale.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "lznuaa@gmail.com" <lznuaa@gmail.com>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--/zcpknKq7UV0+s15
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2013 at 12:12:14AM -0400, Huang Shijie wrote:
> On Thu, Sep 12, 2013 at 04:22:02PM +0100, David Woodhouse wrote:

> > But the controller driver shouldn't *have* that incestuous knowledge of
> > the command set of the chip that happens to be connected to it.

> I think the controller is designed for the NOR flash, yes, a little
> strange.

I think this is part of the problem - you're trying to represent
something that isn't really a SPI controller as a SPI controller (or at
least trying to implement functionality beyond that which a SPI
controller has).

> Mark and you want to create the LUT instruction sequence at the runtime,
> But there is some disadvantage if we do so:
>   [1] low efficiency:=20

>   [2] we may can not create all the LUT instruction sequence at the
>       runtime. For example, the buffer program(OPCODE_PP):

>=20
>   [3] We may can not create the LUT instruction sequence at the runtime,
>       since we can not get enough information from the spi_transfer{}.
>       A whole LUT instruction sequence may needs the following info:

What this is saying to me is that you should not be impementing this as
a SPI controller, trying to do that is breaking the abstracton that SPI
is offering.  Like people have said SPI is just about byte streams.

I think what you should be doing is refactoring the MTD code which
interfaces to SPI flashes to split out the code so that there's an
abstraction which can express what this controller (and presumably
other controllers) can do and then implement this functionaltiy at
that level.

--/zcpknKq7UV0+s15
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSMiqJAAoJELSic+t+oim9Qa4P/ApUZGTvCsWc4OMS5TmvcJDv
5fGsJgwlja9yyvL4ELrnMHVszkFyPY7ccUP6exxH4L8Rrc2FyPUZFTnehmEtL+bL
/mW3b0/fbhcDFeiUw7GtfXdwrAloVCsnbQKja0raQsFf5CpGv6XVQHIsmcqOzKT7
ek1jF4XfuN9smH4p9Ug3NVcppVi6gLmI8tOLTqFO5bVIomyCpmyXve5BvGe9B6AH
hOin3NRrxBTmKgUGr82X1iMUwVuwN0iu9S+iaDKT2+wAa3S1EziA+nw0tAkMRnER
eyqhJioB2/ENtE+mTxxxna5cQW+6awxLUI7RZNmPmPj9CKAPIlQsnI2e13u9JVCi
XLepO0m7acAoQfmMGDVj97OlJEnPPWl7amW08F7xM+o+IIz2KTOeZv/ngPtBRvTM
A+vfT3p/G+wfdeQBG2H9tRZdyi5/yueq0UmoJVyph+HggkM9gcGvDsK1MwqSp5FG
3tgwG9faKqb+Q6VOfpO+7NagPP0Mhx9efyn77eDu/N2uZVNHWojNZmXkPI/BA6WN
6BIt2ce+EeytPw0XMnPKRqTUAlan3q2Z5Tv3plcUe1rtDa8yPuzBI92AsgcIUKgV
SGrrVuSeZlbwPuw3WFAEwM1tKPPAjLZ4D3kB6A9CgPl/Z7Ad+40auWIIr3DYP8ym
VAFW3DkrMRN2crp9SsR/
=w7MY
-----END PGP SIGNATURE-----

--/zcpknKq7UV0+s15--
