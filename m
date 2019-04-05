From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: sunxi: Add DMA support for sun8i
Date: Fri, 5 Apr 2019 14:25:54 +0200
Message-ID: <20190405142554.44e3da68@xps13>
References: <20190404162111.22618-1-miquel.raynal@bootlin.com>
 <20190404162111.22618-3-miquel.raynal@bootlin.com>
 <20190405091607.2dzckvyqibs7xmew@flea>
 <20190405113742.184234ca@xps13>
 <20190405105559.sqdhoa54ne7l4svj@flea>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7587269883574528177=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190405105559.sqdhoa54ne7l4svj@flea>
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

--===============7587269883574528177==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/eM8p=f+D3Tz8vTQ38onfZvM"; protocol="application/pgp-signature"

--Sig_/eM8p=f+D3Tz8vTQ38onfZvM
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

Maxime Ripard <maxime.ripard@bootlin.com> wrote on Fri, 5 Apr 2019
12:55:59 +0200:

> On Fri, Apr 05, 2019 at 11:37:42AM +0200, Miquel Raynal wrote:
> > Hi Maxime,
> >
> > Maxime Ripard <maxime.ripard@bootlin.com> wrote on Fri, 5 Apr 2019
> > 11:16:07 +0200:
> > =20
> > > On Thu, Apr 04, 2019 at 06:21:10PM +0200, Miquel Raynal wrote: =20
> > > > Allwinner NAND controllers can make use of DMA to enhance the I/O
> > > > throughput thanks to ECC pipelining. DMA handling with sun8i NAND IP
> > > > is a bit different than with the older SoCs, hence the introduction=
 of
> > > > a new compatible to handle:
> > > > * the differences between register offsets,
> > > > * the burst length change from 4 to minimum 8,
> > > > * drive SRAM accesses through the AHB bus instead of the MBUS.
> > > >
> > > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > > ---
> > > >  drivers/mtd/nand/raw/sunxi_nand.c | 75 +++++++++++++++++++++++++++=
+---
> > > >  1 file changed, 68 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/r=
aw/sunxi_nand.c
> > > > index 4282bc477761..49cd5067adaa 100644
> > > > --- a/drivers/mtd/nand/raw/sunxi_nand.c
> > > > +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> > > > @@ -42,7 +42,8 @@
> > > >  #define NFC_REG_CMD		0x0024
> > > >  #define NFC_REG_RCMD_SET	0x0028
> > > >  #define NFC_REG_WCMD_SET	0x002C
> > > > -#define NFC_REG_IO_DATA		0x0030
> > > > +#define NFC_REG_A10_IO_DATA	0x0030
> > > > +#define NFC_REG_A33_IO_DATA	0x0300
> > > >  #define NFC_REG_ECC_CTL		0x0034
> > > >  #define NFC_REG_ECC_ST		0x0038
> > > >  #define NFC_REG_DEBUG		0x003C
> > > > @@ -200,6 +201,22 @@ static inline struct sunxi_nand_chip *to_sunxi=
_nand(struct nand_chip *nand)
> > > >  	return container_of(nand, struct sunxi_nand_chip, nand);
> > > >  }
> > > >
> > > > +/*
> > > > + * NAND Controller capabilities structure: stores NAND controller =
capabilities
> > > > + * for distinction between compatible strings.
> > > > + *
> > > > + * @sram_through_ahb:	On A33, we choose to access the internal RAM=
 through AHB
> > > > + *                      instead of MBUS (less configuration). A10+=
 use the MBUS =20
> > >
> > > What do you mean by A10+ ? =20
> >
> > I meant A1x, A2x SoCs. Not sure it matches a product line for you, so
> > please suggest something to mean "SoCs which are not A33" (so far I
> > think all worked without this). =20
>=20
> The list is pretty small, so we can just name them. That would be the
> A10, A10s A13 and A20.

You really need a "A10+"-like acronym for these ;)

Ok, I'll add the list.


Thanks,
Miqu=C3=A8l

--Sig_/eM8p=f+D3Tz8vTQ38onfZvM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEE9HuaYnbmDhq/XIDIJWrqGEe9VoQFAlynSVIACgkQJWrqGEe9
VoTNfQf+OcDAHhqTlVVq3Rt+ffEn2mse0C7xKxVlfQemxrbjWif9v2zQwfBLNRBn
V0oE2Nlr6AiKOeeUtJO/XQIoCNLdZkTV+OKqxW2Z32ocBcK4j9nKr05o56KpJK4b
96tQl60ewX7dNDFyXon0mElcgD6SuCVscdXkkV8ldxXMafqBvttTrO/DM3ibVy8Q
rNaIG+aTiV73ePkdRcuoIV/vvU4HFIRBp8RG8hJaxBoECg2IOsYylsFHQXeymMS/
siLznMzphIsRxojTdTYWv8/Q44l1NgNZoBrm13MSxMW5W13PH1Tsh7VL7+Y3q7p9
z1pYT/mM2m8vbb/7z/+DGOjFWIevhg==
=2DlK
-----END PGP SIGNATURE-----

--Sig_/eM8p=f+D3Tz8vTQ38onfZvM--


--===============7587269883574528177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7587269883574528177==--
