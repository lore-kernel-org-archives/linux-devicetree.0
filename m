From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] arm64: perf: Correct Cortex-A53/A57 compatible values
Date: Tue, 15 Dec 2015 10:42:43 +0000
Message-ID: <20151215104242.GC9452@arm.com>
References: <1450168400-462-1-git-send-email-geert+renesas@glider.be>
 <20151215103659.GB31299@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151215103659.GB31299@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 15, 2015 at 10:37:00AM +0000, Mark Rutland wrote:
> On Tue, Dec 15, 2015 at 09:33:20AM +0100, Geert Uytterhoeven wrote:
> > Use commas instead of periods.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> 
> Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

Cheers, Mark.

Rob -- do you want to pick this up, or shall I queue it on my perf
branch?

Will

> Mark.
> 
> > ---
> >  Documentation/devicetree/bindings/arm/pmu.txt | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/pmu.txt b/Documentation/devicetree/bindings/arm/pmu.txt
> > index 97ba45af04fc693f..a6cd14888bed9b29 100644
> > --- a/Documentation/devicetree/bindings/arm/pmu.txt
> > +++ b/Documentation/devicetree/bindings/arm/pmu.txt
> > @@ -9,8 +9,8 @@ Required properties:
> >  - compatible : should be one of
> >  	"apm,potenza-pmu"
> >  	"arm,armv8-pmuv3"
> > -	"arm.cortex-a57-pmu"
> > -	"arm.cortex-a53-pmu"
> > +	"arm,cortex-a57-pmu"
> > +	"arm,cortex-a53-pmu"
> >  	"arm,cortex-a17-pmu"
> >  	"arm,cortex-a15-pmu"
> >  	"arm,cortex-a12-pmu"
> > -- 
> > 1.9.1
> > 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
