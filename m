From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v7 5/7] coresight: add support for CPU debug module
Date: Tue, 2 May 2017 17:20:18 +0800
Message-ID: <20170502092018.GB20225@leoy-ThinkPad-T440>
References: <1493713805-26920-1-git-send-email-leo.yan@linaro.org>
 <1493713805-26920-6-git-send-email-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1493713805-26920-6-git-send-email-leo.yan@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wei Xu <xuwei5@hisilicon.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Mike Leach <mike.leach@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

On Tue, May 02, 2017 at 04:30:03PM +0800, Leo Yan wrote:

[...]

> +static void debug_force_cpu_powered_up(struct debug_drvdata *drvdata)
> +{
> +	u32 edprcr;
> +
> +try_again:
> +
> +	/*
> +	 * Send request to power management controller and assert
> +	 * DBGPWRUPREQ signal; if power management controller has
> +	 * sane implementation, it should enable CPU power domain
> +	 * in case CPU is in low power state.
> +	 */
> +	edprcr = readl_relaxed(drvdata->base + EDPRCR);
> +	edprcr |= EDPRCR_COREPURQ;
> +	writel_relaxed(edprcr, drvdata->base + EDPRCR);
> +
> +	/* Wait for CPU to be powered up (timeout~=32ms) */
> +	if (readx_poll_timeout_atomic(readl_relaxed, drvdata->base + EDPRSR,
> +			drvdata->edprsr, (drvdata->edprsr & EDPRSR_PU),
> +			DEBUG_WAIT_SLEEP, DEBUG_WAIT_TIMEOUT)) {
> +		/*
> +		 * Unfortunately the CPU cannot be powered up, so return
> +		 * back and later has no permission to access other
> +		 * registers. For this case, should disable CPU low power
> +		 * states to ensure CPU power domain is enabled!
> +		 */
> +		pr_err("%s: power up request for CPU%d failed\n",
> +			__func__, drvdata->cpu);
> +		return;
> +	}
> +
> +	/*
> +	 * At this point the CPU is powered up, so set the no powerdown
> +	 * request bit so we don't lose power and emulate power down.
> +	 */
> +	edprcr = readl_relaxed(drvdata->base + EDPRCR);
> +	edprcr |= EDPRCR_COREPURQ | EDPRCR_CORENPDRQ;
> +	writel_relaxed(edprcr, drvdata->base + EDPRCR);
> +
> +	drvdata->edprsr = readl_relaxed(drvdata->base + EDPRSR);
> +
> +	/* The core power domain got switched off on use, try again */
> +	if (unlikely(!drvdata->edprsr & EDPRSR_PU))

Here have error introduced by operator priority. Should change to

        if (unlikely(!(drvdata->edprsr & EDPRSR_PU)))

Will send new version soon for this fixing.

> +		goto try_again;
> +}

[...]

Thanks,
Leo Yan
