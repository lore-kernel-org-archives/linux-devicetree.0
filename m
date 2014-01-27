From: Davor Joja <davorjoja-bBue3UIS71U2IjGS+8YXRQ@public.gmane.org>
Subject: [RFC] Documentation: devicetree: bindings: drm: Xylon binding
Date: Mon, 27 Jan 2014 16:47:42 +0100
Message-ID: <52E67F9E.20492.1406B56@davorjoja.logicbricks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Description: Mail message body
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Can I please get comments about adding new vendor prefix "xylon", and on 
following devicetree binding for Xylon configurable video controller (logiCVC).
Shown node is prepared for Xilinx Linux kernel dts file.


logicvc_0: logicvc@40030000 {
	compatible = "xylon,logicvc-4.00.a";
	reg = <0x40030000 0x6000>;
	interrupt-parent = <&ps7_scugic_0>;
	interrupts = <0 59 4>;
	background-layer-bits-per-pixel = <32>;
	display-interface = <0>;
	display-color-space = <1>;
	is-readable-regs = <1>;
	is-size-position = <1>;
	layer-width = <2048>;
	num-layers = <4>;
	layer_0 {
		address = <0>;
		alpha-mode = <0>;
		data-width = <16>;
		type = <0>;
	} ;
	layer_1 {
		address = <0>;
		alpha-mode = <0>;
		data-width = <32>;
		type = <0>;
	} ;
	layer_2 {
		address = <0>;
		alpha-mode = <1>;
		data-width = <32>;
		type = <0>;
	} ;
	layer_3 {
		address = <0>;
		alpha-mode = <0>;
		data-width = <16>;
		type = <1>;
	} ;
} ;


Required properties for configuring logiCVC device:
 - compatible: value must be "xylon,logicvc-4.00.a"
 - reg: base address and size of the logiCVC IP
 - interrupts-parent: the phandle for interrupt controller
 - interrupts: the interrupt number
 - background-layer-bits-per-pixel: background layer color format (0, 16, 32)
      if "0" last available layer is standard layer
      if 16 or 32, last available layer is background layer implemented in
      hw register and containing specified bits per pixel color value
 - display-interface: logiCVC to display physical interface
      (0=Parallel, 1=ITU656)
 - display-color-space: logiCVC to display physical color space
      (0=RGB, 1=YCbCr 4:2:2, 2=YCbCr 4:4:4)
 - is-readable-regs: all hw registers are readable by sw
 - is-size-position: hw changing of layer size and position
 - layer-width: layer width in pixels, common for all layers
 - num-layers: supported number of layers (1-5)
      if "background-layer-bits-per-pixel != 0", "num-layers" property value is
      decreased by 1
 - layer_N
    - address: layer address hardcoded in hw (0=Unused, 0x...)
    - alpha-mode: layer transparency mode (0=Layer, 1=Pixel)
         layer alpha mode contains single alpha value for all layer pixels
         pixel alpha mode contains alpha value per pixel in video memory
         pixel alpha mode can increase physical size of pixel in memory
         (8 bits per pixel in pixel alpha mode uses 16 bits per pixel in 
memory)
    - data-width: layer bits per pixel color format (16, 32)
    - type: layer type (0=RGB, 1=YCbCr)


Thank you,
Davor
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
