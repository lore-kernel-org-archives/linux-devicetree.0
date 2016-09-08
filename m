From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v4 1/4] arm64: arch_timer: Add device tree binding for
 A-008585 erratum
Date: Thu, 8 Sep 2016 13:07:51 +0100
Message-ID: <57D15497.9030606@arm.com>
References: <1467877572-10817-1-git-send-email-oss@buserror.net>
 <e69db8b1-5fe2-ed0a-b073-de3efdd854d2@suse.com> <57D14F9A.2050007@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57D14F9A.2050007-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>, Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/09/16 12:46, Ding Tianhong wrote:
> Ping

Oh please! Maybe you could look at the couple of points I've raised in
this thread and help addressing them, given that you have a vested
interest in seeing these patches being merged? Pinging people this way
is not very productive.

Thanks,

	M.

> 
> On 2016/8/25 19:04, Matthias Brugger wrote:
>> Hi all,
>>
>> On 07/07/16 09:46, Scott Wood wrote:
>>> This erratum describes a bug in logic outside the core, so MIDR can't be
>>> used to identify its presence, and reading an SoC-specific revision
>>> register from common arch timer code would be awkward.  So, describe it
>>> in the device tree.
>>>
>>> Signed-off-by: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
>>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> ---
>>
>> As of today I wasn't able to find this series in linux-next. Was this series somehow forgotten? Scott maybe you can resend the patches adding the clocksource maintainer.
>>
>> Regards,
>> Matthias
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>
>>
> 
> 


-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
