From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [RFC PATCH 6/6] dt-bindings: PCI: rockchip: convert to use
 per-lane PHY model
Date: Fri, 14 Jul 2017 13:47:13 -0700
Message-ID: <20170714204711.GA13174@google.com>
References: <1500004101-240296-1-git-send-email-shawn.lin@rock-chips.com>
 <1500004366-241633-1-git-send-email-shawn.lin@rock-chips.com>
 <1500004366-241633-5-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1500004366-241633-5-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Shawn,

On Fri, Jul 14, 2017 at 11:52:46AM +0800, Shawn Lin wrote:
> Deprecate legacy PHY model and encourage to use per-lane PHY
> model.
> 
> Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> ---
> 
>  .../devicetree/bindings/pci/rockchip-pcie.txt      | 25 ++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/rockchip-pcie.txt b/Documentation/devicetree/bindings/pci/rockchip-pcie.txt
> index 1453a73..78d4469 100644
> --- a/Documentation/devicetree/bindings/pci/rockchip-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/rockchip-pcie.txt
> @@ -19,8 +19,6 @@ Required properties:
>  	- "pm"
>  - msi-map: Maps a Requester ID to an MSI controller and associated
>  	msi-specifier data. See ./pci-msi.txt
> -- phys: From PHY bindings: Phandle for the Generic PHY for PCIe.
> -- phy-names:  MUST be "pcie-phy".
>  - interrupts: Three interrupt entries must be specified.
>  - interrupt-names: Must include the following names
>  	- "sys"
> @@ -42,6 +40,18 @@ Required properties:
>  	interrupt source. The value must be 1.
>  - interrupt-map-mask and interrupt-map: standard PCI properties
>  
> +Required properties for legacy PHY model (deprecated):
> +- phys: From PHY bindings: Phandle for the Generic PHY for PCIe.
> +- phy-names:  MUST be "pcie-phy".
> +
> +Required properties for per-lane PHY model:
> +- phys: Must contain an phandle to a PHY for each entry in phy-names.
> +- phy-names: Must include an entry for each active lane. Note that the number
> +  of entries does not have to (though usually will) be equal to the specified
> +  number of lanes in the num-lanes property. Entries are of the form
> +  "pcie-phy-N": where N ranges from 0 to the value specified of (num-lanes - 1).
> +  (see example below)

So (for the non-legacy case) are you requiring listing all 4 PHY lanes,
or not? If you aren't, then you need to make the PHY driver handle the
case were lanes {X..3} were never "powered on", but we want them idled.
IIUC, your current (broken) implementation is trying (incorrectly) to
only idle a lane once it has been powered on and then back off. But that
won't ever happen if we only request (for example) PHY lane 0.

It's also misleading that it's possible to specify only some subset of
the PHY lanes, but the driver might still try to use them all.

Brian

> +
>  Optional Property:
>  - aspm-no-l0s: RC won't support ASPM L0s. This property is needed if
>  	using 24MHz OSC for RC's PHY.
> @@ -95,6 +105,7 @@ pcie0: pcie@f8000000 {
>  		 <&cru SRST_PCIE_PM>, <&cru SRST_P_PCIE>, <&cru SRST_A_PCIE>;
>  	reset-names = "core", "mgmt", "mgmt-sticky", "pipe",
>  		      "pm", "pclk", "aclk";
> +	/* deprecated legacy PHY model */
>  	phys = <&pcie_phy>;
>  	phy-names = "pcie-phy";
>  	pinctrl-names = "default";
> @@ -111,3 +122,13 @@ pcie0: pcie@f8000000 {
>  		#interrupt-cells = <1>;
>  	};
>  };
> +
> +pcie0: pcie@f8000000 {
> +	...
> +
> +	/* preferred per-lane PHY model */
> +	phys = <&pcie_phy 0>, <&pcie_phy 1>, <&pcie_phy 2>, <&pcie_phy 3>;
> +	phy-names = "pcie-phy-0", "pcie-phy-1", "pcie-phy-2", "pcie-phy-3";
> +
> +	...
> +};
> -- 
> 1.9.1
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
