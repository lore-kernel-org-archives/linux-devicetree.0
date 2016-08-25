From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH V5] clk: bcm: Add driver for BCM53573 ILP clock
Date: Thu, 25 Aug 2016 12:57:10 -0700
Message-ID: <20160825195710.GM19826@codeaurora.org>
References: <20160823061745.8162-1-zajec5@gmail.com>
 <20160823062613.13865-1-zajec5@gmail.com>
 <20160824084738.GB6502@codeaurora.org>
 <CACna6rwB8bPMqZ8Gz5x8WVMeB83T3J=D7dXsDpMO8YdNHFSKaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACna6rwB8bPMqZ8Gz5x8WVMeB83T3J=D7dXsDpMO8YdNHFSKaA@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Anholt <eric@anholt.net>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 08/25, Rafał Miłecki wrote:
> On 24 August 2016 at 10:47, Stephen Boyd <sboyd@codeaurora.org> wrote:
> > On 08/23, Rafał Miłecki wrote:
> >> +     }
> >> +
> >> +     /* Disable measurement to save power */
> >> +     writel(0x0, pmu + PMU_XTAL_FREQ_RATIO);
> >> +
> >> +     avg = sum / num;
> >> +
> >> +     return parent_rate * 4 / avg;
> >> +}
> >> +
> >> +static const struct clk_ops bcm53573_ilp_clk_ops = {
> >> +     .enable = bcm53573_ilp_enable,
> >
> > No disable? Or .is_enabled?
> 
> The beauty of working without datasheets... I'll compare initial reg
> state with one after enabling and see if there is sth obvious.
> 
> 

Ok.

> >
> > Can this be a platform driver instead?
> 
> I guess it can. Should it? It's not clear to me when CLK_OF_DECLARE is
> preferred and when it's not.

We've been taking an approach of using CLK_OF_DECLARE() for clks
that must be registered for timers and interrupt controllers (as
these things are done before the device model is initialized),
and struct drivers otherwise. If the DT node has a mix of
timer/interrupt controller clks and other clks then
CLK_OF_DECLARE_DRIVER() can be used and then we can still have a
builtin driver.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
