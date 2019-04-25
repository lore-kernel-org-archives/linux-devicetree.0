From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH v2 05/14] clk: qcom: apcs-msm8916: get parent clock names
 from DT
Date: Thu, 25 Apr 2019 23:42:30 +0200
Message-ID: <5d17334c-ed2f-5112-dba6-72a050bfd1b2@linaro.org>
References: <1548700381-22376-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1548700381-22376-6-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <155085910216.77512.12604271825136479370@swboyd.mtv.corp.google.com>
 <31e17283-c374-f16e-df95-09aaf1854435@linaro.org>
 <155622774551.15276.4140891469702307355@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <155622774551.15276.4140891469702307355@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, andy.gross@linaro.org, arnd@arndb.de, bjorn.andersson@linaro.org, david.brown@linaro.org, enric.balletbo@collabora.com, heiko@sntech.de, horms+renesas@verge.net.au, jagan@amarulasolutions.com, jassisinghbrar@gmail.com, mark.rutland@arm.com, mturquette@baylibre.com, olof@lixom.net, robh+dt@kernel.org, sibis@codeaurora.org, will.deacon@arm.com
Cc: vkoul@kernel.org, niklas.cassel@linaro.org, georgi.djakov@linaro.org, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
List-Id: devicetree@vger.kernel.org

On 4/25/19 23:29, Stephen Boyd wrote:
> Quoting Jorge Ramirez (2019-04-22 04:44:50)
>> On 2/22/19 19:11, Stephen Boyd wrote:
>>> Quoting Jorge Ramirez-Ortiz (2019-01-28 10:32:52)
>>>> @@ -61,6 +65,25 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
>>>>         if (!a53cc)
>>>>                 return -ENOMEM;
>>>>  
>>>> +       /* check if the parent names are present in the device tree */
>>>
>>> This looks odd.
>>>
>>>> +       ret = devm_clk_bulk_get(parent, ARRAY_SIZE(pclks), pclks);
>>>> +       if (ret == -EPROBE_DEFER)
>>>> +               return ret;
>>>
>>> Why can't we use of_clk_parent_fill() if we know this is always a DT
>>> platform?  The parent clks may not be registered at the time of probe?
>>
>> yes, and AFAICS the important thing at this point is that the clock is
>> registered hence the handling of defer.
>>
>> I could use of_clk_parent_fill and then - if needed - call
>> devm_clk_bulk_get but I am not sure of the gains of doing it (wouldnt
>> this just make the code more confusing?)
> 
> Yeah of_clk_parent_fill() isn't the best approach. But it at least keeps
> this driver from using clk consumer APIs?

ok will do that then.

> 
>>
>>
>>> Maybe this series should wait for the parent registration stuff I'm
>>> working on so that this can be made simpler.
>>
>> the need for the clock name is not intrinsic to this driver (the driver
>> itself doesnt use these names) but it just feeds these to the framework.
>>
>> I was looking into your parent registration code and I am not sure how
>> can I use it in this particular driver other than simply removing the
>> names and hoping that things are handled properly at the lower
>> levels.... could you clarify please?
>>
> 
> I think so. I've forgotten the context of this patch, but the general
> idea would be to specify the parents with clock-names or DT index in the
> DT node for the clks registered here and not use of_clk_parent_fill() or
> do any sort of devm_clk_bulk_get() calls. Then the framework will take
> care of finding the parents for the clks and hooking things up properly
> for the parent-child relationship.
> 
> 

ok will try that. thanks for confirming!
