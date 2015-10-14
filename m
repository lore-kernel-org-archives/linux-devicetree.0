From: Rameshwar Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH v2] dmaengine: xgene-dma: Disable memcpy operation due to
 performance drop
Date: Wed, 14 Oct 2015 15:50:33 +0530
Message-ID: <CAFd313z+t2rNFZPfXDm952RhAQgZ-_Rdn7P06UyKXcMi0zR47A@mail.gmail.com>
References: <1444295217-3099-1-git-send-email-rsahu@apm.com>
	<20151009161208.GJ3609@vkoul-mobl.iind.intel.com>
	<CAFd313w3010=LN7rfrxwohM=h-9xWzK6UNtcWxn+eXtx-pNv4Q@mail.gmail.com>
	<20151012142336.GA27370@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151012142336.GA27370@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Vinod,

On Mon, Oct 12, 2015 at 7:53 PM, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Oct 09, 2015 at 10:08:32PM +0530, Rameshwar Sahu wrote:
>> Hi Vinod,
>>
>> On Fri, Oct 9, 2015 at 9:42 PM, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
>> > On Thu, Oct 08, 2015 at 02:36:57PM +0530, Rameshwar Prasad Sahu wrote:
>> >> The DMA engine supports memory copy, RAID5 XOR, RAID6 PQ, and other
>> >> computations. But the bandwidth of the entire DMA engine is shared
>> >> among all channels. This patch re-configures operations availability
>> >> such that one can achieve maximum performance for XOR and PQ
>> >> computation by removing the memory offload operations.
>> >>
>> >> Signed-off-by: Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>
>> >> ---
>> >>  drivers/dma/xgene-dma.c | 1 -
>> >>  1 file changed, 1 deletion(-)
>> >>
>> >> diff --git a/drivers/dma/xgene-dma.c b/drivers/dma/xgene-dma.c
>> >> index 8d57b1b..cd38022 100644
>> >> --- a/drivers/dma/xgene-dma.c
>> >> +++ b/drivers/dma/xgene-dma.c
>> >> @@ -1707,7 +1707,6 @@ static void xgene_dma_set_caps(struct xgene_dma_chan *chan,
>> >>       dma_cap_zero(dma_dev->cap_mask);
>> >>
>> >>       /* Set DMA device capability */
>> >> -     dma_cap_set(DMA_MEMCPY, dma_dev->cap_mask);
>> >>       dma_cap_set(DMA_SG, dma_dev->cap_mask);
>> >
>> > This will not work. Still clients can invoke memcpy operation. You need to
>> > remove the callback
>>
>> Got it, instead of removing the callback registration can we keep it
>> inside the condition like..
>>
>> if (dma_has_cap(DMA_MEMCPY, dma_dev->cap_mask))
>>             dma_dev->device_prep_dma_memcpy = xgene_dma_prep_memcpy;
>
> But the code is dead and will not be tested and hence not maintained. I do
> not see a reason to keep dead code in kernel

Got it, I will remove the memcpy offload support and will send another
patch for review.
>
> --
> ~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
