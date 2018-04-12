Return-Path: <SRS0=34mX=HB=linaro.org=ulf.hansson@kernel.org>
MIME-Version: 1.0
In-Reply-To: <3600d23a-7a5b-cb31-2f6a-9f7239f26981@rock-chips.com>
References: <1523496031-145755-1-git-send-email-shawn.lin@rock-chips.com>
 <1523496031-145755-2-git-send-email-shawn.lin@rock-chips.com>
 <CAPDyKFoMT90sayR3i783Zybr-O5S9Q2Zp4+DYLNehSQQntdbgw@mail.gmail.com> <3600d23a-7a5b-cb31-2f6a-9f7239f26981@rock-chips.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 12 Apr 2018 09:58:59 +0200
Message-ID: <CAPDyKFrWw-AhON1janB83JA13dxZQz6o6zMg3LBQK2Hv2+Cw_w@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: core: Add tunable delay before detecting card
 after card is inserted
Content-Type: text/plain; charset="UTF-8"
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Rob Herring <robh+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 12 April 2018 at 09:34, Shawn Lin <shawn.lin@rock-chips.com> wrote:
> Hi Ulf,
>
> On 2018/4/12 14:32, Ulf Hansson wrote:
>>
>> On 12 April 2018 at 03:20, Shawn Lin <shawn.lin@rock-chips.com> wrote:
>>>
>>> Allow to use tunable delay before detecting card after card is inserted
>>> either from firmware, or argument passing to mmc_gpiod_request_cd(). The
>>> default value is 200ms as before, if cd-delay-ms isn't present but using
>>> mmc_gpiod_request_cd() to request slot-gpio interrupt.
>>
>>
>> Exactly why doesn't the 200 ms delay works?
>>
>> It seems like the proper method is instead to use a gpio debouncing
>> time. mmc-slot-gpio already deals with that, but we are defaulting to
>> use zero as debounce period, when mmc_gpiod_request_cd() is called
>> from mmc_of_parse().
>
>
> I noticed we was defauting to use zero there, but that's no key point
> for me to use another delay. That being said not all platforms support
> gpio debounce, then gpiod_set_debounce() just returns -ENOTSUPP. So

Right, because the HW lacks support or because the gpio driver hasn't
implemented support for it?

> mmc_of_parse uses zero debounce period for mmc_gpiod_request_cd() is
> fine,otherwise mmc_gpiod_request_cd() should be improved to deal with
> failure of gpiod_set_debounce().

Right, that may be an option.

>
> How about:
>
> mmc_of_parse()
>    --> mmc_gpiod_request_cd(200ms debounce peroid) {
>
>         ...
>
>         if (debounce)
>                 gpiod_set_debounce(desc, debounce);
>
>         if (gpio_invert)
>                 *gpio_invert = !gpiod_is_active_low(desc);
>
>         ctx->override_cd_active_level = override_active_level;
>         ctx->cd_gpio = desc;
>         /* Software debounce */
>         ctx->cd_delay_ms =  max_t(unsigned int, debounce, 200);
>
>       }

Huh, not really sure I get the above. Perhaps if you send a proper
patch instead, it becomes easier.

However if I understand correctly, you are suggesting to use a 200 ms
default debounce value - and in case that is succeeded to be set for
the GPIO, then we don't need the delay when scheduling the detect
work. No?

On top of that, you want the debounce value to come from DT?

Kind regards
Uffe
