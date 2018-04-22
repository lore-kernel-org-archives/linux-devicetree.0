From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH] mtd: rawnand: sunxi: Remove support for GPIO-based
 Ready/Busy polling
Date: Sun, 22 Apr 2018 19:25:17 +0200
Message-ID: <20180422192517.2037ef1c@bbrezillon>
References: <20180327070614.3288-1-boris.brezillon@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20180327070614.3288-1-boris.brezillon@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, 27 Mar 2018 09:06:14 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> None of the existing platforms connect the R/B pin to a GPIO (they all
> use one of the dedicated R/B pin).
> Anyway, if we ever get short of native R/B pins, it's probably better
> to fallback to STATUS reg polling than trying to poll a GPIO.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>

Applied to nand/next.

> ---
>  .../devicetree/bindings/mtd/sunxi-nand.txt         |  2 -
>  drivers/mtd/nand/raw/sunxi_nand.c                  | 91 ++++------------------
>  2 files changed, 15 insertions(+), 78 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
> index 0734f03bf3d3..dcd5a5d80dc0 100644
> --- a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
> @@ -22,8 +22,6 @@ Optional properties:
>  - reset : phandle + reset specifier pair
>  - reset-names : must contain "ahb"
>  - allwinner,rb : shall contain the native Ready/Busy ids.
> - or
> -- rb-gpios : shall contain the gpios used as R/B pins.
>  - nand-ecc-mode : one of the supported ECC modes ("hw", "soft", "soft_bch" or
>  		  "none")
>  
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
> index aad42812a353..d831a141a196 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -165,49 +165,16 @@
>  
>  #define NFC_MAX_CS		7
>  
> -/*
> - * Ready/Busy detection type: describes the Ready/Busy detection modes
> - *
> - * @RB_NONE:	no external detection available, rely on STATUS command
> - *		and software timeouts
> - * @RB_NATIVE:	use sunxi NAND controller Ready/Busy support. The Ready/Busy
> - *		pin of the NAND flash chip must be connected to one of the
> - *		native NAND R/B pins (those which can be muxed to the NAND
> - *		Controller)
> - * @RB_GPIO:	use a simple GPIO to handle Ready/Busy status. The Ready/Busy
> - *		pin of the NAND flash chip must be connected to a GPIO capable
> - *		pin.
> - */
> -enum sunxi_nand_rb_type {
> -	RB_NONE,
> -	RB_NATIVE,
> -	RB_GPIO,
> -};
> -
> -/*
> - * Ready/Busy structure: stores information related to Ready/Busy detection
> - *
> - * @type:	the Ready/Busy detection mode
> - * @info:	information related to the R/B detection mode. Either a gpio
> - *		id or a native R/B id (those supported by the NAND controller).
> - */
> -struct sunxi_nand_rb {
> -	enum sunxi_nand_rb_type type;
> -	union {
> -		int gpio;
> -		int nativeid;
> -	} info;
> -};
> -
>  /*
>   * Chip Select structure: stores information related to NAND Chip Select
>   *
>   * @cs:		the NAND CS id used to communicate with a NAND Chip
> - * @rb:		the Ready/Busy description
> + * @rb:		the Ready/Busy pin ID. -1 means no R/B pin connected to the
> + *		NFC
>   */
>  struct sunxi_nand_chip_sel {
>  	u8 cs;
> -	struct sunxi_nand_rb rb;
> +	s8 rb;
>  };
>  
>  /*
> @@ -440,30 +407,19 @@ static int sunxi_nfc_dev_ready(struct mtd_info *mtd)
>  	struct nand_chip *nand = mtd_to_nand(mtd);
>  	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
>  	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
> -	struct sunxi_nand_rb *rb;
> -	int ret;
> +	u32 mask;
>  
>  	if (sunxi_nand->selected < 0)
>  		return 0;
>  
> -	rb = &sunxi_nand->sels[sunxi_nand->selected].rb;
> -
> -	switch (rb->type) {
> -	case RB_NATIVE:
> -		ret = !!(readl(nfc->regs + NFC_REG_ST) &
> -			 NFC_RB_STATE(rb->info.nativeid));
> -		break;
> -	case RB_GPIO:
> -		ret = gpio_get_value(rb->info.gpio);
> -		break;
> -	case RB_NONE:
> -	default:
> -		ret = 0;
> +	if (sunxi_nand->sels[sunxi_nand->selected].rb < 0) {
>  		dev_err(nfc->dev, "cannot check R/B NAND status!\n");
> -		break;
> +		return 0;
>  	}
>  
> -	return ret;
> +	mask = NFC_RB_STATE(sunxi_nand->sels[sunxi_nand->selected].rb);
> +
> +	return !!(readl(nfc->regs + NFC_REG_ST) & mask);
>  }
>  
>  static void sunxi_nfc_select_chip(struct mtd_info *mtd, int chip)
> @@ -488,12 +444,11 @@ static void sunxi_nfc_select_chip(struct mtd_info *mtd, int chip)
>  
>  		ctl |= NFC_CE_SEL(sel->cs) | NFC_EN |
>  		       NFC_PAGE_SHIFT(nand->page_shift);
> -		if (sel->rb.type == RB_NONE) {
> +		if (sel->rb < 0) {
>  			nand->dev_ready = NULL;
>  		} else {
>  			nand->dev_ready = sunxi_nfc_dev_ready;
> -			if (sel->rb.type == RB_NATIVE)
> -				ctl |= NFC_RB_SEL(sel->rb.info.nativeid);
> +			ctl |= NFC_RB_SEL(sel->rb);
>  		}
>  
>  		writel(mtd->writesize, nfc->regs + NFC_REG_SPARE_AREA);
> @@ -1946,26 +1901,10 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
>  		chip->sels[i].cs = tmp;
>  
>  		if (!of_property_read_u32_index(np, "allwinner,rb", i, &tmp) &&
> -		    tmp < 2) {
> -			chip->sels[i].rb.type = RB_NATIVE;
> -			chip->sels[i].rb.info.nativeid = tmp;
> -		} else {
> -			ret = of_get_named_gpio(np, "rb-gpios", i);
> -			if (ret >= 0) {
> -				tmp = ret;
> -				chip->sels[i].rb.type = RB_GPIO;
> -				chip->sels[i].rb.info.gpio = tmp;
> -				ret = devm_gpio_request(dev, tmp, "nand-rb");
> -				if (ret)
> -					return ret;
> -
> -				ret = gpio_direction_input(tmp);
> -				if (ret)
> -					return ret;
> -			} else {
> -				chip->sels[i].rb.type = RB_NONE;
> -			}
> -		}
> +		    tmp < 2)
> +			chip->sels[i].rb = tmp;
> +		else
> +			chip->sels[i].rb = -1;
>  	}
>  
>  	nand = &chip->nand;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
