From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v8 7/7] mtd: nand: gpmi: support NAND on i.MX6UL
Date: Sat, 23 Jan 2016 15:03:08 -0800
Message-ID: <20160123230308.GK24744@localhost>
References: <1449096466-18064-1-git-send-email-b45815@freescale.com>
 <1449096466-18064-8-git-send-email-b45815@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1449096466-18064-8-git-send-email-b45815@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Han Xu <b45815@freescale.com>
Cc: shijie.huang@arm.com, dwmw2@infradead.org, boris.brezillon@free-electrons.com, fabio.estevam@freescale.com, hofrat@osadl.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, vinod.koul@intel.com, dan.j.williams@intel.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 02, 2015 at 04:47:46PM -0600, Han Xu wrote:
> support GPMI NAND on i.MX6UL
> 
> Signed-off-by: Han Xu <han.xu@freescale.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 9 +++++++++
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.h | 4 +++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index 9dea56e..41d9012 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -89,6 +89,12 @@ static const struct gpmi_devdata gpmi_devdata_imx7d = {
>  	.max_chain_delay = 12,
>  };
>  
> +static const struct gpmi_devdata gpmi_devdata_imx6ul = {
> +	.type = IS_MX6UL,
> +	.bch_max_ecc_strength = 40,
> +	.max_chain_delay = 12,
> +};
> +
>  static irqreturn_t bch_irq(int irq, void *cookie)
>  {
>  	struct gpmi_nand_data *this = cookie;
> @@ -2015,6 +2021,9 @@ static const struct of_device_id gpmi_nand_id_table[] = {
>  		.compatible = "fsl,imx6sx-gpmi-nand",
>  		.data = &gpmi_devdata_imx6sx,
>  	}, {
> +		.compatible = "fsl,imx6ul-gpmi-nand",
> +		.data = (void *)&gpmi_devdata_imx6ul,
> +	}, {
>  		.compatible = "fsl,imx7d-gpmi-nand",
>  		.data = (void *)&gpmi_devdata_imx7d,
>  	}, { /* sentinel */ }

DT binding documentation?

[...]

Brian
