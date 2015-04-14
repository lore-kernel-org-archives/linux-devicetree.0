From: YiPing Xu <xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH v2 4/6] clk: hi6220: Clock driver support for Hisilicon
 hi6220 SoC
Date: Tue, 14 Apr 2015 16:53:45 +0800
Message-ID: <552CD599.4010705@hisilicon.com>
References: <1428916660-25910-1-git-send-email-bintian.wang@huawei.com> <2254597.TWaxeZsKvK@wuerfel> <552BCB5A.8010705@huawei.com> <3183355.UnoLoN8dF8@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3183355.UnoLoN8dF8@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Bintian <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, btw-aAikPa0K0u50tdys+9eLAQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, yanhaifeng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, victor.lixin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sledge.yanwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, heyunlei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, z.liuxinliang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, zhenwei.wang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, sboyd@codeaurora.o
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2015/4/13 23:34, Arnd Bergmann =E5=86=99=E9=81=93:
> On Monday 13 April 2015 21:57:46 Bintian wrote:
>> Hello Arnd,
>>
>> Thanks for your code review.
>>
>> On 2015/4/13 21:30, Arnd Bergmann wrote:
>>> On Monday 13 April 2015 17:17:38 Bintian Wang wrote:
>>>> +#define HI6220_CFG_CSI2PHY     8
>>>> +#define HI6220_ISP_SCLK_GATE   9
>>>> +#define HI6220_ISP_SCLK_GATE1  10
>>>> +#define HI6220_ADE_CORE_GATE   11
>>>> +#define HI6220_CODEC_VPU_GATE  12
>>>> +#define HI6220_MED_SYSPLL      13
>>>> +
>>>> +/* mux clocks */
>>>> +#define HI6220_1440_1200       20
>>>> +#define HI6220_1000_1200       21
>>>> +#define HI6220_1000_1440       22
>>>> +
>>>> +/* divider clocks */
>>>> +#define HI6220_CODEC_JPEG      30
>>>> +#define HI6220_ISP_SCLK_SRC    31
>>>> +#define HI6220_ISP_SCLK1       32
>>>>
>>>
>>> The numbers seem rather arbitrary, and you have both holes as well =
as duplicate
>>> numbers here. I would suggest you do one of two things instead:
>
>> I just worry about some special clocks may be added later so keep so=
me
>> holes for them;
>>
>> The duplicate numbers means clocks belong to different system contro=
l
>> domains.
>
> I don't understand. How would there be additional clocks added later?
> Wouldn't that be a new chip?

   There are some clocks not used in linux system. e.g, some clocks are=
=20
used in base band processor. So, some numbers are not defined here.

> If you have separate system control domains, doesn't that mean that y=
ou
> also have separate DT bindings?
>
>>> a) have a separate header file per clock driver and make all the
>>>      numbers unique and consecutive within that header
>>>
>>> b) use the same numbers as the hardware registers so you can put th=
e
>>>      numbers directly into the dts and don't need a header to creat=
e
>>>      an artificial ABI between the clock driver and the boot loader=
=2E
>> This header file will be used by device tree (I like using the clock
>> name instead "magic number" in dts :) )
>
> That's not how it works though: The dts file is the place to define
> the hardware numbers, we do that for all sorts of numbers: interrupts=
,
> gpios, register ranges etc are all defined in dts to avoid putting
> magic numbers in external header files.
>
> There are some cases where it gets too ugly for clock controllers
> that are highly irregular, but yours doesn't seem to be that kind.
>
> E.g. all the fixed rate clocks should just be separate device nodes,
> which lets you remove the binding for that node.
>
>> so how about keep them in one header file and let dts just include
>> one header file (not four files), but remove the holes?
>
> The header files constantly cause problems with merge dependencies,
> and we have some other companies that keep releasing new chips
> that each time require a new header file. If hisilicon plans to make
> more chips like this one, please consider coming up with more
> generic bindings to avoid this.
>
> 	Arnd
>
> .
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
