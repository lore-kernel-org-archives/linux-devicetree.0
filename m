From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v8 0/17] Add Analogix Core Display Port Driver
Date: Fri, 30 Oct 2015 09:05:39 +0800
Message-ID: <5632C263.8050209@rock-chips.com>
References: <1446020143-32645-1-git-send-email-ykk@rock-chips.com>
 <1972811.93U5ryFMyR@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1972811.93U5ryFMyR@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dri-deve
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On 10/30/2015 01:49 AM, Heiko Stuebner wrote:
> Am Mittwoch, 28. Oktober 2015, 16:15:43 schrieb Yakir Yang:
>> Hi all,
>>
>>     The Samsung Exynos eDP controller and Rockchip RK3288 eDP controller
>> share the same IP, so a lot of parts can be re-used. I split the common
>> code into bridge directory, then rk3288 and exynos only need to keep
>> some platform code. Cause I can't find the exact IP name of exynos dp
>> controller, so I decide to name dp core driver with "analogix" which I
>> find in rk3288 eDP TRM
>>
>> But  there are still three light registers setting differents bewteen
>> exynos and rk3288.
>> 1. RK3288 have five special pll resigters which not indicata in exynos
>>     dp controller.
>> 2. The address of DP_PHY_PD(dp phy power manager register) are different
>>     between rk3288 and exynos.
>> 3. Rk3288 and exynos have different setting with AUX_HW_RETRY_CTL(dp debug
>>     register).
>>
>> This series have been well tested on Rockchip platform with eDP panel on
>> Jerry Chromebook and Display Port Monitor on RK3288 board. Also I have
>> tested on Samsung Snow and Peach Pit Chromebooks, and thanks to Javier@Samsung
>> help to retest the whole series on Samsung Exynos5800 Peach Pi Chromebook,
>> glad to say that things works rightlly.
> Patch 15/17 looks like it didn't make it? I haven't found it in neither my
> inbox nor in the linux-rockchip list archive? So I've used the v7 version
> for my tests.

Oops, thanks for your reminding, I would send it now.

> This series on a rk3288-veyron-pinky and rk3288-veyron-jerry
> Tested-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
>

Thanks,

- Yakir

>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
