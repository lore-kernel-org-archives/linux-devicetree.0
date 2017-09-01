From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2] spmi: pmic-arb: Enforce the ownership check optionally
Date: Fri, 1 Sep 2017 11:00:51 +0800
Message-ID: <20170901030049.GD3787@dragon>
References: <20170822085541.GB3685@dragon>
 <20170822203132.GC21656@codeaurora.org>
 <20170824121818.GE3685@dragon>
 <20170824183701.GN21656@codeaurora.org>
 <20170825074324.GF3685@dragon>
 <20170825231818.GP21656@codeaurora.org>
 <20170826034636.GG3685@dragon>
 <20170830210203.GS21656@codeaurora.org>
 <20170831083727.GA3787@dragon>
 <20170901013048.GK21656@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170901013048.GK21656-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Kiran Gunda <kgunda-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Abhijeet Dharmapurikar <adharmap-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Collins <collinsd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 31, 2017 at 06:30:48PM -0700, Stephen Boyd wrote:
> On 08/31, Shawn Guo wrote:
> > On Wed, Aug 30, 2017 at 02:02:03PM -0700, Stephen Boyd wrote:
> > > On 08/26, Shawn Guo wrote:
> > > > On Fri, Aug 25, 2017 at 04:18:18PM -0700, Stephen Boyd wrote:
> > > > > 
> > > > > Right. Does the GPIO work? If so, it sounds like the read/write
> > > > > access checks in spmi pmic arb don't work properly.
> > > > 
> > > > The check works.  With the check in there, PM8916 GPIO doesn't work.
> > > > However, the consequence is that not only user3 but all GPIO leds under
> > > > 'leds' node will fail to register, because any GPIO led's failing on
> > > > create_gpio_led() makes leds-gpio driver probe fail as a while.  That's
> > > > how leds-gpio driver works.
> > > > 
> > > > Also, per schematics, PM8916 GPIO1 is indeed routed to user3 LED on
> > > > db410c board.  Why do you think apq8016-sbc device tree shouldn't use
> > > > the GPIO for that at all?  Isn't it firmware's fault that the ownership
> > > > of the peripheral is not properly configured?
> > > 
> > > If the ownership was not properly configured in the firmware,
> > > then I imagine it would mean that we can't control the GPIO for
> > > the LED. But that doesn't seem to be true. I can see on my board
> > > that I get impermissible write failures on the GPIO when
> > > controlling the GPIO brightness, but it doesn't actually matter
> > > because the led still lights up. So the checks for write/read
> > > permission seem incorrect, or they're not being enforced.
> > 
> > I'm not sure what is happening on your side.  As I said above, with the
> > 4.13-rc series, leds-gpio driver doesn't probe at all, due to the
> > impermissible write to PM8916 GPIO in function create_gpio_led(), and
> > none of the LEDs lights up on my board.
> > 
> 
> Yep. I understand all that.
> 
> Sorry, I forgot to mention I modified the SPMI PMIC arb code on
> v4.13-rc7 to continue even though a permission fault may happen
> by deleting the 'return -EPERM' lines. So the LED GPIO driver is
> still probing for me, and I see that the GPIOs work regardless of
> any permission problems that may have been enforced in the
> hardware. I thought the permission checks that the software is
> looking at to return EPERM were enforced in hardware, but that
> doesn't seem to be the case. That's all I was wondering about.

Ah, okay.  You were asking about the check in hardware, while I was
talking about the check in software.  Yes, now we are on the same page:
the permission check in hardware seems not enforced.  That's why LED
works after we merely remove the check in SPMI PMIC arb driver code.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
