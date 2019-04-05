From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: sunxi: Add DMA support for sun8i
Date: Fri, 5 Apr 2019 11:16:07 +0200
Message-ID: <20190405091607.2dzckvyqibs7xmew@flea>
References: <20190404162111.22618-1-miquel.raynal@bootlin.com>
 <20190404162111.22618-3-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3158111372039326205=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190404162111.22618-3-miquel.raynal@bootlin.com>
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


--===============3158111372039326205==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pnrghmq37tomg7yv"
Content-Disposition: inline


--pnrghmq37tomg7yv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 04, 2019 at 06:21:10PM +0200, Miquel Raynal wrote:
> Allwinner NAND controllers can make use of DMA to enhance the I/O
> throughput thanks to ECC pipelining. DMA handling with sun8i NAND IP
> is a bit different than with the older SoCs, hence the introduction of
> a new compatible to handle:
> * the differences between register offsets,
> * the burst length change from 4 to minimum 8,
> * drive SRAM accesses through the AHB bus instead of the MBUS.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/sunxi_nand.c | 75 ++++++++++++++++++++++++++++---
>  1 file changed, 68 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
> index 4282bc477761..49cd5067adaa 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -42,7 +42,8 @@
>  #define NFC_REG_CMD		0x0024
>  #define NFC_REG_RCMD_SET	0x0028
>  #define NFC_REG_WCMD_SET	0x002C
> -#define NFC_REG_IO_DATA		0x0030
> +#define NFC_REG_A10_IO_DATA	0x0030
> +#define NFC_REG_A33_IO_DATA	0x0300
>  #define NFC_REG_ECC_CTL		0x0034
>  #define NFC_REG_ECC_ST		0x0038
>  #define NFC_REG_DEBUG		0x003C
> @@ -200,6 +201,22 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
>  	return container_of(nand, struct sunxi_nand_chip, nand);
>  }
>
> +/*
> + * NAND Controller capabilities structure: stores NAND controller capabilities
> + * for distinction between compatible strings.
> + *
> + * @sram_through_ahb:	On A33, we choose to access the internal RAM through AHB
> + *                      instead of MBUS (less configuration). A10+ use the MBUS

What do you mean by A10+ ?

> + *                      but no extra configuration is needed.
> + * @reg_io_data:	I/O data register
> + * @dma_maxburst:	DMA maxburst
> + */
> +struct sunxi_nfc_caps {
> +	bool sram_through_ahb;
> +	unsigned int reg_io_data;
> +	unsigned int dma_maxburst;
> +};

Ideally, the introduction of that structure and the introduction of
the A33 support should be separate patches.

>  /**
>   * struct sunxi_nfc - stores sunxi NAND controller information
>   *
> @@ -228,6 +245,7 @@ struct sunxi_nfc {
>  	struct list_head chips;
>  	struct completion complete;
>  	struct dma_chan *dmac;
> +	const struct sunxi_nfc_caps *caps;
>  };
>
>  static inline struct sunxi_nfc *to_sunxi_nfc(struct nand_controller *ctrl)
> @@ -350,10 +368,29 @@ static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc *nfc, const void *buf,
>  		goto err_unmap_buf;
>  	}
>
> -	writel(readl(nfc->regs + NFC_REG_CTL) | NFC_RAM_METHOD,
> -	       nfc->regs + NFC_REG_CTL);
> +	/*
> +	 * On A33, we suppose the "internal RAM" (p.12 of the user manual)

Which user manual? It certainly isn't the A33 user manual :)

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--pnrghmq37tomg7yv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKcc1wAKCRDj7w1vZxhR
xZsGAQD4Ia5EqUc7rAqk8MvxDzrDOfK+ajwK25hKVOgx8OHbNgD+MzIuJNIn4TzU
8QoCWSktB4fhlo6DUTcXorgHq2Gntwk=
=xige
-----END PGP SIGNATURE-----

--pnrghmq37tomg7yv--


--===============3158111372039326205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3158111372039326205==--
