From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v9 0/4] arm64: arch_timer: Add workaround for
 hisilicon-161010101 erratum
Date: Tue, 24 Jan 2017 15:27:51 +0000
Message-ID: <35cf654f-3944-fc76-5120-25e33f71be4f@arm.com>
References: <1484832916-7248-1-git-send-email-dingtianhong@huawei.com>
 <765699aa-cbc6-67eb-9108-cbf335338e4c@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <765699aa-cbc6-67eb-9108-cbf335338e4c-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 24/01/17 15:08, Daniel Lezcano wrote:
> On 19/01/2017 14:35, Ding Tianhong wrote:
>> Erratum Hisilicon-161010101 says that the ARM generic timer counter "has the
>> potential to contain an erroneous value when the timer value changes".
>> Accesses to TVAL (both read and write) are also affected due to the implicit counter
>> read.  Accesses to CVAL are not affected.
>>
>> The workaround is to reread the system count registers until the value of the second
>> read is larger than the first one by less than 32, the system counter can be guaranteed
>> not to return wrong value twice by back-to-back read and the error value is always larger
>> than the correct one by 32. Writes to TVAL are replaced with an equivalent write to CVAL.
> 
> Why not use another clocksource instead of adding a workaround with a
> non negligible overhead and more complexity in the code ?

The overhead only affects the affected systems, since it is guarded by a
static key (the same static key that guards the FSL workaround that is
already in mainline).

As for creating a different clocksources, this would in turn make the
integration with the arch code more complex (arm64 relies on having
working architected timers, with or without workarounds) and the
integration with KVM (which relies on the same), and in the end create
quite a lot of duplication. Are we going to create a separate
clocksource for each potential erratum that people with screwed hardware
come up with?

I'd prefer to organise the mess rather than spread it everywhere.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
