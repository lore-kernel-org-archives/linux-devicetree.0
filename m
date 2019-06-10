From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 1/6] ptp: add QorIQ PTP support for DPAA2
Date: Mon, 10 Jun 2019 15:06:01 +0200
Message-ID: <20190610130601.GD8247@lunn.ch>
References: <20190610032108.5791-1-yangbo.lu@nxp.com>
 <20190610032108.5791-2-yangbo.lu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190610032108.5791-2-yangbo.lu@nxp.com>
Sender: netdev-owner@vger.kernel.org
To: Yangbo Lu <yangbo.lu@nxp.com>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 10, 2019 at 11:21:03AM +0800, Yangbo Lu wrote:
> This patch is to add QorIQ PTP support for DPAA2.
> Although dpaa2-ptp.c driver is a fsl_mc_driver which
> is using MC APIs for register accessing, it's same
> IP block with eTSEC/DPAA/ENETC 1588 timer. We will
> convert to reuse ptp_qoriq driver by using register
> ioremap and dropping related MC APIs.
> 
> Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
> ---
>  drivers/ptp/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ptp/Kconfig b/drivers/ptp/Kconfig
> index 9b8fee5..b1b454f 100644
> --- a/drivers/ptp/Kconfig
> +++ b/drivers/ptp/Kconfig
> @@ -44,7 +44,7 @@ config PTP_1588_CLOCK_DTE
>  
>  config PTP_1588_CLOCK_QORIQ
>  	tristate "Freescale QorIQ 1588 timer as PTP clock"
> -	depends on GIANFAR || FSL_DPAA_ETH || FSL_ENETC || FSL_ENETC_VF
> +	depends on GIANFAR || FSL_DPAA_ETH || FSL_DPAA2_ETH || FSL_ENETC || FSL_ENETC_VF
>  	depends on PTP_1588_CLOCK

Hi Yangbo

Could COMPILE_TEST also be added?

Thanks
	Andrew
