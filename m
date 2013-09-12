From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Thu, 12 Sep 2013 15:40:02 +0100
Message-ID: <20130912144002.GT29403@sirena.org.uk>
References: <52304BFF.4060007@freescale.com>
 <20130911113002.GP29403@sirena.org.uk>
 <523186DF.4070203@freescale.com>
 <1378982395.2627.416.camel@shinybook.infradead.org>
 <20980858CB6D3A4BAE95CA194937D5E73EA0EE8B@DBDE04.ent.ti.com>
 <1378984665.2627.423.camel@shinybook.infradead.org>
 <20130912114831.GL29403@sirena.org.uk>
 <1378987323.2627.429.camel@shinybook.infradead.org>
 <20130912134345.GQ29403@sirena.org.uk>
 <1378994596.2627.449.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jPSbFJU26WoBJ9pH"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1378994596.2627.449.camel@shinybook.infradead.org>
Sender: linux-doc-owner@vger.kernel.org
To: David Woodhouse <dwmw2@infradead.org>
Cc: "Gupta, Pekon" <pekon@ti.com>, Huang Shijie <b32955@freescale.com>, Huang Shijie <shijie8@gmail.com>, "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "b44548@freescale.com" <b44548@freescale.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "b18965@freescale.com" <b18965@freescale.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "lznuaa@gmail.com" <lznuaa@gmail.com>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--jPSbFJU26WoBJ9pH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 12, 2013 at 03:03:16PM +0100, David Woodhouse wrote:

> Not so in this case. The controller driver appears "know", in advance,
> what commands are going to be sent. It preloads its buffers (the LUT)
> with what it *expects* us to send, and when we make a request it'll just
> trigger a send from the appropriate buffer. And it will crap itself if
> we actually try to send anything *different*.

> Or so I understand it.

Yes, that was pretty much my understanding of what was going on here -
clearly the way the driver is currently figuring out what the commands
are isn't good enough.

> So to go back to your question: the commands that it "knows" we are
> going to send are indeed specific to (one particular type of) SPI NOR
> flash. But there's nothing on the MTD side which justifies that
> assumption. Even if you use a different type of SPI NOR flash which uses
> different opcodes for its commands, this broken scheme will fall over.

Right, the specific opcodes do need to variable at least and should be
being provided by the driver for the flash - but is the generic format
of the commands and requirement to send them abstractable?  Given that
it's apparently been baked into hardware and based on having a quick
scan through drivers/mtd/devices I'd guess so but...

> Unless, as I say, I've completely misunderstood what's going on here.
> Huang?

...like you say some clarity would be good.

--jPSbFJU26WoBJ9pH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSMdI+AAoJELSic+t+oim9peAP/3EimMqbs4wjlFS+Rm9YLS5B
AVe3kCjqNRp+hl4R9OuY/izGJpdIp+VHbIuSknWfFuCTm1svi9WrtPzEWuvFpkSv
GhfXCacwehuix8TCjdpYS5XaNWvTaH8Otwg5hNWWYnCuDdXC54WOdXlIwB4uUwdq
KQXnBS9YZSoa9IhUTdhj4Ix5nEAHpPhhMVPM2OTFAEEBKvgTnDg/nRXpaQKDhWC+
Qj/OgwjmcJErlx5BFYGPBVTjXZ7AaWQtvVYpEHwLua8gBHY9Musw5D7aFjRAW84n
Cg6q7YGyTT8Wg/mA/b1oxi6mkbZA2cDneHlVHCWYlaJBafqvdIz0ehwmntg1kQ9M
/G/jSKCW8ub2/WI0YCnFwxNbH7ApM8RxH7CwF+OyTccfOzcegtxEKZ3K0+2kFRlZ
WkBCraqc/ug+b4jgfZyDuBcWCliO4blpxFAthrGEDnBG6aqkRdB2bN2kVtypoNoe
ejqDLcSWOwmD6rLWaJz0ur+Bac9t6YkEAy5zhYNhKkM1npmfC6imrStKW0XFOulT
f/TN9VJSGjkgw1I4yG1Uo87ebxhfRu7Ez7oWC1GzBDrltb6+B6Ywoch1HMTDF5U2
VZAOKDA09CQsFup8r4oEO5f5svpTXZ+ljrpOekPgH4SbZbWqw9Dkk6LN9IRNTtun
Q9jD+yk8tkdE3v076oZW
=Rnfo
-----END PGP SIGNATURE-----

--jPSbFJU26WoBJ9pH--
