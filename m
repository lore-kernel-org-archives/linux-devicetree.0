From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 2/7] drm/panel: simple: Add ability to override
 typical timing
Date: Thu, 11 Jul 2019 21:38:55 +0200
Message-ID: <20190711193855.GB5912@ravnborg.org>
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190401171724.215780-3-dianders@chromium.org>
 <20190630202246.GB15102@ravnborg.org>
 <CAD=FV=V_wTD1xpkXRe-z2HsZ8QXKq7jmq8CsfhMnFxi-5XDJjw@mail.gmail.com>
 <20190708175007.GA3511@ravnborg.org>
 <CAD=FV=XnDTKkscdCwFE1137aX6pTtv=5zqXf=yqcnchpZpt5_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=XnDTKkscdCwFE1137aX6pTtv=5zqXf=yqcnchpZpt5_Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Sean Paul <seanpaul@chromium.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>, Jeffy Chen <jeffy.chen@rock-chips.com>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Boris Brezillon <boris.brezillon@collabora.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Enric =?iso-8859-1?Q?Balletb=F2?= <enric.balletbo@collabora.com>, =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>, Ezequiel Garcia <ezequiel@collabora.com>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi Doug.

> > > > > @@ -91,6 +92,8 @@ struct panel_simple {
> > > > >       struct i2c_adapter *ddc;
> > > > >
> > > > >       struct gpio_desc *enable_gpio;
> > > > > +
> > > > > +     struct drm_display_mode override_mode;
> > > > I fail to see where this poiter is assigned.
> > >
> > > In panel_simple_parse_override_mode().  Specifically:
> > >
> > > drm_display_mode_from_videomode(&vm, &panel->override_mode);
> >
> > The above code-snippet is only called in the panel has specified display
> > timings using display_timings - it is not called when display_mode is
> > used.
> > So override_mode is only assigned in some cases and not all cases.
> > This needs to be fixed so we do not reference override_mode unless
> > it is set.
> 
> I'm afraid I'm not following you here.

> 
> * override_mode is a structure that's directly part of "struct panel_simple".
I had somehow confused myself to think this was a pointer.
And you are right that override_mode is properly initialized when the
structure is allocated.

Sorry for not reading the code and your replies carefully enough.

	Sam
