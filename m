From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC 1/2] dt-bindings: add mmio-based syscon mux controller DT
 bindings
Date: Thu, 20 Apr 2017 10:14:08 +0200
Message-ID: <1492676048.2158.25.camel@pengutronix.de>
References: <20170413154812.19597-1-p.zabel@pengutronix.de>
         <20170419220900.ndrtt2m7d6tqsddh@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170419220900.ndrtt2m7d6tqsddh@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Wed, 2017-04-19 at 17:09 -0500, Rob Herring wrote:
> On Thu, Apr 13, 2017 at 05:48:11PM +0200, Philipp Zabel wrote:
> > This adds device tree binding documentation for mmio-based syscon
> > multiplexers controlled by a single bitfield in a syscon register
> > range.
> > 
> > Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/mux/mmio-mux.txt | 56 ++++++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mux/mmio-mux.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/mux/mmio-mux.txt b/Documentation/devicetree/bindings/mux/mmio-mux.txt
> > new file mode 100644
> > index 0000000000000..11d96f5d98583
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mux/mmio-mux.txt
> > @@ -0,0 +1,56 @@
> > +MMIO bitfield-based multiplexer controller bindings
> > +
> > +Define a syscon bitfield to be used to control a multiplexer. The parent
> > +device tree node must be a syscon node to provide register access.
> > +
> > +Required properties:
> > +- compatible : "gpio-mux"
> 
> ?
>
> > +- reg : register base of the register containing the control bitfield
> > +- bit-mask : bitmask of the control bitfield in the control register
> > +- bit-shift : bit offset of the control bitfield in the control register
> > +- #mux-control-cells : <0>
> > +* Standard mux-controller bindings as decribed in mux-controller.txt
> > +
> > +Optional properties:
> > +- idle-state : if present, the state the mux will have when idle. The
> > +	       special state MUX_IDLE_AS_IS is the default.
> > +
> > +The multiplexer state is defined as the value of the bitfield described
> > +by the reg, bit-mask, and bit-shift properties, accessed through the parent
> > +syscon.
> > +
> > +Example:
> > +
> > +	syscon {
> > +		compatible = "syscon";
> > +
> > +		mux: mux-controller@3 {
> > +			compatible = "mmio-mux";
> > +			reg = <0x3>;
> > +			bit-mask = <0x1>;
> > +			bit-shift = <5>;
> 
> This pattern doesn't scale once you have multiple fields @ addr 3. I 
> also don't really think a node per register field in DT really scales.

Thanks, I have been a bit uneasy with the separate per-bitfield mux
controller node, so I'm eager to agree. But thit makes me unsure how to
best represent the information that is spelled out above.

> I think the parent should be declared as a mux controller instead.

The syscon node itself should be the mux controller? Would you expect
the mmio-mux driver bind to the syscon node, or should the mux framework
handle creation of the mux controls in this case (i.e. does the syscon
node get a "mmio-mux" added to its compatible list)?

> You could encode the mux addr and bit position in the mux cells.

What about the bit-mask / bitfield width? Just add a cell for it?

	gpr: syscon {
		compatible = "mmio-mux", "syscon", "simple-mfd";
		#mux-control-cells = <3>;

		video-mux {
			compatible = "video-mux";
			/* register 0x3, bits [6:5] */
			mux-controls = <&gpr 0x3 5 0x3>;

			ports {
				/* ports 0..5 */
			};
		};
	};

Or maybe using MSB and LSB would be better to read?

		video-mux {
			/* register 0x3, bits [6:5] */
			mux-control = <&gpr 0x3 6 5>;

			ports {
				/* ports 0..5 */
			};
		};

> > +			#mux-control-cells = <0>;
> > +		};
> > +	};
> > +
> > +	video-mux {
> > +		compatible = "video-mux";
> > +		mux-controls = <&mux>;
> 
> The mux binding was largely defined for a single control controling 
> multiple muxes. This doesn't really fit that, but I guess this is an 
> improvement over a custom syscon phandle.

What I especially like about the mux-controls property is that would
allow me to use the gpio-mux driver (or any other mux controller)
instead of having to code variants of the video-mux for all possible
control schemes.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
