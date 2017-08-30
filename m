From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH V2] spmi: pmic-arb: Enforce the ownership check optionally
Date: Wed, 30 Aug 2017 14:02:03 -0700
Message-ID: <20170830210203.GS21656@codeaurora.org>
References: <1503070110-15018-1-git-send-email-kgunda@codeaurora.org>
 <e0af96c3-208b-abfc-8b2a-4ea1cc810ec7@codeaurora.org>
 <20170822085541.GB3685@dragon>
 <20170822203132.GC21656@codeaurora.org>
 <20170824121818.GE3685@dragon>
 <20170824183701.GN21656@codeaurora.org>
 <20170825074324.GF3685@dragon>
 <20170825231818.GP21656@codeaurora.org>
 <20170826034636.GG3685@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170826034636.GG3685@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kiran Gunda <kgunda-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Abhijeet Dharmapurikar <adharmap-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Collins <collinsd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/26, Shawn Guo wrote:
> On Fri, Aug 25, 2017 at 04:18:18PM -0700, Stephen Boyd wrote:
> > 
> > Right. Does the GPIO work? If so, it sounds like the read/write
> > access checks in spmi pmic arb don't work properly.
> 
> The check works.  With the check in there, PM8916 GPIO doesn't work.
> However, the consequence is that not only user3 but all GPIO leds under
> 'leds' node will fail to register, because any GPIO led's failing on
> create_gpio_led() makes leds-gpio driver probe fail as a while.  That's
> how leds-gpio driver works.
> 
> Also, per schematics, PM8916 GPIO1 is indeed routed to user3 LED on
> db410c board.  Why do you think apq8016-sbc device tree shouldn't use
> the GPIO for that at all?  Isn't it firmware's fault that the ownership
> of the peripheral is not properly configured?

If the ownership was not properly configured in the firmware,
then I imagine it would mean that we can't control the GPIO for
the LED. But that doesn't seem to be true. I can see on my board
that I get impermissible write failures on the GPIO when
controlling the GPIO brightness, but it doesn't actually matter
because the led still lights up. So the checks for write/read
permission seem incorrect, or they're not being enforced.

Anyway, I just wanted to make sure the GPIO still works, and it
looks like it does, so removing the permission checks is enough
to make me happy.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
