From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC v3 0/7] MT8173 DRM support
Date: Thu, 01 Oct 2015 11:53:29 +0200
Message-ID: <1443693209.3272.27.camel@pengutronix.de>
References: <1443627006-15319-1-git-send-email-p.zabel@pengutronix.de>
	 <CAGS+omCnpYxO1A1rAD+x6NURa9YEVBi6qg7sp6K2JWC6wuqaCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGS+omCnpYxO1A1rAD+x6NURa9YEVBi6qg7sp6K2JWC6wuqaCg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cawa Cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jie Qiu <jie.qiu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sasha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Daniel,

Am Donnerstag, den 01.10.2015, 16:55 +0800 schrieb Daniel Kurtz:
[...]
> > CK Hu (3):
> >   dt-bindings: drm/mediatek: Add Mediatek display subsystem dts binding
> >   drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.
> >   drm/mediatek: Add DSI sub driver
> >
> > Daniel Kurtz (1):
> >   drm/mediatek: Add HDMI support
> 
> Thanks for the shout-out, but I really can't take any credit for this patch :-)
> Somewhere along the life of this patch its ownership changed.
> It should probably be Jie Qiu as per its SOB.

Whoops, I'll change the author for this patch as you suggest.

> > Jie Qiu (2):
> >   drm/mediatek: Add DPI sub driver
> >   drm/mediatek: enable hdmi output control bit
> >
> > Philipp Zabel (1):
> >   dt-bindings: drm/mediatek: Add Mediatek HDMI dts binding
> 
> Can you also include the actual mt8173.dtsi (& mt8173-evb.dts) changes
> that use this binding next time?
> This will make it possible to actually build and test the driver.

I'll include the mt8173.dtsi changes next time, but I'm not aware what
needs to be done for mt8173-evb apart from enabling the hdmi node.

best regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
