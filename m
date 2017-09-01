From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH V2] spmi: pmic-arb: Enforce the ownership check optionally
Date: Thu, 31 Aug 2017 18:30:48 -0700
Message-ID: <20170901013048.GK21656@codeaurora.org>
References: <e0af96c3-208b-abfc-8b2a-4ea1cc810ec7@codeaurora.org>
 <20170822085541.GB3685@dragon>
 <20170822203132.GC21656@codeaurora.org>
 <20170824121818.GE3685@dragon>
 <20170824183701.GN21656@codeaurora.org>
 <20170825074324.GF3685@dragon>
 <20170825231818.GP21656@codeaurora.org>
 <20170826034636.GG3685@dragon>
 <20170830210203.GS21656@codeaurora.org>
 <20170831083727.GA3787@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170831083727.GA3787@dragon>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Kiran Gunda <kgunda@codeaurora.org>, gregkh@linuxfoundation.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Abhijeet Dharmapurikar <adharmap@codeaurora.org>, David Collins <collinsd@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/31, Shawn Guo wrote:
> On Wed, Aug 30, 2017 at 02:02:03PM -0700, Stephen Boyd wrote:
> > On 08/26, Shawn Guo wrote:
> > > On Fri, Aug 25, 2017 at 04:18:18PM -0700, Stephen Boyd wrote:
> > > > 
> > > > Right. Does the GPIO work? If so, it sounds like the read/write
> > > > access checks in spmi pmic arb don't work properly.
> > > 
> > > The check works.  With the check in there, PM8916 GPIO doesn't work.
> > > However, the consequence is that not only user3 but all GPIO leds under
> > > 'leds' node will fail to register, because any GPIO led's failing on
> > > create_gpio_led() makes leds-gpio driver probe fail as a while.  That's
> > > how leds-gpio driver works.
> > > 
> > > Also, per schematics, PM8916 GPIO1 is indeed routed to user3 LED on
> > > db410c board.  Why do you think apq8016-sbc device tree shouldn't use
> > > the GPIO for that at all?  Isn't it firmware's fault that the ownership
> > > of the peripheral is not properly configured?
> > 
> > If the ownership was not properly configured in the firmware,
> > then I imagine it would mean that we can't control the GPIO for
> > the LED. But that doesn't seem to be true. I can see on my board
> > that I get impermissible write failures on the GPIO when
> > controlling the GPIO brightness, but it doesn't actually matter
> > because the led still lights up. So the checks for write/read
> > permission seem incorrect, or they're not being enforced.
> 
> I'm not sure what is happening on your side.  As I said above, with the
> 4.13-rc series, leds-gpio driver doesn't probe at all, due to the
> impermissible write to PM8916 GPIO in function create_gpio_led(), and
> none of the LEDs lights up on my board.
> 

Yep. I understand all that.

Sorry, I forgot to mention I modified the SPMI PMIC arb code on
v4.13-rc7 to continue even though a permission fault may happen
by deleting the 'return -EPERM' lines. So the LED GPIO driver is
still probing for me, and I see that the GPIOs work regardless of
any permission problems that may have been enforced in the
hardware. I thought the permission checks that the software is
looking at to return EPERM were enforced in hardware, but that
doesn't seem to be the case. That's all I was wondering about.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
