From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/6] dma: bcm-sba-raid: Improve memory allocation in SBA
 RAID driver
Date: Fri, 28 Jul 2017 08:43:42 +0530
Message-ID: <20170728031342.GR3053@localhost>
References: <1501047404-14456-1-git-send-email-anup.patel@broadcom.com>
 <1501047404-14456-2-git-send-email-anup.patel@broadcom.com>
 <20170726170932.GI3053@localhost>
 <CAALAos_xYyvTBZB2C+tt7NvWz-4TX-mXDVJwGqhvN0FTy8QA-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAALAos_xYyvTBZB2C+tt7NvWz-4TX-mXDVJwGqhvN0FTy8QA-Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 27, 2017 at 09:42:33AM +0530, Anup Patel wrote:
> On Wed, Jul 26, 2017 at 10:39 PM, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
> > On Wed, Jul 26, 2017 at 11:06:39AM +0530, Anup Patel wrote:

> >>  drivers/dma/bcm-sba-raid.c | 439 +++++++++++++++++++++++----------------------
> >>  1 file changed, 226 insertions(+), 213 deletions(-)
> >>
> >> diff --git a/drivers/dma/bcm-sba-raid.c b/drivers/dma/bcm-sba-raid.c
> >> index e41bbc7..6d15fed 100644
> >> --- a/drivers/dma/bcm-sba-raid.c
> >> +++ b/drivers/dma/bcm-sba-raid.c
> >> @@ -48,7 +48,8 @@
> >>
> >>  #include "dmaengine.h"
> >>
> >> -/* SBA command related defines */
> >> +/* ====== Driver macros and defines ===== */
> >
> > why this noise, seems unrelated to the change!
> 
> This is just minor beautification. Again, I will put this
> in separate patch.

Well you can't shove garlands under an unrelated change. By all means throw
the whole garden out there, but please as a separate patch

> 
> >
> >> +
> >>  #define SBA_TYPE_SHIFT                                       48
> >>  #define SBA_TYPE_MASK                                        GENMASK(1, 0)
> >>  #define SBA_TYPE_A                                   0x0
> >> @@ -82,39 +83,41 @@
> >>  #define SBA_CMD_WRITE_BUFFER                         0xc
> >>  #define SBA_CMD_GALOIS                                       0xe
> >>
> >> -/* Driver helper macros */
> >> +#define SBA_MAX_REQ_PER_MBOX_CHANNEL                 8192
> >> +
> >>  #define to_sba_request(tx)           \
> >>       container_of(tx, struct sba_request, tx)
> >>  #define to_sba_device(dchan)         \
> >>       container_of(dchan, struct sba_device, dma_chan)
> >>
> >> -enum sba_request_state {
> >> -     SBA_REQUEST_STATE_FREE = 1,
> >> -     SBA_REQUEST_STATE_ALLOCED = 2,
> >> -     SBA_REQUEST_STATE_PENDING = 3,
> >> -     SBA_REQUEST_STATE_ACTIVE = 4,
> >> -     SBA_REQUEST_STATE_RECEIVED = 5,
> >> -     SBA_REQUEST_STATE_COMPLETED = 6,
> >> -     SBA_REQUEST_STATE_ABORTED = 7,
> >> +/* ===== Driver data structures ===== */
> >> +
> >> +enum sba_request_flags {
> >> +     SBA_REQUEST_STATE_FREE          = 0x001,
> >> +     SBA_REQUEST_STATE_ALLOCED       = 0x002,
> >> +     SBA_REQUEST_STATE_PENDING       = 0x004,
> >> +     SBA_REQUEST_STATE_ACTIVE        = 0x008,
> >> +     SBA_REQUEST_STATE_RECEIVED      = 0x010,
> >> +     SBA_REQUEST_STATE_COMPLETED     = 0x020,
> >> +     SBA_REQUEST_STATE_ABORTED       = 0x040,
> >> +     SBA_REQUEST_STATE_MASK          = 0x0ff,
> >> +     SBA_REQUEST_FENCE               = 0x100,
> >
> > how does this help in mem alloctn?

??

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
