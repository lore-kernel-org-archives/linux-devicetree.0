From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 1/2] dt-bindings: add mmio-based syscon mux controller DT
 bindings
Date: Wed, 19 Apr 2017 17:09:00 -0500
Message-ID: <20170419220900.ndrtt2m7d6tqsddh@rob-hp-laptop>
References: <20170413154812.19597-1-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170413154812.19597-1-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 13, 2017 at 05:48:11PM +0200, Philipp Zabel wrote:
> This adds device tree binding documentation for mmio-based syscon
> multiplexers controlled by a single bitfield in a syscon register
> range.
> 
> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mux/mmio-mux.txt | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mux/mmio-mux.txt
> 
> diff --git a/Documentation/devicetree/bindings/mux/mmio-mux.txt b/Documentation/devicetree/bindings/mux/mmio-mux.txt
> new file mode 100644
> index 0000000000000..11d96f5d98583
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mux/mmio-mux.txt
> @@ -0,0 +1,56 @@
> +MMIO bitfield-based multiplexer controller bindings
> +
> +Define a syscon bitfield to be used to control a multiplexer. The parent
> +device tree node must be a syscon node to provide register access.
> +
> +Required properties:
> +- compatible : "gpio-mux"

?

> +- reg : register base of the register containing the control bitfield
> +- bit-mask : bitmask of the control bitfield in the control register
> +- bit-shift : bit offset of the control bitfield in the control register
> +- #mux-control-cells : <0>
> +* Standard mux-controller bindings as decribed in mux-controller.txt
> +
> +Optional properties:
> +- idle-state : if present, the state the mux will have when idle. The
> +	       special state MUX_IDLE_AS_IS is the default.
> +
> +The multiplexer state is defined as the value of the bitfield described
> +by the reg, bit-mask, and bit-shift properties, accessed through the parent
> +syscon.
> +
> +Example:
> +
> +	syscon {
> +		compatible = "syscon";
> +
> +		mux: mux-controller@3 {
> +			compatible = "mmio-mux";
> +			reg = <0x3>;
> +			bit-mask = <0x1>;
> +			bit-shift = <5>;

This pattern doesn't scale once you have multiple fields @ addr 3. I 
also don't really think a node per register field in DT really scales.

I think the parent should be declared as a mux controller instead. You 
could encode the mux addr and bit position in the mux cells.

> +			#mux-control-cells = <0>;
> +		};
> +	};
> +
> +	video-mux {
> +		compatible = "video-mux";
> +		mux-controls = <&mux>;

The mux binding was largely defined for a single control controling 
multiple muxes. This doesn't really fit that, but I guess this is an 
improvement over a custom syscon phandle.

> +
> +		ports {
> +			/* input 0 */
> +			port@0 {
> +				reg = <0>;
> +			};
> +
> +			/* input 1 */
> +			port@1 {
> +				reg = <1>;
> +			};
> +
> +			/* output */
> +			port@2 {
> +				reg = <2>;
> +			};
> +		};
> +	};
> -- 
> 2.11.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
