From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v5 3/5] arm64: arch_timer: Work around QorIQ Erratum
 A-008585
Date: Mon, 12 Sep 2016 13:30:28 +0100
Message-ID: <20160912123027.GA13741@leverpostej>
References: <1473469413-11019-1-git-send-email-oss@buserror.net>
 <1473469413-11019-3-git-send-email-oss@buserror.net>
 <20160912113615.GA20804@leverpostej>
 <20160912114406.GG23211@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160912114406.GG23211-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org, mike.caraman-3arQi8VN3Tc@public.gmane.org, Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 12, 2016 at 12:44:07PM +0100, Will Deacon wrote:
> On Mon, Sep 12, 2016 at 12:36:15PM +0100, Mark Rutland wrote:
> > The changes in arm64's <asm/arch_timer.h> are going to conflict with
> > some cleanup [1,2] that just landed in the arm64 for-next/core branch.
> > 
> > Could you please rebase atop of that?
> 
> Well, we should figure out what tree this is going through first. There
> are a mixture of arm, arm64, driver and dts changes here and not all
> of it is carrying the appropriate acks for me to queue it.

Given that mix, I had assumed that this would all go through the arm64
tree -- I see that Rob has already acked the binding, and I'm happy to
give my ack for the driver once that's in shape.

The dts change could go through arm-soc in parallel, I guess. It doesn't
look like arm-soc have been Cc'd for that, though.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
