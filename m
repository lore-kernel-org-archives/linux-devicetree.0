From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v3 3/5] coresight: add support for debug module
Date: Tue, 21 Mar 2017 15:39:23 +0000
Message-ID: <671a0b39-b635-6e0e-d3fa-967651f2e29c@arm.com>
References: <1488520809-31670-1-git-send-email-leo.yan@linaro.org>
 <1488520809-31670-4-git-send-email-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1488520809-31670-4-git-send-email-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Leo Yan <leo.yan@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wei Xu <xuwei5@hisilicon.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, John Stultz <john.stultz@linaro.org>, Guodong Xu <guodong.xu@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, mike.leach@linaro.org
Cc: Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org



On 03/03/17 06:00, Leo Yan wrote:
> Coresight includes debug module and usually the module connects with CPU
> debug logic. ARMv8 architecture reference manual (ARM DDI 0487A.k) has
> description for related info in "Part H: External Debug".
> 
> Chapter H7 "The Sample-based Profiling Extension" introduces several
> sampling registers, e.g. we can check program counter value with
> combined CPU exception level, secure state, etc. So this is helpful for
> analysis CPU lockup scenarios, e.g. if one CPU has run into infinite
> loop with IRQ disabled. In this case the CPU cannot switch context and
> handle any interrupt (including IPIs), as the result it cannot handle
> SMP call for stack dump.
> 
> This patch is to enable coresight debug module, so firstly this driver
> is to bind apb clock for debug module and this is to ensure the debug
> module can be accessed from program or external debugger. And the driver
> uses sample-based registers for debug purpose, e.g. when system detects
> the CPU lockup and trigger panic, the driver will dump program counter
> and combined context registers (EDCIDSR, EDVIDSR); by parsing context
> registers so can quickly get to know CPU secure state, exception level,
> etc.
> 
> Some of the debug module registers are located in CPU power domain, so
> in the driver it has checked the power state for CPU before accessing
> registers within CPU power domain. For most safe way to use this driver,
> it's suggested to disable CPU low power states, this can simply set
> "nohlt" in kernel command line.
> 

I disagree with this approach. One of the main usefulness of such self
hosted debug feature is to debug issues around features like cpuidle.
Adding constraints like "cpuidle needs to be disabled" is not good IMO.
There are ways to make it work with cpuidle enabled. Please explore
them. In particular refer H9.2.39 EDPRCR, External Debug Power/Reset
Control Register.

So, "nohlt" option is not an option. I prefer some sysfs option like
Suzuki suggested to enable this feature on demand if power saving in
normal usecase is the concern. Using "nohlt" just disables idle and
doesn't ensure the debug power domain is ON. Using the flag directly in
this driver to enable debug power domain also sounds misuse of that flag
for me.

-- 
Regards,
Sudeep
