From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 2/2] arm64: dts: mt8173: add timer node
Date: Thu, 17 Sep 2015 17:41:09 +0100
Message-ID: <20150917164108.GF12808@leverpostej>
References: <1442369095-1094-1-git-send-email-yingjoe.chen@mediatek.com>
 <1442369095-1094-2-git-send-email-yingjoe.chen@mediatek.com>
 <55FAC570.8040307@arm.com>
 <1442501816.4784.3.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1442501816.4784.3.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: Sudeep Holla <Sudeep.Holla@arm.com>, James Liao <jamesjj.liao@mediatek.com>, "srv_heupstream@mediatek.com" <srv_heupstream@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Michael Turquette <mturquette@baylibre.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Kurtz <djkurtz@chromium.org>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, linux-arm-kernel@li
List-Id: devicetree@vger.kernel.org

On Thu, Sep 17, 2015 at 03:56:56PM +0100, Yingjoe Chen wrote:
> On Thu, 2015-09-17 at 14:51 +0100, Sudeep Holla wrote:
> > 
> > On 16/09/15 03:04, Yingjoe Chen wrote:
> > > From: Daniel Kurtz <djkurtz@chromium.org>
> > >
> > > Add device node to enable GPT timer. This timer will be
> > > used as sched clock source.
> > >
> > 
> > Interesting any known issues with or advantage over the arch timers
> > to prefer it as sched clock source. I see even arch timers are present
> > in DT, hence the question. Or is it just a incorrect commit log ?
> > 
> > How does this get selected as sched clock source ? I don't see
> > sched_clock_register in mtk_timer.c
> > 
> > To be clear, I am not against adding this timer support, but just want
> > to know is it preferred for sched clock source ? if yes why ? better
> > resolution ?
> 
> Hi Sudeep,
> 
> Thanks for your review.
> 
> I hit the send too soon and missed cover letter, please see:
> http://lists.infradead.org/pipermail/linux-mediatek/2015-September/002303.html
> 
> The main reason to use GPT as sched clock is it won't stop during idle.

You don't mean sched clock, you just mean a clock_event_device.

A sched_clock is a high-precision clocksource that is read from (which
by definition requires the CPUs to be non-idle). It doesn't have
anything to do with interrupts and therefore cannot wake devices from
idle.

While the clock_event_device for the generic timer can't necessarily
wake CPUs from idle. The generic timer system counter counts even if
CPUs are idle, so the generic timer is fine as a sched_clock. 

Thanks,
Mark.
