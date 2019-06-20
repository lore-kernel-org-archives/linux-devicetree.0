From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH] usb: dwc3: remove unused @lock member of dwc3_ep struct
Date: Thu, 20 Jun 2019 16:23:59 +0800
Message-ID: <1561019039.19385.0.camel@mhfsdcap03>
References: <342af01a252a9ef9457a6a6ec653a40698058fbc.1561018149.git.chunfeng.yun@mediatek.com>
         <87pnn8brej.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87pnn8brej.fsf@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,
On Thu, 2019-06-20 at 11:19 +0300, Felipe Balbi wrote:
> Hi,
> 
> Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
> 
> > The member @lock of dwc2_ep struct is only initialized,
> > and not used elsewhere, so remove it.
Sorry, I need send v2 to fix typo of dwc2_ep

> >
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  drivers/usb/dwc3/core.h   | 2 --
> >  drivers/usb/dwc3/gadget.c | 2 --
> >  2 files changed, 4 deletions(-)
> >
> > diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> > index f19cbeb01087..72d28cb14bdf 100644
> > --- a/drivers/usb/dwc3/core.h
> > +++ b/drivers/usb/dwc3/core.h
> > @@ -649,7 +649,6 @@ struct dwc3_event_buffer {
> >   * @cancelled_list: list of cancelled requests for this endpoint
> >   * @pending_list: list of pending requests for this endpoint
> >   * @started_list: list of started requests on this endpoint
> > - * @lock: spinlock for endpoint request queue traversal
> >   * @regs: pointer to first endpoint register
> >   * @trb_pool: array of transaction buffers
> >   * @trb_pool_dma: dma address of @trb_pool
> > @@ -677,7 +676,6 @@ struct dwc3_ep {
> >  	struct list_head	pending_list;
> >  	struct list_head	started_list;
> >  
> > -	spinlock_t		lock;
> >  	void __iomem		*regs;
> >  
> >  	struct dwc3_trb		*trb_pool;
> > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> > index d67655384eb2..7f75da30caba 100644
> > --- a/drivers/usb/dwc3/gadget.c
> > +++ b/drivers/usb/dwc3/gadget.c
> > @@ -2251,8 +2251,6 @@ static int dwc3_gadget_init_endpoint(struct dwc3 *dwc, u8 epnum)
> >  		dep->endpoint.comp_desc = NULL;
> >  	}
> >  
> > -	spin_lock_init(&dep->lock);
> 
> heh, thanks. This is left-over from when I playing with further
> paralelizing the driver. Turned out that there are not enough gains to
> justify that work. I'll apply this patch.
> 
