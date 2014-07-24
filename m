From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/3] usb: host: st-hcd: Add USB HCD support for STi
 SoCs
Date: Thu, 24 Jul 2014 13:22:54 +0100
Message-ID: <20140724122254.GA15266@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1406199616-10533-1-git-send-email-peter.griffin@linaro.org>
 <1406199616-10533-2-git-send-email-peter.griffin@linaro.org>
 <11018717.Ey5qEJxGNJ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <11018717.Ey5qEJxGNJ@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

Thanks for reviewing, see my comments below: -

> Unfortunately, this seems to be done in a rather strange way,
> I suspect you'll have to start over, but I'll let Alan and Greg
> weigh in.
> 
> > +
> > +struct st_hcd_dev {
> > +	int port_nr;
> > +	struct platform_device *ehci_device;
> > +	struct platform_device *ohci_device;
> > +	struct clk *ic_clk;
> > +	struct clk *ohci_clk;
> > +	struct reset_control *pwr;
> > +	struct reset_control *rst;
> > +	struct phy *phy;
> > +};
> 
> The way you do this apparently is to create a device that encapsulates
> the OHCI and the EHCI and then goes on to create child devices that
> are bound to the real drivers.

Yes, although this isn't the first driver to take that approach USB_HCD_BCMA
(bcma-hcd.c) and USB_HCD_SSB (ssb-hcd.c) do much the same thing.

> 
> The way it should be done however is to put the two host controllers
> into DT directly and describe their resources (phy, clock, reset, ...)
> using the DT bindings for those.

I'm of course happy to change it if required. I see looking through that a lot 
of other platforms do it the way you describe with a

ehci-<platname>.c and ohci-<platname>.c 
> 
> Depending on what kind of special requirements the ST version has,
> this can be done either by using the generic ohci/ehci bindings
> with extensions where necessary, or by creating a new binding and
> new driver files that use 'ohci_init_driver'/'ehci_init_driver'
> to inherit from the common code.
> 
> The first of the two approaches is preferred.

We don't have anything particularly special, just a couple of reset lines,
clock, phy, etc.
> 
> > +	pdev->dev.parent = &parent->dev;
> > +	pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
> > +	pdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
> 
> This is something we shouldn't ever do these days, the DMA settings
> should come directly from DT without driver interaction.

Ok, I'll wait to hear the outcome of Greg/Alans views before either fixing
it or starting over.

regards,

Peter.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
