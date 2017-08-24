From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 3/4] dt-bindings: PCI: rockchip: Add support for pcie
 wake irq
Date: Thu, 24 Aug 2017 11:53:54 -0500
Message-ID: <20170824165353.GL31858@bhelgaas-glaptop.roam.corp.google.com>
References: <20170822031934.8675-1-jeffy.chen@rock-chips.com>
 <20170822031934.8675-4-jeffy.chen@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170822031934.8675-4-jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 22, 2017 at 11:19:33AM +0800, Jeffy Chen wrote:
> Add an optional interrupt for PCIE_WAKE pin.

Rob?

> Signed-off-by: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> 
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
> 
>  .../devicetree/bindings/pci/rockchip-pcie.txt        | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/rockchip-pcie.txt b/Documentation/devicetree/bindings/pci/rockchip-pcie.txt
> index 5678be82530d..9f6504129e80 100644
> --- a/Documentation/devicetree/bindings/pci/rockchip-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/rockchip-pcie.txt
> @@ -20,10 +20,13 @@ Required properties:
>  - msi-map: Maps a Requester ID to an MSI controller and associated
>  	msi-specifier data. See ./pci-msi.txt
>  - interrupts: Three interrupt entries must be specified.
> -- interrupt-names: Must include the following names
> -	- "sys"
> -	- "legacy"
> -	- "client"
> +- interrupt-names: Include the following names
> +	Required:
> +		- "sys"
> +		- "legacy"
> +		- "client"
> +	Optional:
> +		- "wake"

Why is there no other PCI binding that includes "wake" as an
interrupt-name?  This feels like something that should be fairly
common across host controllers.  I don't want a Rockport-specific
DT description if it could be made more general.

>  - resets: Must contain seven entries for each entry in reset-names.
>  	   See ../reset/reset.txt for details.
>  - reset-names: Must include the following names
> @@ -87,10 +90,11 @@ pcie0: pcie@f8000000 {
>  	clock-names = "aclk", "aclk-perf",
>  		      "hclk", "pm";
>  	bus-range = <0x0 0x1>;
> -	interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH 0>,
> -		     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH 0>,
> -		     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH 0>;
> -	interrupt-names = "sys", "legacy", "client";
> +	interrupts-extended = <&gic GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH 0>,
> +			      <&gic GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH 0>,
> +			      <&gic GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH 0>,
> +			      <&gpio0 8 IRQ_TYPE_LEVEL_LOW>;
> +	interrupt-names = "sys", "legacy", "client", "wake";
>  	assigned-clocks = <&cru SCLK_PCIEPHY_REF>;
>  	assigned-clock-parents = <&cru SCLK_PCIEPHY_REF100M>;
>  	assigned-clock-rates = <100000000>;
> -- 
> 2.11.0
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
