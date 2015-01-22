From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2 6/9] watchdog: st_wdt: Add new driver for ST's LPC
 Watchdog
Date: Thu, 22 Jan 2015 11:31:45 -0800
Message-ID: <54C15021.4060907@roeck-us.net>
References: <1421927767-28889-1-git-send-email-lee.jones@linaro.org> <1421927767-28889-7-git-send-email-lee.jones@linaro.org> <54C12F10.4090901@roeck-us.net> <20150122172100.GF9129@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150122172100.GF9129@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, david.paris-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/22/2015 09:21 AM, Lee Jones wrote:
> On Thu, 22 Jan 2015, Guenter Roeck wrote:
>
>> On 01/22/2015 03:56 AM, Lee Jones wrote:
>>> Signed-off-by: David Paris <david.paris-qxv4g6HH51o@public.gmane.org>
>>> Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> ---
>>>   drivers/watchdog/Kconfig      |  13 ++
>>>   drivers/watchdog/Makefile     |   1 +
>>>   drivers/watchdog/st_lpc_wdt.c | 335 ++++++++++++++++++++++++++++++++++++++++++
>>>   3 files changed, 349 insertions(+)
>>>   create mode 100644 drivers/watchdog/st_lpc_wdt.c
>
> [...]
>
>>> +struct st_wdog_syscfg {
>>> +	struct regmap *regmap;
>>
>> Hi David & Lee,
>>
>> Why did you add the regmap pointer to this structure and not to st_wdog ?
>> It is not a configuration value, after all, and it is always dereferenced
>> through wt_wdog->syscfg. So all it does is to make the code more complicated.
>>
>> Am I missing something ?
>
> I guess it was just to group it all together, as it will all be used
> at the same time:
>
> 	regmap_update_bits(st_wdog->syscfg->regmap,
> 			   st_wdog->syscfg->reset_type_reg,
> 			   st_wdog->syscfg->reset_type_mask,
> 			   st_wdog->warm_reset);
>
> It really doesn't matter to me either way.
>
Having it in syscfg means it is stored in the static configuration data instead
of the allocated data, which is at least conceptually wrong. So I think it should
be in st_wdog.

Thanks,
Guenter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
