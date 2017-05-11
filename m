From: Suzuki K Poulose <Suzuki.Poulose-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v9 7/9] coresight: add support for CPU debug module
Date: Thu, 11 May 2017 18:40:55 +0100
Message-ID: <b894bca9-b66f-32f5-4dd7-4593fa734701@arm.com>
References: <1494298202-6739-1-git-send-email-leo.yan@linaro.org>
 <1494298202-6739-8-git-send-email-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1494298202-6739-8-git-send-email-leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Leach <mike.leach-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/05/17 03:50, Leo Yan wrote:
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
> uses sample-based registers for debug purpose, e.g. when system triggers
> panic, the driver will dump program counter and combined context
> registers (EDCIDSR, EDVIDSR); by parsing context registers so can
> quickly get to know CPU secure state, exception level, etc.
>
> Some of the debug module registers are located in CPU power domain, so
> this requires the CPU power domain stays on when access related debug
> registers, but the power management for CPU power domain is quite
> dependent on SoC integration for power management. For the platforms
> which with sane power controller implementations, this driver follows
> the method to set EDPRCR to try to pull the CPU out of low power state
> and then set 'no power down request' bit so the CPU has no chance to
> lose power.
>
> If the SoC has not followed up this design well for power management
> controller, the user should use the command line parameter or sysfs
> to constrain all or partial idle states to ensure the CPU power
> domain is enabled and access coresight CPU debug component safely.
>
> Signed-off-by: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

With comments from Mathieu addressed,

Reviewed-by: Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
