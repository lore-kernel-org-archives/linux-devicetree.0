From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: Re: [PATCH 2/2] arm64: dts: mt8173: add timer node
Date: Thu, 1 Oct 2015 22:50:53 +0800
Message-ID: <1443711053.22188.21.camel@mtksdaap41>
References: <1442369095-1094-1-git-send-email-yingjoe.chen@mediatek.com>
	 <1442369095-1094-2-git-send-email-yingjoe.chen@mediatek.com>
	 <55FAC570.8040307@arm.com> <1442501816.4784.3.camel@mtksdaap41>
	 <20150917164108.GF12808@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20150917164108.GF12808@leverpostej>
Sender: linux-clk-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Sudeep Holla <Sudeep.Holla@arm.com>, James Liao <jamesjj.liao@mediatek.com>, "srv_heupstream@mediatek.com" <srv_heupstream@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Michael Turquette <mturquette@baylibre.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Kurtz <djkurtz@chromium.org>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, linux-arm-kernel@
List-Id: devicetree@vger.kernel.org

On Thu, 2015-09-17 at 17:41 +0100, Mark Rutland wrote:
> On Thu, Sep 17, 2015 at 03:56:56PM +0100, Yingjoe Chen wrote:
> > On Thu, 2015-09-17 at 14:51 +0100, Sudeep Holla wrote:
> > > 
> > > On 16/09/15 03:04, Yingjoe Chen wrote:
> > > > From: Daniel Kurtz <djkurtz@chromium.org>
> > > >
> > > > Add device node to enable GPT timer. This timer will be
> > > > used as sched clock source.
> > > >
> > > 
> > > Interesting any known issues with or advantage over the arch timers
> > > to prefer it as sched clock source. I see even arch timers are present
> > > in DT, hence the question. Or is it just a incorrect commit log ?
> > > 
> > > How does this get selected as sched clock source ? I don't see
> > > sched_clock_register in mtk_timer.c
> > > 
> > > To be clear, I am not against adding this timer support, but just want
> > > to know is it preferred for sched clock source ? if yes why ? better
> > > resolution ?
> > 
> > Hi Sudeep,
> > 
> > Thanks for your review.
> > 
> > I hit the send too soon and missed cover letter, please see:
> > http://lists.infradead.org/pipermail/linux-mediatek/2015-September/002303.html
> > 
> > The main reason to use GPT as sched clock is it won't stop during idle.
> 
> You don't mean sched clock, you just mean a clock_event_device.
> 
> A sched_clock is a high-precision clocksource that is read from (which
> by definition requires the CPUs to be non-idle). It doesn't have
> anything to do with interrupts and therefore cannot wake devices from
> idle.
> 
> While the clock_event_device for the generic timer can't necessarily
> wake CPUs from idle. The generic timer system counter counts even if
> CPUs are idle, so the generic timer is fine as a sched_clock. 

Hi, Mark,

Thanks for your info and sorry for late reply. 

I notice ARM ARM said the arch timer shouldn't stop when idle, but
unfortunately that not true for mt8173. The last CPU enter idle can
choose to enter deep idle mode and the counter value would be lost. Our
firmware backup/recover the counter so it looks like it is stopped.

We will change the firmware to add missing count when back from deep
idle to make it looks like the counter never stop.

Joe.C


