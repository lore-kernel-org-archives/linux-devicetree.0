From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 3/3] cpufreq: Add a generic cpufreq-cpu0 driver
Date: Mon, 30 Jul 2012 16:17:53 +0800
Message-ID: <20120730081750.GC31509@S2101-09.ap.freescale.net>
References: <1342713281-31114-1-git-send-email-shawn.guo@linaro.org>
 <1342713281-31114-4-git-send-email-shawn.guo@linaro.org>
 <20120727063334.GC3347@b20223-02.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120727063334.GC3347@b20223-02.ap.freescale.net>
Sender: cpufreq-owner@vger.kernel.org
To: Richard Zhao <richard.zhao@freescale.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Kevin Hilman <khilman@ti.com>, Nishanth Menon <nm@ti.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Mike Turquette <mturquette@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, cpufreq@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 27, 2012 at 02:33:35PM +0800, Richard Zhao wrote:
> > +Generic cpufreq driver for CPU0
> It's going to have generic name if it will become more generic.
> 
I'm not in the position to say that it will become even more generic.

> > +- voltage-tolerance: Specify the CPU voltage tolerance in percentage.
> Why do we have the same tolerance for all points?

Because I haven't seen any case that needs different tolerance for
different operating points.

> I think you can
> either remove tolerance or add it to opps.

I'm not going to remove it, because I have seen potential cpufreq-cpu0
candidates, e.g. omap-cpufreq, need it.  It's also improper to encode
it in operating-points, since OPP library does not have it.

> > +	ret = clk_set_rate(cpu_clk, freqs.new * 1000);
> Check return value and fall back to previous point if it needs?

Right, the voltage should be reverted back if clk_set_rate fails.

> > +	cpu_dev->of_node = np;
> hmm.. sys dev can not set of_node when populate it?

Since the sys dev is not populated from device tree, the of_node is
not set, and we have to do it here on our own.

> And why not do it in module init? 

What's the advantage of doing it in module init over here?

> static u32 max_freq = UINT_MAX / 1000; /* kHz */
> module_param(max_freq, uint, 0);
> MODULE_PARM_DESC(max_freq, "max cpu frequency in unit of kHz");
> 
> It's for debug. Make sense?
> 
It does not look so useful to me, as it never came to me when I was
debugging the driver.

-- 
Regards,
Shawn

