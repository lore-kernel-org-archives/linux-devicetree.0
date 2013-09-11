From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Wed, 11 Sep 2013 16:07:05 +0100
Message-ID: <20130911150705.GT29403@sirena.org.uk>
References: <20980858CB6D3A4BAE95CA194937D5E73EA0C7F4@DBDE04.ent.ti.com>
 <522817D7.1010206@freescale.com>
 <522D3B79.3060707@freescale.com>
 <20130909151450.GI29403@sirena.org.uk>
 <522EC33B.9000009@freescale.com>
 <20130910180704.GB29403@sirena.org.uk>
 <522FD78A.6080900@freescale.com>
 <20130911104126.GN29403@sirena.org.uk>
 <52304BFF.4060007@freescale.com>
 <1378908315.2627.392.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rOxm5kX/3wI4eitB"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1378908315.2627.392.camel@shinybook.infradead.org>
Sender: linux-doc-owner@vger.kernel.org
To: David Woodhouse <dwmw2@infradead.org>
Cc: Huang Shijie <b32955@freescale.com>, Huang Shijie <shijie8@gmail.com>, "Gupta, Pekon" <pekon@ti.com>, "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "b44548@freescale.com" <b44548@freescale.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "b18965@freescale.com" <b18965@freescale.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "lznuaa@gmail.com" <lznuaa@gmail.com>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--rOxm5kX/3wI4eitB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 11, 2013 at 03:05:15PM +0100, David Woodhouse wrote:

> Why can't the flash driver *provide* the required information?

Yeah, that's my question too...

> So far I seem to have got it into my head that we have a SPI controller
> which is connected to more than one device, and we can't send commands
> to one without sending to the other... and that means that we have to
> send a *NOP* to the "unwanted" device. Is that right?

That shouldn't be the case, SPI has a chip select line which is asserted
to talk to a particular chip, while it's not asserted the slaves should
ignore any activity on the bus.  If activity on one slave affects
another something is broken, this is the first time I noticed that being
an issue but I might've missed some of the MTD side of this thread.

--rOxm5kX/3wI4eitB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSMIcSAAoJELSic+t+oim9fkMQAI/Ep5QSXbRc/J33NxMd3s9c
2DrV5RgCfuYcqfOiMdTTnrRx7IYWc4yYvch72U/CtOSb4gfmdGM9ZKJAoHCpL+tD
YW25DYDGLFRaBtu+hwAB9UvnvjXIwHBnGdRDuoNmnsAiPAQr8Atw2e5v/W3C3cdE
husLhhKCAKMJ45NyRE/ZO1sCKXFCMMr5ZnyKR/LOjLNYD54dMV0NXTkWASK4T8fo
D3qE1AfP9RsL5qMjSMHwys+WEleI9XO7JJOW3BSfLReQO7qGVKnfDN2GlRztDzvh
WCtE+kk6zlVYFu0H4lFpGRPprvcYrdcbn3NJgHIpsQpb3TL9p8IkJ+HpBnpGmLV5
QD3Ny2FUKR3J1Jajyob6e4pilccnosYickj4Uf6tXvb+tuiGodhLGC0bsZIaWgEf
vFevtPkCRAHBz6D5BJ31qnZAxvyduoxb2wTCXqgd7t8W1iBKUYAyMx5pueh4+H71
/kFut1tbeI8bejcMh9JRfLX2Va9Zt9uQlw5COTcdo+MPm0zJSX/TbV4jvJ3sSHRB
WNIMrH8uHDsizMPvVbeb7TDuqsgUSMRvsOKgyQIryb54QlII9qkLfDLZvyZF2Jxl
2SRc803otfLIR2/pni9yq5NLUdAYoRiTpjQs2fxm4tICpiP7KI3YDMNIO1gdInDN
QZog5lj2QOg/WmKD5MLE
=3v7l
-----END PGP SIGNATURE-----

--rOxm5kX/3wI4eitB--
