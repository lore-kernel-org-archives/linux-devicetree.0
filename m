From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 4/6] dma: bcm-sba-raid: Break sba_process_deferred_requests()
 into two parts
Date: Thu, 27 Jul 2017 10:28:57 +0530
Message-ID: <CAALAos9-RScL49BbtvwgWLkJ+uvhDFDFAmywQZQdbtXy+Ud+AA@mail.gmail.com>
References: <1501047404-14456-1-git-send-email-anup.patel@broadcom.com>
 <1501047404-14456-5-git-send-email-anup.patel@broadcom.com> <20170726171554.GK3053@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170726171554.GK3053@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 26, 2017 at 10:45 PM, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Jul 26, 2017 at 11:06:42AM +0530, Anup Patel wrote:
>> This patch breaks sba_process_deferred_requests() into two parts
>> sba_process_received_request() and _sba_process_pending_requests()
>> for readability.
>>
>> In addition,
>
> that should be a separate patch then... no?
>
>> we remove redundant SBA_REQUEST_STATE_RECEIVED state
>
> this should be one more...

OK, I will make this separate patch.

>
>> and ensure that all requests in a chained request should be freed
>> only after all have been received.
>
> and then this, right?

OK.

>
>>
>> Signed-off-by: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Reviewed-by: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> ---
>>  drivers/dma/bcm-sba-raid.c | 130 ++++++++++++++++-----------------------------
>>  1 file changed, 47 insertions(+), 83 deletions(-)
>>
>> diff --git a/drivers/dma/bcm-sba-raid.c b/drivers/dma/bcm-sba-raid.c
>> index db5e3db..b92c756 100644
>> --- a/drivers/dma/bcm-sba-raid.c
>> +++ b/drivers/dma/bcm-sba-raid.c
>> @@ -97,9 +97,8 @@ enum sba_request_flags {
>>       SBA_REQUEST_STATE_ALLOCED       = 0x002,
>>       SBA_REQUEST_STATE_PENDING       = 0x004,
>>       SBA_REQUEST_STATE_ACTIVE        = 0x008,
>> -     SBA_REQUEST_STATE_RECEIVED      = 0x010,
>> -     SBA_REQUEST_STATE_COMPLETED     = 0x020,
>> -     SBA_REQUEST_STATE_ABORTED       = 0x040,
>> +     SBA_REQUEST_STATE_COMPLETED     = 0x010,
>> +     SBA_REQUEST_STATE_ABORTED       = 0x020,
>
> so we changed this is patch 1, only to change it here. why....!!!!
>
> so let me stop here again and repeat myself again about splitting stuff up,
> blah blah, good patches, blah blah, read the Documentation blah blah.. and
> hope someones listening :(

OK, I will address your comments.

Regards,
Anup
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
