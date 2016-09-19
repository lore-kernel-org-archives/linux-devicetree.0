From: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v5 3/5] arm64: arch_timer: Work around QorIQ Erratum
 A-008585
Date: Mon, 19 Sep 2016 14:16:00 -0500
Message-ID: <1474312560.4283.10.camel@buserror.net>
References: <1473469413-11019-1-git-send-email-oss@buserror.net>
         <1473469413-11019-3-git-send-email-oss@buserror.net>
         <20160912113615.GA20804@leverpostej>
         <1474260085.15220.17.camel@buserror.net>
         <20160919165258.GA30584@leverpostej> <1474304489.4283.6.camel@buserror.net>
         <20160919170707.GC30584@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160919170707.GC30584@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org, mike.caraman-3arQi8VN3Tc@public.gmane.org, Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2016-09-19 at 18:07 +0100, Mark Rutland wrote:
> On Mon, Sep 19, 2016 at 12:01:29PM -0500, Scott Wood wrote:
> > 
> > On Mon, 2016-09-19 at 17:52 +0100, Mark Rutland wrote:
> > > 
> > > > 
> > > > > 
> > > > > > 
> > > > > > 
> > > > > > +static void fsl_a008585_set_sne(struct clock_event_device *clk)
> > > > > > +{
> > > > > > +#ifdef CONFIG_FSL_ERRATUM_A008585
> > > > > > +	if
> > > > > > (!static_branch_unlikely(&arch_timer_read_ool_enabled))
> > > > > > +		return;
> > > > > > +
> > > > > > +	if (arch_timer_uses_ppi == VIRT_PPI)
> > > > > > +		clk->set_next_event =
> > > > > > fsl_a008585_set_next_event_virt;
> > > > > > +	else
> > > > > > +		clk->set_next_event =
> > > > > > fsl_a008585_set_next_event_phys;
> > > > > > +#endif
> > > > > > +}
> > > > > > +
> > > > > I'm not keen on the magic hook to reset the function pointers, and
> > > > > the
> > > > > additional phys/virt stubs seem pointless. Instead, can we fold this
> > > > > into the existing set_next_event? e.g. have that do:
> > > > > 
> > > > > 	if (needs_fsl_a008585_workaround() {
> > > > > 		fsl_a008585_set_next_event(access, evt, clk);
> > > > > 		return;
> > > > > 	}
> > > > OK.  I had been trying to avoid messing with the standard
> > > > set_next_event,
> > > > but
> > > > it doesn't matter as much now that static branches are being used.  In
> > > > that
> > > > case we can avoid duplicating the ctrl code, and only replace the tval
> > > > write.
> > > Reconsidering my suggestion, I realise this will also affect the MMIO
> > > timers, so that doesn't work.
> > > 
> > > So for the moment, I guess we have to keep fsl_a008585_set_next_event().
> > What is the problem with MMIO timers?  needs_fsl_a008585_workaround()
> > should
> > always be false for them.
> As suggested, needs_fsl_a008585_workaround() takes no parameter, and
> set_next_event is called for both cp15/sysreg and MMIO timers. So it
> would either be true for all, or false for all.
> 
> If it's true for all, we'd end up calling fsl_a008585_set_next_event()
> for the MMIO timers too.

There should not be any MMIO timers on a system where
fsl_a008585_set_next_event() returns true.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
