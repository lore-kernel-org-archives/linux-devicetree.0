From: Abhilash Kesavan <kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/5] arm: exynos: Add MCPM call-back functions
Date: Thu, 17 Apr 2014 00:41:31 +0530
Message-ID: <CAM4voamo5iiOQ5P1JyO8kekU6cuxoj4oAT+VpS14LNvWqw_T4g@mail.gmail.com>
References: <1397239311-27717-1-git-send-email-a.kesavan@samsung.com>
	<1397239311-27717-6-git-send-email-a.kesavan@samsung.com>
	<alpine.LFD.2.11.1404111426510.980@knanqh.ubzr>
	<20140414104116.GA3844@e103592.cambridge.arm.com>
	<alpine.LFD.2.11.1404140956060.980@knanqh.ubzr>
	<20140415083615.GC3596@e103592.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140415083615.GC3596-M5GwZQ6tE7x5pKCnmE3YQBJ8xKzm50AiAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "mark.rutland" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, robh+dt <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas P Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Dave,

On Tue, Apr 15, 2014 at 2:06 PM, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org> wrote:
> On Mon, Apr 14, 2014 at 10:01:27AM -0400, Nicolas Pitre wrote:
>> On Mon, 14 Apr 2014, Dave Martin wrote:
>>
>> > On Fri, Apr 11, 2014 at 04:23:04PM -0400, Nicolas Pitre wrote:
>> > > On Fri, 11 Apr 2014, Abhilash Kesavan wrote:
>> > >
>> > > > Add machine-dependent MCPM call-backs for Exynos5420. These are used
>> > > > to power up/down the secondary CPUs during boot, shutdown, s2r and
>> > > > switching.
>> > > >
>> > > > Signed-off-by: Thomas Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> > > > Signed-off-by: Inderpal Singh <inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> > > > Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> > > > Signed-off-by: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> > >
>> > > See comments inline.
>> >
>> > I won't duplicate Nico's review, but I have a couple of extra comments/
>> > questions, below.
>> >
>> > [...]
>> >
>> > > > diff --git a/arch/arm/mach-exynos/mcpm-exynos.c b/arch/arm/mach-exynos/mcpm-exynos.c
>> > > > new file mode 100644
>> > > > index 0000000..46d4968
>> > > > --- /dev/null
>> > > > +++ b/arch/arm/mach-exynos/mcpm-exynos.c
>> > > > @@ -0,0 +1,444 @@
>> >
>> > [...]
>> >
>> > > > +static void exynos_cluster_power_control(unsigned int cluster, int enable)
>> > > > +{
>> > > > +       unsigned long timeout = jiffies + msecs_to_jiffies(20);
>> > > > +       unsigned int status, val = EXYNOS_CORE_LOCAL_PWR_DIS;
>> > > > +
>> > > > +       if (enable)
>> > > > +               val = EXYNOS_CORE_LOCAL_PWR_EN;
>> > > > +
>> > > > +       status = __raw_readl(EXYNOS_COMMON_STATUS(cluster));
>> > > > +       if ((status & EXYNOS_CORE_LOCAL_PWR_EN) == val)
>> > > > +               return;
>> > > > +
>> > > > +       __raw_writel(val, EXYNOS_COMMON_CONFIGURATION(cluster));
>> > > > +       /* Wait until cluster power control is applied */
>> > > > +       while (time_before(jiffies, timeout)) {
>> > > > +               status = __raw_readl(EXYNOS_COMMON_STATUS(cluster));
>> > > > +
>> > > > +               if ((status & EXYNOS_CORE_LOCAL_PWR_EN) == val)
>> > > > +                       return;
>> > > > +
>> > > > +               cpu_relax();
>> > > > +       }
>> > > > +       pr_warn("timed out waiting for cluster %u to power %s\n", cluster,
>> > > > +               enable ? "on" : "off");
>> > >
>> > > You should not have to wait for the power status to change here.
>> > > Simply signaling the desired state and returning is all that is
>> > > expected.  And because IRQs are turned off, it is likely that
>> > > time_before(jiffies, timeout) will always be true anyway because jiffies
>> > > are not updated if there is no other CPU to service the timer interrupt.
>> > >
>> > > The actual power status should be polled for in the mcpm_finish()
>> > > method only.
>> >

>> > Depending on the power controller, it might be possible for writes to
>> > the controller to be lost or not acted upon, if a previous change is
>> > still pending.
>> >
>> > Does this issue apply to the exynos power controller?
>>
>> Given the way the code is structured now, I suppose that has not been
>> the case so far.
>
> It depends on the purpose of the polling loop.  If it was added to resolve
> a race between a power-up and a power-down that is complete in MCPM but
> still pending in the hardware, than that would suggest the power controller
> does have this behaviour.
>
> But I'm just guessing.
>
> Abhilash, can you comment?
The polling loop in the above function was added to ensure that the
cluster is switched on before we power on the individual cores in
exynos_power_up. This is only required when the first man comes up.

Regards,
Abhilash
>
>> >
>> > If this is the case, it might be necessary to ensure before a power-up
>> > request, that the power controller has caught up and reports the
>> > cluster/CPU as down.  Putting this poll before the write to the
>> > power controller maximises the chance of pipelining useful work
>> > in the meantime.  Putting the poll after the write is the worst case.
>>
>> More useful might be a check on the actual _control_ bit.  If the
>> control bits may be read back then I expect the indicated state will
>> happen even if delayed.
>
> Quite likely, yes.  It just depends on what the hardware specs say.
>
> Cheers
> ---Dave
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
