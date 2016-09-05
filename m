From: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: rockchip: support the pmu node for
 rk3399
Date: Tue, 06 Sep 2016 07:27:10 +0800
Message-ID: <57CDFF4E.9090907@rock-chips.com>
References: <1473099435-28198-1-git-send-email-wxt@rock-chips.com> <1473099435-28198-3-git-send-email-wxt@rock-chips.com> <1666797.JgSRLN1JIq@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1666797.JgSRLN1JIq@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 2016年09月06日 06:27, Heiko Stuebner wrote:
> Am Dienstag, 6. September 2016, 02:17:15 CEST schrieb Caesar Wang:
>> This patch adds to enable the ARM Performance Monitor Units for rk3399.
>> ARM cores often have a PMU for counting cpu and cache events like cache
>> misses and hits.
>>
>> Also, as the Marc posted the patches [0] to support Partitioning per-cpu
>> interrupts. Let's add this patch to match it on rk3399 SoCs.
>>
>> [0]:
>> https://lkml.org/lkml/2016/4/11/182
>>
>> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
>> Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
>> CC: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> I've applied this one but did some corrections [0]:
>
> - ppi-partitions is supposed to be a subnode of the gic, that is why the code
> also start search for it starting from the gic node - I've moved it
> - I've renamed the phandles taking part0/part1 from the example feels a bit to
> generic, so it's now ppi_cluster0 and ppi_cluster1 matching the cpu-clusters
>
> I've gave this a spin on my rk3399evb and the ppi-partitions got recognized
> as well as the pmu instances got created, but please also double check again.


Yup, thanks the fixes.

>
>
> Thanks
> Heiko
>
>
> [0] https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.git/
> commit/?id=48120b1af6f072bfd6b075bf9be560ad6fda2faa
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


-- 
caesar wang | software engineer | wxt-TNX95d0MmH73oGB3hsPCZA@public.gmane.org


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
