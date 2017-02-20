From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/9] gpu: ipu-v3: add DT binding for the Prefetch
 Resolve Engine
Date: Mon, 20 Feb 2017 16:01:26 +0100
Message-ID: <1487602886.3878.16.camel@pengutronix.de>
References: <20170217182830.32618-1-l.stach@pengutronix.de>
         <20170217182830.32618-3-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170217182830.32618-3-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2017-02-17 at 19:28 +0100, Lucas Stach wrote:
> The Prefetch Resolve Engine is a prefetch and tile resolve engine
> which prefetches display data from DRAM to an internal SRAM region.
> It has a single clock for configuration register access and the
> functional units. A single shared interrupt is used for status and
> error signaling.
> 
> The only external dependency is the SRAM region to use for the
> prefetch double buffer.
> 
> Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  .../bindings/display/imx/fsl-imx-drm.txt           | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt b/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
> index 971c3eedb1c7..1bd777d7c37d 100644
> --- a/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
> +++ b/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
> @@ -53,6 +53,32 @@ ipu: ipu@18000000 {
>  	};
>  };
>  
> +Freescale i.MX PRE (Prefetch Resolve Engine)
> +============================================
> +
> +Required properties:
> +- compatible: should be "fsl,imx6qp-pre"
> +- reg: should be register base and length as documented in the
> +  datasheet
> +- clocks : phandle to the PRE axi clock input, as described
> +  in Documentation/devicetree/bindings/clock/clock-bindings.txt and
> +  Documentation/devicetree/bindings/clock/imx6q-clock.txt.
> +- clock-names: should be "axi"
> +- interrupts: should contain the PRE interrupt
> +- fsl,ocram: phandle pointing to the mmio-sram device node, that should be
> +  used for the PRE SRAM double buffer.
> +
> +example:
> +
> +pre@021c8000 {
> +	compatible = "fsl,imx6qp-pre";
> +	reg = <0x021c8000 0x1000>;
> +	interrupts = <GIC_SPI 90 IRQ_TYPE_EDGE_RISING>;
> +	clocks = <&clks IMX6QDL_CLK_PRE0>;
> +	clock-names = "axi";
> +	fsl,ocram = <&ocram2>;

Nitpick: the CODA property for this is called iram. Should we do the
same here in case the PRE is later used on other SoCs that call their
on-chip SRAM differently?
There is no mention of OCRAM in the PRE chapter in the i.MX6QP reference
manual, but Figures 38-1 and 38-5 mention an "IRAM Double Buffer".

> +};
> +
>  Parallel display support
>  ========================
>  

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
