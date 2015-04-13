From: Bintian <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 4/6] clk: hi6220: Clock driver support for Hisilicon
 hi6220 SoC
Date: Mon, 13 Apr 2015 21:57:46 +0800
Message-ID: <552BCB5A.8010705@huawei.com>
References: <1428916660-25910-1-git-send-email-bintian.wang@huawei.com> <1428916660-25910-5-git-send-email-bintian.wang@huawei.com> <2254597.TWaxeZsKvK@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2254597.TWaxeZsKvK@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, yanhaifeng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, sledge.yanwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhenwei.wang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, victor.lixin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, dan.zhao@hisilicon.c
List-Id: devicetree@vger.kernel.org

Hello Arnd,

Thanks for your code review.

On 2015/4/13 21:30, Arnd Bergmann wrote:
> On Monday 13 April 2015 17:17:38 Bintian Wang wrote:
>> +#define HI6220_CFG_CSI2PHY     8
>> +#define HI6220_ISP_SCLK_GATE   9
>> +#define HI6220_ISP_SCLK_GATE1  10
>> +#define HI6220_ADE_CORE_GATE   11
>> +#define HI6220_CODEC_VPU_GATE  12
>> +#define HI6220_MED_SYSPLL      13
>> +
>> +/* mux clocks */
>> +#define HI6220_1440_1200       20
>> +#define HI6220_1000_1200       21
>> +#define HI6220_1000_1440       22
>> +
>> +/* divider clocks */
>> +#define HI6220_CODEC_JPEG      30
>> +#define HI6220_ISP_SCLK_SRC    31
>> +#define HI6220_ISP_SCLK1       32
>>
>
> The numbers seem rather arbitrary, and you have both holes as well as duplicate
> numbers here. I would suggest you do one of two things instead:
I just worry about some special clocks may be added later so keep some
holes for them;

The duplicate numbers means clocks belong to different system control
domains.
>
> a) have a separate header file per clock driver and make all the
>     numbers unique and consecutive within that header
>
> b) use the same numbers as the hardware registers so you can put the
>     numbers directly into the dts and don't need a header to create
>     an artificial ABI between the clock driver and the boot loader.
This header file will be used by device tree (I like using the clock
name instead "magic number" in dts :) ), so how about keep them in one
header file and let dts just include one header file (not four files),
but remove the holes?

Thank you Arnd.

BR,

Bintian
>
> 	Arnd
>
> .
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
