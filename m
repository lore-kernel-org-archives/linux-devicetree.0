Return-Path: <devicetree-owner@vger.kernel.org>
Received: from co9ehsobe003.messaging.microsoft.com ([207.46.163.26]:24701
	"EHLO co9outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753642Ab3GYCqX (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Wed, 24 Jul 2013 22:46:23 -0400
Message-ID: <51F09189.9010602@freescale.com>
Date: Thu, 25 Jul 2013 10:46:33 +0800
From: Hongbo Zhang <hongbo.zhang@freescale.com>
MIME-Version: 1.0
Subject: Re: [PATCH v5 4/4] DMA: Freescale: eliminate a compiling warning
References: <1374646870-5162-1-git-send-email-hongbo.zhang@freescale.com> <1374646870-5162-5-git-send-email-hongbo.zhang@freescale.com> <1374694411.15592.63@snotra>
In-Reply-To: <1374694411.15592.63@snotra>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Scott Wood <scottwood@freescale.com>
Cc: vinod.koul@intel.com, djbw@fb.com, leoli@freescale.com, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 07/25/2013 03:33 AM, Scott Wood wrote:
> On 07/24/2013 01:21:09 AM, hongbo.zhang@freescale.com wrote:
>> From: Hongbo Zhang <hongbo.zhang@freescale.com>
>>
>> The variable cookie is initialized in a list_for_each_entry loop, 
>> if(unlikely)
>> the list is empty, this variable will be used uninitialized, so we 
>> get a gcc
>> compiling warning about this. This patch fixes this defect by setting an
>> initial value to the varialble cookie.
>>
>> Signed-off-by: Hongbo Zhang <hongbo.zhang@freescale.com>
>> ---
>>  drivers/dma/fsldma.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
>> index 16a9a48..14d68a4 100644
>> --- a/drivers/dma/fsldma.c
>> +++ b/drivers/dma/fsldma.c
>> @@ -406,7 +406,7 @@ static dma_cookie_t fsl_dma_tx_submit(struct 
>> dma_async_tx_descriptor *tx)
>>      struct fsl_desc_sw *desc = tx_to_fsl_desc(tx);
>>      struct fsl_desc_sw *child;
>>      unsigned long flags;
>> -    dma_cookie_t cookie;
>> +    dma_cookie_t cookie = 0;
>>
>>      spin_lock_irqsave(&chan->desc_lock, flags);
>
> This patch is unrelated to the rest of the patch series...
>
> What are the semantics of this function if there are multiple entries 
> in the list?  Returning the last cookie seems a bit odd.
>
> Is zero the proper error value?  include/linux/dmaengine.h suggests 
> that cookies should be < 0 to indicate error.
I found this compiling warning since the beginning of this work, it is 
better somebody fixes it sooner or later, so I take it at last.
Yes it was a bit hard to define the initial value, I saw the 
dmaengine.h, and I searched all the other DMA drivers with initial value 
before making the decision:
drivers/dma/mv_xor.c:    dma_cookie_t cookie = 0;
drivers/dma/sh/shdma-base.c:    dma_cookie_t cookie = 0;
drivers/dma/mmp_pdma.c:    dma_cookie_t cookie = -EBUSY;
drivers/dma/ppc4xx/adma.c:    dma_cookie_t cookie = 0;
drivers/dma/iop-adma.c:    dma_cookie_t cookie = 0;
most of them using 0, and only one negative value, it seems better? but 
-EBUSY isn't  so accurate I think.
My thought is to drop this in the next iteration, and back to this after 
the first 3 get merged.
>
> -Scott



