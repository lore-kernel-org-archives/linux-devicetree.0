From: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCHv2 1/1] mtd: gpmi: make blockmark swapping optional
Date: Mon, 24 Mar 2014 17:59:03 +0800
Message-ID: <20140324095902.GB11377@localhost>
References: <532BCFCC.4080205@freescale.com>
 <1395399017-19005-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1395399017-19005-1-git-send-email-LW@KARO-electronics.de>
Sender: linux-doc-owner@vger.kernel.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Fabio Estevam <fabio.estevam@freescale.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@freescale.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Shawn Guo <shawn.guo@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 21, 2014 at 11:50:17AM +0100, Lothar Wa=DFmann wrote:
> With a flash-based BBT there is no reason to move the Factory Bad
> Block Marker from the data area buffer (to where it is mapped by the
> GPMI NAND controller) to the OOB buffer. Thus, make this feature
> configurable via DT. This is required for the Ka-Ro electronics
> platforms.
>=20
> Signed-off-by: Lothar Wa=DFmann <LW@KARO-electronics.de>
> ---
>  Documentation/devicetree/bindings/mtd/gpmi-nand.txt |    3 +++
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c              |   10 +++++++--=
-
>  2 files changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt b/Do=
cumentation/devicetree/bindings/mtd/gpmi-nand.txt
> index 458d596..f28949a 100644
> --- a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
> @@ -25,6 +25,9 @@ Optional properties:
>                         discoverable or this property is not enabled,
>                         the software may chooses an implementation-de=
fined
>                         ECC scheme.
> +  - fsl,no-blockmark-swap: Don't swap the bad block marker from the =
OOB
> +                       area with the byte in the data area but rely =
on the
> +                       BBT for identifying bad blocks.

Please add the following:
       "NOTE: This property is not supported by the imx23 and imx28"
> =20
>  The device tree may optionally contain sub-nodes describing partitio=
ns of the
>  address space. See partition.txt for more detail.
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nan=
d/gpmi-nand/gpmi-nand.c
> index bb77f75..98562eb 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -1632,9 +1632,6 @@ static int gpmi_init_last(struct gpmi_nand_data=
 *this)
>  	struct bch_geometry *bch_geo =3D &this->bch_geometry;
>  	int ret;
> =20
> -	/* Set up swap_block_mark, must be set before the gpmi_set_geometry=
() */
> -	this->swap_block_mark =3D !GPMI_IS_MX23(this);
> -
>  	/* Set up the medium geometry */
>  	ret =3D gpmi_set_geometry(this);
>  	if (ret)
> @@ -1701,6 +1698,13 @@ static int gpmi_nand_init(struct gpmi_nand_dat=
a *this)
>  	if (of_get_nand_on_flash_bbt(this->dev->of_node))
>  		chip->bbt_options |=3D NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB;
> =20
> +	/* Set up swap_block_mark, must be set before the gpmi_set_geometry=
() */
> +	if (!of_property_read_bool(this->dev->of_node, "fsl,no-blockmark-sw=
ap"))
> +		this->swap_block_mark =3D !GPMI_IS_MX23(this);

the code should like this:
----------------------------------------------
	this->swap_block_mark =3D !GPMI_IS_MX23(this);

	if (!GPMI_IS_IMX23(this) && !GPMI_IS_MX28(this) &&
		of_property_read_bool(this->dev->of_node, "fsl,no-blockmark-swap"))
		this->swap_block_mark =3D false;
----------------------------------------------
         =20
> +
> +	dev_dbg(this->dev, "Blockmark swapping %sabled\n",
> +		this->swap_block_mark ? "en" : "dis");
> +
>  	/*
>  	 * Allocate a temporary DMA buffer for reading ID in the
>  	 * nand_scan_ident().

There are some bugs in the gpmi driver which is caused by the assumptio=
n that
we always enable the swapping except the imx23.=20

So, there are some places should be changed with this patch:
   [1] the subpage hook,
        Please also change the gpmi_ecc_read_subpage() too.

   [2] the OOB hook,
   	Please also change the gpmi_ecc_read_oob().=20


   [3] the markbad hook,
   	Please also change the gpmi_block_markbad() .=20

thanks
Huang Shijie
       =20

=09



