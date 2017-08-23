From: kgunda@codeaurora.org
Subject: Re: [PATCH V2] spmi: pmic-arb: Enforce the ownership check optionally
Date: Wed, 23 Aug 2017 18:27:22 +0530
Message-ID: <632ae6ac77226ed528dbc50b2ca9ac9f@codeaurora.org>
References: <1503070110-15018-1-git-send-email-kgunda@codeaurora.org>
 <e0af96c3-208b-abfc-8b2a-4ea1cc810ec7@codeaurora.org>
 <20170822085541.GB3685@dragon> <20170822203132.GC21656@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20170822203132.GC21656@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Shawn Guo <shawnguo@kernel.org>, gregkh@linuxfoundation.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Abhijeet Dharmapurikar <adharmap@codeaurora.org>, David Collins <collinsd@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2017-08-23 02:01, Stephen Boyd wrote:
> On 08/22, Shawn Guo wrote:
>> On Mon, Aug 21, 2017 at 04:18:58PM -0700, Stephen Boyd wrote:
>> > On 08/18/2017 08:28 AM, Kiran Gunda wrote:
>> > > The peripheral ownership check is not necessary on single master
>> > > platforms. Hence, enforce the peripheral ownership check optionally.
>> > >
>> > > Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
>> > > Tested-by: Shawn Guo <shawnguo@kernel.org>
>> > > ---
>> >
>> > This sounds like a band-aid. Isn't the gpio driver going to keep probing
>> > all the pins that are not supposed to be accessed due to security
>> > constraints? What exactly is failing in the gpio case?
>> 
>> There is a platform_irq_count() call in pinctrl-spmi-gpio probe
>> function.  Due to the owner check in spmi-pmic-arb IRQ domain
>> qpnpint_irq_domain_dt_translate() function, the call will return irq
>> number as zero and cause pmic_gpio_probe() fail with -EINVAL error.
>> 
>> [    1.608516] [<ffff00000860e51c>] 
>> qpnpint_irq_domain_dt_translate+0x168/0x194
>> [    1.613557] [<ffff000008117040>] 
>> irq_create_fwspec_mapping+0x17c/0x2d8
>> [    1.620672] [<ffff000008117200>] irq_create_of_mapping+0x64/0x74
>> [    1.627008] [<ffff0000087b4fac>] of_irq_get+0x54/0x64
>> [    1.633169] [<ffff00000856b824>] platform_get_irq+0x20/0x150
>> [    1.638117] [<ffff00000856b97c>] platform_irq_count+0x28/0x44
>> [    1.643850] [<ffff0000083cf12c>] pmic_gpio_probe+0x50/0x544
>> 
> 
> Hmm. Ok. I guess platform_irq_count() has to go and create irq
> mappings if they haven't been created yet and that then causes us
> to check if we can even get the interrupt for this particular
> irq? There are some interrupt lines that are not routed to the
> application processor in the system, so the irq_ee (irq execution
> environment) is different. This check is there to avoid creating
> flow handlers for irqs that can't be triggered.
> 
> I can see how trying to request that irq doesn't make sense,
> because it won't ever happen. But preventing that from being
> translated is confusing. Perhaps we can move the check for irq_ee
> to the irq_request_resources() callback in the irqchip? That way,
> we can fail installing the flow handler for the interrupt we
> can't ever receive, but otherwise translate the interrupt number
> so we can keep counting them.
> 
Hi Stephen,
The idea to move the ownership check to irq_request_resources sounds 
good.
I am dropping this patch and sent the new patch to move the irq 
ownership to
irq_request_resource. Following is the patchwork link.

Shawn, can you please give a try with it?
https://patchwork.kernel.org/patch/9917315/

> Also, I see that on v4.13-rc series the read/write checks are
> causing the led driver to fail in a different way:
> 
>     spmi spmi-0: error: impermissible write to peripheral sid:0 
> addr:0xc040
>     qcom-spmi-gpio 200f000.spmi:pm8916@0:gpios@c000: write 0x40 failed
>     leds-gpio soc:leds: Error applying setting, reverse things back
>     spmi spmi-0: error: impermissible write to peripheral sid:0 
> addr:0xc041
>     qcom-spmi-gpio 200f000.spmi:pm8916@0:gpios@c000: write 0x41 failed
>     leds-gpio: probe of soc:leds failed with error -1
> 
> Are you seeing similar behavior?
With the new patch series these errors will go away, as we are removing 
the ownership
checks from the read/write path.
