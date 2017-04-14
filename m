From: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 1/2] dt-bindings: add mmio-based syscon mux controller DT
 bindings
Date: Thu, 13 Apr 2017 18:03:43 -0700
Message-ID: <d6d32063-5df3-3848-32f5-824c500a8927@gmail.com>
References: <20170413154812.19597-1-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170413154812.19597-1-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 04/13/2017 08:48 AM, Philipp Zabel wrote:
> This adds device tree binding documentation for mmio-based syscon
> multiplexers controlled by a single bitfield in a syscon register
> range.

Nice! (you beat me to it, I was about to embark on this myself :)

Looks good to me, just some minor comments below.

>
> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>   Documentation/devicetree/bindings/mux/mmio-mux.txt | 56 ++++++++++++++++++++++
>   1 file changed, 56 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mux/mmio-mux.txt
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

I think "Define a register bitfield to be used ..." is more clear.

> +device tree node must be a syscon node to provide register access.
> +
> +Required properties:
> +- compatible : "gpio-mux"

Er, "mmio-mux"

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
> +			#mux-control-cells = <0>;
> +		};
> +	};
> +
> +	video-mux {

I like this as an example consumer of a mmio-mux, but just
the same some might argue this doesn't really fit here.

Steve

> +		compatible = "video-mux";
> +		mux-controls = <&mux>;
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
