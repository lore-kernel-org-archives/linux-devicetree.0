From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 10/16] dmaengine: bcm-sba-raid: Alloc resources before
 registering DMA device
Date: Fri, 18 Aug 2017 10:31:51 +0530
Message-ID: <CAALAos-i22Mm5R1U-GGHPBZE74nKkHH-z_v4y48oD8nHZ6uscA@mail.gmail.com>
References: <1501583880-32072-1-git-send-email-anup.patel@broadcom.com>
 <1501583880-32072-11-git-send-email-anup.patel@broadcom.com> <20170817063812.GA3053@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170817063812.GA3053@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 17, 2017 at 12:08 PM, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Aug 01, 2017 at 04:07:54PM +0530, Anup Patel wrote:
>> We should allocate DMA channel resources before registering the
>> DMA device in sba_probe() because we can get DMA request soon
>> after registering the DMA device. If DMA channel resources are
>> not allocated before first DMA request then SBA-RAID driver will
>> crash.
>>
>> Signed-off-by: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> ---
>>  drivers/dma/bcm-sba-raid.c | 30 +++++++++++++++---------------
>>  1 file changed, 15 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/dma/bcm-sba-raid.c b/drivers/dma/bcm-sba-raid.c
>> index f6616da..f14ed0a 100644
>> --- a/drivers/dma/bcm-sba-raid.c
>> +++ b/drivers/dma/bcm-sba-raid.c
>> @@ -1478,13 +1478,13 @@ static int sba_prealloc_channel_resources(struct sba_device *sba)
>>       int i, j, ret = 0;
>>       struct sba_request *req = NULL;
>>
>> -     sba->resp_base = dma_alloc_coherent(sba->dma_dev.dev,
>> +     sba->resp_base = dma_alloc_coherent(sba->mbox_dev,
>
> how does this qualify as move before registering, you seem to be using
> different device now

The sba->dma_dev.dev is assigned in sba_async_register().

Now, if we are calling sba_async_register() after
sba_prealloc_channel_resources() then we cannot
use sba->dma_dev.dev in sba_prealloc_channel_resources()

Regards,
Anup
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
