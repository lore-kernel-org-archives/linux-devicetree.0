From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: driver using another driver
Date: Fri, 1 Aug 2014 10:51:48 +0200
Message-ID: <20140801085148.GW23235@pengutronix.de>
References: <E70AF999396FDF4EAE40E195B84709611F84671F@SPMDEGHN001.CADCON.INTERN>
 <20140801063105.GV23235@pengutronix.de>
 <E70AF999396FDF4EAE40E195B84709611F847086@SPMDEGHN001.CADCON.INTERN>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E70AF999396FDF4EAE40E195B84709611F847086-VHQhki0MIenpQFNhCJRnZ0Yy6alPw7Wn0MAMd6zgKLc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Priebe, Sebastian" <Sebastian.Priebe-hnW+OuB6jW6zQB+pC5nmwQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 01, 2014 at 07:15:41AM +0000, Priebe, Sebastian wrote:
> Hello Sascha,
> 
> thanks for your answer.
> We are using an imx35 cpu and our CPLD is in fact connected via weim (CS1).
> Though I created the following device node in our dts:
> &weim {
>         pinctrl-names = "default";
>         status = "okay";
> 
>         pld@1,0 {
>                 compatible = "roche,hbm-pld";
>                 reg = <1 0x00000000 0x0001000>;
>                 fsl,weim-cs-timing = <0x0 0x0 0x0>; /* don't know what to put here */
>         };
> };
> 
> And I turned the CPLD driver into a platform driver. But I don't get the resource in probe:
> res = platform_get_resource(pdev, IORESOURCE_MEM, 0) returns NULL.
> 
> In our platform code we had:
> static struct resource hbm_pld_resource_data = {
>         .start = 0xA8000000,
>         .end = 0xA8000000 + 0x1000 - 1,
>         .flags = IORESOURCE_MEM,
> };

Why do you manually register a platform_device? You should add the CPLD
device to the device tree instead.

> 
> And for the setting of CS1:
> __raw_writel((0x22 << 8), MX35_IO_ADDRESS(MX3x_WEIM_BASE_ADDR) + 0x10);
> __raw_writel(((0x0a << 28) | (0x06 << 12) | (0x03 << 8) | (0x04 << 4) | (0x01 << 0)), MX35_IO_ADDRESS(MX3x_WEIM_BASE_ADDR) + 0x14);
> 
> Where do I put this in the device tree?

In the fsl,weim-cs-timing property. See
Documentation/devicetree/bindings/bus/imx-weim.txt

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
