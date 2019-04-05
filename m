From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: sunxi: Add DMA support for sun8i
Date: Fri, 5 Apr 2019 11:37:42 +0200
Message-ID: <20190405113742.184234ca@xps13>
References: <20190404162111.22618-1-miquel.raynal@bootlin.com>
 <20190404162111.22618-3-miquel.raynal@bootlin.com>
 <20190405091607.2dzckvyqibs7xmew@flea>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6646406635027866202=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190405091607.2dzckvyqibs7xmew@flea>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============6646406635027866202==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/vd++0sxM_TLpDiWu=l8Dxew"; protocol="application/pgp-signature"

--Sig_/vd++0sxM_TLpDiWu=l8Dxew
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

Maxime Ripard <maxime.ripard@bootlin.com> wrote on Fri, 5 Apr 2019
11:16:07 +0200:

> On Thu, Apr 04, 2019 at 06:21:10PM +0200, Miquel Raynal wrote:
> > Allwinner NAND controllers can make use of DMA to enhance the I/O
> > throughput thanks to ECC pipelining. DMA handling with sun8i NAND IP
> > is a bit different than with the older SoCs, hence the introduction of
> > a new compatible to handle:
> > * the differences between register offsets,
> > * the burst length change from 4 to minimum 8,
> > * drive SRAM accesses through the AHB bus instead of the MBUS.
> >
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  drivers/mtd/nand/raw/sunxi_nand.c | 75 ++++++++++++++++++++++++++++---
> >  1 file changed, 68 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/s=
unxi_nand.c
> > index 4282bc477761..49cd5067adaa 100644
> > --- a/drivers/mtd/nand/raw/sunxi_nand.c
> > +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> > @@ -42,7 +42,8 @@
> >  #define NFC_REG_CMD		0x0024
> >  #define NFC_REG_RCMD_SET	0x0028
> >  #define NFC_REG_WCMD_SET	0x002C
> > -#define NFC_REG_IO_DATA		0x0030
> > +#define NFC_REG_A10_IO_DATA	0x0030
> > +#define NFC_REG_A33_IO_DATA	0x0300
> >  #define NFC_REG_ECC_CTL		0x0034
> >  #define NFC_REG_ECC_ST		0x0038
> >  #define NFC_REG_DEBUG		0x003C
> > @@ -200,6 +201,22 @@ static inline struct sunxi_nand_chip *to_sunxi_nan=
d(struct nand_chip *nand)
> >  	return container_of(nand, struct sunxi_nand_chip, nand);
> >  }
> >
> > +/*
> > + * NAND Controller capabilities structure: stores NAND controller capa=
bilities
> > + * for distinction between compatible strings.
> > + *
> > + * @sram_through_ahb:	On A33, we choose to access the internal RAM thr=
ough AHB
> > + *                      instead of MBUS (less configuration). A10+ use=
 the MBUS =20
>=20
> What do you mean by A10+ ?

I meant A1x, A2x SoCs. Not sure it matches a product line for you, so
please suggest something to mean "SoCs which are not A33" (so far I
think all worked without this).

>=20
> > + *                      but no extra configuration is needed.
> > + * @reg_io_data:	I/O data register
> > + * @dma_maxburst:	DMA maxburst
> > + */
> > +struct sunxi_nfc_caps {
> > +	bool sram_through_ahb;
> > +	unsigned int reg_io_data;
> > +	unsigned int dma_maxburst;
> > +}; =20
>=20
> Ideally, the introduction of that structure and the introduction of
> the A33 support should be separate patches.

Sure, I can split it up.

>=20
> >  /**
> >   * struct sunxi_nfc - stores sunxi NAND controller information
> >   *
> > @@ -228,6 +245,7 @@ struct sunxi_nfc {
> >  	struct list_head chips;
> >  	struct completion complete;
> >  	struct dma_chan *dmac;
> > +	const struct sunxi_nfc_caps *caps;
> >  };
> >
> >  static inline struct sunxi_nfc *to_sunxi_nfc(struct nand_controller *c=
trl)
> > @@ -350,10 +368,29 @@ static int sunxi_nfc_dma_op_prepare(struct sunxi_=
nfc *nfc, const void *buf,
> >  		goto err_unmap_buf;
> >  	}
> >
> > -	writel(readl(nfc->regs + NFC_REG_CTL) | NFC_RAM_METHOD,
> > -	       nfc->regs + NFC_REG_CTL);
> > +	/*
> > +	 * On A33, we suppose the "internal RAM" (p.12 of the user manual) =20
>=20
> Which user manual? It certainly isn't the A33 user manual :)

You are right it is the A33 NAND flash controller spec.


Thanks,
Miqu=C3=A8l

--Sig_/vd++0sxM_TLpDiWu=l8Dxew
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEE9HuaYnbmDhq/XIDIJWrqGEe9VoQFAlynIeYACgkQJWrqGEe9
VoT7JQgAnbw20yLfhshSpFrv+WX4hRMTD6hkwgSeuQQqjet8FEBQ8n03wLHS19cr
Pv3V3rrMuWVXw2BAjgs1i4hSn6oRxCZHAuKh2JAnSmMsHOCcliZ07w+kYuxtFncv
lLmWdrotkw/z6QdT0LSNevJCfmlFCe5Jy3XlxaTXgooREkuatOQCawU3q6bLFt4m
cRLBE6WXHuySpXmlj0p0MqkFOmIQz1EeSP+pYAgXK+557BnRrmY68wBUuS/zNY48
0RFytZsNvYHMgqLpqZxao23Lmv2Rg3S0b5DsEovVsvsbxVR6Nlcc96jMeSKTYxnF
qXs0fdqNNHBSXI6poDHlJA3Y4IJR/g==
=ph20
-----END PGP SIGNATURE-----

--Sig_/vd++0sxM_TLpDiWu=l8Dxew--


--===============6646406635027866202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6646406635027866202==--
