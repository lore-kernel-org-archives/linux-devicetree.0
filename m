From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC v2 4/4] drm/mediatek: Add DRM-based framebuffer device
Date: Tue, 22 Sep 2015 12:35:14 +0200
Message-ID: <1442918114.3128.19.camel@pengutronix.de>
References: <1442592722-29004-1-git-send-email-p.zabel@pengutronix.de>
	 <1442592722-29004-5-git-send-email-p.zabel@pengutronix.de>
	 <20150922092951.GD3383@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150922092951.GD3383-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Cawa Cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Daniel,

Am Dienstag, den 22.09.2015, 11:29 +0200 schrieb Daniel Vetter:
> > diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
> > index 5343cf1..fa581fb 100644
> > --- a/drivers/gpu/drm/mediatek/Kconfig
> > +++ b/drivers/gpu/drm/mediatek/Kconfig
> > @@ -14,3 +14,15 @@ config DRM_MEDIATEK
> >  	  This driver provides kernel mode setting and
> >  	  buffer management to userspace.
> >  
> > +config DRM_MEDIATEK_FBDEV
> > +	bool "Enable legacy fbdev support for Mediatek DRM"
> > +	depends on DRM_MEDIATEK
> > +	select FB_SYS_FILLRECT
> > +	select FB_SYS_COPYAREA
> > +	select FB_SYS_IMAGEBLIT
> > +	select DRM_KMS_FB_HELPER
> > +	help
> > +	  Choose this option if you have a need for the legacy
> > +	  fbdev support.  Note that this support also provides
> > +	  the Linux console on top of the Mediatek DRM mode
> > +	  setting driver.
> 
> With the new Kconfig for fbdev emulation in 4.3 and the module option to
> disable it queued up for 4.4 driver-private Kconfig entries for fbdev
> aren't needed any more.
> -Daniel

I'll drop it for the next patch submission, thanks.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
