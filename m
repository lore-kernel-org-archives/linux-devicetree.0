From: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: at_xdmac: add bindings documentation
Date: Fri, 4 Jul 2014 11:45:09 +0200
Message-ID: <20140704094509.GH2386@ldesroches-Latitude-E6320>
References: <1404459370-3540-1-git-send-email-ludovic.desroches@atmel.com>
 <1404459370-3540-3-git-send-email-ludovic.desroches@atmel.com>
 <20140704085834.GC31812@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140704085834.GC31812@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org" <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org" <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, "vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org" <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 04, 2014 at 09:58:34AM +0100, Mark Rutland wrote:
> On Fri, Jul 04, 2014 at 08:36:10AM +0100, Ludovic Desroches wrote:
> > Add bindings documentation for the new Atmel DMA controller (XDMAC)
> > introduced with SAMA5D4.
> > 
> > Signed-off-by: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> > ---
> >  .../devicetree/bindings/dma/atmel-xdma.txt         |   39 ++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/dma/atmel-xdma.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/dma/atmel-xdma.txt b/Documentation/devicetree/bindings/dma/atmel-xdma.txt
> > new file mode 100644
> > index 0000000..1e09fda
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/dma/atmel-xdma.txt
> > @@ -0,0 +1,39 @@
> > +* Atmel Extensible Direct Memory Access Controller (XDMAC)
> > +
> > +Required properties:
> > +- compatible: Should be "atmel,<chip>-dma".
> > +- reg: Should contain DMA registers location and length.
> > +- interrupts: Should contain DMA interrupt.
> > +- #dma-cells: Must be <2>, used to represent the number of integer cells in
> > +the dmas property of client devices.
> 
> Could you please move the description of the two cells in the
> dma-specifier here? It makes it far easier to read the binding.

Of course, I'll do it for next version.

> 
> Cheers,
> Mark.
> 
> > +
> > +Example:
> > +
> > +dma1: dma-controller@f0004000 {
> > +	compatible = "atmel,sama5d4-dma";
> > +	reg = <0xf0004000 0x200>;
> > +	interrupts = <50 4 0>;
> > +	#dma-cells = <2>;
> > +};
> > +
> > +DMA clients connected to the Atmel XDMA controller must use the format
> > +described in the dma.txt file, using a three-cell specifier for each channel:
> > +a phandle plus two integer cells.
> > +The two cells in order are:
> > +
> > +1. A phandle pointing to the DMA controller.
> > +2. The memory interface (16 most significant bits), the peripheral interface
> > +(16 less significant bits).
> > +3. Channel configuration register. Configurable fields are:
> > +  - bit 30-24: PERID, peripheral identifier.
> > +
> > +Example:
> > +
> > +i2c2: i2c@f8024000 {
> > +	compatible = "atmel,at91sam9x5-i2c";
> > +	reg = <0xf8024000 0x4000>;
> > +	interrupts = <34 4 6>;
> > +	dmas = <&dma0 0x00000001 0x06000000>,
> > +	       <&dma0 0x00000001 0x07000000>;
> > +	dma-names = "tx", "rx";
> > +};
> > -- 
> > 1.7.9.5
> > 
> > --
> > To unsubscribe from this list: send the line "unsubscribe devicetree" in
> > the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
