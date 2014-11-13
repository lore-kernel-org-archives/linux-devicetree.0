From: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/7] dmaengine: at_xdmac: prefer usage of
 readl/writel_relaxed
Date: Thu, 13 Nov 2014 16:45:51 +0100
Message-ID: <20141113154551.GV3639@ldesroches-Latitude-E6320>
References: <1415875965-6905-1-git-send-email-ludovic.desroches@atmel.com>
 <1415875965-6905-2-git-send-email-ludovic.desroches@atmel.com>
 <2791155.z0l2TZezWO@wuerfel>
 <20141113153449.GO24582@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141113153449.GO24582-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 13, 2014 at 09:04:49PM +0530, Vinod Koul wrote:
> On Thu, Nov 13, 2014 at 12:01:49PM +0100, Arnd Bergmann wrote:
> > On Thursday 13 November 2014 11:52:39 Ludovic Desroches wrote:
> > > _relaxed version of readl and writel are not implemented on all
> > > architecture so COMPILE_TEST has to be removed in order to not cause
> > > some build failures.
> > > 
> > > Signed-off-by: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> > > ---
> > > 
> > 
> > I've queued up Will Deacon's series to enable the relaxed accessors
> > on all architectures, so the Kconfig change should no longer
> > be required in 3.19.
> And why is _relaxed() version required for thsi driver. Why cant readl(),
> writel() with barriers do?

Required not but preferred to my mind. I don't need a barrier for all
read and write I am performing. Barriers have been added when needed.

When you have fixed my code because of the compilation breakage on other
architecture, you only change the read and write macros. Currently, there are
some redundancies because of the barriers added in the code.

To be honest, I have no idea about the performance impact between the
use of read/write and read/write_relaxed. Then two choices:
- go back to relaxed version, good new can keep COMPILE_TEST thanks to
  Will Deacon
- remove barrier since they are no more needed if using readl/writel


Ludovic

> 
> -- 
> ~Vinod
> 
> --
> To unsubscribe from this list: send the line "unsubscribe dmaengine" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
