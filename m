From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Thu, 12 Sep 2013 14:43:45 +0100
Message-ID: <20130912134345.GQ29403@sirena.org.uk>
References: <522FD78A.6080900@freescale.com>
 <20130911104126.GN29403@sirena.org.uk>
 <52304BFF.4060007@freescale.com>
 <20130911113002.GP29403@sirena.org.uk>
 <523186DF.4070203@freescale.com>
 <1378982395.2627.416.camel@shinybook.infradead.org>
 <20980858CB6D3A4BAE95CA194937D5E73EA0EE8B@DBDE04.ent.ti.com>
 <1378984665.2627.423.camel@shinybook.infradead.org>
 <20130912114831.GL29403@sirena.org.uk>
 <1378987323.2627.429.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zZuJxO8a+F9lN2Mr"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1378987323.2627.429.camel@shinybook.infradead.org>
Sender: linux-doc-owner@vger.kernel.org
To: David Woodhouse <dwmw2@infradead.org>
Cc: "Gupta, Pekon" <pekon@ti.com>, Huang Shijie <b32955@freescale.com>, Huang Shijie <shijie8@gmail.com>, "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "b44548@freescale.com" <b44548@freescale.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "b18965@freescale.com" <b18965@freescale.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "lznuaa@gmail.com" <lznuaa@gmail.com>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--zZuJxO8a+F9lN2Mr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 12, 2013 at 01:02:03PM +0100, David Woodhouse wrote:
> On Thu, 2013-09-12 at 12:48 +0100, Mark Brown wrote:

> > So, to repeat my earlier question can someone tell me what a LUT is?

> I only know what's in the patch that you have also received, but it
> seems to be a table of commands. To send a given command to the flash,
> you write the actual command to the some slot in the LUT, then 'trigger'
> it by writing its index to another register.

OK, so the LUT itself isn't a generic mtd thing, though the commands
it's apparently sending are?

> I think this whole thing is about the fact that they are *prepopulating*
> the LUT with a set of 'known' commands, and have incestuous knowledge
> about what commands will be used, rather than being a truly generic SPI
> driver and being able to cope with *any* commands that might be sent to
> the slave(s), dynamically setting up to the LUT as required.

Yup, and I'm also worrying how this is going to work if the flash driver
starts supporting SPI controllers which can do the extra data lines but
are otherwise dumb and so need the device to explicitly send commands to
the device.  SPI is just byte streams, it's got no idea about commands.

I'm wondering if we want an abstraction between SPI and the flash chips
which understands SPI commands and could possibly have drivers itself?

--zZuJxO8a+F9lN2Mr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSMcUOAAoJELSic+t+oim9RvsP/1Y8LquakOyNWUP3+DxykG8s
2mkslE8sFgmFOd1sgohnzA+iySU4eC9tmB98pvqkU2/Kz0h0DKEOQsIU0F/a09U5
LWsu5ln758Xva6myfOI4DRc2vartDFtJH5omy0f0icB2aSOZSqDzQwLozlx3FOgr
iSEW8mYJNnuUPo92vTk1syR63cjl0acyQpWIxKpEmpzpOC0hh/L41LAfwK1Pgdgp
3KELViDhjLPhVyDWPHAPUVJHye6Z9hXg/D7KccukCyP5401ktN7gEOsKmQ7yGOPD
F+nMIk+BX/ycWnjNkdV1O9s0mm8u2MX/HF5+QgNOQeudFeRSQqW5wDYL9WbWNGVE
KDfzMCeu4gU24OIcjeGKLzxtVW7+0d2OhwEH+y4U5rjJpSYpQUS3IBzt+7ktyyrp
KLo5H+Y8s5+Abz8BEiWq+H52345PpiJD3xsMAWQebt0bXsbwqpKnVvZk/+5Ha852
H7mNoiRmQTXskgQy8cK2NZC48eBnx841lw29MrKWadRVaNBGzSJLMF7gvvarEy4c
L9lnBo0SfmthulH2z5/XMN2l35dReNxfCw2HQ93rPsxXANvSM01yPGgUEUhAYyDZ
wv3rsvbE2Khh1eDYkoWv03oVDzyzV3x8IlovYhcL0UzgcJMO3XOT8NPvZvw0mFow
k+yefHRCCREukzeuP16B
=f8AR
-----END PGP SIGNATURE-----

--zZuJxO8a+F9lN2Mr--
