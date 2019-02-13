From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 01/11] ARM: at91: add sam9x60 SFR definitions
Date: Wed, 13 Feb 2019 11:52:38 +0100
Message-ID: <20190213105238.GI10129@piout.net>
References: <20190213085930.31578-1-tudor.ambarus@microchip.com>
 <20190213085930.31578-2-tudor.ambarus@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190213085930.31578-2-tudor.ambarus@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tudor.Ambarus@microchip.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, Nicolas.Ferre@microchip.com, Ludovic.Desroches@microchip.com, dwmw2@infradead.org, computersforpeace@gmail.com, bbrezillon@kernel.org, marek.vasut@gmail.com, richard@nod.at, miquel.raynal@bootlin.com, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 13/02/2019 08:59:44+0000, Tudor.Ambarus@microchip.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Keep generic names, as there are no conflicts with previous
> SFR definitions.
> 
> While touching bits, update AT91_OHCIICR_USB_SUSPEND to use
> GENMASK, replace unused AT91_OHCIICR_SUSPEND_A/B/C with a more
> generic macro, align values on tab-width.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  include/soc/at91/atmel-sfr.h | 34 +++++++++++++++++++++++++++-------
>  1 file changed, 27 insertions(+), 7 deletions(-)
> 
> diff --git a/include/soc/at91/atmel-sfr.h b/include/soc/at91/atmel-sfr.h
> index 482337af06b8..532fd784e86c 100644
> --- a/include/soc/at91/atmel-sfr.h
> +++ b/include/soc/at91/atmel-sfr.h
> @@ -14,21 +14,41 @@
>  #define _LINUX_MFD_SYSCON_ATMEL_SFR_H
>  
>  #define AT91_SFR_DDRCFG		0x04	/* DDR Configuration Register */
> +#define AT91_SFR_CCFG_EBICSA	0x04	/* EBI Chip Select Register */
>  /* 0x08 ~ 0x0c: Reserved */
>  #define AT91_SFR_OHCIICR	0x10	/* OHCI INT Configuration Register */
>  #define AT91_SFR_OHCIISR	0x14	/* OHCI INT Status Register */
>  #define AT91_SFR_UTMICKTRIM	0x30	/* UTMI Clock Trimming Register */
> +#define AT91_SFR_UTMISWAP	0x3c	/* UTMI DP/DM Pin Swapping Register */
> +#define AT91_SFR_LS		0x7c	/* Light Sleep Register */
>  #define AT91_SFR_I2SCLKSEL	0x90	/* I2SC Register */
> +#define AT91_SFR_WPMR		0xe4	/* Write Protection Mode Register */
>  
>  /* Field definitions */
> -#define AT91_OHCIICR_SUSPEND_A	BIT(8)
> -#define AT91_OHCIICR_SUSPEND_B	BIT(9)
> -#define AT91_OHCIICR_SUSPEND_C	BIT(10)
> +#define AT91_SFR_CCFG_EBI_CSA(cs, val)		((val) << (cs))
> +#define AT91_SFR_CCFG_EBI_DBPUC			BIT(8)
> +#define AT91_SFR_CCFG_EBI_DBPDC			BIT(9)
> +#define AT91_SFR_CCFG_EBI_DRIVE			BIT(17)
> +#define AT91_SFR_CCFG_NFD0_ON_D16		BIT(24)
> +#define AT91_SFR_CCFG_DDR_MP_EN			BIT(25)
>  
> -#define AT91_OHCIICR_USB_SUSPEND	(AT91_OHCIICR_SUSPEND_A | \
> -					 AT91_OHCIICR_SUSPEND_B | \
> -					 AT91_OHCIICR_SUSPEND_C)
> +#define AT91_SFR_OHCIICR_RES(x)			BIT(x)
> +#define AT91_SFR_OHCIICR_ARIE			BIT(4)
> +#define AT91_SFR_OHCIICR_APPSTART		BIT(5)
> +#define AT91_SFR_OHCIICR_USB_SUSP(x)		BIT(8 + (x))
> +#define AT91_SFR_OHCIICR_UDPPUDIS		BIT(23)
> +#define AT91_OHCIICR_USB_SUSPEND		GENMASK(10, 8)
>  
> -#define AT91_UTMICKTRIM_FREQ	GENMASK(1, 0)
> +#define AT91_SFR_OHCIISR_RIS(x)			BIT(x)
> +
> +#define AT91_UTMICKTRIM_FREQ			GENMASK(1, 0)
> +
> +#define AT91_SFR_UTMISWAP_PORT(x)		BIT(x)
> +
> +#define AT91_SFR_LS_VALUE(x)			BIT(x)
> +#define AT91_SFR_LS_MEM_POWER_GATING_ULP1_EN	BIT(16)
> +
> +#define AT91_SFR_WPMR_WPEN			BIT(0)
> +#define AT91_SFR_WPMR_WPKEY_MASK		GENMASK(31, 8)
>  
>  #endif /* _LINUX_MFD_SYSCON_ATMEL_SFR_H */
> -- 
> 2.9.5
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
