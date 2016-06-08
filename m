From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: bindings: add dt documentation for
 Rockchip PCIe PHY
Date: Wed, 8 Jun 2016 15:29:00 -0500
Message-ID: <20160608202900.GA25662@rob-hp-laptop>
References: <1465370708-23619-1-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1465370708-23619-1-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

gOn Wed, Jun 08, 2016 at 03:25:08PM +0800, Shawn Lin wrote:
> This patch adds a binding that describes the Rockchip PCIe PHY
> found on Rockchip SoCs PCIe interface.
> 
> Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> 
>  .../devicetree/bindings/phy/rockchip-pcie-phy.txt  | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt b/Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt
> new file mode 100644
> index 0000000..ba8c406
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt
> @@ -0,0 +1,22 @@
> +Rockchip PCIE PHY
> +-----------------------
> +
> +Required properties:
> + - compatible: rockchip,rk3399-pcie-phy
> + - #phy-cells: must be 0
> +
> +Example:
> +
> +grf: syscon@ff770000 {
> +	compatible = "rockchip,rk3399-grf", "syscon", "simple-mfd";
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	...
> +
> +	pcie_phy: phy@e220 {

unit-address needs a reg property or drop the unit address. I'd do the 
former if there's a register range you can describe here.


> +		compatible = "rockchip,rk3399-pcie-phy";
> +		#phy-cells = <0>;
> +	};
> +};
> +
> -- 
> 2.3.7
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
