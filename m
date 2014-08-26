From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v5 3/5] RTC: RK808: add RTC driver for RK808
Date: Tue, 26 Aug 2014 17:47:08 +0800
Message-ID: <53FC579C.50507@rock-chips.com>
References: <1408973668-21436-1-git-send-email-zyw@rock-chips.com> <CAD=FV=VYJvgXXcYkq+vcpZkXZBDbgfRGNyF8GA6MnvMAGaAebQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=VYJvgXXcYkq+vcpZkXZBDbgfRGNyF8GA6MnvMAGaAebQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lin Huang <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, xxx <xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sonny Rao <sonnyrao@c>
List-Id: devicetree@vger.kernel.org


On 08/26/2014 11:22 AM, Doug Anderson wrote:
>> +       int ret;
>> >+
>> >+       /* Has the RTC been programmed? */
>> >+       ret = regmap_update_bits(rk808->regmap, RK808_RTC_CTRL_REG,
>> >+                                BIT_RTC_CTRL_REG_RTC_V_OPT_M, 0);
> Can you explain what you're doing here?  The comment seems wrong since
> it implies that you're checking something.
>
> >From what I can tell from the manual you're setting "RTC_READSEL" to 0
> which means "Read access directly to dynamic registers.".  That's not
> clear here, and RTC_V_OPT_M makes no sense to me.

RK808 has a shadowed register for saving a "frozen" RTC time.
When user setting "RTC_READSEL" to 1, the time will save in this 
shadowed register.
In this case, user read rtc time register, actually get the time of that 
moment.
So, I move it to probe, this bit needn't clear every time
>> >+       tm->tm_min = bcd2bin(rtc_data[1]) & MINUTES_REG_MAK;
>> >+       tm->tm_hour = bcd2bin(rtc_data[2]) & HOURS_REG_MSK;
>> >+       tm->tm_mday = bcd2bin(rtc_data[3]) & DAYS_REG_MSK;
>> >+       tm->tm_mon = (bcd2bin(rtc_data[4]) & MONTHS_REG_MSK) - 1;
>> >+       tm->tm_year = (bcd2bin(rtc_data[5]) & YEARS_REG_MSK) + 100;
>> >+       tm->tm_wday = bcd2bin(rtc_data[6]) & WEEKS_REG_MSK;
>> >+       dev_dbg(dev, "RTC date/time %4d-%02d-%02d(%d) %02d:%02d:%02d\n",
>> >+               1900 + tm->tm_year, tm->tm_mon + 1, tm->tm_mday,
>> >+               tm->tm_wday, tm->tm_hour , tm->tm_min, tm->tm_sec);
>> >+
>> >+       return 0;
>> >+}
>> >+
>> >+/*
>> >+ * Set current time and date in RTC
>> >+ */
>> >+static int rk808_rtc_set_time(struct device *dev, struct rtc_time *tm)
> Make this "const struct rtc_time *tm"
It will be a warning if add const.
It should be match
int (*set_time)(struct device *, struct rtc_time *);
in rtc.h
>
>> +               rk808_rtc_set_time(&pdev->dev, &tm_def);
>> >+       }
>> >+
>> >+       device_init_wakeup(&pdev->dev, 1);
> You can skip this.  We'll set "wakeup-source" in the device tree.
> That will set I2C_CLIENT_WAKE.  That will cause the i2c core to call
> device_init_wakeup() for you.
If I remove it, wakealarm is disappear, even though I add 
"wakeup-source" in device tree.
So, I keep it temporarily
>
>> +       if (IS_ERR(rk808_rtc->rtc)) {
>> >+               ret = PTR_ERR(rk808_rtc->rtc);
>> >+               return ret;
>> >+       }
>> >+
>> >+       alm_irq  = platform_get_irq(pdev, 0);
> Are you sure that platform_get_irq() works in this case?  In Javier's
> in-flight max77802 driver he use regmap_irq_get_virq().
>
> ...oh, maybe your way does work!  You've got the rtc_resources to
> specify things, so that looks good...
>
> ...but I tried testing it by doing:
>
> cd /sys/class/rtc/rtc0
> echo +2 > wakealarm
> sleep 5
> grep 808 /proc/interrupts
>
> ...and I didn't see an interrupt go off.  Any idea why?
It works well.





--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
