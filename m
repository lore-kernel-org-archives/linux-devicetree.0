From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 2/9] dmaengine: st_fdma: Add st fdma platform specific header
Date: Tue, 29 Sep 2015 13:10:32 +0200
Message-ID: <1595360.mhtcFfAByg@wuerfel>
References: <1441980871-24475-1-git-send-email-peter.griffin@linaro.org> <2654563.3IzPKrUkAU@wuerfel> <20150929092442.GB16955@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150929092442.GB16955@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 29 September 2015 10:24:42 Peter Griffin wrote:
> On Fri, 11 Sep 2015, Arnd Bergmann wrote:
> 
> > On Friday 11 September 2015 15:14:24 Peter Griffin wrote:
> > > Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
> > > Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > ---
> > >  include/linux/platform_data/dma-st_fdma.h | 72 +++++++++++++++++++++++++++++++
> > >  1 file changed, 72 insertions(+)
> > >  create mode 100644 include/linux/platform_data/dma-st_fdma.h
> > > 
> > 
> > This clearly needs an explanation of which platforms require the header.
> > 
> > On ARM, all new platforms use DT, so it's obviously not one of them.
> 
> I will move the relevant parts into the st_fdma.h header file, as no other platforms
> will be upstreamed that are not DT based.

Ok, it's possible that you can simplify the code a bit after you do that,
e.g. if you can fold the st_fdma_platform_data structure into the main
per-device structure, and if you remove the filter function.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
