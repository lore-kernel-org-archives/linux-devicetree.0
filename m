From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: sunxi: Improve A33 NAND transfers by
 using DMA
Date: Mon, 8 Apr 2019 10:44:07 +0200
Message-ID: <20190408084407.7wauneg3wzjsqg4l@flea>
References: <20190408074147.26797-1-miquel.raynal@bootlin.com>
 <20190408074147.26797-4-miquel.raynal@bootlin.com>
 <20190408084015.6iw74ub5ay6q73v2@flea>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1110615940704874896=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190408084015.6iw74ub5ay6q73v2@flea>
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


--===============1110615940704874896==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nrzlspwk2lkrapo4"
Content-Disposition: inline


--nrzlspwk2lkrapo4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 08, 2019 at 10:40:15AM +0200, Maxime Ripard wrote:
> On Mon, Apr 08, 2019 at 09:41:47AM +0200, Miquel Raynal wrote:
> > In the current state, A33 NAND controllers use PIO during
> > transfers. Throughput can be increased thanks to the use of DMA
> > (mostly during reads, because of the ECC pipelining feature).
> >
> > Besides the usual addition of DMA DT properties, because the A33
> > NAND DMA handling is different than for older SoCs, we must also
> > update the compatible which has recently been introduced for this
> > purpose.
> >
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>
> Applied, thanks!
>
> The rest is
> Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Actually, the A23 was introduced before the A33, so we want to use
that in the compatible.

I've updated the patch while applying it, you might want to do the
same.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nrzlspwk2lkrapo4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKsJ1gAKCRDj7w1vZxhR
xb6tAQCFytNO1wQYB2mMklz+JlqcgAGC0MQGJZNsg63QE75RUAD/WI8SmGt2IZbh
N9SXJSTVexPP7u9sovNL6dP9D3/BLAA=
=whwQ
-----END PGP SIGNATURE-----

--nrzlspwk2lkrapo4--


--===============1110615940704874896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1110615940704874896==--
