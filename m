From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC v2 1/4] dt-bindings: drm/mediatek: Add Mediatek display
 subsystem dts binding
Date: Fri, 02 Oct 2015 16:51:15 +0200
Message-ID: <1443797475.3445.114.camel@pengutronix.de>
References: <1442592722-29004-1-git-send-email-p.zabel@pengutronix.de>
	 <1442592722-29004-2-git-send-email-p.zabel@pengutronix.de>
	 <CAL_JsqLZQXMoKxGZ6c56e6d1UuLiJKzVB=sH15ihTvwpOgSU8Q@mail.gmail.com>
	 <1442823067.3277.35.camel@pengutronix.de>
	 <CAL_JsqLcraiS+Yq48-m-xTksohU5wPSPrjtjV2GLzDTSDcUCUA@mail.gmail.com>
	 <1443689957.3272.18.camel@pengutronix.de>
	 <CAL_Jsq+aBxjvPyAR3nUtXny6JwgcopSCENrBaGzo7OKXFA1cvg@mail.gmail.com>
	 <1443770319.3445.20.camel@pengutronix.de>
	 <CAL_JsqJhoysg=39gsArwmxf3xpzeXeHhxJ7THq4SbVc-NyertQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJhoysg=39gsArwmxf3xpzeXeHhxJ7THq4SbVc-NyertQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Cawa Cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Am Freitag, den 02.10.2015, 09:24 -0500 schrieb Rob Herring:
[...]
> >> > I'll try to bind to this node and have the driver find sibling nodes
> >> > using their compatible strings.
> >>
> >> That doesn't seem like a good choice since there are other functions
> >> in the block. I was thinking one of the display related blocks like
> >> whatever block provides the main crtc functions.
> >
> > Why exactly isn't this a good choice? Since all display function blocks
> > are spread throughout the MMSYS address space, using the mmsys driver to
> > create the DRM/component master platform driver that collects its
> > subdevices sounded logical.
> 
> Given it is a syscon, I was assuming there are other unrelated
> functions. If everything in it is display related, then it would be a
> fine choice.

Oh, ok. Next to the display blocks there's also a similar graph of MDP
("multimedia data path") blocks that can perform memory-to-memory
scaling and rotation that use the same multiplexers and mutex, and the
HDMI encoder controls the FIFO between its parallel output and the HDMI
PHY via (separate) registers in the MMSYS_CONFIG region. Still, I think
these are sufficiently display related.

> > Another candidate would be the mutex node, which can synchronize the
> > configuration updates to the function blocks in the MMSYS region to
> > frame borders.
> >
> > The hardware blocks that most closely correspond to crtc functionality
> > are the two OVL blocks, as Daniel points out. They provide DMA and plane
> > composition. But they are equivalent, and there is no single central
> > node, same as with the two IPUs on i.MX6.
> 
> Just curious, are 2 IPUs represented as 1 or 2 struct drm_device?

One. There's bus multiplexer fabric between the IPU outputs and the
LVDS/HDMI encoders, so it's all connected.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
