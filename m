From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: allwinner: a64: enable ANX6345 bridge
 on Teres-I
Date: Fri, 12 Jul 2019 22:15:43 +0200
Message-ID: <20190712201543.krhsfjepd3cqndla@flea>
References: <20190607094030.GA12373@lst.de>
 <66707fcc-b48e-02d3-5ed7-6b7e77d53266@samsung.com>
 <20190612152022.c3cfhp4cauhzhfyr@flea>
 <bb2c2c00-b46e-1984-088f-861ac8952331@samsung.com>
 <20190701095842.fvganvycce2cy7jn@flea>
 <CA+E=qVdsYV2Bxk245=Myq=otd7-7WHzUnSJN8_1dciAzvSOG8g@mail.gmail.com>
 <20190709085532.cdqv7whuesrjs64c@flea>
 <CA+E=qVdz4vfU3rtTTKjYdM+4UA+=FWheJfWOMaDtFMnWQ1rHbw@mail.gmail.com>
 <20190710114042.ybgavnxb4hgqrtor@flea>
 <CA+E=qVdFoT137pADfxz3uMwhOqjqrA9+6hBeOfbJxuH-M-3Pjw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+E=qVdFoT137pADfxz3uMwhOqjqrA9+6hBeOfbJxuH-M-3Pjw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Torsten Duwe <duwe@lst.de>, Harald Geyer <harald@ccbib.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Icenowy Zheng <icenowy@aosc.io>, Sean Paul <seanpaul@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>, arm-linux <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 10, 2019 at 03:11:04PM -0700, Vasily Khoruzhick wrote:
> On Wed, Jul 10, 2019 at 4:40 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > > > > There's another issue: if we introduce edp-connector we'll have to
> > > > > specify power up delays somewhere (in dts? or in platform driver?), so
> > > > > edp-connector doesn't really solve the issue of multiple panels with
> > > > > same motherboard.
> > > >
> > > > And that's what that compatible is about :)
> > >
> > > Sorry, I fail to see how it would be different from using existing
> > > panels infrastructure and different panels compatibles. I think Rob's
> > > idea was to introduce generic edp-connector.
> >
> > Again, there's no such thing as a generic edp-connector. The spec
> > doesn't define anything related to the power sequence for example.
> >
> > > If we can't make it generic then let's use panel infrastructure.
> >
> > Which uses a device specific compatible. Really, I'm not sure what
> > your objection and / or argument is here.
> >
> > In addition, when that was brought up in the discussion, you rejected
> > it because it was inconvenient:
> > https://patchwork.freedesktop.org/patch/283012/?series=56163&rev=1#comment_535206
>
> It is inconvenient, but I don't understand how having board-specific
> connectors fixes it.

How it would not fix it?

You'll have one connector, without the need to describe each and every
panel in the device tree and rely on the EDID instead, and you'll have
the option to power up the regulator you need.

I really don't understand what's the issue here, so let's take a step
back. What are is the issue , what are your requirements, and how
would you like that to be described ?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
