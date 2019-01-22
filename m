From: Min Guo <min.guo@mediatek.com>
Subject: Re: [PATCH v4 5/6] usb: musb: Add musb_clearb/w() interface
Date: Tue, 22 Jan 2019 09:43:34 +0800
Message-ID: <1548121414.4433.257.camel@mhfsdcap03>
References: <1548073351-13739-1-git-send-email-min.guo@mediatek.com>
         <1548073351-13739-6-git-send-email-min.guo@mediatek.com>
         <20190121155929.GC30080@uda0271908>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190121155929.GC30080@uda0271908>
Sender: linux-kernel-owner@vger.kernel.org
To: Bin Liu <b-liu@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, chunfeng.yun@mediatek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, tony@atomide.com, hdegoede@redhat.com
List-Id: devicetree@vger.kernel.org

Hi Bin,

On Mon, 2019-01-21 at 09:59 -0600, Bin Liu wrote:
> Hi Min,
> 
> On Mon, Jan 21, 2019 at 08:22:30PM +0800, min.guo@mediatek.com wrote:
> > From: Min Guo <min.guo@mediatek.com>
> > 
> > Delete the const attribute of addr parameter in readb/w/l hooks, these
> > changes are for implementing clearing W1C registers.
> > Replace musb_readb/w with musb_clearb/w to clear the interrupt status.
> > 
> > Signed-off-by: Min Guo <min.guo@mediatek.com>
> > ---
> > new patch based on v3:
> > ---
> >  drivers/usb/musb/musb_core.c | 32 +++++++++++++++++++++++---------
> >  drivers/usb/musb/musb_core.h |  8 ++++++--
> >  drivers/usb/musb/musb_io.h   |  8 +++++---
> >  drivers/usb/musb/musbhsdma.c |  3 +++
> >  drivers/usb/musb/sunxi.c     |  4 ++--
> >  drivers/usb/musb/tusb6010.c  |  2 +-
> >  6 files changed, 40 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
> > index 2fe5225..5ef8848 100644
> > --- a/drivers/usb/musb/musb_core.c
> > +++ b/drivers/usb/musb/musb_core.c
> 
> [snip]
> 
> > diff --git a/drivers/usb/musb/musbhsdma.c b/drivers/usb/musb/musbhsdma.c
> > index b2394a7..7bf91cb 100644
> > --- a/drivers/usb/musb/musbhsdma.c
> > +++ b/drivers/usb/musb/musbhsdma.c
> > @@ -286,6 +286,9 @@ irqreturn_t dma_controller_irq(int irq, void *private_data)
> >  
> >  	int_hsdma = musb_readb(mbase, MUSB_HSDMA_INTR);
> >  
> > +	/* clear pending interrupts by manual */
> > +	musb_clearb(musb->mregs, MUSB_HSDMA_INTR);
> > +
> 
> Make musb_clearb/w() return the value of the _read() instead of
> _write(), so that we don't have to read twice here. The value of
> _write() is not used anyway.
> 
> The change above can be:
> 
> 	int_hsdma = musb_clearb(mbase, MUSB_HSDMA_INTR);
> 
> Please see my comments in 6/6 for details.

Okay.

> Regards,
> -Bin.
