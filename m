From: zhangfei <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: hi3660: Clock driver support for Hisilicon
 hi3660 SoC
Date: Fri, 23 Dec 2016 10:37:37 +0800
Message-ID: <1df9ecd0-559d-4c34-e690-dc64b6908d96@linaro.org>
References: <1481781493-6188-1-git-send-email-zhangfei.gao@linaro.org>
 <1481781493-6188-3-git-send-email-zhangfei.gao@linaro.org>
 <20161221232551.GB8288@codeaurora.org>
 <fc7bebd2-ad03-6479-d6e7-42f5d724216c@linaro.org>
 <20161222205112.GD8288@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161222205112.GD8288-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, Stephen


On 2016年12月23日 04:51, Stephen Boyd wrote:
> On 12/22, zhangfei wrote:
>> On 2016年12月22日 07:25, Stephen Boyd wrote:
>>> On 12/15, Zhangfei Gao wrote:
>>>> Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>> +
>>>> +	switch (type) {
>>>> +	case HI3660_CRGCTRL:
>>>> +		hi3660_clk_crgctrl_init(np);
>>>> +		break;
>>>> +	case HI3660_PCTRL:
>>>> +		hi3660_clk_pctrl_init(np);
>>>> +		break;
>>>> +	case HI3660_PMUCTRL:
>>>> +		hi3660_clk_pmuctrl_init(np);
>>>> +		break;
>>>> +	case HI3660_SCTRL:
>>>> +		hi3660_clk_sctrl_init(np);
>>>> +		break;
>>>> +	case HI3660_IOMCU:
>>>> +		hi3660_clk_iomcu_init(np);
>>>> +		break;
>>> This "multi-device" driver design is sort of odd. Why not have
>>> different files and struct drivers for the different devices in
>>> the system that are clock controllers? I don't really understand
>>> why we're controlling the devices with one struct driver
>>> instance. Is something shared between the devices?
>> Do you mean put in different .c / drivers?
> Yes.
>
>> They have to be put in the same file, since the parent / child
>> relate to each other.
> We handle clk parent/child relationships through strings. So why
> does that mean we need to put these in the same file with the
> same struct driver?
Yes, you are right.

But we still prefer to put in the same file for as a hi3660-clock driver,
since it is easy to maintain.

There may too many files if each chip split to small pieces,
there may many chips for hisilicon in the futures.
And some clocks has less entries,  like hi3660_pmu_gate_clks only have 
one entry.

Also put in one file is easy to find parent/child relation, so easier to 
find bugs.
After all, they just put in different region for privilege control, no 
other special reason.

What do you think.

Thanks

>
>> They are for the same chip, but some put in different region for
>> privilege control.
> Ok.
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
