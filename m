From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [RFC 1/2] dt-bindings: add mmio-based syscon mux controller DT
 bindings
Date: Tue, 18 Apr 2017 10:19:04 +0200
Message-ID: <1492503544.2432.32.camel@pengutronix.de>
References: <20170413154812.19597-1-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170413154812.19597-1-p.zabel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>, Pavel Machek <pavel@ucw.cz>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sakari Ailus <sakari.ailus@iki.fi>, Steve Longerbeam <slongerbeam@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Thu, 2017-04-13 at 17:48 +0200, Philipp Zabel wrote:
> This adds device tree binding documentation for mmio-based syscon
> multiplexers controlled by a single bitfield in a syscon register
> range.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
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

So Pavel (added to Cc:) suggested to merge these into one node for the
video mux, as really we are describing a single hardware entity that
happens to be multiplexing multiple video buses into one:

	syscon {
		compatible = "syscon";

		/* video multiplexer */
		mux: mux-controller@3 {
			compatible = "video-mmio-mux";
			reg = <0x3>;
			bit-mask = <0x1>;
			bit-shift = <5>;
			#mux-control-cells = <0>;
 
			mux-controls = <&mux>;

			ports {
				/* input 0 */
				port@0 {
					reg = <0>;
				};

				/* input 1 */
				port@1 {
					reg = <1>;
				};

				/* output */
				port@2 {
					reg = <2>;
				};
			};
		};
	};

That would not touch on this "general purpose" mmio-mux binding itself,
but would make it necessary to add a separate "video-mmio-mux" and a
"video-gpio-mux" binding that mirror the "mmio-mux" and "gpio-mux"
bindings but add the OF-graph connections.

Also I think in this case the self-referencing mux-controls property
would be superfluous, as the driver binding to this node is expected to
control the mux according to activation of the links described by the
OF-graph bindings.

regards
Philipp
