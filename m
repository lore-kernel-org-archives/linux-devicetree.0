From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/9] MXS/i.MX28: add the possibility to define the
 external RTC crystal
Date: Thu, 7 Mar 2013 14:33:40 +0800
Message-ID: <20130307063337.GB5372@S2101-09.ap.freescale.net>
References: <1362405948-12992-1-git-send-email-s.trumtrar@pengutronix.de>
 <1362405948-12992-3-git-send-email-s.trumtrar@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1362405948-12992-3-git-send-email-s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Juergen Beisert <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 04, 2013 at 03:05:41PM +0100, Steffen Trumtrar wrote:
> From: Juergen Beisert <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> 
> Signed-off-by: Juergen Beisert <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

You should have your SoB added here.

> ---
>  arch/arm/boot/dts/imx28.dtsi |    6 ++++++
>  drivers/clk/mxs/clk-imx28.c  |    4 +++-
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/imx28.dtsi b/arch/arm/boot/dts/imx28.dtsi
> index 958bd10..dcd0844 100644
> --- a/arch/arm/boot/dts/imx28.dtsi
> +++ b/arch/arm/boot/dts/imx28.dtsi
> @@ -41,6 +41,12 @@
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> +		osc32k: rtc_oscillator {

Please use "-" than "_" in node name.

> +			compatible = "fsl,mxs-rtc", "fixed-clock";

I would suggest drop "fsl,mxs-rtc" here, and ...

> +			#clock-cells = <0>;
> +			clock-frequency = <0>;
> +		};
> +
>  		osc24m: system_oscillator {
>  			compatible = "fsl,mxs-system", "fixed-clock";
>  			#clock-cells = <0>;
> diff --git a/drivers/clk/mxs/clk-imx28.c b/drivers/clk/mxs/clk-imx28.c
> index 01048b5..a910d72 100644
> --- a/drivers/clk/mxs/clk-imx28.c
> +++ b/drivers/clk/mxs/clk-imx28.c
> @@ -141,7 +141,7 @@ enum imx28_clk {
>  	clk32k_div, rtc, lradc, spdif_div, clk32k, pwm, uart, ssp0,
>  	ssp1, ssp2, ssp3, gpmi, spdif, emi, saif0, saif1, lcdif, etm,
>  	fec, can0, can1, usb0, usb1, usb0_phy, usb1_phy, enet_out,
> -	clk_max
> +	rtc_32k, clk_max

Number it in binding doc.

>  };
>  
>  static struct clk *clks[clk_max];
> @@ -167,6 +167,8 @@ int __init mx28_clocks_init(void)
>  
>  		if (of_device_is_compatible(np, "fsl,mxs-system"))
>  			clks[ref_xtal] = mxs_clk_fixed("ref_xtal", rate);
> +		else if (of_device_is_compatible(np, "fsl,mxs-rtc"))

... use node name to match, so that we can save a custom compatible.

Shawn

> +			clks[rtc_32k] = mxs_clk_fixed("rtc32k", rate);
>  	}
>  
>  	/* if not set, guess their frequency */
> -- 
> 1.7.10.4
> 
