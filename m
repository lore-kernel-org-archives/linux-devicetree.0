From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v6 07/12] usb: chipidea: add a usb2 driver for ci13xxx
Date: Sun, 28 Sep 2014 08:40:52 +0800
Message-ID: <20140928004049.GA3667@peterchendt>
References: <1411468088-5702-1-git-send-email-antoine.tenart@free-electrons.com>
 <2923729.dtX0WmHSV0@wuerfel> <20140924112902.GA23331@peterchendt>
 <2786668.t3YLqX5enD@wuerfel> <20140925141553.GC28045@saruman>
 <20140925233932.GA3026@peterchendt> <20140926003750.GA12770@saruman>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140926003750.GA12770@saruman>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 25, 2014 at 07:37:50PM -0500, Felipe Balbi wrote:
> HI,
> 
> On Fri, Sep 26, 2014 at 07:39:34AM +0800, Peter Chen wrote:
> > On Thu, Sep 25, 2014 at 09:15:53AM -0500, Felipe Balbi wrote:
> > > On Wed, Sep 24, 2014 at 02:23:38PM +0200, Arnd Bergmann wrote:
> > > > On Wednesday 24 September 2014 19:29:05 Peter Chen wrote:
> > > > > 
> > > > > So, it is IP CORE LIB (you suggest) vs IP CORE Platform Driver
> > > > > (dwc3, musb, chipidea) you are talking about, right? Except for
> > > > > creating another platform driver as well as related DT node (optional),
> > > > > are there any advantages compared to current IP core driver structure?
> > > > 
> > > > Having a library module usually requires less code, and is more
> > > > consistent with other drivers, which helps new developers understand
> > > > what the driver is doing.
> > > 
> > > I beg to differ. You end-up having to pass function pointers through
> > > platform_data to handle differences which could be handled by the core
> > > IP.
> > > 
> > > > The most important aspect though is the DT binding: once the structure
> > > > with separate kernel drivers leaks out into the DT format, you can't
> > > > easily change the driver any more, e.g. to make a property that was
> > > > introduced for one glue driver more general so it can get handled by
> > > > the common part. Having a single node lets us convert to the library
> > > > model later, so that would be a strong reason to keep the DT binding
> > > > simple, without child nodes.
> > > > 
> > > > Following that logic, it turns into another reason for using the library
> > > > model to start with, because otherwise the child device does not have
> > > > any DT properties itself and has to rely on the parent device properties,
> > > > which somewhat complicates the driver structure.
> > > 
> > > this is bullcrap. Take a look at
> > > Documentation/devicetree/bindings/usb/dwc3.txt:
> > > 
> > > synopsys DWC3 CORE
> > > 
> > > DWC3- USB3 CONTROLLER
> > > 
> > > Required properties:
> > >  - compatible: must be "snps,dwc3"
> > >  - reg : Address and length of the register set for the device
> > >  - interrupts: Interrupts used by the dwc3 controller.
> > > 
> > > Optional properties:
> > >  - usb-phy : array of phandle for the PHY device.  The first element
> > >    in the array is expected to be a handle to the USB2/HS PHY and
> > >    the second element is expected to be a handle to the USB3/SS PHY
> > >  - phys: from the *Generic PHY* bindings
> > >  - phy-names: from the *Generic PHY* bindings
> > >  - tx-fifo-resize: determines if the FIFO *has* to be reallocated.
> > > 
> > > This is usually a subnode to DWC3 glue to which it is connected.
> > > 
> > > dwc3@4a030000 {
> > > 	compatible = "snps,dwc3";
> > > 	reg = <0x4a030000 0xcfff>;
> > > 	interrupts = <0 92 4>
> > > 	usb-phy = <&usb2_phy>, <&usb3,phy>;
> > > 	tx-fifo-resize;
> > > };
> > > 
> > > This contains all the attributes it needs to work. In fact, this could
> > > be used without any glue.
> > > 
> > 
> > If you want to add "vbus-supply" core node to support ID switch, what's
> > the plan for that?
> 
> send a patch ? Just make sure it's optional because not everybody needs
> a vbus-supply. Also, DRD will still take a few merge windows to become a
> reality. I don't want to merge something before considering it carefuly,
> otherwise we will having which is broken and doesn't work for everybody
> ;-)
> 
> > Is it possible that the glue layer needs to access core register
> > (eg, portsc.phcd during suspend)? The wrapper IP may wait some signals
> > at core IP to change.
> 
> why would a glue layer need to access registers from the core ? That
> sounds very odd. I haven't seen that and will, definitely, NACK such a
> patch :-)
> 
> can you further describe why you think a glue layer might need to access
> core IP's registers ?
> 

My mistake, we can just wait core layer for finishing before doing PHY
and wrapper operation.

-- 
Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
