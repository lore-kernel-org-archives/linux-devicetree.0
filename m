From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2] spmi: pmic-arb: Enforce the ownership check optionally
Date: Mon, 28 Aug 2017 22:47:20 +0800
Message-ID: <20170828144718.GD3525@dragon>
References: <1503070110-15018-1-git-send-email-kgunda@codeaurora.org>
 <e0af96c3-208b-abfc-8b2a-4ea1cc810ec7@codeaurora.org>
 <20170822085541.GB3685@dragon>
 <93b8935e-061f-ba3a-ee36-8ffbc8230bcc@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <93b8935e-061f-ba3a-ee36-8ffbc8230bcc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fenglin Wu <fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kiran Gunda <kgunda-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Abhijeet Dharmapurikar <adharmap-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Collins <collinsd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 28, 2017 at 04:27:54PM +0800, Fenglin Wu wrote:
> On 8/22/2017 4:55 PM, Shawn Guo wrote:
> >On Mon, Aug 21, 2017 at 04:18:58PM -0700, Stephen Boyd wrote:
> >>On 08/18/2017 08:28 AM, Kiran Gunda wrote:
> >>>The peripheral ownership check is not necessary on single master
> >>>platforms. Hence, enforce the peripheral ownership check optionally.
> >>>
> >>>Signed-off-by: Kiran Gunda <kgunda-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> >>>Tested-by: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >>>---
> >>
> >>This sounds like a band-aid. Isn't the gpio driver going to keep probing
> >>all the pins that are not supposed to be accessed due to security
> >>constraints? What exactly is failing in the gpio case?
> >
> >There is a platform_irq_count() call in pinctrl-spmi-gpio probe
> >function.  Due to the owner check in spmi-pmic-arb IRQ domain
> >qpnpint_irq_domain_dt_translate() function, the call will return irq
> >number as zero and cause pmic_gpio_probe() fail with -EINVAL error.
> >
> >[    1.608516] [<ffff00000860e51c>] qpnpint_irq_domain_dt_translate+0x168/0x194
> >[    1.613557] [<ffff000008117040>] irq_create_fwspec_mapping+0x17c/0x2d8
> >[    1.620672] [<ffff000008117200>] irq_create_of_mapping+0x64/0x74
> >[    1.627008] [<ffff0000087b4fac>] of_irq_get+0x54/0x64
> >[    1.633169] [<ffff00000856b824>] platform_get_irq+0x20/0x150
> >[    1.638117] [<ffff00000856b97c>] platform_irq_count+0x28/0x44
> >[    1.643850] [<ffff0000083cf12c>] pmic_gpio_probe+0x50/0x544
> >
> >ShawnI just realize this patch is trying to fix this issue from spmi driver
> level. Actually I had submitted a change in spmi-gpio driver to fix
> this by ignoring the GPIOs which the IRQ is not owned by APPS
> processor. The maintainer hasn't reviewed it yet:
> https://www.spinics.net/lists/linux-arm-msm/msg28849.html
> I am trying to understand if my patch is still needed if Kiran's patch
> get merged, the intention for my patch originally is for fixing the same
> probe failure, but it could hide the GPIOs which are not allowed to use
> from the pinctrl driver level. Please help to suggest.

As I just replied to Greg, this patch is obsolete and replaced by 'spmi:
pmic-arb: Move the ownership check to irq_chip callback' [1].

With the patch applied, we can get rid of the spmi-gpio probe failure.
So from the point of fixing the issue, your patch is not needed.  But I
would like to discuss your patch a bit, and will reply to your patch
with my comments.

Shawn

[1] https://lkml.org/lkml/2017/8/23/325
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
