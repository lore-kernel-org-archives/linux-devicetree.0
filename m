From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 2/7] drm/panel: simple: Add ability to override typical timing
Date: Mon, 1 Jul 2019 09:39:06 -0700
Message-ID: <CAD=FV=WH4kmhQA0kbKcAUx=oOeqTZiQOFCXYpVWwq+mG7Y7ofA@mail.gmail.com>
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190401171724.215780-3-dianders@chromium.org> <20190630202246.GB15102@ravnborg.org>
 <20190630205514.GA17046@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190630205514.GA17046@ravnborg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, Jeffy Chen <jeffy.chen@rock-chips.com>, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>, Boris Brezillon <boris.brezillon@collabora.com>, =?UTF-8?Q?Enric_Balletb=C3=B2?= <enric.balletbo@collabora.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, Ezequiel Garcia <ezequiel@collabora.com>, Matthias Kaehlcke <mka@chromium.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Sun, Jun 30, 2019 at 1:55 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Douglas.
>
> > > +
> > > +   /* Only add timings if override was not there or failed to validate */
> > > +   if (num == 0 && panel->desc->num_timings)
> > > +           num = panel_simple_get_timings_modes(panel);
> > > +
> > > +   /*
> > > +    * Only add fixed modes if timings/override added no mode.
> >
> > This part I fail to understand.
> > If we have a panel where we in panel-simple have specified the timings,
> > and done so using display_timing so with proper {min, typ, max} then it
> > should be perfectly legal to specify a more precise variant in the DT
> > file.
> > Or what did I miss here?
>
> Got it now.
> If display_mode is used for timings this is what you call "fixed mode".
> Hmm, if I got confused someone else may also be confused by this naming.

The name "fixed mode" comes from the old code, though I guess in the
old code it used to refer to a mode that came from either the
display_timing or the display_mode.

How about if I call it "panel_simple_get_from_fixed_display_mode"?
...or if you have another suggestion feel free to chime in.

NOTE: Since this feedback is minor and this patch has been outstanding
for a while (and is blocking other work), I am assuming that the best
path forward is for Heiko to land this patch with Thierry's Ack and
I'll send a follow-up.  Please yell if you disagree.  I'll respond to
each of your emails separately and then wait for your response before
sending the follow-up series.


-Doug
