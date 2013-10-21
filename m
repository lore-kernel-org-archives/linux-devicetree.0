From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [Patch v2][ 08/37] video: mx3fb: Add device tree suport.
Date: Mon, 21 Oct 2013 10:03:27 +0200
Message-ID: <20131021080327.GA30088@pengutronix.de>
References: <1382022155-21954-1-git-send-email-denis@eukrea.com>
 <1382022155-21954-9-git-send-email-denis@eukrea.com>
 <20131019110459.GM18477@ns203013.ovh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131019110459.GM18477-HVbc7XotTAhnXn40ka+A6Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Eric B??nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Oct 19, 2013 at 01:04:59PM +0200, Jean-Christophe PLAGNIOL-VILLARD wrote:
> On 17:02 Thu 17 Oct     , Denis Carikli wrote:
> > diff --git a/Documentation/devicetree/bindings/video/fsl,mx3-fb.txt b/Documentation/devicetree/bindings/video/fsl,mx3-fb.txt
> > new file mode 100644
> > index 0000000..ae0b343
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/video/fsl,mx3-fb.txt
> > @@ -0,0 +1,52 @@
> > +Freescale mx3 Framebuffer
> > +
> > +This framebuffer driver supports the imx31 and imx35 devices.
> > +
> > +Required properties:
> > +- compatible : Must be "fsl,mx3-fb".
> > +- reg : Should contain 1 register ranges(address and length).
> > +- dmas : Phandle to the ipu dma node as described in
> > +	Documentation/devicetree/bindings/dma/dma.txt
> > +- dma-names : Must be "tx".
> > +- clocks : Phandle to the ipu source clock.
> > +- display: Phandle to a display node as described in
> > +	Documentation/devicetree/bindings/video/display-timing.txt
> > +	Additional, the display node has to define properties:
> > +	- bits-per-pixel: lcd panel bit-depth.
> > +
> > +Optional properties:
> > +- ipu-disp-format: could be "rgb666", "rgb565", or "rgb888".
> > +  If not specified defaults to "rgb666".
> > +
> > +Example:
> > +
> > +	lcdc: mx3fb@53fc00b4 {
> > +		compatible = "fsl,mx3-fb";
> > +		reg = <0x53fc00b4 0x0b>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_lcdc_1>;
> > +		clocks = <&clks 55>;
> > +		dmas = <&ipu 14>;
> > +		dma-names = "tx";
> > +	};

As mentioned to the v1 patch: This should really be closer to the IPUv3
binding. IPUv1 and IPUv3 are very similar hardwares. Having two
different bindings for it is painful.

Implementing IPUv1 as a DMA driver was the wrong decision back then, now
exposing the IPU to dt using the DMA binding makes it worse.

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
