From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC] Documentation: devicetree: bindings: drm: Xylon binding
Date: Mon, 27 Jan 2014 16:22:55 +0000
Message-ID: <20140127162255.GG16516@e106331-lin.cambridge.arm.com>
References: <52E67F9E.20492.1406B56@davorjoja.logicbricks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52E67F9E.20492.1406B56-l//4pz4nnF2T4XiunKkQOL/f6Pfn6aUBAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Davor Joja <davorjoja-bBue3UIS71U2IjGS+8YXRQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 27, 2014 at 03:47:42PM +0000, Davor Joja wrote:
> Hi,

Hi,

> 
> Can I please get comments about adding new vendor prefix "xylon", and on 
> following devicetree binding for Xylon configurable video controller (logiCVC).
> Shown node is prepared for Xilinx Linux kernel dts file.

Does this device have any publicly-accessible documentation?

It would be helpful if you could Cc this to some graphics related
mailing lists. Not everyone on devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org is a graphics
expert, and you'll get much better feedback with the relevant people on
Cc.

It would also be nice to see some code with the binding, and for both
the code and binding to be sent as patches. That makes it _far_ easier
to review as it's far easier to compare with existing bindings if in a
standard format.

> 
> 
> logicvc_0: logicvc@40030000 {
> 	compatible = "xylon,logicvc-4.00.a";
> 	reg = <0x40030000 0x6000>;
> 	interrupt-parent = <&ps7_scugic_0>;
> 	interrupts = <0 59 4>;
> 	background-layer-bits-per-pixel = <32>;
> 	display-interface = <0>;
> 	display-color-space = <1>;
> 	is-readable-regs = <1>;
> 	is-size-position = <1>;
> 	layer-width = <2048>;
> 	num-layers = <4>;
> 	layer_0 {
> 		address = <0>;
> 		alpha-mode = <0>;
> 		data-width = <16>;
> 		type = <0>;
> 	} ;
> 	layer_1 {
> 		address = <0>;
> 		alpha-mode = <0>;
> 		data-width = <32>;
> 		type = <0>;
> 	} ;
> 	layer_2 {
> 		address = <0>;
> 		alpha-mode = <1>;
> 		data-width = <32>;
> 		type = <0>;
> 	} ;
> 	layer_3 {
> 		address = <0>;
> 		alpha-mode = <0>;
> 		data-width = <16>;
> 		type = <1>;
> 	} ;
> } ;
> 
> 
> Required properties for configuring logiCVC device:
>  - compatible: value must be "xylon,logicvc-4.00.a"
>  - reg: base address and size of the logiCVC IP

Presumably the address and size of the MMIO region the IP has?

Does it only have a single bank of registers?

>  - interrupts-parent: the phandle for interrupt controller
>  - interrupts: the interrupt number

Does the device have only a single interrupt?

>  - background-layer-bits-per-pixel: background layer color format (0, 16, 32)
>       if "0" last available layer is standard layer

Why is 0 quoted, and what is a "standard layer"?

>       if 16 or 32, last available layer is background layer implemented in
>       hw register and containing specified bits per pixel color value
>  - display-interface: logiCVC to display physical interface
>       (0=Parallel, 1=ITU656)
>  - display-color-space: logiCVC to display physical color space
>       (0=RGB, 1=YCbCr 4:2:2, 2=YCbCr 4:4:4)

These sound like they should be properties of the display this unit is
attached to.

>  - is-readable-regs: all hw registers are readable by sw

Which registers aren't always accessible?

>  - is-size-position: hw changing of layer size and position

These look like booleans, but have values above.

>  - layer-width: layer width in pixels, common for all layers
>  - num-layers: supported number of layers (1-5)

If you require a node for each layer, you don't need this proeprty --
you can simply count the layer nodes.

>       if "background-layer-bits-per-pixel != 0", "num-layers" property value is
>       decreased by 1

Does that mean the author of the dt subtracts one, or this is done by
the kernel?

Why?

>  - layer_N

Where N is?

>     - address: layer address hardcoded in hw (0=Unused, 0x...)

The example gives all layers 0 / unused. What exactly is this address
space?

>     - alpha-mode: layer transparency mode (0=Layer, 1=Pixel)
>          layer alpha mode contains single alpha value for all layer pixels
>          pixel alpha mode contains alpha value per pixel in video memory
>          pixel alpha mode can increase physical size of pixel in memory
>          (8 bits per pixel in pixel alpha mode uses 16 bits per pixel in 
> memory)

This looks like a runtime decision rather than a property of the device.

>     - data-width: layer bits per pixel color format (16, 32)
>     - type: layer type (0=RGB, 1=YCbCr)

Likewise why is this static?

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
