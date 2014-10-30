From: BhuvanChandra DharanikotaVenkata <bhuvanchandradv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: ARM: dts: Passing 'irq' property in SPI child node
Date: Thu, 30 Oct 2014 13:39:30 +0530
Message-ID: <CAPRVJ63TGV-XtRXGv8BDivKkxd=u5YLQO8tEQ02FOdC_u_XeDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi all,

Facing some issues while passing the irq property in child node of SPI node.
I was trying to enable the SPI based mcp2515 can controller, according
to the documentation available in the bindings of mcp251x driver,
added the required properties of the node.
As per the requirement need to pass an irq of a GPIO, used
'interrupt-parent' and 'interrupts' properties in the child node
(mcp251x can node).
I had a doubt, how exactly the interrupts property was parsed and
taken in the mcp251x driver?
In driver the spi->irq holds the irq number, in non dt kernels we are
passing the irq value directly from platform data.
How can we pass the irq property required by mcp251x driver from the
device tree node?

http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/net/can/microchip,mcp251x.txt
http://lxr.free-electrons.com/source/drivers/net/can/mcp251x.c?v=2.6.33

spi dt node:

>  &dspi1 {
>      status = "okay";
>      spi-max-frequency = <25000000>;
>
>     can2: can@1 {
>         compatible = "microchip,mcp2515";
>         reg = <0>;
>         clocks = <&clk16m>;
>         interrupt-parent = <&gpio2>;
>         interrupts = <43 0x8>;
>         spi-max-frequency = <10000000>;
>     };
>  };



Best Regards,
Bhuvanchandara DV
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
