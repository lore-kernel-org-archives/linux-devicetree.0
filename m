From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v5 6/9] coresight: add support for CPU debug module
Date: Thu, 30 Mar 2017 09:18:39 +0800
Message-ID: <20170330011839.GA939@leoy-linaro>
References: <1490466197-29163-1-git-send-email-leo.yan@linaro.org>
 <1490466197-29163-7-git-send-email-leo.yan@linaro.org>
 <31be033f-514e-e48a-3ba2-a5c5cd477548@arm.com>
 <20170329030735.GA23889@leoy-linaro>
 <CAJ9a7VgsnFYpOGVjD4m7+EjFXkBoRqVR2F2Pgtn-T0NB+YP6tg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJ9a7VgsnFYpOGVjD4m7+EjFXkBoRqVR2F2Pgtn-T0NB+YP6tg@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <Suzuki.Poulose@arm.com>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wei Xu <xuwei5@hisilicon.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Guodong Xu <guodong.xu@linaro.org>, John Stultz <john.stultz@linaro.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, Sudeep Holla <sudee>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 29, 2017 at 04:17:19PM +0100, Mike Leach wrote:

[...]

> >> >+out_powered_up:
> >> >+    debug_os_unlock(drvdata);
> >>
> >> Question: Do we need a matching debug_os_lock() once we are done ?
> >
> > I have checked ARM ARMv8, but there have no detailed description for
> > this. I refered coresight-etmv4 code and Mike's pseudo code, ther have
> > no debug_os_lock() related operations.
> >
> > Mike, Mathieu, could you also help confirm this?
> >
> 
> Debug OS lock / unlock allows the power management code running on the
> core to lock out the external debugger while the debug registers are
> saved/restored during a core power event.
> 
> e.g. A sequence such as this might occur in a correctly programmed system....
> 
> debug_os_lock()
> save_debug_regs() // visible from core power domain - incl breakpoints etc
> save_etm_regs()
> ... // other stuff prior to core power down,
> <power_down_core>
> 
> Followed by...
> 
> <power_up_core>
> restore_etm_regs()
> restore_debug_regs() // visible from core power domain - incl breakpoints etc
> debug_os_unlock()
> 
> The value is 1 (locked) if cold resetting into AArch64 - it is
> expected that some system software will set this to 0 as part of the
> boot process.
> The lock prevents write access to the external debug registers so we
> need to clear it to set up the external debug registers we are using.

This description is conflict with upper restoring flows. During
restore_debug_regs(), the os lock is locked so how it can write
external debug register to restore context?

> This suggests that it should be restored as we found it when done.

Thanks,
Leo Yan
