From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v7 3/5] RTC: RK808: add RTC driver for RK808
Date: Wed, 03 Sep 2014 10:01:24 +0800
Message-ID: <54067674.3040007@rock-chips.com>
References: <1409562468-16586-1-git-send-email-zyw@rock-chips.com>	<1409564586-18421-1-git-send-email-zyw@rock-chips.com> <CAD=FV=X-hSHKe4_QRxFLejok-qVYM_FyXO7L7X6AzW8sTaVPnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=X-hSHKe4_QRxFLejok-qVYM_FyXO7L7X6AzW8sTaVPnQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lin Huang <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, xxx <xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Dmitry Torokhov <dtor@chromiu>
List-Id: devicetree@vger.kernel.org


On 09/02/2014 11:58 AM, Doug Anderson wrote:
>> +static int rk808_rtc_probe(struct platform_device *pdev)
>> >+{
>> >+       struct rk808 *rk808 = dev_get_drvdata(pdev->dev.parent);
>> >+       struct rk808_rtc *rk808_rtc;
>> >+       struct rtc_time tm;
>> >+       int ret;
>> >+
>> >+       rk808_rtc = devm_kzalloc(&pdev->dev, sizeof(*rk808_rtc), GFP_KERNEL);
>> >+       if (rk808_rtc == NULL)
>> >+               return -ENOMEM;
>> >+
>> >+       platform_set_drvdata(pdev, rk808_rtc);
>> >+       rk808_rtc->rk808 = rk808;
>> >+
>> >+       /* start rtc running by default, and use shadowed timer. */
>> >+       ret = regmap_update_bits(rk808->regmap, RK808_RTC_CTRL_REG,
>> >+                                BIT_RTC_CTRL_REG_STOP_RTC_M |
>> >+                                BIT_RTC_CTRL_REG_RTC_READSEL_M,
>> >+                                BIT_RTC_CTRL_REG_RTC_READSEL_M);
> I think this should still be setting to 0, not to
> BIT_RTC_CTRL_REG_RTC_READSEL_M.  Otherwise the first read of the time
> will return that time that was frozen at probe time, right?  AKA: if
> probe happens at 11:00:00 and then we read the time at 11:00:05 we'll
> still read 11:00:00 the first time.
>
  Sorry, I did not describe correctly, in the previous mail.
  Actually, RK808 has a "GET_TIME" switch bit. When "GET_TIME" bit rising thansiton to 1,
  the current time will save in a shadowed register.
  If "READSEL" = 1, read rtc time register, return the frozen time.
  If we need the real time, clr this "READSEL" bit.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
