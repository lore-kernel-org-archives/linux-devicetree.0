From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 11/11] ARM i.MX6q: Add LDB device to device tree
Date: Thu, 28 Mar 2013 15:51:52 +0800
Message-ID: <20130328075148.GD2756@S2101-09.ap.freescale.net>
References: <1364405445-5271-1-git-send-email-p.zabel@pengutronix.de>
 <1364405445-5271-12-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1364405445-5271-12-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>, Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 27, 2013 at 06:30:45PM +0100, Philipp Zabel wrote:
> From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> 
> Add ldb device tree node and clock lookups.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx6q.dtsi   | 17 +++++++++++++++++
>  arch/arm/boot/dts/imx6qdl.dtsi | 26 ++++++++++++++++++++++++++
>  2 files changed, 43 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
> index cba021e..1a30227 100644
> --- a/arch/arm/boot/dts/imx6q.dtsi
> +++ b/arch/arm/boot/dts/imx6q.dtsi
> @@ -294,3 +294,20 @@
>  		};
>  	};
>  };
> +
> +&ldb {
> +	clocks = <&clks 33>, <&clks 34>,
> +		 <&clks 39>, <&clks 40>, <&clks 41>, <&clks 42>,
> +		 <&clks 135>, <&clks 136>;
> +	clock-names = "di0_pll", "di1_pll",
> +		      "di0_sel", "di1_sel", "di2_sel", "di3_sel",
> +		      "di0", "di1";

These are identical with the ones in imx6qdl.dtsi, so not needed at all?

> +
> +	lvds-channel@0 {
> +		crtcs = <&ipu1 0>, <&ipu1 1>, <&ipu2 0>, <&ipu2 1>;
> +	};
> +
> +	lvds-channel@1 {
> +		crtcs = <&ipu1 0>, <&ipu1 1>, <&ipu2 0>, <&ipu2 1>;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
> index 06ec460..dd5ef96 100644
> --- a/arch/arm/boot/dts/imx6qdl.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl.dtsi
> @@ -529,6 +529,32 @@
>  				reg = <0x020e0000 0x38>;
>  			};
>  
> +			ldb: ldb@020e0008 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				compatible = "fsl,imx6q-ldb", "fsl,imx53-ldb";

Since both compatible strings are in the driver matching table, it's not
necessary to have "fsl,imx53-ldb" listed here.

Shawn

> +				clocks = <&clks 33>, <&clks 34>,
> +					 <&clks 39>, <&clks 40>,
> +					 <&clks 135>, <&clks 136>;
> +				clock-names = "di0_pll", "di1_pll",
> +					      "di0_sel", "di1_sel",
> +					      "di0", "di1";
> +				gpr = <&gpr>;
> +				status = "disabled";
> +
> +				lvds-channel@0 {
> +					reg = <0>;
> +					crtcs = <&ipu1 0>;
> +					status = "disabled";
> +				};
> +
> +				lvds-channel@1 {
> +					reg = <1>;
> +					crtcs = <&ipu1 1>;
> +					status = "disabled";
> +				};
> +			};
> +
>  			dcic1: dcic@020e4000 {
>  				reg = <0x020e4000 0x4000>;
>  				interrupts = <0 124 0x04>;
> -- 
> 1.8.2.rc2
> 
