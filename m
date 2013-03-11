From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/9] ARM: i.MX28: define osc in DT
Date: Mon, 11 Mar 2013 12:03:17 +0800
Message-ID: <20130311040315.GF18574@S2101-09.ap.freescale.net>
References: <1362733304-23037-1-git-send-email-s.trumtrar@pengutronix.de>
 <1362733304-23037-2-git-send-email-s.trumtrar@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1362733304-23037-2-git-send-email-s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Juergen Beisert <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 08, 2013 at 10:01:36AM +0100, Steffen Trumtrar wrote:
> From: Juergen Beisert <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> 
> Instead of hardcoding the ref_xtal in the clk driver, get it from the DT.
> 
> Signed-off-by: Juergen Beisert <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx28.dtsi | 11 +++++++++++
>  drivers/clk/mxs/clk-imx28.c  | 16 +++++++++++++++-
>  2 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/imx28.dtsi b/arch/arm/boot/dts/imx28.dtsi
> index 7ba4966..b9e3712 100644
> --- a/arch/arm/boot/dts/imx28.dtsi
> +++ b/arch/arm/boot/dts/imx28.dtsi
> @@ -37,6 +37,17 @@
>  		};
>  	};
>  
> +	clocks {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		osc24m: system-oscillator {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <24000000>;
> +		};
> +	};
> +
>  	apb@80000000 {
>  		compatible = "simple-bus";
>  		#address-cells = <1>;
> diff --git a/drivers/clk/mxs/clk-imx28.c b/drivers/clk/mxs/clk-imx28.c
> index 76ce6c6..01048b5 100644
> --- a/drivers/clk/mxs/clk-imx28.c
> +++ b/drivers/clk/mxs/clk-imx28.c
> @@ -158,7 +158,21 @@ int __init mx28_clocks_init(void)
>  
>  	clk_misc_init();
>  
> -	clks[ref_xtal] = mxs_clk_fixed("ref_xtal", 24000000);
> +	/* retrieve the crystal's frequencies from device tree */
> +	for_each_compatible_node(np, NULL, "fixed-clock") {
> +		u32 rate;
> +
> +		if (of_property_read_u32(np, "clock-frequency", &rate))
> +			continue;
> +
> +		if (of_device_is_compatible(np, "fsl,mxs-system"))

Use node name to save the custom compatible.

But more fundamental question - do you really have a imx28 system
running a ref_xtal that is not 24 MHz?  Or does imx28 actually support
any other frequency ref_xtal other than 24 MHz?

Shawn

> +			clks[ref_xtal] = mxs_clk_fixed("ref_xtal", rate);
> +	}
> +
> +	/* if not set, guess their frequency */
> +	if (clks[ref_xtal] == NULL)
> +		clks[ref_xtal] = mxs_clk_fixed("ref_xtal", 24000000);
> +
>  	clks[pll0] = mxs_clk_pll("pll0", "ref_xtal", PLL0CTRL0, 17, 480000000);
>  	clks[pll1] = mxs_clk_pll("pll1", "ref_xtal", PLL1CTRL0, 17, 480000000);
>  	clks[pll2] = mxs_clk_pll("pll2", "ref_xtal", PLL2CTRL0, 23, 50000000);
> -- 
> 1.8.2.rc2
> 
