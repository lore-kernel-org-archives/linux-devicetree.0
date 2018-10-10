Return-Path: <SRS0=QTcC=MW=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH v2 2/3] mmc: renesas_sdhi_internal_dmac: Add R7S9210
 support
References: <20181010123713.67541-1-chris.brandt@renesas.com>
 <20181010123713.67541-3-chris.brandt@renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <fbb500df-239b-4c67-98ed-3aa606c9cc57@cogentembedded.com>
Date: Wed, 10 Oct 2018 17:51:20 +0300
MIME-Version: 1.0
In-Reply-To: <20181010123713.67541-3-chris.brandt@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Chris Brandt <chris.brandt@renesas.com>, Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hello!

On 10/10/2018 03:37 PM, Chris Brandt wrote:

> The SDHI/MMC controller in the RZ/A2 is almost the same as R-Car gen3, but
> with some minor differences.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
>  * Made comment clearer
> ---
>  drivers/mmc/host/Kconfig                      |  5 +++--
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 28 +++++++++++++++++++++++++--
>  2 files changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index cf984f0f0246..33840ce2221d 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -636,13 +636,14 @@ config MMC_SDHI_SYS_DMAC
>  
>  config MMC_SDHI_INTERNAL_DMAC
>  	tristate "DMA for SDHI SD/SDIO controllers using on-chip bus mastering"
> -	depends on ARM64 || COMPILE_TEST
> +	depends on ARM64 ||  ARCH_R7S9210 || COMPILE_TEST

   Double space hardly needed here...

[...]
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index e5e5015ca680..89066237d6f0 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
[...]
> @@ -81,6 +84,21 @@ static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
>  	},
>  };
>  
> +static const struct renesas_sdhi_of_data of_rza2_compatible = {
> +	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
> +			  TMIO_MMC_HAVE_CBSY,
> +	.tmio_ocr_mask	= MMC_VDD_32_33,
> +	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
> +			  MMC_CAP_CMD23,
> +	.bus_shift	= 2,
> +	.scc_offset	= (0 - 0x1000),

   Parens hardly needed here...

[...]

MBR, Sergei
