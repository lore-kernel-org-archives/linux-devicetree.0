From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC 1/2] dt-bindings: add mmio-based syscon mux controller DT
 bindings
Date: Thu, 20 Apr 2017 15:03:13 +0200
Message-ID: <1492693393.2158.71.camel@pengutronix.de>
References: <20170413154812.19597-1-p.zabel@pengutronix.de>
         <20170419220900.ndrtt2m7d6tqsddh@rob-hp-laptop>
         <1492676048.2158.25.camel@pengutronix.de>
         <3f6e0337-46e1-fcfd-430b-4221e45c6ca8@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3f6e0337-46e1-fcfd-430b-4221e45c6ca8-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2017-04-20 at 13:57 +0200, Peter Rosin wrote:
> On 2017-04-20 10:14, Philipp Zabel wrote:
> > Hi Rob,
> > 
> > On Wed, 2017-04-19 at 17:09 -0500, Rob Herring wrote:
> >> On Thu, Apr 13, 2017 at 05:48:11PM +0200, Philipp Zabel wrote:
> >>> This adds device tree binding documentation for mmio-based syscon
> >>> multiplexers controlled by a single bitfield in a syscon register
> >>> range.
> >>>
> >>> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >>> ---
> >>>  Documentation/devicetree/bindings/mux/mmio-mux.txt | 56 ++++++++++++++++++++++
> >>>  1 file changed, 56 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/mux/mmio-mux.txt
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/mux/mmio-mux.txt b/Documentation/devicetree/bindings/mux/mmio-mux.txt
> >>> new file mode 100644
> >>> index 0000000000000..11d96f5d98583
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/mux/mmio-mux.txt
> >>> @@ -0,0 +1,56 @@
> >>> +MMIO bitfield-based multiplexer controller bindings
> >>> +
> >>> +Define a syscon bitfield to be used to control a multiplexer. The parent
> >>> +device tree node must be a syscon node to provide register access.
> >>> +
> >>> +Required properties:
> >>> +- compatible : "gpio-mux"
> >>
> >> ?
> >>
> >>> +- reg : register base of the register containing the control bitfield
> >>> +- bit-mask : bitmask of the control bitfield in the control register
> >>> +- bit-shift : bit offset of the control bitfield in the control register
> >>> +- #mux-control-cells : <0>
> >>> +* Standard mux-controller bindings as decribed in mux-controller.txt
> >>> +
> >>> +Optional properties:
> >>> +- idle-state : if present, the state the mux will have when idle. The
> >>> +	       special state MUX_IDLE_AS_IS is the default.
> >>> +
> >>> +The multiplexer state is defined as the value of the bitfield described
> >>> +by the reg, bit-mask, and bit-shift properties, accessed through the parent
> >>> +syscon.
> >>> +
> >>> +Example:
> >>> +
> >>> +	syscon {
> >>> +		compatible = "syscon";
> >>> +
> >>> +		mux: mux-controller@3 {
> >>> +			compatible = "mmio-mux";
> >>> +			reg = <0x3>;
> >>> +			bit-mask = <0x1>;
> >>> +			bit-shift = <5>;
> >>
> >> This pattern doesn't scale once you have multiple fields @ addr 3. I 
> >> also don't really think a node per register field in DT really scales.
> > 
> > Thanks, I have been a bit uneasy with the separate per-bitfield mux
> > controller node, so I'm eager to agree. But thit makes me unsure how to
> > best represent the information that is spelled out above.
> > 
> >> I think the parent should be declared as a mux controller instead.
> > 
> > The syscon node itself should be the mux controller? Would you expect
> > the mmio-mux driver bind to the syscon node, or should the mux framework
> > handle creation of the mux controls in this case (i.e. does the syscon
> > node get a "mmio-mux" added to its compatible list)?
> > 
> >> You could encode the mux addr and bit position in the mux cells.
> > 
> > What about the bit-mask / bitfield width? Just add a cell for it?
> > 
> > 	gpr: syscon {
> > 		compatible = "mmio-mux", "syscon", "simple-mfd";
> > 		#mux-control-cells = <3>;
> > 
> > 		video-mux {
> > 			compatible = "video-mux";
> > 			/* register 0x3, bits [6:5] */
> > 			mux-controls = <&gpr 0x3 5 0x3>;
> > 
> > 			ports {
> > 				/* ports 0..5 */
> > 			};
> > 		};
> > 	};
> > 
> > Or maybe using MSB and LSB would be better to read?
> > 
> > 		video-mux {
> > 			/* register 0x3, bits [6:5] */
> > 			mux-control = <&gpr 0x3 6 5>;
> > 
> > 			ports {
> > 				/* ports 0..5 */
> > 			};
> > 		};
> 
> Why do you need three values for one register+field? The shift can be
> implied from the mask, if the mask is pre-shifted. I.e. specifying a
> mask of 0x60 in this case. What I'm I missing?

As long as we have <= 32-bit hardware registers, that would work.
The question then is if things like
	mux-control = <&gpr 0x04 0x00300000>;
are considered readable/reviewable enough. And what happens when we get
64-bit general purpose registers containing muxes? Also a binding like
this would allow non-contiguous bit masks.
The reason I suggested using bit-shift in the first place was that there
are already other bindings using "bit-shift" or "reg-shift" properties.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
