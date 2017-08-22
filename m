From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH V2] spmi: pmic-arb: Enforce the ownership check optionally
Date: Tue, 22 Aug 2017 13:31:32 -0700
Message-ID: <20170822203132.GC21656@codeaurora.org>
References: <1503070110-15018-1-git-send-email-kgunda@codeaurora.org>
 <e0af96c3-208b-abfc-8b2a-4ea1cc810ec7@codeaurora.org>
 <20170822085541.GB3685@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170822085541.GB3685@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kiran Gunda <kgunda-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Abhijeet Dharmapurikar <adharmap-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Collins <collinsd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/22, Shawn Guo wrote:
> On Mon, Aug 21, 2017 at 04:18:58PM -0700, Stephen Boyd wrote:
> > On 08/18/2017 08:28 AM, Kiran Gunda wrote:
> > > The peripheral ownership check is not necessary on single master
> > > platforms. Hence, enforce the peripheral ownership check optionally.
> > >
> > > Signed-off-by: Kiran Gunda <kgunda-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > > Tested-by: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > ---
> > 
> > This sounds like a band-aid. Isn't the gpio driver going to keep probing
> > all the pins that are not supposed to be accessed due to security
> > constraints? What exactly is failing in the gpio case?
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

Hmm. Ok. I guess platform_irq_count() has to go and create irq
mappings if they haven't been created yet and that then causes us
to check if we can even get the interrupt for this particular
irq? There are some interrupt lines that are not routed to the
application processor in the system, so the irq_ee (irq execution
environment) is different. This check is there to avoid creating
flow handlers for irqs that can't be triggered.

I can see how trying to request that irq doesn't make sense,
because it won't ever happen. But preventing that from being
translated is confusing. Perhaps we can move the check for irq_ee
to the irq_request_resources() callback in the irqchip? That way,
we can fail installing the flow handler for the interrupt we
can't ever receive, but otherwise translate the interrupt number
so we can keep counting them.

Also, I see that on v4.13-rc series the read/write checks are
causing the led driver to fail in a different way:

    spmi spmi-0: error: impermissible write to peripheral sid:0 addr:0xc040
    qcom-spmi-gpio 200f000.spmi:pm8916@0:gpios@c000: write 0x40 failed
    leds-gpio soc:leds: Error applying setting, reverse things back
    spmi spmi-0: error: impermissible write to peripheral sid:0 addr:0xc041
    qcom-spmi-gpio 200f000.spmi:pm8916@0:gpios@c000: write 0x41 failed
    leds-gpio: probe of soc:leds failed with error -1 

Are you seeing similar behavior?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
