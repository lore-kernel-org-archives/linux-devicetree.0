From: Guo Ren <ren_guo@c-sky.com>
Subject: Re: [PATCH V7 3/8] clocksource: add C-SKY SMP timer
Date: Mon, 1 Oct 2018 08:02:08 +0800
Message-ID: <20181001000207.GA2131@guoren-Inspiron-7460>
References: <9d68bdd87a8c91f4ee35ff4311e273ea81ab9eb4.1538323894.git.ren_guo@c-sky.com>
 <eee964dd57d12bc630280ab84235b5356799b1fb.1538323894.git.ren_guo@c-sky.com>
 <a15b5e43-0721-8638-f5d2-8bb72df87f4d@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a15b5e43-0721-8638-f5d2-8bb72df87f4d@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, anurup.m@huawei.com, Jonathan.Cameron@huawei.com, will.deacon@arm.com, zhangshaokun@hisilicon.com, jhogan@kernel.org, paul.burton@mips.com, peterz@infradead.org, f.fainelli@gmail.com, arnd@arndb.de, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Sep 30, 2018 at 09:22:30PM +0200, Daniel Lezcano wrote:
> On 30/09/2018 18:18, Guo Ren wrote:
> > This timer is used by SMP system and use mfcr/mtcr instruction
> > to access the regs.
> > 
> > Changelog:
> >  - Remove #define CPUHP_AP_CSKY_TIMER_STARTING
> >  - Add CPUHP_AP_CSKY_TIMER_STARTING in cpuhotplug.h
> >  - Support csky mp timer alpha version.
> >  - Just use low-counter with 32bit width as clocksource.
> >  - Coding convention with upstream feed-back.
> > 
> > Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> > ---
> 
> 
> Guo,
> 
> what is the flow of your patches ?
> 
> You sent me a V8 with two patches and those timers which I commented.
> 
> And now there is this V7 with the patches previously sent as V8 without
> the comments take into account.
> 
> I'm a bit lost. Can you clarify ?
Opps ... I should send the "V9 C-SKY(csky) Linux Drivers". It's a wrong
patchset from "V6 C-SKY(csky) Linux Kernel Port".

The patchset didn't include your comment in V8:
 - Add COMIPLE_TEST in Kconfig
 - no cast is needed for "struct clock_event_device *ce = dev"
 - remove: extra space after (u64).

I'm sorry about it, I'll send "V9 C-SKY(csky) Linux Drivers". My fault.

Best Regards
 Guo Ren
