From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC v4 05/11] dt-bindings: drm/mediatek: Add Mediatek HDMI dts
 binding
Date: Wed, 28 Oct 2015 18:50:23 +0100
Message-ID: <1446054623.7190.5.camel@pengutronix.de>
References: <1445026333-17013-1-git-send-email-p.zabel@pengutronix.de>
	 <1445026333-17013-6-git-send-email-p.zabel@pengutronix.de>
	 <CAL_JsqJkhbvTSMzyKb=3d3301VLRmuAf-UchWyf236c3VOdiQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJkhbvTSMzyKb=3d3301VLRmuAf-UchWyf236c3VOdiQA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cawa Cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jie Qiu <jie.qiu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

thank you for the comments.

Am Freitag, den 23.10.2015, 07:29 -0500 schrieb Rob Herring:
[...]
> > +Mediatek HDMI Encoder
> > +=====================
> > +
> > +The Mediatek HDMI encoder can generate HDMI 1.4a or MHL 2.0 signals from
> > +its parallel input.
> 
> How do you know whether it is HDMI or MHL on a given board? You should
> have a connector node perhaps.

Sounds sensible. I haven't really thought about MHL, my test board has a
slimport bridge. For HDMI we already have the "hdmi-connector"
compatible. I suppose for MHL we'd have to add a new "usb-connector"?

> > +
> > +Required properties:
> > +- compatible: Should be "mediatek,<chip>-hdmi".
> > +- reg: Physical base address and length of the controller's registers
> > +- interrupts: The interrupt signal from the function block.
> > +- clocks: device clocks
> > +  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> > +- clock-names: must contain "pixel", "pll", "bclk", and "spdif".
> > +- mediatek,cec: phandle link to the HDMI CEC node.
> 
> Do you have more than 1 CEC block? If not, just find the compatible
> node with of_find_compatible_node.

MT8173 only has one CEC block, so I will drop this property again.

> > +- ddc-i2c-bus: phandle link to the I2C controller used for DDC EDID probing
> 
> This really should be part of a connector node as I2C bus goes to the
> connector, not the HDMI block.

So I should add that as an optional property to the hdmi-connector
binding. I'll have to check how DDC is handled for MHL.

[...]
> > +HDMI PHY
> > +========
> > +
> > +The HDMI PHY serializes the HDMI encoder's three channel 10-bit parallel
> > +output and drives the HDMI pads.
> > +
> > +Required properties:
[...]
> > +
> > +Optional properties:
> > +- ibias: TX DRV bias current for <1.65Gbps, defaults to 0xa
> > +- ibias_up: TX DRV bias current for >1.65Gbps, defaults to 0x1c
> 
> prefix with "mediatek,"

Will do.

regards
Philipp


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
