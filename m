Return-Path: <SRS0=FOmB=HB=rock-chips.com=shawn.lin@kernel.org>
Subject: Re: [PATCH 2/2] mmc: core: Add tunable delay before detecting card
 after card is inserted
References: <1523496031-145755-1-git-send-email-shawn.lin@rock-chips.com>
 <1523496031-145755-2-git-send-email-shawn.lin@rock-chips.com>
 <CAPDyKFoMT90sayR3i783Zybr-O5S9Q2Zp4+DYLNehSQQntdbgw@mail.gmail.com>
 <3600d23a-7a5b-cb31-2f6a-9f7239f26981@rock-chips.com>
 <CAPDyKFrWw-AhON1janB83JA13dxZQz6o6zMg3LBQK2Hv2+Cw_w@mail.gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <a9497120-154b-4f87-9742-d7fd4c38d86b@rock-chips.com>
Date: Thu, 12 Apr 2018 16:14:38 +0800
MIME-Version: 1.0
In-Reply-To: <CAPDyKFrWw-AhON1janB83JA13dxZQz6o6zMg3LBQK2Hv2+Cw_w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: shawn.lin@rock-chips.com, Rob Herring <robh+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 2018/4/12 15:58, Ulf Hansson wrote:
> On 12 April 2018 at 09:34, Shawn Lin <shawn.lin@rock-chips.com> wrote:
>> Hi Ulf,
>>
>> On 2018/4/12 14:32, Ulf Hansson wrote:
>>>
>>> On 12 April 2018 at 03:20, Shawn Lin <shawn.lin@rock-chips.com> wrote:
>>>>
>>>> Allow to use tunable delay before detecting card after card is inserted
>>>> either from firmware, or argument passing to mmc_gpiod_request_cd(). The
>>>> default value is 200ms as before, if cd-delay-ms isn't present but using
>>>> mmc_gpiod_request_cd() to request slot-gpio interrupt.
>>>
>>>
>>> Exactly why doesn't the 200 ms delay works?
>>>
>>> It seems like the proper method is instead to use a gpio debouncing
>>> time. mmc-slot-gpio already deals with that, but we are defaulting to
>>> use zero as debounce period, when mmc_gpiod_request_cd() is called
>>> from mmc_of_parse().
>>
>>
>> I noticed we was defauting to use zero there, but that's no key point
>> for me to use another delay. That being said not all platforms support
>> gpio debounce, then gpiod_set_debounce() just returns -ENOTSUPP. So
> 
> Right, because the HW lacks support or because the gpio driver hasn't
> implemented support for it?

yep, on my platforms, the HW lacks support for that.

> 
>> mmc_of_parse uses zero debounce period for mmc_gpiod_request_cd() is
>> fine,otherwise mmc_gpiod_request_cd() should be improved to deal with
>> failure of gpiod_set_debounce().
> 
> Right, that may be an option.
> 
>>
>> How about:
>>
>> mmc_of_parse()
>>     --> mmc_gpiod_request_cd(200ms debounce peroid) {
>>
>>          ...
>>
>>          if (debounce)
>>                  gpiod_set_debounce(desc, debounce);
>>
>>          if (gpio_invert)
>>                  *gpio_invert = !gpiod_is_active_low(desc);
>>
>>          ctx->override_cd_active_level = override_active_level;
>>          ctx->cd_gpio = desc;
>>          /* Software debounce */
>>          ctx->cd_delay_ms =  max_t(unsigned int, debounce, 200);
>>
>>        }
> 
> Huh, not really sure I get the above. Perhaps if you send a proper
> patch instead, it becomes easier.
> 
> However if I understand correctly, you are suggesting to use a 200 ms
> default debounce value - and in case that is succeeded to be set for
> the GPIO, then we don't need the delay when scheduling the detect
> work. No?
> 
> On top of that, you want the debounce value to come from DT?

In case the debounce is passed on from the caller, it means the caller
drivers want it. So we firstly try it by using gpio debounce, but anyway 
we could fall back to use software debounce method, namely
mmc_detect_change(host, msecs_to_jiffies(ctx->cd_delay_ms));

ctx->cd_delay_ms =  max_t(unsigned int, debounce, 200) could make sure
we at least have a basic 200ms delay which keeps consistent with current
code. But a longer delay is better if the caller ask it via debounce
argument.

I will post v2 for that if the above makes sense to you. :)

> 
> Kind regards
> Uffe
> --
> To unsubscribe from this list: send the line "unsubscribe linux-mmc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 
