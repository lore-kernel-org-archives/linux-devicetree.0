From: Josh Cartwright <joshc@ni.com>
Subject: Re: [PATCH v7 0/3] Add arm pl353 smc nand driver for xilinx zynq soc
Date: Wed, 8 Jul 2015 14:40:51 -0500
Message-ID: <20150708194051.GP25028@jcartwri.amer.corp.natinst.com>
References: <1433786918-21500-1-git-send-email-punnaia@xilinx.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+ARLBH93C7pgvpZY"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1433786918-21500-1-git-send-email-punnaia@xilinx.com>
Content-Disposition: inline
Sender: linux-doc-owner@vger.kernel.org
To: dwmw2@infradead.org, computersforpeace@gmail.com, michal.simek@xilinx.com
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, grant.likely@linaro.org, gregkh@linuxfoundation.org, jason@lakedaemon.net, ezequiel.garcia@free-electrons.com, arnd@arndb.de, artem.bityutskiy@linux.intel.com, jussi.kivilinna@iki.fi, acourbot@nvidia.com, ivan.khoronzhuk@ti.com, joern@logfs.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, kpc528@gmail.com, kalluripunnaiahchoudary@gmail.com, punnaia@xilinx.com
List-Id: devicetree@vger.kernel.org


--+ARLBH93C7pgvpZY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 08, 2015 at 11:38:35PM +0530, Punnaiah Choudary Kalluri wrote:
> The following patches add arm pl353 static memory controller driver for
> xilinx zynq soc. The arm pl353 smc supports two interfaces i.e nand and
> nor/sram memory interfaces. The current implementation supports only a
> single SMC instance and nand specific configuration.

What's the integration plan for this guy?  Looks like we missed 4.2.
It'd be swell to get have NAND support land for Zynq in 4.3.

Assuming there is nothing else holding it back:

Brian- I'm assuming you'll want to take this through your tree.

It looks like most of the stuff in drivers/memory have historically gone
through arm-soc/drivers, Michal- does it make sense for you to pick up
http://lkml.kernel.org/r/1433786857-32575-1-git-send-email-punnaia@xilinx.com?

Thanks,
  Josh

--+ARLBH93C7pgvpZY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJVnXy/AAoJEKp7ZBKwQFArjI0H/ir6PMmzySwqvHfaDpdP6/ac
LvALkoUK74SaRfxjc5NrFzF7Aah0BnjAtKrW16SsJUoYyTEghx+sZ8BzAXwG0Y+C
iVBL5dqyeu3BjJQrup9FeiXvhQ+/VBDef2iabTeWrLjznxaXnTTEMWlLH4piZp6o
19cyseFNEAmD+jmDIXpEclLrEHkD/JcNSlRUcJXftt6DQOulwKLcxX4FIDRgk6VR
agp4jdPT9u8J8i7VapwVIa3kRfHD12bObe+e1Joor2ogsqj2psEbHl1hJ5T1er9T
kYU8xCBc8mIsvBfc4iCgCX6BqZmycZ2Wctmfg2BpaSnWCYNBy3TTehTuaIwzyr8=
=sIiL
-----END PGP SIGNATURE-----

--+ARLBH93C7pgvpZY--
