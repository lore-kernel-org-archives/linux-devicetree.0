From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] dma: Add Xilinx AXI Video Direct Memory Access Engine driver support
Date: Mon, 20 Jan 2014 12:39:47 +0100
Message-ID: <201401201239.47665.arnd@arndb.de>
References: <1389894803-4147-1-git-send-email-sthokal@xilinx.com> <201401171713.08550.arnd@arndb.de> <CA+mB=1L0ZSC8f6eMEuO7MEk6nG5SDahE7AH2F_uUr1TgTCD=cw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+mB=1L0ZSC8f6eMEuO7MEk6nG5SDahE7AH2F_uUr1TgTCD=cw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srikanth Thokala <sthokal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 20 January 2014, Srikanth Thokala wrote:
> On Fri, Jan 17, 2014 at 9:43 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > On Thursday 16 January 2014, Srikanth Thokala wrote:
> > I also assume that some of the properties should just go away:
> >
> > * xlnx,device-id should be the argument in the handle from the slave device
> 
> We can have multiple instances of this VDMA IP configured in the FPGA and we
> need a unique identifier for each VDMA device that is present in the FPGA.
> This device-id dt parameter forms the filter mask for the slave devices. As an
> example, this can be used to get a channel of specific VDMA device (assuming
> multiple instances) using the API dma_request_channel().  Please note this
> is an example of a slave device that doesnt have dt node.

That is not a valid scenario: You should not try to support legacy
slave devices (without DT) connected to a dma-engine that is initialized
using DT. If you still in the progress of converting drivers to DT, you
can use auxdata to attach additional information that can be used for
those slave devices, but the code should be kept out of the mainline
kernel, and I don't want to see it manifest in the bindings.

> > * data width should be a property of the slave driver that is configured
> >   through dma_slave_config(), unless you can have dma engines that only
> >   support certain a width.
> 
> Yes, this VDMA engine soft IP support only certain widths, which is
> configurable during IP synthesis.

But what is this property used for in that case? Surely you can't
connect a slave device to a dmaengine if the bus width doesn't match.
You probably have a point here, but I don't understand it yet.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
