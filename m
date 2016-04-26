From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 01/18] dmaengine: st_fdma: Add STMicroelectronics FDMA DT
 binding documentation
Date: Tue, 26 Apr 2016 13:00:04 +0100
Message-ID: <20160426120004.GC5457@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1461236675-10176-1-git-send-email-peter.griffin@linaro.org>
 <1461236675-10176-2-git-send-email-peter.griffin@linaro.org>
 <3920014.LnOL9gjB2a@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3920014.LnOL9gjB2a@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Thu, 21 Apr 2016, Arnd Bergmann wrote:

> On Thursday 21 April 2016 12:04:18 Peter Griffin wrote:
> > +- clocks       : Must contain an entry for each name in clock-names
> > +- clock-names  : Must contain "fdma_slim, fdma_hi, fdma_low, fdma_ic" entries
> > +See: Documentation/devicetree/bindings/clock/clock-bindings.txt
> 
> The fdma_ prefix for the clock names is redundant, just make these
> "slim", "hi", "low", and "ic".

Ok will fix in v4.

Peter.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
