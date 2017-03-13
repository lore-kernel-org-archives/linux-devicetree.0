From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [v3 3/5] coresight: add support for debug module
Date: Mon, 13 Mar 2017 16:12:14 +0800
Message-ID: <20170313081214.GC22706@leoy-linaro>
References: <1488520809-31670-4-git-send-email-leo.yan@linaro.org>
 <011fdac0-59bf-b539-2de3-0b59a41bc922@arm.com>
 <20170309175915.GA964@leoy-linaro>
 <3f27efee-3b63-81fd-eb96-73fd7e6f5e92@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3f27efee-3b63-81fd-eb96-73fd7e6f5e92-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Suzuki K Poulose <Suzuki.Poulose-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mike.leach-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Suzuki,

On Fri, Mar 10, 2017 at 02:29:53PM +0000, Suzuki K Poulose wrote:

[...]

> >>So we cannot really rely on the values in EDVIDSR which we use to make further decisions. So I
> >>am wondering if this is really guranteed to be useful.
> >
> >So this is caused by Software lock is locked?
> >
> >Section H8.4.1:
> >
> >"Reads and writes have no side-effects. A side-effect is where a
> >direct read or a direct write of a register creates
> >an indirect write of the same or another register. When the Software
> >Lock is locked, the indirect write does
> >not occur."
> 
> Yes, thats correct, further :
> 
> Section H9.2.32: EDPCSR
> 
> "For a read of EDPCSRlo from the memory-mapped interface, if EDLSR.SLK == 1, meaning
> the Software Lock is locked, then the access has no side-effects. That is, EDCIDSR,
> EDVIDSR, and EDPCSRhi are unchanged."
> 
> And since we do a CS_UNLOCK, that should be fine. Please ignore my comment.

Thanks a lot for confirmation.

[...]

> >>>+
> >>>+	put_online_cpus();
> >>>+
> >>>+	if (!debug_count++)
> >>>+		atomic_notifier_chain_register(&panic_notifier_list,
> >>>+					       &debug_notifier);
> >>>+
> >>
> >>>+	sprintf(buf, (char *)id->data, drvdata->cpu);
> >>>+	dev_info(dev, "%s initialized\n", buf);
> >>
> >>This could simply be :
> >>	dev_info(dev, "Coresight debug-CPU%d initialized\n", drvdata->cpu);
> >>
> >>and get rid of the static string and the buffer, see below.
> 
> Also we need pm_runtime_put() here to balance the pm_runtime_get_ from AMBA
> device probe. More on that below.

[...]

> Btw, I don't see any PM calls to make sure the power domain (at least the debug domain)
> is up, which could cause problems with accesses to some of these registers (leave alone the
> ones in CPU power domain), especially the EDPRSR. We could also do pm_runtime_get on the
> CPU's power domain, if the CPU is online, before we access the pcsr.

I will add pm_runtime_get/pm_runtime_put for apb clock.

But for CPU power domain, AFAIK this part is managed by PSCI but is not
controlled by pm_runtime_{put|get} pairs. So at beginning, we suggest
to use "nohlt" to ensure CPU power domain is enabled.

Please let me know if I miss some thing for this?

Thanks,
Leo Yan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
