From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 02/14] drm/etnaviv: add devicetree bindings
Date: Wed, 9 Dec 2015 14:14:14 -0600
Message-ID: <20151209201414.GA31697@rob-hp-laptop>
References: <1449661707-30532-1-git-send-email-l.stach@pengutronix.de>
 <1449661707-30532-2-git-send-email-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1449661707-30532-2-git-send-email-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Christian Gmeiner <christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 09, 2015 at 12:48:15PM +0100, Lucas Stach wrote:
> Etnaviv follows the same priciple as imx-drm to have a virtual
> master device node to bind all the individual GPU cores together
> into one DRM device.
> 
> Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
> v2: Add note why a more specific compatible isn't needed for
> GPU core nodes.
> ---
>  .../bindings/display/etnaviv/etnaviv-drm.txt       | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt b/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
> new file mode 100644
> index 000000000000..01254f40b11b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
> @@ -0,0 +1,49 @@
> +Etnaviv DRM master device
> +================================
> +
> +The Etnaviv DRM master device is a virtual device needed to list all
> +Vivante GPU cores that comprise the GPU subsystem.
> +
> +Required properties:
> +- compatible: Should be one of
> +    "fsl,imx-gpu-subsystem"
> +    "marvell,dove-gpu-subsystem"
> +- cores: Should contain a list of phandles pointing to Vivante GPU devices
> +
> +example:
> +
> +gpu-subsystem {
> +	compatible = "fsl,imx-gpu-subsystem";
> +	cores = <&gpu_2d>, <&gpu_3d>;
> +};
> +
> +
> +Vivante GPU core devices
> +====================
> +
> +Required properties:
> +- compatible: Should be "vivante,gc"
> +  A more specific compatible is not needed, as the cores contain chip
> +  identification registers at fixed locations, which provide all the
> +  necessary information to the driver.
> +- reg: should be register base and length as documented in the
> +  datasheet
> +- interrupts: Should contain the cores interrupt line
> +- clocks: should contain one clock for entry in clock-names
> +  see Documentation/devicetree/bindings/clock/clock-bindings.txt
> +- clock-names:
> +   - "bus":    AXI/register clock
> +   - "core":   GPU core clock
> +   - "shader": Shader clock (only required if GPU has feature PIPE_3D)
> +
> +example:
> +
> +gpu_3d: gpu@00130000 {
> +	compatible = "vivante,gc";
> +	reg = <0x00130000 0x4000>;
> +	interrupts = <0 9 IRQ_TYPE_LEVEL_HIGH>;
> +	clocks = <&clks IMX6QDL_CLK_GPU3D_AXI>,
> +	         <&clks IMX6QDL_CLK_GPU3D_CORE>,
> +	         <&clks IMX6QDL_CLK_GPU3D_SHADER>;
> +	clock-names = "bus", "core", "shader";
> +};
> -- 
> 2.6.2
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
