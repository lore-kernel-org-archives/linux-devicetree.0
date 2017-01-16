From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v7 0/4] arm64: arch_timer: Add workaround for
 hisilicon-161601 erratum
Date: Mon, 16 Jan 2017 11:29:44 +0000
Message-ID: <63e1f4de-f5e8-6a19-2f8f-61b198f6369f@arm.com>
References: <1483772858-10380-1-git-send-email-dingtianhong@huawei.com>
 <6c33e4e9-6472-4738-aea2-55dcaab3a94f@huawei.com>
 <ff9c81c2-90ef-a5c2-6f0b-c6cf5d0d11a9@arm.com>
 <06fd3327-f451-bc0d-b80c-4200bc9fadaa@huawei.com>
 <e0aa52a6-8dc7-65d6-6a3a-c753b6c9538e@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e0aa52a6-8dc7-65d6-6a3a-c753b6c9538e-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 16/01/17 10:37, Ding Tianhong wrote:
> 
> 
> On 2017/1/12 21:24, Ding Tianhong wrote:
>>
>> On 2017/1/12 17:11, Marc Zyngier wrote:
>>> On 12/01/17 04:23, Ding Tianhong wrote:
>>>> Hi Marc:
>>>>
>>>> How about this v7, if any suggestions very grateful.
>>>
>>> It's been less than 5 days since you posted this. I'll get to it once I
>>> finish reviewing all the other patches that are sitting in the queue
>>> right before yours.
>>>
>>
>> Ok and sorry for the noisy.
>>
> 
> Hi Marc：
> 
> After discussion with the chip developer, we decide to update the erratum id for this bug, so I will resend a new version
> about this, if you has start to review this v7 patch set, I think I could wait until you have finished yet. :)

This has to be a stable erratum ID, and it won't be changed once the
workaround is merged (all you'll be able to do is to add new IDs where
the same fix is applicable). So please post the revised series, and make
sure that this is the *final* ID update.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
