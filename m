From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v5 3/5] arm64: arch_timer: Work around QorIQ Erratum
 A-008585
Date: Tue, 20 Sep 2016 10:35:03 +0100
Message-ID: <20160920093503.GA1045@leverpostej>
References: <1473469413-11019-1-git-send-email-oss@buserror.net>
 <1473469413-11019-3-git-send-email-oss@buserror.net>
 <20160912113615.GA20804@leverpostej>
 <1474260085.15220.17.camel@buserror.net>
 <20160919165258.GA30584@leverpostej>
 <1474304489.4283.6.camel@buserror.net>
 <20160919170707.GC30584@leverpostej>
 <1474312560.4283.10.camel@buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1474312560.4283.10.camel-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org, mike.caraman-3arQi8VN3Tc@public.gmane.org, Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 19, 2016 at 02:16:00PM -0500, Scott Wood wrote:
> On Mon, 2016-09-19 at 18:07 +0100, Mark Rutland wrote:
> > > > Reconsidering my suggestion, I realise this will also affect the MMIO
> > > > timers, so that doesn't work.
> > > > 
> > > > So for the moment, I guess we have to keep fsl_a008585_set_next_event().
> > > What is the problem with MMIO timers?  needs_fsl_a008585_workaround()
> > > should
> > > always be false for them.
> > As suggested, needs_fsl_a008585_workaround() takes no parameter, and
> > set_next_event is called for both cp15/sysreg and MMIO timers. So it
> > would either be true for all, or false for all.
> > 
> > If it's true for all, we'd end up calling fsl_a008585_set_next_event()
> > for the MMIO timers too.
> 
> There should not be any MMIO timers on a system where
> fsl_a008585_set_next_event() returns true.

I'm generally not keen on relying on that.

For reference, are no MMIO timers implemented at all, or are they simply
not listed in the DT today?

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
