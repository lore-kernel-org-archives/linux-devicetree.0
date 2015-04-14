From: Brent Wang <wangbintian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/6] clk: hi6220: Document devicetree bindings for
 hi6220 clock
Date: Tue, 14 Apr 2015 22:37:34 +0800
Message-ID: <CAAS=xmip9WeN2AXH+YpQK9Un1TCaXkHbK-cRFcr3fMcFvrfhPQ@mail.gmail.com>
References: <1428916660-25910-1-git-send-email-bintian.wang@huawei.com>
	<2456827.cDpE8M58pn@wuerfel>
	<552D09F7.7080603@huawei.com>
	<5065055.RUNnjWsHWj@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5065055.RUNnjWsHWj@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Bintian <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "btw-aAikPa0K0u50tdys+9eLAQ@public.gmane.org" <btw-aAikPa0K0u50tdys+9eLAQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org" <huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Haifeng Yan <yanhaifeng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Xu Wei <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "sledge.yanwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org" <sledge.yanwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, XinWei Kong <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "heyunlei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org" <heyunlei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org" <w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, z.liuxinliang-hv44wF8Li91hl2p70BpVqQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Arnd,

2015-04-14 21:20 GMT+08:00 Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>:
> On Tuesday 14 April 2015 20:37:11 Bintian wrote:
>> It's really a smart fix!
>>
>> For the four system controllers, how about change the following strings:
>> +       - "hisilicon,aoctrl"
>> +       - "hisilicon,sysctrl"
>> +       - "hisilicon,mediactrl"
>> +       - "hisilicon,pmctrl"
>>
>> to
>> +       - "hisilicon,hi6220-aoctrl"
>> +       - "hisilicon,hi6220-sysctrl"
>> +       - "hisilicon,hi6220-mediactrl"
>> +       - "hisilicon,hi6220-pmctrl"
>
> Yes, that works.
Thanks, will fix in next version.

>
>> and I also use "hisilicon,hi6220-xxxx" for hi6220 clk driver directly ?
>
> Seems fine to me, though I'd have to look at the bigger picture to see
> any potential problems. At the moment, I don't see any.
Sure, please also help to review the 6/6 patch of this patch set, many thanks!

BR,

Bintian

>
>         Arnd
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
