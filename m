From: Fenglin Wu <fenglinw@codeaurora.org>
Subject: Re: [PATCH V2] spmi: pmic-arb: Enforce the ownership check optionally
Date: Mon, 28 Aug 2017 16:27:54 +0800
Message-ID: <93b8935e-061f-ba3a-ee36-8ffbc8230bcc@codeaurora.org>
References: <1503070110-15018-1-git-send-email-kgunda@codeaurora.org>
 <e0af96c3-208b-abfc-8b2a-4ea1cc810ec7@codeaurora.org>
 <20170822085541.GB3685@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20170822085541.GB3685@dragon>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Kiran Gunda <kgunda@codeaurora.org>, gregkh@linuxfoundation.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Abhijeet Dharmapurikar <adharmap@codeaurora.org>, David Collins <collinsd@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 8/22/2017 4:55 PM, Shawn Guo wrote:
> On Mon, Aug 21, 2017 at 04:18:58PM -0700, Stephen Boyd wrote:
>> On 08/18/2017 08:28 AM, Kiran Gunda wrote:
>>> The peripheral ownership check is not necessary on single master
>>> platforms. Hence, enforce the peripheral ownership check optionally.
>>>
>>> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
>>> Tested-by: Shawn Guo <shawnguo@kernel.org>
>>> ---
>>
>> This sounds like a band-aid. Isn't the gpio driver going to keep probing
>> all the pins that are not supposed to be accessed due to security
>> constraints? What exactly is failing in the gpio case?
> 
> There is a platform_irq_count() call in pinctrl-spmi-gpio probe
> function.  Due to the owner check in spmi-pmic-arb IRQ domain
> qpnpint_irq_domain_dt_translate() function, the call will return irq
> number as zero and cause pmic_gpio_probe() fail with -EINVAL error.
> 
> [    1.608516] [<ffff00000860e51c>] qpnpint_irq_domain_dt_translate+0x168/0x194
> [    1.613557] [<ffff000008117040>] irq_create_fwspec_mapping+0x17c/0x2d8
> [    1.620672] [<ffff000008117200>] irq_create_of_mapping+0x64/0x74
> [    1.627008] [<ffff0000087b4fac>] of_irq_get+0x54/0x64
> [    1.633169] [<ffff00000856b824>] platform_get_irq+0x20/0x150
> [    1.638117] [<ffff00000856b97c>] platform_irq_count+0x28/0x44
> [    1.643850] [<ffff0000083cf12c>] pmic_gpio_probe+0x50/0x544
> 
> ShawnI just realize this patch is trying to fix this issue from spmi driver
level. Actually I had submitted a change in spmi-gpio driver to fix
this by ignoring the GPIOs which the IRQ is not owned by APPS
processor. The maintainer hasn't reviewed it yet:
https://www.spinics.net/lists/linux-arm-msm/msg28849.html
I am trying to understand if my patch is still needed if Kiran's patch
get merged, the intention for my patch originally is for fixing the same
probe failure, but it could hide the GPIOs which are not allowed to use
from the pinctrl driver level. Please help to suggest.
Thanks

Fenglin

> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
