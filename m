From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v2 2/5] MFD: RK808: Add new mfd driver for RK808
Date: Tue, 26 Aug 2014 18:39:42 +0800
Message-ID: <53FC63EE.6060104@rock-chips.com>
References: <1408505461-24200-1-git-send-email-zyw@rock-chips.com> <20140820092117.GI4266@lee--X1> <53FA9D1E.8040202@rock-chips.com> <20140826092205.GG9574@lee--X1> <53FC5BD1.7030406@rock-chips.com> <20140826102036.GJ9574@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140826102036.GJ9574@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 08/26/2014 06:20 PM, Lee Jones wrote:
> On Tue, 26 Aug 2014, Chris Zhong wrote:
>> On 08/26/2014 05:22 PM, Lee Jones wrote:
>>> On Mon, 25 Aug 2014, Chris Zhong wrote:
>>>> On 08/20/2014 05:21 PM, Lee Jones wrote:
>>>>> On Wed, 20 Aug 2014, Chris Zhong wrote:
>>>>>
>>>>>> The RK808 chip is a power management IC for multimedia and handheld
>>>>>> devices. It contains the following components:
>>>>>>
>>>>>> - Regulators
>>>>>> - RTC
>>>>>>
>>>>>> The rk808 core driver is registered as a platform driver and provides
>>>>>> communication through I2C with the host device for the different
>>>>>> components.
>>>>>>
>>>>>> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>>>>> ---
>>> [...]
>>>
>>>>>> +	rk808->pdata = pdata;
>>>>> Remove pdata from 'struct rk808'.  You can obtain it from dev.
>>>> Can I keep this pdata in rk808, because it is used in the regulator driver.
>>>> The one obtain from dev maybe empty.
>>> If the one in dev is empty, you should populate that instead.
>> So, should I malloc a pada, and assign it to client->dev?
> If client->dev.pdata is NULL, yes.
>
> But actually, I have more important questions that need to be answered
> first.  Ones which I would normally be able to answer myself if the
> patch-set had been sent as one (i.e. threaded) instead of as
> individual patches:
>
> - What are you using pdata for?

For save some properties,

like "rockchip,system-power-controller" in MFD
and some regulator properties in regulator/rk808...

> - Where is pdata populated?

It is populated in probe in mfd/rk808.c

actually, I copy it from tps65910.c


> - Where is pdata used?

pdata is used in mfd and regulator



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
