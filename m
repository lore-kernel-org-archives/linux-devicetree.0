From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v10 1/3] RTC: RK808: add RTC driver for RK808
Date: Wed, 10 Sep 2014 14:37:13 -0700
Message-ID: <CAD=FV=V4-dHpKwRqewCr7ujDdRYiMiUcRuJAS7C602EyCMnPFQ@mail.gmail.com>
References: <1410311886-4579-1-git-send-email-zyw@rock-chips.com>
	<1410311886-4579-2-git-send-email-zyw@rock-chips.com>
	<20140910134411.8128acce79f2423d4448e8f4@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140910134411.8128acce79f2423d4448e8f4-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lin Huang <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, xxx <xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Olof Johansson <olof@>
List-Id: devicetree@vger.kernel.org

Andrew,

On Wed, Sep 10, 2014 at 1:44 PM, Andrew Morton
<akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org> wrote:
> On Wed, 10 Sep 2014 09:18:04 +0800 Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
>
>> Adding RTC driver for supporting RTC device present inside RK808 PMIC.
>>
>> ...
>>
>> +     ret = rtc_valid_tm(&tm);
>> +     if (ret) {
>> +             dev_warn(&pdev->dev, "invalid date/time and init time\n");
>> +             rk808_rtc_set_time(&pdev->dev, &tm_def);
>> +     }
>
> This is somewhat unusual.  Most drivers will emit a warning and give up
> when they find the time is wrong.  Why is this driver different and is
> this desirable behaviour?

When you say "give up", what does that mean?  I assume the driver
should keep initting, right?  Then the user can go in and set a time
later...


I did test things with just removing this chunk of code.  You get some
yells at bootup if you put a bogus time in there:

[    2.987590] rk808-rtc rk808-rtc: invalid date/time and init time
[    3.013148] rk808-rtc rk808-rtc: rtc core: registered rk808-rtc as rtc0
[    4.586115] rk808-rtc rk808-rtc: hctosys: invalid date/time

...but if you later set a valid time then everything is fine.  That
seems reasonable behavior to me, so I guess we could just remove this
whole chunk?  It appears that after a normal bootup the date/time is
something valid.


-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
