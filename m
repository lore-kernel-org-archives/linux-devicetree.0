From: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH 1/3] spmi: pmic-arb: convert to v2 irq interfaces to
 support hierarchical IRQ chips
Date: Fri, 4 Jan 2019 20:45:03 -0500
Message-ID: <20190105014503.GA32383@basecamp>
References: <20181229114755.8711-1-masneyb@onstation.org>
 <20181229114755.8711-2-masneyb@onstation.org>
 <154664792383.15366.9346249356552958882@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <154664792383.15366.9346249356552958882@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: andy.gross@linaro.org, bjorn.andersson@linaro.org, linus.walleij@linaro.org, marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 04, 2019 at 04:25:23PM -0800, Stephen Boyd wrote:
> > +       /*
> > +        * Check to see if the hwirq is already associated with another virq on
> > +        * this IRQ domain. If so, then disassociate it before associating the
> > +        * hwirq with the new virq. IRQs are all initially setup without an IRQ
> > +        * hierarchy when this driver is probed and when mfd/qcom-spmi-pmic.c is
> > +        * probed. Later in the boot process, an IRQ hierarchy is requested by
> > +        * pinctrl-spmi-gpio.c, and the same hwirq is now associated with a new
> > +        * virq.
> 
> Is that because we count the irqs in the pmic gpio driver?

Yes.

The call to devm_of_platform_populate() in drivers/mfd/qcom-spmi-pmic.c
also triggers this condition. I'll experiment with this some more this
weekend.

> Otherwise patch looks good to me. Thanks for working on this. Are you
> going to convert the ssbi master and gpio chip too?

Yes, I will do that work as well once this patch series is accepted.
I currently don't have the hardware to test it, but I'm willing to pick
up a cheap device on ebay. Any suggestions for something that boots a
mainline kernel with the ssbi? It looks like the Sony Xperia Z phone is
one of the supported devices.

Thanks for your review on the other patches. It all makes sense.

Brian
