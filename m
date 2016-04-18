From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Axi-usb: Add support for 64-bit addressing.
Date: Mon, 18 Apr 2016 09:29:09 -0500
Message-ID: <20160418142909.GA5608@rob-hp-laptop>
References: <1460360506-14692-1-git-send-email-navam@xilinx.com>
 <20160412140338.GA19311@rob-hp-laptop>
 <4542055.HvdgVkDRYK@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4542055.HvdgVkDRYK@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nava kishore Manne <nava.manne-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, navam-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, radhey.shyam.pandey-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Apr 17, 2016 at 03:14:34PM +0200, Arnd Bergmann wrote:
> On Tuesday 12 April 2016 09:03:38 Rob Herring wrote:
> > On Mon, Apr 11, 2016 at 01:11:46PM +0530, Nava kishore Manne wrote:
> > > This patch updates the driver to support 64-bit DMA
> > > addressing.
> > > 
> > > Signed-off-by: Nava kishore Manne <navam-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > > ---
> > >  .../devicetree/bindings/usb/udc-xilinx.txt         |  3 +-
> > >  drivers/usb/gadget/udc/udc-xilinx.c                | 38 ++++++++++++++++++++--
> > >  2 files changed, 37 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/usb/udc-xilinx.txt b/Documentation/devicetree/bindings/usb/udc-xilinx.txt
> > > index 47b4e39..d417872 100644
> > > --- a/Documentation/devicetree/bindings/usb/udc-xilinx.txt
> > > +++ b/Documentation/devicetree/bindings/usb/udc-xilinx.txt
> > > @@ -7,12 +7,13 @@ Required properties:
> > >  - interrupts         : Should contain single irq line of USB2 device
> > >                         controller
> > >  - xlnx,has-builtin-dma       : if DMA is included
> > > -
> > > +- xlnx,addrwidth       : Should be the dma addressing size in bits(ex: 40 bits).
> > 
> > Now this property shows up in a 2nd device. Now I'm more convinced this 
> > is the wrong approach and should use dma-ranges.
> 
> Not necessarily: We need to be careful not to mix up two different things here:
> 
> * dma-ranges describes the address width of a bus, along with possible offsets.
>   In order to do wider than 32-bit addressing, all upstream busses must be
>   capable of supporting this, and AXI can have either 64-bit or 32-bit addressing.
> 
> * A device may have a register set that allows wider DMA. This is normally
>   identified through the 'compatible' property, and you can have all
>   combinations with bus addressing: a device with 32-bit DMA can be connected
>   to a 64-bit AXI bus, and a device with 64-bit DMA can have an upstream parent
>   or grandparent that is limited to 32 bits (or any other width really).
> 
> The patch here is almost certainly wrong. For one thing, it never sets the
> DMA mask to the correct value, and it also infers the presence of the
> 0x308..0x317 register range from an arbitrary DT property that describes
> something else (the supported width of the DMA).

Right, you don't need to know the exact bus width for determining the 
register/descriptor set is 32 or 64 bit addesses. I'm fine with a 
property for that, but if limiting the actual connected address bits is 
needed, then dma-ranges should be used.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
