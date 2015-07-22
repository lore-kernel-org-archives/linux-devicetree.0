From: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] clk: 88pm800: Add clk provider driver for 88pm800
 family of devices
Date: Wed, 22 Jul 2015 11:57:37 +0530
Message-ID: <55AF37D9.3000006@linaro.org>
References: <1437476823-3358-1-git-send-email-vaibhav.hiremath@linaro.org> <1437476823-3358-4-git-send-email-vaibhav.hiremath@linaro.org> <55AE990E.2040004@codeaurora.org> <55AE9F48.20600@linaro.org> <55AEB103.9010205@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55AEB103.9010205-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Wednesday 22 July 2015 02:22 AM, Stephen Boyd wrote:
> On 07/21/2015 12:36 PM, Vaibhav Hiremath wrote:
>>
>> On Wednesday 22 July 2015 12:40 AM, Stephen Boyd wrote:
>>> On 07/21/2015 04:07 AM, Vaibhav Hiremath wrote:
>>>> +

<snip>

>>>> +static int pm800_clk_remove(struct platform_device *pdev)
>>>> +{
>>>> +    struct pm800_clk *pm800_clks = platform_get_drvdata(pdev);
>>>> +    int i;
>>>> +
>>>> +    of_clk_del_provider(pm800_clks[0].clk_np);
>>>> +    /* Drop the reference obtained in pm800_clk_parse_dt */
>>>> +    of_node_put(pm800_clks[0].clk_np);
>>>
>>> This is odd. Why are we keeping the reference in the driver?
>>>
>>
>> Honestly I do not have any good answer here. I have to admit that it is
>> getting carry forwarded from legacy driver.
>>
>
> Well we shouldn't do things if we don't know why we're doing them.
> Krzysztof?
>

Hold on,
After looking more in to this, it seems we really do not need it.
It is already taken care by

of_clk_add_provider() and
of_clk_del_provider()

Sorry for not investigating this before. Just left out from my eyes
somehow.


Actually I can cleanup clk-s2mps11.c driver as well, but only thing is
I can validate it, as I do not have platform to test it.
It should be trivial changes.

If somebody can help me out in validation I can submit the patch for
clk-s2mps11.c driver as well.

Thanks,
Vaibhav
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
