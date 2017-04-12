From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH v1 1/1] mtd: mtk-nor: set controller's address width
 according to nor flash
Date: Wed, 12 Apr 2017 22:57:27 +0200
Message-ID: <e9eafca3-41a0-7e88-996b-9d1c51f0c132@wedev4u.fr>
References: <1491381462-21893-1-git-send-email-guochun.mao@mediatek.com>
 <1491381462-21893-2-git-send-email-guochun.mao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1491381462-21893-2-git-send-email-guochun.mao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Guochun Mao <guochun.mao@mediatek.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Guochun,

Le 05/04/2017 à 10:37, Guochun Mao a écrit :
> When nor's size larger than 16MByte, nor's address width maybe
> set to 3 or 4, and controller should change address width according
> to nor's setting.
> 
> Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
> ---
>  drivers/mtd/spi-nor/mtk-quadspi.c |   27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/mtk-quadspi.c b/drivers/mtd/spi-nor/mtk-quadspi.c
> index e661877..b637770 100644
> --- a/drivers/mtd/spi-nor/mtk-quadspi.c
> +++ b/drivers/mtd/spi-nor/mtk-quadspi.c
> @@ -104,6 +104,8 @@
>  #define MTK_NOR_MAX_RX_TX_SHIFT		6
>  /* can shift up to 56 bits (7 bytes) transfer by MTK_NOR_PRG_CMD */
>  #define MTK_NOR_MAX_SHIFT		7
> +/* nor controller 4-byte address mode enable bit */
> +#define MTK_NOR_4B_ADDR_EN		BIT(4)
>  
>  /* Helpers for accessing the program data / shift data registers */
>  #define MTK_NOR_PRG_REG(n)		(MTK_NOR_PRGDATA0_REG + 4 * (n))
> @@ -230,10 +232,35 @@ static int mt8173_nor_write_buffer_disable(struct mt8173_nor *mt8173_nor)
>  				  10000);
>  }
>  
> +static void mt8173_nor_set_addr_width(struct mt8173_nor *mt8173_nor)
> +{
> +	u8 val;
> +	struct spi_nor *nor = &mt8173_nor->nor;
> +
> +	val = readb(mt8173_nor->base + MTK_NOR_DUAL_REG);
> +
> +	switch (nor->addr_width) {
> +	case 3:
> +		val &= ~MTK_NOR_4B_ADDR_EN;
> +		break;
> +	case 4:
> +		val |= MTK_NOR_4B_ADDR_EN;
> +		break;
> +	default:
> +		dev_warn(mt8173_nor->dev, "Unexpected address width %u.\n",
> +			 nor->addr_width);
> +		break;
> +	}
> +
> +	writeb(val, mt8173_nor->base + MTK_NOR_DUAL_REG);
> +}
> +
>  static void mt8173_nor_set_addr(struct mt8173_nor *mt8173_nor, u32 addr)
>  {
>  	int i;
>  
> +	mt8173_nor_set_addr_width(mt8173_nor);
> +
>  	for (i = 0; i < 3; i++) {

Should it be 'i < nor->addr_width' instead of 'i < 3' ?
Does it work when accessing data after 128Mbit ?

Best regards,

Cyrille

>  		writeb(addr & 0xff, mt8173_nor->base + MTK_NOR_RADR0_REG + i * 4);
>  		addr >>= 8;
> 
