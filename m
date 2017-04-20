From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC 1/2] dt-bindings: add mmio-based syscon mux controller DT
 bindings
Date: Thu, 20 Apr 2017 08:39:28 -0500
Message-ID: <20170420133928.m7zqvuwdbh7u5qlf@rob-hp-laptop>
References: <20170413154812.19597-1-p.zabel@pengutronix.de>
 <20170419220900.ndrtt2m7d6tqsddh@rob-hp-laptop>
 <1492676048.2158.25.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1492676048.2158.25.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Peter Rosin <peda@axentia.se>, Mark Rutland <mark.rutland@arm.com>, Sakari Ailus <sakari.ailus@iki.fi>, Steve Longerbeam <slongerbeam@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Thu, Apr 20, 2017 at 10:14:08AM +0200, Philipp Zabel wrote:
> Hi Rob,
> 
> On Wed, 2017-04-19 at 17:09 -0500, Rob Herring wrote:
> > On Thu, Apr 13, 2017 at 05:48:11PM +0200, Philipp Zabel wrote:
> > > This adds device tree binding documentation for mmio-based syscon
> > > multiplexers controlled by a single bitfield in a syscon register
> > > range.
> > > 
> > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > ---
> > >  Documentation/devicetree/bindings/mux/mmio-mux.txt | 56 ++++++++++++++++++++++
> > >  1 file changed, 56 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mux/mmio-mux.txt
> > > 
> > > diff --git a/Documentation/devicetree/bindings/mux/mmio-mux.txt b/Documentation/devicetree/bindings/mux/mmio-mux.txt
> > > new file mode 100644
> > > index 0000000000000..11d96f5d98583
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mux/mmio-mux.txt
> > > @@ -0,0 +1,56 @@
> > > +MMIO bitfield-based multiplexer controller bindings
> > > +
> > > +Define a syscon bitfield to be used to control a multiplexer. The parent
> > > +device tree node must be a syscon node to provide register access.
> > > +
> > > +Required properties:
> > > +- compatible : "gpio-mux"
> > 
> > ?
> >
> > > +- reg : register base of the register containing the control bitfield
> > > +- bit-mask : bitmask of the control bitfield in the control register
> > > +- bit-shift : bit offset of the control bitfield in the control register
> > > +- #mux-control-cells : <0>
> > > +* Standard mux-controller bindings as decribed in mux-controller.txt
> > > +
> > > +Optional properties:
> > > +- idle-state : if present, the state the mux will have when idle. The
> > > +	       special state MUX_IDLE_AS_IS is the default.
> > > +
> > > +The multiplexer state is defined as the value of the bitfield described
> > > +by the reg, bit-mask, and bit-shift properties, accessed through the parent
> > > +syscon.
> > > +
> > > +Example:
> > > +
> > > +	syscon {
> > > +		compatible = "syscon";
> > > +
> > > +		mux: mux-controller@3 {
> > > +			compatible = "mmio-mux";
> > > +			reg = <0x3>;
> > > +			bit-mask = <0x1>;
> > > +			bit-shift = <5>;
> > 
> > This pattern doesn't scale once you have multiple fields @ addr 3. I 
> > also don't really think a node per register field in DT really scales.
> 
> Thanks, I have been a bit uneasy with the separate per-bitfield mux
> controller node, so I'm eager to agree. But thit makes me unsure how to
> best represent the information that is spelled out above.
> 
> > I think the parent should be declared as a mux controller instead.
> 
> The syscon node itself should be the mux controller? Would you expect
> the mmio-mux driver bind to the syscon node, or should the mux framework
> handle creation of the mux controls in this case (i.e. does the syscon
> node get a "mmio-mux" added to its compatible list)?

Using compatibles here doesn't scale either. If we had 30 functions in 
a syscon, we'd have 30 different compatibles. The syscon node should 
have a specific compatible which implies it is a mux controller (as does 
#mux-controll-cells). So I would expect either you add compatibles to 
the mmio-mux driver or you have a specific driver for the syscon that 
in turn registers a mux device. Either way, it doesn't affect the binding.

> 
> > You could encode the mux addr and bit position in the mux cells.
> 
> What about the bit-mask / bitfield width? Just add a cell for it?

As Peter said, just a shifted mask should be enough.

> 	gpr: syscon {
> 		compatible = "mmio-mux", "syscon", "simple-mfd";
> 		#mux-control-cells = <3>;
> 
> 		video-mux {
> 			compatible = "video-mux";
> 			/* register 0x3, bits [6:5] */
> 			mux-controls = <&gpr 0x3 5 0x3>;
> 
> 			ports {
> 				/* ports 0..5 */
> 			};
> 		};
> 	};
> 
> Or maybe using MSB and LSB would be better to read?
> 
> 		video-mux {
> 			/* register 0x3, bits [6:5] */
> 			mux-control = <&gpr 0x3 6 5>;
> 
> 			ports {
> 				/* ports 0..5 */
> 			};
> 		};
> 
> > > +			#mux-control-cells = <0>;
> > > +		};
> > > +	};
> > > +
> > > +	video-mux {
> > > +		compatible = "video-mux";
> > > +		mux-controls = <&mux>;
> > 
> > The mux binding was largely defined for a single control controling 
> > multiple muxes. This doesn't really fit that, but I guess this is an 
> > improvement over a custom syscon phandle.
> 
> What I especially like about the mux-controls property is that would
> allow me to use the gpio-mux driver (or any other mux controller)
> instead of having to code variants of the video-mux for all possible
> control schemes.

Yes, that's true.

Rob
