From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 2/7] watchdog: jz4740: Use devm_* functions
Date: Thu, 28 Dec 2017 12:19:23 -0800
Message-ID: <994187b3-113c-88ef-8ebd-cd57d0c833a0@roeck-us.net>
References: <20171228162939.3928-1-paul@crapouillou.net>
 <20171228162939.3928-3-paul@crapouillou.net>
 <9778afd4-5841-0d48-cde3-c02872623a5f@roeck-us.net>
 <1514491167.6093.0@smtp.crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1514491167.6093.0-nb6JAIIttxhEPksTRSfcJOTW4wlIGRCZ@public.gmane.org>
Content-Language: en-US
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/28/2017 11:59 AM, Paul Cercueil wrote:
> Hi Guenter,
> 
> Le jeu. 28 déc. 2017 à 18:48, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> a écrit :
>> On 12/28/2017 08:29 AM, Paul Cercueil wrote:
>>> - Use devm_clk_get instead of clk_get
>>> - Use devm_watchdog_register_device instead of watchdog_register_device
>>>
>>> Signed-off-by: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
>>> ---
>>>   drivers/watchdog/jz4740_wdt.c | 27 ++++++++-------------------
>>>   1 file changed, 8 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/drivers/watchdog/jz4740_wdt.c b/drivers/watchdog/jz4740_wdt.c
>>> index 6955deb100ef..92d6ca8ceb49 100644
>>> --- a/drivers/watchdog/jz4740_wdt.c
>>> +++ b/drivers/watchdog/jz4740_wdt.c
>>> @@ -178,40 +178,29 @@ static int jz4740_wdt_probe(struct platform_device *pdev)
>>>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>       drvdata->base = devm_ioremap_resource(&pdev->dev, res);
>>> -    if (IS_ERR(drvdata->base)) {
>>> -        ret = PTR_ERR(drvdata->base);
>>> -        goto err_out;
>>> -    }
>>> +    if (IS_ERR(drvdata->base))
>>> +        return PTR_ERR(drvdata->base);
>>>   -    drvdata->rtc_clk = clk_get(&pdev->dev, "rtc");
>>> +    drvdata->rtc_clk = devm_clk_get(&pdev->dev, "rtc");
>>>       if (IS_ERR(drvdata->rtc_clk)) {
>>>           dev_err(&pdev->dev, "cannot find RTC clock\n");
>>> -        ret = PTR_ERR(drvdata->rtc_clk);
>>> -        goto err_out;
>>> +        return PTR_ERR(drvdata->rtc_clk);
>>>       }
>>>   -    ret = watchdog_register_device(&drvdata->wdt);
>>> +    ret = devm_watchdog_register_device(&pdev->dev, &drvdata->wdt);
>>>       if (ret < 0)
>>> -        goto err_disable_clk;
>>> +        return ret;
>>>         platform_set_drvdata(pdev, drvdata);
>>> -    return 0;
>>>   -err_disable_clk:
>>> -    clk_put(drvdata->rtc_clk);
>>> -err_out:
>>> -    return ret;
>>> +    return 0;
>>>   }
>>>     static int jz4740_wdt_remove(struct platform_device *pdev)
>>>   {
>>>       struct jz4740_wdt_drvdata *drvdata = platform_get_drvdata(pdev);
>>>   -    jz4740_wdt_stop(&drvdata->wdt);
>>> -    watchdog_unregister_device(&drvdata->wdt);
>>> -    clk_put(drvdata->rtc_clk);
>>> -
>>> -    return 0;
>>> +    return jz4740_wdt_stop(&drvdata->wdt);
>>
>> If the watchdog is running, the module can not be unloaded. Even if that wasn't
>> the case, this defeats both WDIOF_MAGICCLOSE and watchdog_set_nowayout().
>> Are you sure this is what you want ? If so, please call
>> watchdog_stop_on_unregister() before registration; this clarifies that this
>> is what you want, and you can drop the remove function.
>>
>> Thanks,
>> Guenter
> 
> This patch does not change the behaviour. We always used that driver built-in; what
> should the behaviour be when unloading the module? Keep the watchdog hardware running
> if configured for 'nowayout'?
> 

One can still unload the driver. If you are fine with bypassing/dfeating nowayout
and WDIOF_MAGICCLOSE, may I ask why those are enabled in the first place ?

Thanks,
Guenter
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
