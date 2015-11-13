From: bayi cheng <bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v6 1/3] doc: dt: add documentation for Mediatek spi-nor
 controller
Date: Fri, 13 Nov 2015 15:20:45 +0800
Message-ID: <1447399245.9118.14.camel@mhfsdcap03>
References: <1446824889-16144-1-git-send-email-bayi.cheng@mediatek.com>
	 <1446824889-16144-2-git-send-email-bayi.cheng@mediatek.com>
	 <20151111203823.GJ12143@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151111203823.GJ12143-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2015-11-11 at 12:38 -0800, Brian Norris wrote:
> On Fri, Nov 06, 2015 at 11:48:07PM +0800, Bayi Cheng wrote:
> > Add device tree binding documentation for serial flash with
> > Mediatek serial flash controller
> > 
> > Signed-off-by: Bayi Cheng <bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> 
> Applied to l2-mtd.git/next (for 4.5). This will show up in
> linux-next.git after the merge window.
> 
> Also squashed in a small diff (below), to fix up some language issues
> and to refer the reader to the jedec,spi-nor.txt document.
> 

OK, I will fix it in next patch!

> >  .../devicetree/bindings/mtd/mtk-quadspi.txt        | 41 ++++++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> > new file mode 100644
> > index 0000000..866b492
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> > @@ -0,0 +1,41 @@
> > +* MTD SPI nor driver for MTK MT81xx (and similar) serial flash controller
> 
> The DT binding document shouldn't be talking about software (i.e.,
> shouldn't be talking about "drivers").
> 

OK, I will fix it.

> > +
> > +Required properties:
> > +- compatible: 	  should be "mediatek,mt8173-nor";
> > +- reg: 		  physical base address and length of the controller's register
> > +- clocks: 	  the phandle of the clock needed by the nor controller
> > +- clock-names: 	  the name of the clocks
> > +		  the clocks needed "spi" and "sf". "spi" is used for spi bus,
> > +		  and "sf" is used for controller, these are the clocks witch
> > +		  hardware needs to enabling nor flash and nor flash controller.
> > +		  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> > +- #address-cells: should be <1>
> > +- #size-cells:	  should be <0>
> > +
> > +The SPI Flash must be a child of the nor_flash node and must have a
> > +compatible property.
> > +
> > +Required properties:
> > +- compatible:	  May include a device-specific string consisting of the manufacturer
> > +		  and name of the chip. Must also include "jedec,spi-nor" for any
> > +		  SPI NOR flash that can be identified by the JEDEC READ ID opcode (0x9F).
> > +- reg :		  Chip-Select number
> > +
> > +Example:
> > +
> > +nor_flash: spi@1100d000 {
> > +	compatible = "mediatek,mt8173-nor";
> > +	reg = <0 0x1100d000 0 0xe0>;
> > +	clocks = <&pericfg CLK_PERI_SPI>,
> > +		 <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
> > +	clock-names = "spi", "sf";
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	status = "disabled";
> > +
> > +	flash@0 {
> > +		compatible = "jedec,spi-nor";
> > +		reg = <0>;
> > +	};
> > +};
> > +
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> index 866b492c38d2..fb314f09861b 100644
> --- a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> +++ b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> @@ -1,19 +1,19 @@
> -* MTD SPI nor driver for MTK MT81xx (and similar) serial flash controller
> +* Serial NOR flash controller for MTK MT81xx (and similar)
>  
>  Required properties:
>  - compatible: 	  should be "mediatek,mt8173-nor";
>  - reg: 		  physical base address and length of the controller's register
> -- clocks: 	  the phandle of the clock needed by the nor controller
> -- clock-names: 	  the name of the clocks
> -		  the clocks needed "spi" and "sf". "spi" is used for spi bus,
> +- clocks: 	  the phandle of the clocks needed by the nor controller
> +- clock-names: 	  the names of the clocks
> +		  the clocks should be named "spi" and "sf". "spi" is used for spi bus,
>  		  and "sf" is used for controller, these are the clocks witch
>  		  hardware needs to enabling nor flash and nor flash controller.
>  		  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
>  - #address-cells: should be <1>
>  - #size-cells:	  should be <0>
>  
> -The SPI Flash must be a child of the nor_flash node and must have a
> -compatible property.
> +The SPI flash must be a child of the nor_flash node and must have a
> +compatible property. Also see jedec,spi-nor.txt.
>  
>  Required properties:
>  - compatible:	  May include a device-specific string consisting of the manufacturer

Thanks for your instruction! and I will fix it in the next patch!


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
