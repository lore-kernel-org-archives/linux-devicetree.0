From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/3] Documentation: dtb: xgene: Add PMD clock binding
Date: Mon, 12 Sep 2016 10:37:03 -0500
Message-ID: <20160912153703.GA26444@rob-hp-laptop>
References: <1472863255-32337-1-git-send-email-hotran@apm.com>
 <1472863255-32337-2-git-send-email-hotran@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472863255-32337-2-git-send-email-hotran-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hoan Tran <hotran-qTEPVZfXA3Y@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, lho-qTEPVZfXA3Y@public.gmane.org, Duc Dang <dhdang-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 02, 2016 at 05:40:53PM -0700, Hoan Tran wrote:
> Add APM X-Gene clock binding documentation for PMD clock.
> 
> Signed-off-by: Hoan Tran <hotran-qTEPVZfXA3Y@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/clock/xgene.txt | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/xgene.txt b/Documentation/devicetree/bindings/clock/xgene.txt
> index 82f9638..e6e12ae 100644
> --- a/Documentation/devicetree/bindings/clock/xgene.txt
> +++ b/Documentation/devicetree/bindings/clock/xgene.txt
> @@ -8,6 +8,7 @@ Required properties:
>  - compatible : shall be one of the following:
>  	"apm,xgene-socpll-clock" - for a X-Gene SoC PLL clock
>  	"apm,xgene-pcppll-clock" - for a X-Gene PCP PLL clock
> +	"apm,xgene-pmd-clock" - for a X-Gene PMD clock
>  	"apm,xgene-device-clock" - for a X-Gene device clock
>  	"apm,xgene-socpll-v2-clock" - for a X-Gene SoC PLL v2 clock
>  	"apm,xgene-pcppll-v2-clock" - for a X-Gene PCP PLL v2 clock
> @@ -22,6 +23,15 @@ Required properties for SoC or PCP PLL clocks:
>  Optional properties for PLL clocks:
>  - clock-names : shall be the name of the PLL. If missing, use the device name.
>  
> +Required properties for PMD clocks:
> +- reg : shall be the physical register address for the pmd clock.
> +- clocks : shall be the input parent clock phandle for the clock.
> +- #clock-cells : shall be set to 1.
> +- clock-output-names : shall be the name of the clock referenced by derive
> +  clock.
> +Optional properties for PLL clocks:
> +- clock-names : shall be the name of the clock. If missing, use the device name.
> +
>  Required properties for device clocks:
>  - reg : shall be a list of address and length pairs describing the CSR
>           reset and/or the divider. Either may be omitted, but at least
> @@ -59,6 +69,14 @@ For example:
>  		type = <0>;
>  	};
>  
> +	pmd0clk: pmd0clk {

Needs a unit address.

> +		compatible = "apm,xgene-pmd-clock";
> +		#clock-cells = <1>;
> +		clocks = <&pmdpll 0>;
> +		reg = <0x0 0x7E200200 0x0 0x10>;

Lowercase hex please.

With those,

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>


> +		clock-output-names = "pmd0clk";
> +	};
> +
>  	socpll: socpll@17000120 {
>  		compatible = "apm,xgene-socpll-clock";
>  		#clock-cells = <1>;
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
