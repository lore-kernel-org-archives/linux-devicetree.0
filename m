From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC] Documentation: devicetree: bindings: drm: Xylon binding
Date: Wed, 29 Jan 2014 17:32:42 +0000
Message-ID: <20140129173242.GH6651@e106331-lin.cambridge.arm.com>
References: <52E67F9E.20492.1406B56@davorjoja.logicbricks.com>
 <20140127162255.GG16516@e106331-lin.cambridge.arm.com>
 <52E6987F.25008.1A19A05@davorjoja.logicbricks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52E6987F.25008.1A19A05-l//4pz4nnF2T4XiunKkQOL/f6Pfn6aUBAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Davor Joja <davorjoja-bBue3UIS71U2IjGS+8YXRQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 27, 2014 at 05:33:51PM +0000, Davor Joja wrote:
> Hi Mark,
> 
> > On Mon, Jan 27, 2014 at 03:47:42PM +0000, Davor Joja wrote:
> > > Hi,
> > 
> > Hi,
> > 
> > > 
> > > Can I please get comments about adding new vendor prefix "xylon", and on 
> > > following devicetree binding for Xylon configurable video controller (logiCVC).
> > > Shown node is prepared for Xilinx Linux kernel dts file.
> > 
> > Does this device have any publicly-accessible documentation?
> 
> Yes it has, but it does not explain the details mentioned in binding.
> http://www.logicbricks.com/Documentation/Datasheets/IP/logiCVC-ML_hds.pdf
> 
> > 
> > It would be helpful if you could Cc this to some graphics related
> > mailing lists. Not everyone on devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org is a graphics
> > expert, and you'll get much better feedback with the relevant people on
> > Cc.
> > 
> 
> Ok, CC'ed.
> 
> > It would also be nice to see some code with the binding, and for both
> > the code and binding to be sent as patches. That makes it _far_ easier
> > to review as it's far easier to compare with existing bindings if in a
> > standard format.
> > 
> 
> Currently I do not have it. I only have some old binding which I want to get 
> rid off. That is why I want to change binding (officially) and then rewrite the 
> driver code for that exact binding.

Why not write the code, and propose the binding with an example user
that shows it's possible to make use of the information in the binding?

> 
> > > 
> > > 
> > > logicvc_0: logicvc@40030000 {
> > > 	compatible = "xylon,logicvc-4.00.a";
> > > 	reg = <0x40030000 0x6000>;
> > > 	interrupt-parent = <&ps7_scugic_0>;
> > > 	interrupts = <0 59 4>;
> > > 	background-layer-bits-per-pixel = <32>;
> > > 	display-interface = <0>;
> > > 	display-color-space = <1>;
> > > 	is-readable-regs = <1>;
> > > 	is-size-position = <1>;
> > > 	layer-width = <2048>;
> > > 	num-layers = <4>;
> > > 	layer_0 {
> > > 		address = <0>;
> > > 		alpha-mode = <0>;
> > > 		data-width = <16>;
> > > 		type = <0>;
> > > 	} ;
> > > 	layer_1 {
> > > 		address = <0>;
> > > 		alpha-mode = <0>;
> > > 		data-width = <32>;
> > > 		type = <0>;
> > > 	} ;
> > > 	layer_2 {
> > > 		address = <0>;
> > > 		alpha-mode = <1>;
> > > 		data-width = <32>;
> > > 		type = <0>;
> > > 	} ;
> > > 	layer_3 {
> > > 		address = <0>;
> > > 		alpha-mode = <0>;
> > > 		data-width = <16>;
> > > 		type = <1>;
> > > 	} ;
> > > } ;
> > > 
> > > 
> > > Required properties for configuring logiCVC device:
> > >  - compatible: value must be "xylon,logicvc-4.00.a"
> > >  - reg: base address and size of the logiCVC IP
> > 
> > Presumably the address and size of the MMIO region the IP has?
> 
> Yes, MMIO region address where IP resides and size of IP registers area.
> 
> > 
> > Does it only have a single bank of registers?
> > 
> 
> Yes.
> 
> > >  - interrupts-parent: the phandle for interrupt controller
> > >  - interrupts: the interrupt number
> > 
> > Does the device have only a single interrupt?
> 
> Yes, in this case connected to ARM GIC.
> 
> > 
> > >  - background-layer-bits-per-pixel: background layer color format (0, 16, 32)
> > >       if "0" last available layer is standard layer
> > 
> > Why is 0 quoted, and what is a "standard layer"?
> 
> Thought that this is simple way for saying "not used".
> Maybe have / not to have property?

