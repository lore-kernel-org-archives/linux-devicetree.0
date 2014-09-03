From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v7 3/5] RTC: RK808: add RTC driver for RK808
Date: Tue, 2 Sep 2014 20:53:05 -0700
Message-ID: <CAD=FV=UXLUvvQfG4oEwcC3-ts8vVkUzZhcrfc9v6EvUvybfvOg@mail.gmail.com>
References: <1409562468-16586-1-git-send-email-zyw@rock-chips.com>
	<1409564586-18421-1-git-send-email-zyw@rock-chips.com>
	<CAD=FV=X-hSHKe4_QRxFLejok-qVYM_FyXO7L7X6AzW8sTaVPnQ@mail.gmail.com>
	<54067674.3040007@rock-chips.com>
	<CAD=FV=Xq+EaSX=wqkpRVKg5e5Rf-CMWD8ZBJ_-SZqoo-KrX0LA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=Xq+EaSX=wqkpRVKg5e5Rf-CMWD8ZBJ_-SZqoo-KrX0LA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lin Huang <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, xxx <xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Dmitry Torokhov <dtor@chromium.>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Sep 2, 2014 at 8:52 PM, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> Chris,
>
> On Tue, Sep 2, 2014 at 7:01 PM, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
>>
>> On 09/02/2014 11:58 AM, Doug Anderson wrote:
>>>>
>>>> +static int rk808_rtc_probe(struct platform_device *pdev)
>>>> >+{
>>>> >+       struct rk808 *rk808 = dev_get_drvdata(pdev->dev.parent);
>>>> >+       struct rk808_rtc *rk808_rtc;
>>>> >+       struct rtc_time tm;
>>>> >+       int ret;
>>>> >+
>>>> >+       rk808_rtc = devm_kzalloc(&pdev->dev, sizeof(*rk808_rtc),
>>>> > GFP_KERNEL);
>>>> >+       if (rk808_rtc == NULL)
>>>> >+               return -ENOMEM;
>>>> >+
>>>> >+       platform_set_drvdata(pdev, rk808_rtc);
>>>> >+       rk808_rtc->rk808 = rk808;
>>>> >+
>>>> >+       /* start rtc running by default, and use shadowed timer. */
>>>> >+       ret = regmap_update_bits(rk808->regmap, RK808_RTC_CTRL_REG,
>>>> >+                                BIT_RTC_CTRL_REG_STOP_RTC_M |
>>>> >+                                BIT_RTC_CTRL_REG_RTC_READSEL_M,
>>>> >+                                BIT_RTC_CTRL_REG_RTC_READSEL_M);
>>>
>>> I think this should still be setting to 0, not to
>>> BIT_RTC_CTRL_REG_RTC_READSEL_M.  Otherwise the first read of the time
>>> will return that time that was frozen at probe time, right?  AKA: if
>>> probe happens at 11:00:00 and then we read the time at 11:00:05 we'll
>>> still read 11:00:00 the first time.
>>>
>>  Sorry, I did not describe correctly, in the previous mail.
>>  Actually, RK808 has a "GET_TIME" switch bit. When "GET_TIME" bit rising
>> thansiton to 1,
>>  the current time will save in a shadowed register.
>>  If "READSEL" = 1, read rtc time register, return the frozen time.
>>  If we need the real time, clr this "READSEL" bit.
>
> Ohhhhh!  I see.  I clearly didn't look closely enough at the whole
> register description in the user manual.  I think you've got it right,
> then.
>
> I think this would be more obvious if you added a comment and you set
> both the high and low bits at the same time.  AKA:
>
> +       /* Force an update of the shadowed registers right now */
> +       ret = regmap_update_bits(rk808->regmap, RK808_RTC_CTRL_REG,
> +                                BIT_RTC_CTRL_REG_RTC_GET_TIME,
> +                                BIT_RTC_CTRL_REG_RTC_GET_TIME);
> +       if (ret) {
> +               dev_err(dev, "Failed to update bits rtc_ctrl: %d\n", ret);
> +               return ret;
> +       }
> +
> +       ret = regmap_update_bits(rk808->regmap, RK808_RTC_CTRL_REG,
> +                                BIT_RTC_CTRL_REG_RTC_GET_TIME,
> +                                BIT_RTC_CTRL_REG_RTC_GET_TIME);

Doh, this one was supposed to be setting it back to 0.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
