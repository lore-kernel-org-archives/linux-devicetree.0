From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCHv2 3/5] clk: s2mps11: Add the support for S2MPS13 PMIC clock
Date: Mon, 24 Nov 2014 18:00:50 +0900
Message-ID: <5472F3C2.4030907@samsung.com>
References: <1416301183-10478-1-git-send-email-cw00.choi@samsung.com>
 <1416301183-10478-4-git-send-email-cw00.choi@samsung.com>
 <20141118215926.25314.90810@quantum> <20141119164310.GH1875@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20141119164310.GH1875@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, geunsik.lim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Lee,

Could you please apply this patchset on your tree
or Do we wait the Ack from RTC mainatiner for patch 4?

Best Regards,
Chanwoo Choi

On 11/20/2014 01:43 AM, Lee Jones wrote:
> On Tue, 18 Nov 2014, Mike Turquette wrote:
> 
>> Quoting Chanwoo Choi (2014-11-18 00:59:41)
>>> This patch adds the support for S2MPS13 PMIC clock which is same with existing
>>> S2MPS14 RTC IP. But, S2MPS13 uses all of clocks (32khz_{ap|bt|cp}).
>>>
>>> Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> Reviewed-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>
>> Applied to clk-next.
> 
> I'm pretty sure you can't do that.  You have a dependency on
> linux/mfd/samsung/s2mps13.h, which is satisfied in one of the earlier
> patches in the set.  If you'd care to just provide an Ack for this
> patch, I can send you a pull-request with the decencies met.
> 
>>> ---
>>>  drivers/clk/clk-s2mps11.c | 24 ++++++++++++++++++++++++
>>>  1 file changed, 24 insertions(+)
>>>
>>> diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
>>> index b7797fb..7bb13af 100644
>>> --- a/drivers/clk/clk-s2mps11.c
>>> +++ b/drivers/clk/clk-s2mps11.c
>>> @@ -23,6 +23,7 @@
>>>  #include <linux/clk-provider.h>
>>>  #include <linux/platform_device.h>
>>>  #include <linux/mfd/samsung/s2mps11.h>
>>> +#include <linux/mfd/samsung/s2mps13.h>
>>>  #include <linux/mfd/samsung/s2mps14.h>
>>>  #include <linux/mfd/samsung/s5m8767.h>
>>>  #include <linux/mfd/samsung/core.h>
>>> @@ -120,6 +121,24 @@ static struct clk_init_data s2mps11_clks_init[S2MPS11_CLKS_NUM] = {
>>>         },
>>>  };
>>>  
>>> +static struct clk_init_data s2mps13_clks_init[S2MPS11_CLKS_NUM] = {
>>> +       [S2MPS11_CLK_AP] = {
>>> +               .name = "s2mps13_ap",
>>> +               .ops = &s2mps11_clk_ops,
>>> +               .flags = CLK_IS_ROOT,
>>> +       },
>>> +       [S2MPS11_CLK_CP] = {
>>> +               .name = "s2mps13_cp",
>>> +               .ops = &s2mps11_clk_ops,
>>> +               .flags = CLK_IS_ROOT,
>>> +       },
>>> +       [S2MPS11_CLK_BT] = {
>>> +               .name = "s2mps13_bt",
>>> +               .ops = &s2mps11_clk_ops,
>>> +               .flags = CLK_IS_ROOT,
>>> +       },
>>> +};
>>> +
>>>  static struct clk_init_data s2mps14_clks_init[S2MPS11_CLKS_NUM] = {
>>>         [S2MPS11_CLK_AP] = {
>>>                 .name = "s2mps14_ap",
>>> @@ -184,6 +203,10 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
>>>                 s2mps11_reg = S2MPS11_REG_RTC_CTRL;
>>>                 clks_init = s2mps11_clks_init;
>>>                 break;
>>> +       case S2MPS13X:
>>> +               s2mps11_reg = S2MPS13_REG_RTCCTRL;
>>> +               clks_init = s2mps13_clks_init;
>>> +               break;
>>>         case S2MPS14X:
>>>                 s2mps11_reg = S2MPS14_REG_RTCCTRL;
>>>                 clks_init = s2mps14_clks_init;
>>> @@ -279,6 +302,7 @@ static int s2mps11_clk_remove(struct platform_device *pdev)
>>>  
>>>  static const struct platform_device_id s2mps11_clk_id[] = {
>>>         { "s2mps11-clk", S2MPS11X},
>>> +       { "s2mps13-clk", S2MPS13X},
>>>         { "s2mps14-clk", S2MPS14X},
>>>         { "s5m8767-clk", S5M8767X},
>>>         { },
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
