From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v5 3/5] arm64: arch_timer: Work around QorIQ Erratum
 A-008585
Date: Mon, 19 Sep 2016 17:55:31 +0100
Message-ID: <20160919165531.GB30584@leverpostej>
References: <1473469413-11019-1-git-send-email-oss@buserror.net>
 <1473469413-11019-3-git-send-email-oss@buserror.net>
 <20160912113615.GA20804@leverpostej>
 <20160912114406.GG23211@arm.com>
 <20160912123027.GA13741@leverpostej>
 <20160912125948.GB13899@leverpostej>
 <57D6A88D.7000002@arm.com>
 <1474259505.15220.8.camel@buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1474259505.15220.8.camel-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org, mike.caraman-3arQi8VN3Tc@public.gmane.org, Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Sep 18, 2016 at 11:31:45PM -0500, Scott Wood wrote:
> On Mon, 2016-09-12 at 14:07 +0100, Marc Zyngier wrote:
> > On 12/09/16 13:59, Mark Rutland wrote:
> > > 
> > > On Mon, Sep 12, 2016 at 01:30:28PM +0100, Mark Rutland wrote:
> > > > 
> > > > On Mon, Sep 12, 2016 at 12:44:07PM +0100, Will Deacon wrote:
> > > > > 
> > > > > On Mon, Sep 12, 2016 at 12:36:15PM +0100, Mark Rutland wrote:
> > > > > > 
> > > > > > The changes in arm64's <asm/arch_timer.h> are going to conflict with
> > > > > > some cleanup [1,2] that just landed in the arm64 for-next/core
> > > > > > branch.
> > > > > > 
> > > > > > Could you please rebase atop of that?
> > > > > Well, we should figure out what tree this is going through first.
> > > > > There
> > > > > are a mixture of arm, arm64, driver and dts changes here and not all
> > > > > of it is carrying the appropriate acks for me to queue it.
> > > > Given that mix, I had assumed that this would all go through the arm64
> > > > tree -- I see that Rob has already acked the binding, and I'm happy to
> > > > give my ack for the driver once that's in shape.
> > > Now I see that I'd missed the arch/arm changes in patch 4, which lack a
> > > relevant ack.
> > > 
> > > Given that, I don't know what to suggest.
> > I wouldn't mind delaying patch 4 until it gets acked by RMK, as it
> > doesn't impact the functionality.
> 
> Mark asked me to move that patch before the workaround patch, to avoid ever
> having to add more code that messes with the name.  Should I keep the order as
> is then?

Yes; at this stage I think we have to.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