Omitting the property would be clearer.

> 
> > 
> > >       if 16 or 32, last available layer is background layer implemented in
> > >       hw register and containing specified bits per pixel color value
> > >  - display-interface: logiCVC to display physical interface
> > >       (0=Parallel, 1=ITU656)
> > >  - display-color-space: logiCVC to display physical color space
> > >       (0=RGB, 1=YCbCr 4:2:2, 2=YCbCr 4:4:4)
> > 
> > These sound like they should be properties of the display this unit is
> > attached to.
> 
> To be more exact, this is output interface to whatever (LCD, encoder, 
> converter, ...), but it is IP property selectable when configuring.
> Maybe better name for property should be "interface" and "color-space".

This still sounds like a property of the display. Other bindings
describe the display, and then configure the device as appropriate for
the display.

> 
> > 
> > >  - is-readable-regs: all hw registers are readable by sw
> > 
> > Which registers aren't always accessible?
> 
> IP core can be configured to disable read registers access to all except 
> interrupt status power control and interupt status.

OK. Please name the property to be more specific, and mention this in
the binding.

> 
> > 
> > >  - is-size-position: hw changing of layer size and position
> > 
> > These look like booleans, but have values above.
> 
> Yes, it is boolean.
> Should it be
> "readable-regs;" instead "is-readable-regs = <1>;"
> "size-position;" instead "is-size-position = <1>;"

Yes.

Also, please elaborate on "hw changing of layer size and position".

> 
> > 
> > >  - layer-width: layer width in pixels, common for all layers
> > >  - num-layers: supported number of layers (1-5)
> > 
> > If you require a node for each layer, you don't need this proeprty --
> > you can simply count the layer nodes.
> 
> True, I do not know what is practice in this case.
> 
> > 
> > >       if "background-layer-bits-per-pixel != 0", "num-layers" property value is
> > >       decreased by 1
> > 
> > Does that mean the author of the dt subtracts one, or this is done by
> > the kernel?
> > 
> 
> In given example it is substracted by author, and I would like to have it like 
> that.
> This comment should be just info for user, and maybe it is confusing.

Get rid of the num-layers property entirely. It's redundant and
confusing.

If a layer is unusable / not present, don't describe it.

> 
> > Why?
> > 
> > >  - layer_N
> > 
> > Where N is?
> 
> 0-4
> 
> > 
> > >     - address: layer address hardcoded in hw (0=Unused, 0x...)
> > 
> > The example gives all layers 0 / unused. What exactly is this address
> > space?
> 
> This property is set while configuring IP, and if it is set to "0" then driver 
> knows that there is no dedicated address for video memory and uses its own.

In that case, omit the address property.

Your reply doesn't answer the question of what address space this is in.

> 
> > 
> > >     - alpha-mode: layer transparency mode (0=Layer, 1=Pixel)
> > >          layer alpha mode contains single alpha value for all layer pixels
> > >          pixel alpha mode contains alpha value per pixel in video memory
> > >          pixel alpha mode can increase physical size of pixel in memory
> > >          (8 bits per pixel in pixel alpha mode uses 16 bits per pixel in 
> > > memory)
> > 
> > This looks like a runtime decision rather than a property of the device.
> > 
> > >     - data-width: layer bits per pixel color format (16, 32)
> > >     - type: layer type (0=RGB, 1=YCbCr)
> > 
> > Likewise why is this static?
> 
> What exactly do you mean with "runtime decision"?
> All layer properties are configured in IP, and driver needs to know what they 
> are to properly handle pixel memory access on specific layer.

Without a user or appropriate documentation, such things are unclear...

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
