From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: mxsfb: Add bindings for the MXSFB
 KMS/DRM driver
Date: Fri, 2 Sep 2016 07:30:21 -0500
Message-ID: <20160902123021.GA20726@rob-hp-laptop>
References: <20160826142742.7236-1-marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160826142742.7236-1-marex-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 26, 2016 at 04:27:41PM +0200, Marek Vasut wrote:
> Add DT bindings for new MXSFB driver using the DRM framework.
> The old MXSFB fbdev driver bindings are preserved in mxsfb.txt .

They should be documented in the same place as they describe the same 
h/w. I've not looked how incompatible they are, but I'd expect that to 
be described here.

> Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  .../devicetree/bindings/display/mxsfb-drm.txt      | 33 ++++++++++++++++++++++

DRM is a Linuxism.

>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mxsfb-drm.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/mxsfb-drm.txt b/Documentation/devicetree/bindings/display/mxsfb-drm.txt
> new file mode 100644
> index 0000000..e70d337
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mxsfb-drm.txt
> @@ -0,0 +1,33 @@
> +* Freescale MXS LCD Interface (LCDIF) with KMS/DRM support

KMS/DRM is a Linuxism.

> +
> +Required properties:
> +- compatible:	Should be "fsl,imx23-lcdif" for i.MX23.
> +		Should be "fsl,imx28-lcdif" for i.MX28 and i.MX6SX.

MX6SX should have it's own compatible string. Knowing some of the 
development history, I would doubt they are exactly the same.

Also, IIRC MX50 variants have LCDIF.

> +- reg:		Address and length of the register set for lcdif
> +- interrupts:	Should contain lcdif interrupts
> +- clocks:	A list of phandle + clock-specifier pairs, one for each
> +		entry in 'clock-names'.
> +- clock-names:	A list of clock names. For MXSFB it should contain:
> +    - "pix" for the MXSFB block clock
> +    - (optional) "axi", "disp_axi" for the bus interface clock on MX6SX

Doesn't this mean required on MX6SX?

> +
> +Required sub-nodes:
> +  - port: The connection to an encoder chip.
> +
> +Example:
> +
> +	lcdif1: lcdif@02220000 {

Drop the leading 0.

> +		compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
> +		reg = <0x02220000 0x4000>;
> +		interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&clks IMX6SX_CLK_LCDIF1_PIX>,
> +			 <&clks IMX6SX_CLK_LCDIF_APB>,
> +			 <&clks IMX6SX_CLK_DISPLAY_AXI>;
> +		clock-names = "pix", "axi", "disp_axi";
> +
> +		port {
> +			parallel_out: endpoint {
> +				remote-endpoint = <&panel_in_parallel>;
> +			};
> +		};
> +	};
> -- 
> 2.9.3
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
