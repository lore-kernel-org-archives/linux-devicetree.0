From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v10 03/13] drm/mediatek: Add DSI sub driver
Date: Thu, 04 Feb 2016 14:27:07 +0100
Message-ID: <1454592427.3356.24.camel@pengutronix.de>
References: <1454527562-28154-1-git-send-email-p.zabel@pengutronix.de>
	 <1454527562-28154-4-git-send-email-p.zabel@pengutronix.de>
	 <CACvgo528oR23PFbZwfm7RPwTZ6Z2Bv8uc0WHNyyG0SPQypMzDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACvgo528oR23PFbZwfm7RPwTZ6Z2Bv8uc0WHNyyG0SPQypMzDg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Jie Qiu <jie.qiu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Cawa Cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Emil,

Am Donnerstag, den 04.02.2016, 13:09 +0000 schrieb Emil Velikov:
> Hi Philipp,
> 
> On 3 February 2016 at 19:25, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> 
> > diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
> > index 8dad892..b7e0404 100644
> > --- a/drivers/gpu/drm/mediatek/Kconfig
> > +++ b/drivers/gpu/drm/mediatek/Kconfig
> > @@ -3,6 +3,9 @@ config DRM_MEDIATEK
> >         depends on DRM
> >         depends on ARCH_MEDIATEK || (ARM && COMPILE_TEST)
> >         select DRM_KMS_HELPER
> > +       select DRM_MIPI_DSI
> > +       select DRM_PANEL
> 
> > +       select DRM_PANEL_SIMPLE
> Please don't force a particular panel like that. No other driver does
> it, so might as well not start now ?

I'll drop this select on DRM_PANEL_SIMPLE.

thanks
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
