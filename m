From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH V2] spmi: pmic-arb: Enforce the ownership check optionally
Date: Thu, 24 Aug 2017 11:37:01 -0700
Message-ID: <20170824183701.GN21656@codeaurora.org>
References: <1503070110-15018-1-git-send-email-kgunda@codeaurora.org>
 <e0af96c3-208b-abfc-8b2a-4ea1cc810ec7@codeaurora.org>
 <20170822085541.GB3685@dragon>
 <20170822203132.GC21656@codeaurora.org>
 <20170824121818.GE3685@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170824121818.GE3685@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kiran Gunda <kgunda-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Abhijeet Dharmapurikar <adharmap-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Collins <collinsd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/24, Shawn Guo wrote:
> On Tue, Aug 22, 2017 at 01:31:32PM -0700, Stephen Boyd wrote:
> > Also, I see that on v4.13-rc series the read/write checks are
> > causing the led driver to fail in a different way:
> > 
> >     spmi spmi-0: error: impermissible write to peripheral sid:0 addr:0xc040
> >     qcom-spmi-gpio 200f000.spmi:pm8916@0:gpios@c000: write 0x40 failed
> >     leds-gpio soc:leds: Error applying setting, reverse things back
> >     spmi spmi-0: error: impermissible write to peripheral sid:0 addr:0xc041
> >     qcom-spmi-gpio 200f000.spmi:pm8916@0:gpios@c000: write 0x41 failed
> >     leds-gpio: probe of soc:leds failed with error -1 
> > 
> > Are you seeing similar behavior?
> 
> Yes.  I forgot to mention that, and leds-gpio failure is gone after
> applying Kiran's patch below.
> 
> spmi: pmic-arb: remove the read/write access checks
> 

Sure. Removing the checks will silence the warnings, but it still
means that we're attempting to configure GPIOs that we shouldn't
be configuring. Is there some sort of default configuration that
gets applied to all pins by default?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
