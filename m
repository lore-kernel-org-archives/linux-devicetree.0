From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC 1/2] dt-bindings: add mmio-based syscon mux controller DT
 bindings
Date: Thu, 20 Apr 2017 16:50:16 +0200
Message-ID: <1492699816.2158.107.camel@pengutronix.de>
References: <20170413154812.19597-1-p.zabel@pengutronix.de>
         <20170419220900.ndrtt2m7d6tqsddh@rob-hp-laptop>
         <67388375-4f9e-fd1e-5155-7aeac0ea7b46@axentia.se>
         <b2e0c3bb-c74a-3ef3-6b58-1139d7a932a4@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b2e0c3bb-c74a-3ef3-6b58-1139d7a932a4-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2017-04-20 at 16:13 +0200, Peter Rosin wrote:
> On 2017-04-20 15:32, Peter Rosin wrote:
> > On 2017-04-20 00:09, Rob Herring wrote:
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
> >>
> >> I think the parent should be declared as a mux controller instead. You 
> >> could encode the mux addr and bit position in the mux cells.
> > 
> > But then you need to create mux controllers on demand. I have not
> > succeeded in doing that while also following the rules of the driver
> > model. I had severe problems with life-time issues when I tried.
> > I would like to see code before embarking on this path, and I'm
> > apparently not the one writing it...
> > 
> > So, either you meant that, or that the parent node should somehow
> > specify the possible mux controllers up front so that they can be
> > pre-created and ready when the consumers request them. But if you
> > do that, you can just refer to them by some enumeration from the
> > mux consumers instead of by some convoluted reg+field notation.
> 
> Ok, thinking some more about this. Sorry for spamming and replying to
> self...
> 
> How about:
> 
>  	syscon {
>  		compatible = "syscon", "simple-mfd";
> 
> 		mux: mux-controllers {
> 			compatible = "mmio-mux";
> 	 		#mux-control-cells = <1>;
> 
> 			/* three mux controllers, one at reg 3 bits 0:2,
> 			 * one at reg 3 bits 5:6 and one at reg 7 bit 3.
> 			 */
> 			mux-reg-masks = <0x3 0x07>, <0x3 0x60>, <0x7 0x08>;
> 			idle-state = <7>, <MUX_IDLE_AS_IS>, <0>;
> 		};
> 
>  
>  		video-mux {
>  			compatible = "video-mux";
>  			mux-controls = <&mux 1>; /* i.e. reg 3 bits 5:6 */
>  
>  			ports {
>  				/* ports 0..5 */
>  			};
>  		};
>  	};
> 
> Optionally using some 64-bit safe 3-value encoding of the register fields
> in the mux-reg-masks binding...

I would prefer this to putting the registers and bit masks into the
phandle cells. The i.MX6Q/D GPR muxes could look like this:

	gpr: iomuxc-gpr@020e0000 {
		compatible = "fsl,imx6q-iomuxc-gpr", "syscon";
		reg = <0x020e0000 0x38>;

		mux: mux-controllers {
			compatible = "mmio-mux";
			#mux-control-cells = <1>;

			/* This list is not complete */
			mux-reg-masks = <0x04 0x00080000>, /* MIPI_IPU1_MUX */
					<0x04 0x00100000>, /* MIPI_IPU2_MUX */
					<0x0c 0x0000000c>, /* HDMI_MUX_CTL */
					<0x0c 0x000000c0>, /* LVDS0_MUX_CTL */
					<0x0c 0x0000030c>, /* LVDS1_MUX_CTL */
					<0x28 0x00000003>, /* DCIC1_MUX_CTL */
					<0x28 0x0000000c>; /* DCIC2_MUX_CTL */
		};

		ipu1_csi0_mux {
			compatible = "video-mux";
			mux-controls = <&mux 0>;
			/* ... */
		};

		ipu2_csi1_mux {
			compatible = "video-mux";
			mux-controls = <&mux 1>;
			/* ... */
		};
	};

and for i.MX6DL/S:

	gpr: iomuxc-gpr@20e0000 {
		compatible = "fsl,imx6q-iomuxc-gpr", "syscon";
		reg = <0x020e0000 0x38>;

		mux: mux-controllers {
			compatible = "mmio-mux";
			#mux-control-cells = <1>;

			mux-reg-masks = <0x34 0x00000007>, /* IPU_CSI0_MUX */
					<0x34 0x00000038>, /* IPU_CSI1_MUX */
					<0x0c 0x0000000c>, /* HDMI_MUX_CTL */
					<0x0c 0x000000c0>, /* LVDS0_MUX_CTL */
					<0x0c 0x0000030c>, /* LVDS1_MUX_CTL */
					<0x28 0x00000003>, /* DCIC1_MUX_CTL */
					<0x28 0x0000000c>; /* DCIC2_MUX_CTL */
		};

		ipu1_csi0_mux {
			compatible = "video-mux";
			mux-controls = <&mux 0>;
			/* ... */
		};

		ipu1_csi1_mux {
			compatible = "video-mux";
			mux-controls = <&mux 1>;
			/* ... */
		};
	};

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
