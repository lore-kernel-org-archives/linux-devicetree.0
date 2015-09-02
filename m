From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 6/7] MAINTAINERS: Add FDMA driver files to STi section.
Date: Wed, 2 Sep 2015 16:14:50 +0100
Message-ID: <20150902151450.GB15477@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1436371888-27863-1-git-send-email-peter.griffin@linaro.org>
 <1436371888-27863-7-git-send-email-peter.griffin@linaro.org>
 <20150826073351.GU19409@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150826073351.GU19409@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lee,

On Wed, 26 Aug 2015, Lee Jones wrote:

> On Wed, 08 Jul 2015, Peter Griffin wrote:
> 
> > This patch adds the FDMA driver files to the STi
> > section of the maintainers file.
> > 
> > Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  MAINTAINERS | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 8133cef..8cb1ad9 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1503,6 +1503,8 @@ S:	Maintained
> >  F:	arch/arm/mach-sti/
> >  F:	arch/arm/boot/dts/sti*
> >  F:	drivers/clocksource/arm_global_timer.c
> > +F:	drivers/dma/st_fdma.*
> > +F:	drivers/dma/st_fdma_xbar.c
> 
> How about you replace both lines with:
> 
> F:	drivers/dma/st_fdma*

Ok, will fix in next version.

regards,

Peter.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
