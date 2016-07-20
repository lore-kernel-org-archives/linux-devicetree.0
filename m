From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/7] drm/bridge: Add RGB to VGA bridge support
Date: Wed, 20 Jul 2016 14:34:09 -0500
Message-ID: <20160720193409.GA17313@rob-hp-laptop>
References: <20160720095857.12297-1-maxime.ripard@free-electrons.com>
 <20160720095857.12297-5-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160720095857.12297-5-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 20, 2016 at 11:58:54AM +0200, Maxime Ripard wrote:
> Some boards have an entirely passive RGB to VGA bridge, based on either
> DACs or resistor ladders.
> 
> Those might or might not have an i2c bus routed to the VGA connector in
> order to access the screen EDIDs.
> 
> Add a bridge that doesn't do anything but expose the modes available on the
> screen, either based on the EDIDs if available, or based on the XGA
> standards.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  .../bindings/display/bridge/dumb-vga.txt           |  54 +++++
>  drivers/gpu/drm/bridge/Kconfig                     |   6 +
>  drivers/gpu/drm/bridge/Makefile                    |   1 +
>  drivers/gpu/drm/bridge/dumb-vga.c                  | 232 +++++++++++++++++++++
>  4 files changed, 293 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/dumb-vga.txt
>  create mode 100644 drivers/gpu/drm/bridge/dumb-vga.c
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/dumb-vga.txt b/Documentation/devicetree/bindings/display/bridge/dumb-vga.txt
> new file mode 100644
> index 000000000000..0056ffa2b31d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/dumb-vga.txt
> @@ -0,0 +1,54 @@
> +Passive RGB to VGA bridge
> +-------------------------
> +
> +This binding is aimed for entirely passive RGB to VGA bridges that do not
> +require any configuration.
> +
> +Required properties:
> +
> +- compatible: Must be "dumb-vga-bridge"
> +
> +Required nodes:
> +
> +This device has two video ports. Their connections are modeled using the OF
> +graph bindings specified in Documentation/devicetree/bindings/graph.txt.
> +
> +- Video port 0 for RGB input
> +- Video port 1 for VGA output
> +
> +
> +Example
> +-------
> +
> +bridge {
> +	compatible = "dumb-vga-bridge";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0>;
> +
> +			vga_bridge_in: endpoint@0 {
> +				reg = <0>;

Don't need a unit address here.

> +				remote-endpoint = <&tcon0_out_vga>;
> +			};
> +		};
> +
> +		port@1 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <1>;
> +
> +			vga_bridge_out: endpoint@0 {
> +				reg = <0>;

Ditto.

> +				remote-endpoint = <&vga_con_in>;

Would be good to show the connector node in the example too.

With those changes,

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
