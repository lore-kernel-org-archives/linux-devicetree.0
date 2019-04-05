From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 3/3] ARM: dts: sunxi: Improve sun8i NAND transfers by
 using DMA
Date: Fri, 5 Apr 2019 11:18:07 +0200
Message-ID: <20190405091807.itjp5uvsoqdfbm2u@flea>
References: <20190404162111.22618-1-miquel.raynal@bootlin.com>
 <20190404162111.22618-4-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8795330710686374329=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190404162111.22618-4-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============8795330710686374329==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zxt6af7sseqqtpzx"
Content-Disposition: inline


--zxt6af7sseqqtpzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 04, 2019 at 06:21:11PM +0200, Miquel Raynal wrote:
> In the current state, sun8i NAND controllers use PIO during
> transfers. Throughput can be increased thanks to the use of DMA
> (mostly during reads, because of the ECC pipelining feature).
>
> Besides the usual addition of DMA DT properties, because the sun8i

The only thing that "sun8i" means for Allwinner is that the SoC has
Cortex-A7 CPUs. You need to be more precise than that, why not just
use A33?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--zxt6af7sseqqtpzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKcdTwAKCRDj7w1vZxhR
xUmzAQCKDC0g8ADDqtg9WA3GPGUGbhgce5qS43k7aWzTbWxHpAEAgjNT5JwA0RLl
xWiPemPjxbnMMuWdZpeP70lgk6jSCQ4=
=1KTO
-----END PGP SIGNATURE-----

--zxt6af7sseqqtpzx--


--===============8795330710686374329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8795330710686374329==--
