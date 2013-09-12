From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Thu, 12 Sep 2013 14:24:04 +0100
Message-ID: <20130912132404.GP29403@sirena.org.uk>
References: <522FD78A.6080900@freescale.com>
 <20130911104126.GN29403@sirena.org.uk>
 <52304BFF.4060007@freescale.com>
 <20130911113002.GP29403@sirena.org.uk>
 <523186DF.4070203@freescale.com>
 <1378982395.2627.416.camel@shinybook.infradead.org>
 <20980858CB6D3A4BAE95CA194937D5E73EA0EE8B@DBDE04.ent.ti.com>
 <1378984665.2627.423.camel@shinybook.infradead.org>
 <20130912114831.GL29403@sirena.org.uk>
 <20130912115549.GI12758@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8Nop0+hX4DMSzQZB"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130912115549.GI12758@n2100.arm.linux.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: David Woodhouse <dwmw2@infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "b44548@freescale.com" <b44548@freescale.com>, "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>, "b18965@freescale.com" <b18965@freescale.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, Huang Shijie <b32955@freescale.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta, Pekon" <pekon@ti.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "lznuaa@gmail.com" <lznuaa@gmail.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, Huang Shijie <shijie8@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--8Nop0+hX4DMSzQZB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 12, 2013 at 12:55:49PM +0100, Russell King - ARM Linux wrote:
> On Thu, Sep 12, 2013 at 12:48:31PM +0100, Mark Brown wrote:

> > So, to repeat my earlier question can someone tell me what a LUT is?

> It's a very common abbreviation - Look Up Table.

Right, but that doesn't have an obvious mapping to SPI...

> More specifically, it's a set of registers which give the SPI controller
> a sequence of 16-bit commands to execute, which tell it what to do on
> the SPI bus.  Each register contains two commands, and it executes them
> successively throughout the register set until it reaches a STOP command.
> These commands tell the SPI controller the width of the bus, a command
> to send on SPI, whether to read or write data and how much, etc.

That's not quite the full story, these appear to be doing flash specific
things which depend on the partcular flash being interacted with and
which as a result aren't purely at the SPI level.  It's not clear if
this has some sort of generic meaning for flash or if it really is just
a controller specific implementation detail, nor is it clear what the
actual meaning of what the commands do is.

> If you read the comments in patch 5, and the code, it's all explained
> there.

The biggest problem with most of this stuff has been poor abstractions
and application specific assumptions so I'd not want to just assume that
there isn't some broader meaning that's obvious in the flash context, it
seems fairly clear that the hardware is specifically targetted at flash
so generic flash concepts seem likely to appear in the hardware.

Also bear in mind that we need a respin at the big picture level here,
the patches have already been discarded.

> I never saw this before until about an hour ago when I took an interest
> in it after your "what is a LUT" question, and it took less than 15
> minutes to work the above out.

I wouldn't assume that a quick scan is going to tell you what's going
on, nor that things have been explained clearly.

--8Nop0+hX4DMSzQZB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSMcBxAAoJELSic+t+oim9RTAP/iGqVjUCLlVAv3pIOPobIdt5
yQJrOHpk0Fza1dkBqU0r4hY7xqgCr2agvmGrqvpriR6QzfkXBcSfdkzjk6xH49M/
VK9Cokdcps4pW68dqDfflS6Gp4CEL5IUoJiPcmb3HhHxQwLZ4wlyn6+SH5Y7+R4x
zsGt42OzOAaQF3w0MqTDIobBqdUHxBxpiesw+uzgxZHovOr/2gomCJ5jsKJPyjYm
mM/Ok2Oxf3KGqyS8kAzmgkCZR1s+5/WhO6BPp7FbUIAfWXCRomdtu0g6BF4mtSqV
kuwdZOt2dHqAqP36azz0n22YOYWg0PBMC/friwZOU8e4VZq4egsKVUbsXmdhntk/
RsAHv7npvcigNFzyW607dGuDZAi9775JooztHoUd+nLVt0vUH4iu8QqBKJChj29W
WExYStIn0wXM1KJFgjjVIONGQF10gCLKKIAQe0Ijbo8Nn6FVOE73FEvLiZkGGh7m
1uk1ZNcFLisgpKjy0rK2P5NQ39cJg6dvgBkhN0NOwNGq+nm+zmVjVlCtWcNsMqaw
Z6EZI+nmNwtn0LPnCNlOgCIPre19MBBW3+AqoD4oYeyX5JlFrG548Y9PX2bABsQa
kC3Xk+B5TPGZwtXAYRpeq3RZKfrz9YrqzZQR0bUpK2QqnkBv8OhhaHrqPn02yBre
4PHj7NGGlsvP606tutep
=CRdX
-----END PGP SIGNATURE-----

--8Nop0+hX4DMSzQZB--
