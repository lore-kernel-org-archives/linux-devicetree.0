From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 04/11] memory: atmel-ebi: add sam9x60 EBI support
Date: Wed, 13 Feb 2019 11:54:10 +0100
Message-ID: <20190213105410.GL10129@piout.net>
References: <20190213085930.31578-1-tudor.ambarus@microchip.com>
 <20190213085930.31578-5-tudor.ambarus@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190213085930.31578-5-tudor.ambarus@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tudor.Ambarus@microchip.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, Nicolas.Ferre@microchip.com, Ludovic.Desroches@microchip.com, dwmw2@infradead.org, computersforpeace@gmail.com, bbrezillon@kernel.org, marek.vasut@gmail.com, richard@nod.at, miquel.raynal@bootlin.com, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 13/02/2019 08:59:55+0000, Tudor.Ambarus@microchip.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> The sam9x60 board defines the CCFG_EBICSA register under SFR,
> and not as a MATRIX register, as previous boards do.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/memory/atmel-ebi.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/memory/atmel-ebi.c b/drivers/memory/atmel-ebi.c
> index b45914cfa212..0322df9dc249 100644
> --- a/drivers/memory/atmel-ebi.c
> +++ b/drivers/memory/atmel-ebi.c
> @@ -17,6 +17,7 @@
>  #include <linux/init.h>
>  #include <linux/of_device.h>
>  #include <linux/regmap.h>
> +#include <soc/at91/atmel-sfr.h>
>  
>  struct atmel_ebi_dev_config {
>  	int cs;
> @@ -440,6 +441,15 @@ static const struct atmel_ebi_caps sama5d3_ebi_caps = {
>  	.apply_config = sama5_ebi_apply_config,
>  };
>  
> +static const struct atmel_ebi_caps sam9x60_ebi_caps = {
> +	.available_cs = 0x3f,
> +	.ebi_csa_offs = AT91_SFR_CCFG_EBICSA,
> +	.regmap_name = "microchip,sfr",
> +	.get_config = at91sam9_ebi_get_config,
> +	.xlate_config = atmel_ebi_xslate_smc_config,
> +	.apply_config = at91sam9_ebi_apply_config,
> +};
> +
>  static const struct of_device_id atmel_ebi_id_table[] = {
>  	{
>  		.compatible = "atmel,at91sam9260-ebi",
> @@ -473,6 +483,10 @@ static const struct of_device_id atmel_ebi_id_table[] = {
>  		.compatible = "atmel,sama5d3-ebi",
>  		.data = &sama5d3_ebi_caps,
>  	},
> +	{
> +		.compatible = "microchip,sam9x60-ebi",
> +		.data = &sam9x60_ebi_caps,
> +	},
>  	{ /* sentinel */ }
>  };
>  
> -- 
> 2.9.5
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
