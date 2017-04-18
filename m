From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [RFC 1/2] dt-bindings: add mmio-based syscon mux controller DT
 bindings
Date: Tue, 18 Apr 2017 13:55:40 +0300
Message-ID: <20170418105540.GH7456@valkosipuli.retiisi.org.uk>
References: <20170413154812.19597-1-p.zabel@pengutronix.de>
 <1492503544.2432.32.camel@pengutronix.de>
 <20170418100840.GF7456@valkosipuli.retiisi.org.uk>
 <20170418103453.GC14505@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170418103453.GC14505@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Steve Longerbeam <slongerbeam@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Tue, Apr 18, 2017 at 12:34:53PM +0200, Pavel Machek wrote:
> On Tue 2017-04-18 13:08:41, Sakari Ailus wrote:
> > Hi Philipp,
> > 
> > On Tue, Apr 18, 2017 at 10:19:04AM +0200, Philipp Zabel wrote:
> > > On Thu, 2017-04-13 at 17:48 +0200, Philipp Zabel wrote:
> > > > This adds device tree binding documentation for mmio-based syscon
> > > > multiplexers controlled by a single bitfield in a syscon register
> > > > range.
> > > > 
> > > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > > ---
> > > >  Documentation/devicetree/bindings/mux/mmio-mux.txt | 56 ++++++++++++++++++++++
> > > >  1 file changed, 56 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/mux/mmio-mux.txt
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/mux/mmio-mux.txt b/Documentation/devicetree/bindings/mux/mmio-mux.txt
> > > > new file mode 100644
> > > > index 0000000000000..11d96f5d98583
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/mux/mmio-mux.txt
> > > > @@ -0,0 +1,56 @@
> > > > +MMIO bitfield-based multiplexer controller bindings
> > > > +
> > > > +Define a syscon bitfield to be used to control a multiplexer. The parent
> > > > +device tree node must be a syscon node to provide register access.
> > > > +
> > > > +Required properties:
> > > > +- compatible : "gpio-mux"
> > > > +- reg : register base of the register containing the control bitfield
> > > > +- bit-mask : bitmask of the control bitfield in the control register
> > > > +- bit-shift : bit offset of the control bitfield in the control register
> > > > +- #mux-control-cells : <0>
> > > > +* Standard mux-controller bindings as decribed in mux-controller.txt
> > > > +
> > > > +Optional properties:
> > > > +- idle-state : if present, the state the mux will have when idle. The
> > > > +	       special state MUX_IDLE_AS_IS is the default.
> > > > +
> > > > +The multiplexer state is defined as the value of the bitfield described
> > > > +by the reg, bit-mask, and bit-shift properties, accessed through the parent
> > > > +syscon.
> > > > +
> > > > +Example:
> > > > +
> > > > +	syscon {
> > > > +		compatible = "syscon";
> > > > +
> > > > +		mux: mux-controller@3 {
> > > > +			compatible = "mmio-mux";
> > > > +			reg = <0x3>;
> > > > +			bit-mask = <0x1>;
> > > > +			bit-shift = <5>;
> > > > +			#mux-control-cells = <0>;
> > > > +		};
> > > > +	};
> > > > +
> > > > +	video-mux {
> > > > +		compatible = "video-mux";
> > > > +		mux-controls = <&mux>;
> > > > +
> > > > +		ports {
> > > > +			/* input 0 */
> > > > +			port@0 {
> > > > +				reg = <0>;
> > > > +			};
> > > > +
> > > > +			/* input 1 */
> > > > +			port@1 {
> > > > +				reg = <1>;
> > > > +			};
> > > > +
> > > > +			/* output */
> > > > +			port@2 {
> > > > +				reg = <2>;
> > > > +			};
> > > > +		};
> > > > +	};
> > > 
> > > So Pavel (added to Cc:) suggested to merge these into one node for the
> > > video mux, as really we are describing a single hardware entity that
> > > happens to be multiplexing multiple video buses into one:
> > 
> > Two drivers will be needed in a way or another to disconnect the dependency
> > between the video switch driver and the MUX implementation. Are there ways
> > to do that cleanly other than having two devices?
> 
> Yes.
> 
> Device tree describes hardware, not the driver structure.

I think you you could view the MUX control as a device, too, and that's
separate from the actual video switch.

This isn't really related to the video switch as much as it's got to do with
the MUX framework, so having Peter's opinion here would be very helpful.

-- 
Kind regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
