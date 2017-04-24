From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: Re: [RFC v2 1/2] dt-bindings: add mmio-based syscon mux controller DT
 bindings
Date: Mon, 24 Apr 2017 23:04:31 +0200
Message-ID: <7507360c-b741-1fdd-7dbf-397eee597b23@axentia.se>
References: <1493050349-25533-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493050349-25533-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2017-04-24 18:12, Philipp Zabel wrote:
> This adds device tree binding documentation for mmio-based syscon
> multiplexers controlled by a single bitfield in a syscon register
> range.

Single bitfield?

> 
> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
> Changes since v1:
>  - Replaced reg, bit-mask, and bit-shift properties with mux-reg-masks array
>    to allow defining multiple mux bit-fields per mmio-mux instance.
>  - Changed mux-control-cells value to <1>, the cell value is an index into
>    the mux-reg-masks array.
>  - Replaced idle-state with idle-states array.
> ---
>  Documentation/devicetree/bindings/mux/mmio-mux.txt | 60 ++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mux/mmio-mux.txt
> 
> diff --git a/Documentation/devicetree/bindings/mux/mmio-mux.txt b/Documentation/devicetree/bindings/mux/mmio-mux.txt
> new file mode 100644
> index 0000000000000..99282fa761c55
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mux/mmio-mux.txt
> @@ -0,0 +1,60 @@
> +MMIO register bitfield-based multiplexer controller bindings
> +
> +Define register bitfields to be used to control multiplexers. The parent
> +device tree node must be a syscon node to provide register access.
> +
> +Required properties:
> +- compatible : "mmio-mux"
> +- #mux-control-cells : <1>
> +- mux-reg-masks : an array of register offset and pre-shifted bitfield mask
> +                  pairs, each describing a single mux control.
> +* Standard mux-controller bindings as decribed in mux-controller.txt
> +
> +Optional properties:
> +- idle-states : if present, the state the muxes will have when idle. The
> +		special state MUX_IDLE_AS_IS is the default.
> +
> +The multiplexer state is defined as the value of the bitfield described
> +by the reg, bit-mask, and bit-shift properties, accessed through the parent
> +syscon.

This paragraph needs updating.

> +
> +Example:
> +
> +	syscon {
> +		compatible = "syscon";
> +
> +		mux: mux-controller@3 {

You shouldn't do ...@3 if you don't have a reg property.

Cheers,
peda

> +			compatible = "mmio-mux";
> +			#mux-control-cells = <1>;
> +
> +			mux-reg-masks = <0x3 0x30>, /* 0: reg 0x3, bits 5:4 */
> +					<0x3 0x40>, /* 1: reg 0x3, bit 6 */
> +			idle-states = <MUX_IDLE_AS_IS>, <0>;
> +		};
> +	};
> +
> +	video-mux {
> +		compatible = "video-mux";
> +		mux-controls = <&mux 0>;
> +
> +		ports {
> +			/* inputs 0..3 */
> +			port@0 {
> +				reg = <0>;
> +			};
> +			port@1 {
> +				reg = <1>;
> +			};
> +			port@2 {
> +				reg = <2>;
> +			};
> +			port@3 {
> +				reg = <3>;
> +			};
> +
> +			/* output */
> +			port@4 {
> +				reg = <4>;
> +			};
> +		};
> +	};
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
