From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/5] arm: exynos: Add MCPM call-back functions
Date: Mon, 14 Apr 2014 10:01:27 -0400 (EDT)
Message-ID: <alpine.LFD.2.11.1404140956060.980@knanqh.ubzr>
References: <1397239311-27717-1-git-send-email-a.kesavan@samsung.com> <1397239311-27717-6-git-send-email-a.kesavan@samsung.com> <alpine.LFD.2.11.1404111426510.980@knanqh.ubzr> <20140414104116.GA3844@e103592.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140414104116.GA3844-M5GwZQ6tE7x5pKCnmE3YQBJ8xKzm50AiAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>
Cc: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 14 Apr 2014, Dave Martin wrote:

> On Fri, Apr 11, 2014 at 04:23:04PM -0400, Nicolas Pitre wrote:
> > On Fri, 11 Apr 2014, Abhilash Kesavan wrote:
> > 
> > > Add machine-dependent MCPM call-backs for Exynos5420. These are used
> > > to power up/down the secondary CPUs during boot, shutdown, s2r and
> > > switching.
> > > 
> > > Signed-off-by: Thomas Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > > Signed-off-by: Inderpal Singh <inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > > Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > Signed-off-by: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > 
> > See comments inline.
> 
> I won't duplicate Nico's review, but I have a couple of extra comments/
> questions, below.
> 
> [...]
> 
> > > diff --git a/arch/arm/mach-exynos/mcpm-exynos.c b/arch/arm/mach-exynos/mcpm-exynos.c
> > > new file mode 100644
> > > index 0000000..46d4968
> > > --- /dev/null
> > > +++ b/arch/arm/mach-exynos/mcpm-exynos.c
> > > @@ -0,0 +1,444 @@
> 
> [...]
> 
> > > +static void exynos_cluster_power_control(unsigned int cluster, int enable)
> > > +{
> > > +	unsigned long timeout = jiffies + msecs_to_jiffies(20);
> > > +	unsigned int status, val = EXYNOS_CORE_LOCAL_PWR_DIS;
> > > +
> > > +	if (enable)
> > > +		val = EXYNOS_CORE_LOCAL_PWR_EN;
> > > +
> > > +	status = __raw_readl(EXYNOS_COMMON_STATUS(cluster));
> > > +	if ((status & EXYNOS_CORE_LOCAL_PWR_EN) == val)
> > > +		return;
> > > +
> > > +	__raw_writel(val, EXYNOS_COMMON_CONFIGURATION(cluster));
> > > +	/* Wait until cluster power control is applied */
> > > +	while (time_before(jiffies, timeout)) {
> > > +		status = __raw_readl(EXYNOS_COMMON_STATUS(cluster));
> > > +
> > > +		if ((status & EXYNOS_CORE_LOCAL_PWR_EN) == val)
> > > +			return;
> > > +
> > > +		cpu_relax();
> > > +	}
> > > +	pr_warn("timed out waiting for cluster %u to power %s\n", cluster,
> > > +		enable ? "on" : "off");
> > 
> > You should not have to wait for the power status to change here.  
> > Simply signaling the desired state and returning is all that is 
> > expected.  And because IRQs are turned off, it is likely that 
> > time_before(jiffies, timeout) will always be true anyway because jiffies 
> > are not updated if there is no other CPU to service the timer interrupt.
> > 
> > The actual power status should be polled for in the mcpm_finish() 
> > method only.
> 
> Depending on the power controller, it might be possible for writes to
> the controller to be lost or not acted upon, if a previous change is
> still pending.
> 
> Does this issue apply to the exynos power controller?

Given the way the code is structured now, I suppose that has not been 
the case so far.

> 
> If this is the case, it might be necessary to ensure before a power-up
> request, that the power controller has caught up and reports the
> cluster/CPU as down.  Putting this poll before the write to the
> power controller maximises the chance of pipelining useful work
> in the meantime.  Putting the poll after the write is the worst case.

More useful might be a check on the actual _control_ bit.  If the 
control bits may be read back then I expect the indicated state will 
happen even if delayed.


Nicolas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
