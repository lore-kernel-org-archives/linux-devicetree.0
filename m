From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC 1/2] dt-bindings: add mmio-based syscon mux controller DT
 bindings
Date: Tue, 18 Apr 2017 12:51:11 +0200
Message-ID: <1492512671.2432.92.camel@pengutronix.de>
References: <20170413154812.19597-1-p.zabel@pengutronix.de>
         <1492503544.2432.32.camel@pengutronix.de>
         <20170418100840.GF7456@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170418100840.GF7456-S+BSfZ9RZZmRSg0ZkenSGLdO1Tsj/99ntUK59QYPAWc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2017-04-18 at 13:08 +0300, Sakari Ailus wrote:
> Hi Philipp,
> 
> On Tue, Apr 18, 2017 at 10:19:04AM +0200, Philipp Zabel wrote:
> > On Thu, 2017-04-13 at 17:48 +0200, Philipp Zabel wrote:
> > > This adds device tree binding documentation for mmio-based syscon
> > > multiplexers controlled by a single bitfield in a syscon register
> > > range.
> > > 
> > > Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
> > > +			#mux-control-cells = <0>;
> > > +		};
> > > +	};
> > > +
> > > +	video-mux {
> > > +		compatible = "video-mux";
> > > +		mux-controls = <&mux>;
> > > +
> > > +		ports {
> > > +			/* input 0 */
> > > +			port@0 {
> > > +				reg = <0>;
> > > +			};
> > > +
> > > +			/* input 1 */
> > > +			port@1 {
> > > +				reg = <1>;
> > > +			};
> > > +
> > > +			/* output */
> > > +			port@2 {
> > > +				reg = <2>;
> > > +			};
> > > +		};
> > > +	};
> > 
> > So Pavel (added to Cc:) suggested to merge these into one node for the
> > video mux, as really we are describing a single hardware entity that
> > happens to be multiplexing multiple video buses into one:
> 
> Two drivers will be needed in a way or another to disconnect the dependency
> between the video switch driver and the MUX implementation. Are there ways
> to do that cleanly other than having two devices?

We are talking about the device tree bindings, drivers and devices
shouldn't factor into it yet. A video-mmio-mux driver could very well
create a mmio-mux platform device internally, if necessary. Or it could
just use the same library functions that the mmio-mux driver uses,
without creating a second device.

> And if there are two devices, shouldn't the video switch device be a child
> of the MUX device? I think it'd be odd to have it hanging around in a
> completely unrelated part of the device tree.

That boils down to whether you consider the connection between mux
controller and mux to be resource usage that should be described via a
phandle reference, like pwms, gpios, clocks, and so on, or whether you
consider it to be control flow in the device tree sense, which should be
described as a parent-child relationship of the nodes. The mux framework
is designed around the former.

We could embrace this and consider a syscon region that contains
multiple mux bitfields as one mux controller that controls multiple
muxes, with a binding similar to, for example, the
reset/ti-syscon-reset.txt bindings:

	syscon {
		compatible = "syscon";

		mux: mux-controller@4 {
			compatible = "mmio-mux";

			/* register, bit shift, bit mask */
			mux-bits = <0x4 19 0x1>, /* 0: CSI0 mux */
				   <0x4 20 0x1>; /* 1: CSI1 mux */
			#mux-control-cells = <1>;
		};
	};

	/* somewhere else */

	csi0-mux {
		compatible = "video-mux";
		mux-controls = <&mux 0>;

		ports {
			/* ... */
		};
	};

	csi1-mux {
		compatible = "video-mux";
		mux-controls = <&mux 1>;

		ports {
			/* ... */
		};
	};

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
