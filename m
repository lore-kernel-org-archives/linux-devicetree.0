From: Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v9 0/4] arm64: arch_timer: Add workaround for
 hisilicon-161010101 erratum
Date: Sun, 22 Jan 2017 15:59:57 +0800
Message-ID: <8818973b-602b-e71f-a12b-3e894aa0e619@linaro.org>
References: <1484832916-7248-1-git-send-email-dingtianhong@huawei.com>
 <20170120150428.GC22152@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170120150428.GC22152@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2017/1/20 23:04, Mark Rutland wrote:
> On Thu, Jan 19, 2017 at 09:35:12PM +0800, Ding Tianhong wrote:
>> Ding Tianhong (4):
>>   arm64: arch_timer: Add device tree binding for hisilicon-161010101
>>     erratum
>>   arm64: arch_timer: Introduce a generic erratum handing mechanism for
>>     fsl-a008585
>>   arm64: arch_timer: Work around Erratum Hisilicon-161010101
>>   arm64: arch timer: Add timer erratum property for Hip05-d02 and
>>     Hip06-d03
>>
>>  Documentation/admin-guide/kernel-parameters.txt    |   9 --
>>  Documentation/arm64/silicon-errata.txt             |  43 +++---
>>  .../devicetree/bindings/arm/arch_timer.txt         |   6 +
>>  arch/arm64/boot/dts/hisilicon/hip05.dtsi           |   1 +
>>  arch/arm64/boot/dts/hisilicon/hip06.dtsi           |   1 +
>>  arch/arm64/include/asm/arch_timer.h                |  38 ++----
>>  drivers/clocksource/Kconfig                        |  18 +++
>>  drivers/clocksource/arm_arch_timer.c               | 150 +++++++++++++++------
>>  8 files changed, 171 insertions(+), 95 deletions(-)
>
> I've picked these up (with a few local cleanups), given that some local
> testing, and pushed the result to a branch [1] on my git repo.
>
> There are likely to be clashes with the arm64 tree (e.g. for
> silicon-errata.txt), and we're also likely to have more arch timer
> updates shortly for the GTDT stuff,

Yes, GTDT patches conflict with this patch set but it's easy to
fix.

> so I think the best bet is for both
> arm64 and the clocksource tree to pull that branch for v4.11.
>
> Alternatively, we could take this all through the arm64 tree, if the
> clocksource maintainers are happy with that.
>
> Thoughts?

GTDT patch set is adding ACPI support for arch timer, and it's
only used for ARM64 now, in order to handler the conflict easily,
I think take them all through arm64 tree is better (I was working
with Fuwei for the GTDT patch set and I hope it's not blocked by
"who will merge the code"...)

Thanks
Hanjun
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
