From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 06/15] drm/sun4i: tcon: Add support for tcon-top
Date: Thu, 31 May 2018 11:21:33 +0200
Message-ID: <20180531092133.3gqepoabvuruiztz@flea.home>
References: <20180519183127.2718-1-jernej.skrabec@siol.net>
 <20180519183127.2718-7-jernej.skrabec@siol.net>
 <20180521080759.rgviuva65ijcfm2e@flea>
 <218132669.UY7RKz0VPx@jernej-laptop>
 <20180524085021.qto6266adjvpj6ai@flea>
 <CAGb2v65whE-qW++cg+gu_o2O1dDdCWkumQB41nt3Aqa75Wp3dg@mail.gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uszjkr6mfqo6r23v"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBKP5X3MAKGQERWULP5A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAGb2v65whE-qW++cg+gu_o2O1dDdCWkumQB41nt3Aqa75Wp3dg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--uszjkr6mfqo6r23v
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Thu, May 24, 2018 at 03:01:09PM -0700, Chen-Yu Tsai wrote:
> >> > > + if (tcon->quirks->needs_tcon_top) {
> >> > > +         struct device_node *np;
> >> > > +
> >> > > +         np = of_parse_phandle(dev->of_node, "allwinner,tcon-top", 0);
> >> > > +         if (np) {
> >> > > +                 struct platform_device *pdev;
> >> > > +
> >> > > +                 pdev = of_find_device_by_node(np);
> >> > > +                 if (pdev)
> >> > > +                         tcon->tcon_top = platform_get_drvdata(pdev);
> >> > > +                 of_node_put(np);
> >> > > +
> >> > > +                 if (!tcon->tcon_top)
> >> > > +                         return -EPROBE_DEFER;
> >> > > +         }
> >> > > + }
> >> > > +
> >> >
> >> > I might have missed it, but I've not seen the bindings additions for
> >> > that property. This shouldn't really be done that way anyway, instead
> >> > of using a direct phandle, you should be using the of-graph, with the
> >> > TCON-top sitting where it belongs in the flow of data.
> >>
> >> Just to answer to the first question, it did describe it in "[PATCH 07/15] dt-
> >> bindings: display: sun4i-drm: Add R40 HDMI pipeline".
> >>
> >> As why I designed it that way - HW representation could be described that way
> >> (ASCII art makes sense when fixed width font is used to view it):
> >>
> >>                             / LCD0/LVDS0
> >>                 / TCON-LCD0
> >>                 |           \ MIPI DSI
> >> mixer0          |
> >>        \        / TCON-LCD1 - LCD1/LVDS1
> >>         TCON-TOP
> >>        /        \ TCON-TV0 - TVE0/RGB
> >> mixer1          |          \
> >>                 |           TCON-TOP - HDMI
> >>                 |          /
> >>                 \ TCON-TV1 - TVE1/RGB
> >>
> >> This is a bit simplified, since there is also TVE-TOP, which is responsible
> >> for sharing 4 DACs between both TVE encoders. You can have two TV outs (PAL/
> >> NTSC) or TVE0 as TV out and TVE1 as RGB or vice versa. It even seems that you
> >> can arbitrarly choose which DAC is responsible for which signal, so there is a
> >> ton of possible end combinations, but I'm not 100% sure.
> >>
> >> Even though I wrote TCON-TOP twice, this is same unit in HW. R40 manual
> >> suggest more possibilities, although some of them seem wrong, like RGB feeding
> >> from LCD TCON. That is confirmed to be wrong when checking BSP code.
> >>
> >> Additionally, TCON-TOP comes in the middle of TVE0 and LCD0, TVE1 and LCD1 for
> >> pin muxing, although I'm not sure why is that needed at all, since according
> >> to R40 datasheet, TVE0 and TVE1 pins are dedicated and not on PORT D and PORT
> >> H, respectively, as TCON-TOP documentation suggest. However, HSYNC and PSYNC
> >> lines might be shared between TVE (when it works in RGB mode) and LCD. But
> >> that is just my guess since I'm not really familiar with RGB and LCD
> >> interfaces.
> >>
> >> I'm really not sure what would be the best representation in OF-graph. Can you
> >> suggest one?
> >
> > Rob might disagree on this one, but I don't see anything wrong with
> > having loops in the graph. If the TCON-TOP can be both the input and
> > output of the TCONs, then so be it, and have it described that way in
> > the graph.
> >
> > The code is already able to filter out nodes that have already been
> > added to the list of devices we need to wait for in the component
> > framework, so that should work as well.
> >
> > And we'd need to describe TVE-TOP as well, even though we don't have a
> > driver for it yet. That will simplify the backward compatibility later
> > on.
> 
> I'm getting the feeling that TCON-TOP / TVE-TOP is the glue layer that
> binds everything together, and provides signal routing, kind of like
> DE-TOP on A64. So the signal mux controls that were originally found
> in TCON0 and TVE0 were moved out.
> 
> The driver needs to know about that, but the graph about doesn't make
> much sense directly. Without looking at the manual, I understand it to
> likely be one mux between the mixers and TCONs, and one between the
> TCON-TVs and HDMI. Would it make more sense to just have the graph
> connections between the muxed components, and remove TCON-TOP from
> it, like we had in the past? A phandle could be used to reference
> the TCON-TOP for mux controls, in addition to the clocks and resets.
> 
> For TVE, we would need something to represent each of the output pins,
> so the device tree can actually describe what kind of signal, be it
> each component of RGB/YUV or composite video, is wanted on each pin,
> if any. This is also needed on the A20 for the Cubietruck, so we can
> describe which pins are tied to the VGA connector, and which one does
> R, G, or B.

I guess we'll see how the DT maintainers feel about this, but my
impression is that the OF graph should model the flow of data between
the devices. If there's a mux somewhere, then the data is definitely
going through it, and as such it should be part of the graph.

Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--uszjkr6mfqo6r23v--
