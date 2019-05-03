Return-Path: <SRS0=hdwz=TD=intel.com=adrian.hunter@kernel.org>
Subject: Re: [PATCH v2 3/3] mmc: add HS400 support for iMX7ULP
References: <20190429090310.25484-1-haibo.chen@nxp.com>
 <20190429090310.25484-4-haibo.chen@nxp.com>
From: Adrian Hunter <adrian.hunter@intel.com>
Message-ID: <72ddece9-1138-a31c-b55e-788a26ec907f@intel.com>
Date: Fri, 3 May 2019 09:53:45 +0300
MIME-Version: 1.0
In-Reply-To: <20190429090310.25484-4-haibo.chen@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: BOUGH CHEN <haibo.chen@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 29/04/19 11:55 AM, BOUGH CHEN wrote:
> Add HS400 support for iMX7ULP B0.
> 
> According to IC suggest, need to clear the STROBE_DLL_CTRL_RESET
> before any setting of STROBE_DLL_CTRL register.
> 
> USDHC has register bits(bit[27~20] of register STROBE_DLL_CTRL)
> for slave sel value. If this register bits value is 0,  it needs
> 256 ref_clk cycles to update slave sel value. IC suggest to set
> bit[27~20] to 0x4, it only need 4 ref_clk cycle to update slave
> sel value. This will short the lock time of slave.
> 
> i.MX7ULP B0 will need more time to lock the REF and SLV, so change
> to add 5us delay.
> 
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index 053e8586d557..c391510e9ef4 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -74,6 +74,7 @@
>  #define ESDHC_STROBE_DLL_CTRL_ENABLE	(1 << 0)
>  #define ESDHC_STROBE_DLL_CTRL_RESET	(1 << 1)
>  #define ESDHC_STROBE_DLL_CTRL_SLV_DLY_TARGET_SHIFT	3
> +#define ESDHC_STROBE_DLL_CTRL_SLV_UPDATE_INT_DEFAULT	(4 << 20)
>  
>  #define ESDHC_STROBE_DLL_STATUS		0x74
>  #define ESDHC_STROBE_DLL_STS_REF_LOCK	(1 << 1)
> @@ -210,7 +211,7 @@ static const struct esdhc_soc_data usdhc_imx7d_data = {
>  static struct esdhc_soc_data usdhc_imx7ulp_data = {
>  	.flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_STD_TUNING
>  			| ESDHC_FLAG_HAVE_CAP1 | ESDHC_FLAG_HS200
> -			| ESDHC_FLAG_PMQOS,
> +			| ESDHC_FLAG_PMQOS | ESDHC_FLAG_HS400,
>  };
>  
>  static struct esdhc_soc_data usdhc_imx8qxp_data = {
> @@ -994,15 +995,19 @@ static void esdhc_set_strobe_dll(struct sdhci_host *host)
>  	/* force a reset on strobe dll */
>  	writel(ESDHC_STROBE_DLL_CTRL_RESET,
>  		host->ioaddr + ESDHC_STROBE_DLL_CTRL);
> +	/* clear the reset bit on strobe dll before any setting */
> +	writel(0, host->ioaddr + ESDHC_STROBE_DLL_CTRL);
> +
>  	/*
>  	 * enable strobe dll ctrl and adjust the delay target
>  	 * for the uSDHC loopback read clock
>  	 */
>  	v = ESDHC_STROBE_DLL_CTRL_ENABLE |
> +		ESDHC_STROBE_DLL_CTRL_SLV_UPDATE_INT_DEFAULT |
>  		(7 << ESDHC_STROBE_DLL_CTRL_SLV_DLY_TARGET_SHIFT);
>  	writel(v, host->ioaddr + ESDHC_STROBE_DLL_CTRL);
> -	/* wait 1us to make sure strobe dll status register stable */
> -	udelay(1);
> +	/* wait 5us to make sure strobe dll status register stable */
> +	udelay(5);
>  	v = readl(host->ioaddr + ESDHC_STROBE_DLL_STATUS);
>  	if (!(v & ESDHC_STROBE_DLL_STS_REF_LOCK))
>  		dev_warn(mmc_dev(host->mmc),
> 
