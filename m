From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 1/2] clk: qcom: gcc-msm8960: add child devices support.
Date: Tue, 03 Feb 2015 10:44:05 +0000
Message-ID: <54D0A675.7040801@linaro.org>
References: <1422613004-29802-1-git-send-email-srinivas.kandagatla@linaro.org>	<1422613060-29886-1-git-send-email-srinivas.kandagatla@linaro.org> <CAJAp7Oi_nxEyBZ0bTaQr6d-8sy8M4dFLJxOWCrniX6Pd9+_AGQ@mail.gmail.com> <54CBC82D.2050003@linaro.org> <54CBF4B4.6080208@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54CBF4B4.6080208@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Bjorn Andersson <bjorn@kryo.se>
Cc: Mike Turquette <mturquette@linaro.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, edubezval@gmail.com, nrajan@codeaurora.com, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org



On 30/01/15 21:16, Stephen Boyd wrote:
> On 01/30/15 10:06, Srinivas Kandagatla wrote:
>>
>>
>> On 30/01/15 16:57, Bjorn Andersson wrote:
>>> On Fri, Jan 30, 2015 at 2:17 AM, Srinivas Kandagatla
>>> <srinivas.kandagatla@linaro.org> wrote:
>>>> This patch adds support to add child devices to gcc as some of the
>>>> registers mapped by gcc are used by drivers like thermal sensors.
>>>>
>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>> ---
>>>>    drivers/clk/qcom/gcc-msm8960.c | 10 +++++++++-
>>>>    1 file changed, 9 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/clk/qcom/gcc-msm8960.c
>>>> b/drivers/clk/qcom/gcc-msm8960.c
>>>> index 0cd3e26..3ba77c5 100644
>>>> --- a/drivers/clk/qcom/gcc-msm8960.c
>>>> +++ b/drivers/clk/qcom/gcc-msm8960.c
>>>> @@ -15,6 +15,7 @@
>>>>    #include <linux/bitops.h>
>>>>    #include <linux/err.h>
>>>>    #include <linux/platform_device.h>
>>>> +#include <linux/of_platform.h>
>>>>    #include <linux/module.h>
>>>>    #include <linux/of.h>
>>>>    #include <linux/of_device.h>
>>>> @@ -3658,6 +3659,7 @@ static int gcc_msm8960_probe(struct
>>>> platform_device *pdev)
>>>>           struct clk *clk;
>>>>           struct device *dev = &pdev->dev;
>>>>           const struct of_device_id *match;
>>>> +       int ret;
>>>>
>>>>           match = of_match_device(gcc_msm8960_match_table, &pdev->dev);
>>>>           if (!match)
>>>> @@ -3677,12 +3679,18 @@ static int gcc_msm8960_probe(struct
>>>> platform_device *pdev)
>>>>           if (IS_ERR(clk))
>>>>                   return PTR_ERR(clk);
>>>>
>>>> -       return qcom_cc_probe(pdev, match->data);
>>>> +       ret = qcom_cc_probe(pdev, match->data);
>>>> +       if (ret)
>>>> +               return ret;
>>>> +
>>>> +       return of_platform_populate(pdev->dev.of_node, NULL, NULL,
>>>> &pdev->dev);
>>>
>>> How about calling of_syscon_register() instead? That would give us a
>>> handle to a regmap that can be consumed in e.g. the thermal driver.
>>
>> Two things:
>> - Are you sure, this looks like of_syscon_register() is a static function
>> - gcc node would be required to add "syscon" compatible
>>
>> Unless am missing some patches, Am not sure if going via syscon is
>> right thing here?
>>
>> Stephen Any comments?
>
> I don't understand any of this. We should be making a specific tsens
> device directly in the gcc driver probe and not doing any sort of
> of_platform_populate(). This is what I had, but it probably could be
> done better so that we can assign the struct device's of_node pointer
> before registering on the platform bus.
>
>          platform_device_register_data(&pdev->dev, "tsens8960-tm", -1,
>                          &pdev->dev.of_node, sizeof(&pdev->dev.of_node));
>
Yes this would work too, What are the advantages of doing this way over 
the other? Except the fact that gcc and tsens do not have parent child 
relation in hw p.o.v .

If I get all this correct, we do not want to add a parent child 
hierarchy in DT, but we are Ok doing that inside the gcc driver, that 
seem not correct.

TBH, All this looks bit fiddly, for below reasons
- we re going to have a consolidated bindings for two different drivers 
gcc and tsens.
- Passing of_node as data to other drivers.

On the other hand can't we move a level up and make the common resource 
a syscon node and let both gcc and tsens drivers access it?
Which I think tsens originally attempted doing :-)

??

--srini



> Then if we need to add any properties like #sensor-cells or coefficients
> the tsens driver can use the same of_node that gcc is using.
>
