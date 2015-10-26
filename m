From: Ganapatrao Kulkarni <gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 3/4] arm64/arm, numa, dt: adding numa dt binding
 implementation for arm64 platforms
Date: Mon, 26 Oct 2015 13:54:36 +0530
Message-ID: <CAFpQJXXN-xixG2k7JJuJeCbLkGmR4RKX3heEeaOCpWBVNL4Mog@mail.gmail.com>
References: <1445337931-11344-1-git-send-email-gkulkarni@caviumnetworks.com>
	<1445337931-11344-4-git-send-email-gkulkarni@caviumnetworks.com>
	<CACVXFVMiZs_g3qw99-PhxLiX5oLe8_z5cOAfJZ_4-09jN2koCQ@mail.gmail.com>
	<CAFpQJXX8VXX+gTBn-+7MepSAOzbOuc-yWJe4f=B7MH_Nj7FsKw@mail.gmail.com>
	<CACVXFVPoZqjFeqK7=M7wK0JQ0iS9tYoN8BHsYMc25OL-4j=e1g@mail.gmail.com>
	<CACVXFVO5QGu9z1C49Wos_A5MpPafABL+WDidiHp3S2v1xUsRZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACVXFVO5QGu9z1C49Wos_A5MpPafABL+WDidiHp3S2v1xUsRZw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ming Lei <ming.lei-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Prasun Kapoor <Prasun.Kapoor-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, Mark Salter <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, rfranz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Steve Capper <steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "marc.zyngier-5wv7dgnIgG8@public.gmane.org" <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kumar
List-Id: devicetree@vger.kernel.org

On Mon, Oct 26, 2015 at 12:50 PM, Ming Lei <ming.lei-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wrote:
> On Mon, Oct 26, 2015 at 12:53 PM, Ming Lei <ming.lei-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wrote:
>> On Mon, Oct 26, 2015 at 11:50 AM, Ganapatrao Kulkarni
>> <gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> On Mon, Oct 26, 2015 at 7:14 AM, Ming Lei <ming.lei-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wrote:
>>>> On Tue, Oct 20, 2015 at 6:45 PM, Ganapatrao Kulkarni
>>>> <gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org> wrote:
>>>>> Adding numa dt binding support for arm64 based platforms.
>>>>> dt node parsing for numa topology is done using device property
>>>>> proximity and device node distance-map.
>>>>>
>>>>> Reviewed-by: Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>>>>> Signed-off-by: Ganapatrao Kulkarni <gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
>>>>> ---
>>>>>  arch/arm64/Kconfig            |  10 ++
>>>>>  arch/arm64/include/asm/numa.h |  10 ++
>>>>>  arch/arm64/kernel/Makefile    |   1 +
>>>>>  arch/arm64/kernel/of_numa.c   | 221 ++++++++++++++++++++++++++++++++++++++++++
>>>>>  arch/arm64/kernel/smp.c       |   1 +
>>>>>  arch/arm64/mm/numa.c          |  10 +-
>>>>>  6 files changed, 252 insertions(+), 1 deletion(-)
>>>>>  create mode 100644 arch/arm64/kernel/of_numa.c
>>>>>
>>>>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>>>>> index 0f9cdc7..6cf8d20 100644
>>>>> --- a/arch/arm64/Kconfig
>>>>> +++ b/arch/arm64/Kconfig
>>>>> @@ -426,6 +426,16 @@ config NUMA
>>>>>           local memory controller of the CPU and add some more
>>>>>           NUMA awareness to the kernel.
>>>>>
>>>>> +config OF_NUMA
>>>>> +       bool "Device Tree NUMA support"
>>>>> +       depends on NUMA
>>>>> +       depends on OF
>>>>> +       default y
>>>>> +       help
>>>>> +         Enable Device Tree NUMA support.
>>>>> +         This enables the numa mapping of cpu, memory, io and
>>>>> +         inter node distances using dt bindings.
>>>>
>>>> Enabling the above config option can cause numa_init() warning in
>>>> numa-less arm64 system, please see the following report:
>>> this is taken care. which version are you using?
>>
>> V5.
>
> The issue persists on V6 too, so looks V7 is needed.
can you please share the boot log with v6.
you can send to me only.
>
>>
>>>
>>>>
>>>>           https://bugs.launchpad.net/bugs/1509221
>>>>
>>>> Thanks,
>>>
>>> Thanks
>>> Ganapat
>>>
>>> _______________________________________________
>>> linux-arm-kernel mailing list
>>> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
