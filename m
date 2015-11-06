From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 05/13] Documentation: dt-bindings: Add bindings for
 Synopsys DW MIPI DSI DRM bridge driver
Date: Thu, 5 Nov 2015 20:21:08 -0600
Message-ID: <20151106022108.GA12138@rob-hp-laptop>
References: <1446296170-3702-1-git-send-email-zyw@rock-chips.com>
 <1446296170-3702-6-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1446296170-3702-6-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Liu Ying <Ying.liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Oct 31, 2015 at 08:56:01PM +0800, Chris Zhong wrote:
> From: Liu Ying <Ying.liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> This patch adds device tree bindings for Synopsys DesignWare MIPI DSI
> host controller DRM bridge driver.
> 
> Signed-off-by: Liu Ying <Ying.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> 
> Changes in v2: None
> 
>  .../devicetree/bindings/drm/bridge/dw_mipi_dsi.txt | 76 ++++++++++++++++++++++

Move to bindings/display/bridge/

>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/drm/bridge/dw_mipi_dsi.txt
> 
> diff --git a/Documentation/devicetree/bindings/drm/bridge/dw_mipi_dsi.txt b/Documentation/devicetree/bindings/drm/bridge/dw_mipi_dsi.txt
> new file mode 100644
> index 0000000..bb87466
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/drm/bridge/dw_mipi_dsi.txt
> @@ -0,0 +1,76 @@
> +Device-Tree bindings for Synopsys DesignWare MIPI DSI host controller
> +
> +The controller is a digital core that implements all protocol functions
> +defined in the MIPI DSI specification, providing an interface between
> +the system and the MIPI DPHY, and allowing communication with a MIPI DSI
> +compliant display.
> +
> +Required properties:
> + - #address-cells: Should be <1>.
> + - #size-cells: Should be <0>.
> + - compatible: The first compatible string should be "fsl,imx6q-mipi-dsi"
> +   for i.MX6q/sdl SoCs.  For other SoCs, please refer to their specific
> +   device tree binding documentations.  A common compatible string
> +   "snps,dw-mipi-dsi" should be appended for all SoCs.
> + - reg: Represent the physical address range of the controller.
> + - interrupts: Represent the controller's interrupt to the CPU(s).
> + - clocks, clock-names: Phandles to the controller's pll reference
> +   clock(ref), configuration clock(cfg) and APB clock(pclk), as
> +   described in [1].
> +
> +For more required properties, please refer to relevant device tree binding
> +documentations which describe the controller embedded in specific SoCs.
> +
> +Required sub-nodes:
> + - A node to represent a DSI peripheral as described in [2].
> +
> +For more required sub-nodes, please refer to relevant device tree binding
> +documentations which describe the controller embedded in specific SoCs.
> +
> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> +[2] Documentation/devicetree/bindings/mipi/dsi/mipi-dsi-bus.txt

This is now in bindings/display/mipi-dsi-bus.txt

> +
> +example:
> +	gpr: iomuxc-gpr@020e0000 {
> +		/* ... */
> +	};
> +
> +	mipi_dsi: mipi@021e0000 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "fsl,imx6q-mipi-dsi", "snps,dw-mipi-dsi";
> +		reg = <0x021e0000 0x4000>;
> +		interrupts = <0 102 IRQ_TYPE_LEVEL_HIGH>;
> +		gpr = <&gpr>;
> +		clocks = <&clks IMX6QDL_CLK_MIPI_CORE_CFG>,
> +			 <&clks IMX6QDL_CLK_MIPI_CORE_CFG>,
> +			 <&clks IMX6QDL_CLK_MIPI_IPG>;
> +		clock-names = "ref", "cfg", "pclk";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				mipi_mux_0: endpoint {
> +					remote-endpoint = <&ipu1_di0_mipi>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				mipi_mux_1: endpoint {
> +					remote-endpoint = <&ipu1_di1_mipi>;
> +				};
> +			};
> +		};
> +
> +		panel {
> +			compatible = "truly,tft480800-16-e-dsi";
> +			reg = <0>;
> +			/* ... */
> +		};
> +	};
> -- 
> 2.6.2
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
