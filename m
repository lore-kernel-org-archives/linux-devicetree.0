From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/3] drm/panel: simple: Add ability to override typical
 timing
Date: Tue, 6 Feb 2018 16:48:12 -0500
Message-ID: <20180206214812.fzh3tr3zflzunw6n@art_vandelay>
References: <20180206165626.37692-1-seanpaul@chromium.org>
 <20180206165626.37692-2-seanpaul@chromium.org>
 <CAL_JsqJer8ZrLyPHz=hBo9smSv7aXhtP3hOJzQojt7ofUiHo=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJer8ZrLyPHz=hBo9smSv7aXhtP3hOJzQojt7ofUiHo=w@mail.gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 06, 2018 at 02:19:34PM -0600, Rob Herring wrote:
> On Tue, Feb 6, 2018 at 10:56 AM, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> > This patch adds the ability to override the typical display timing for a
> > given panel. This is useful for devices which have timing constraints
> > that do not apply across the entire display driver (eg: to avoid
> > crosstalk between panel and digitizer on certain laptops). The rules are
> > as follows:
> >
> > - panel must not specify fixed mode (since the override mode will
> >   either be the same as the fixed mode, or we'll be unable to
> >   check the bounds of the overried)
> > - panel must specify at least one display_timing range which will be
> >   used to ensure the override mode fits within its bounds
> >
> > Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> > Cc: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: Stéphane Marchesin <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > ---
> >  .../bindings/display/panel/simple-panel.txt        | 20 +++++++
> 
> The binding should be a separate patch.
> 

Ack, will split.


> >  drivers/gpu/drm/panel/panel-simple.c               | 69 +++++++++++++++++++++-
> >  2 files changed, 88 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/simple-panel.txt b/Documentation/devicetree/bindings/display/panel/simple-panel.txt
> > index 16d8ff088b7d..590bbff6fc90 100644
> > --- a/Documentation/devicetree/bindings/display/panel/simple-panel.txt
> > +++ b/Documentation/devicetree/bindings/display/panel/simple-panel.txt
> > @@ -7,6 +7,14 @@ Optional properties:
> >  - ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
> >  - enable-gpios: GPIO pin to enable or disable the panel
> >  - backlight: phandle of the backlight device attached to the panel
> > +- override-mode: For devices which require a mode which differs from the
> 
> This is not a property, but a node so it needs its own section.
> 
> Also, it's not real clear from display-timing.txt, but the modes
> should be grouped under a display-timings node. Looks like we haven't
> been good at enforcing that as "panel-timing" is also common when
> there's a single mode. I'd rather not have another way. With a
> standard node name, we can validate the node more easily.
> 
> We'd lose the fact that this is explicitly an override, but I'd doubt
> Thierry is going to start letting in panels with no timings.
> 

Yeah, I noticed that the timing subnode was specified as nestled in
display-timings. I figured since there can only be one override mode, and the
of_get_display_timing function was exported, it would be Ok to just reuse the
format of the subnode. I'll respin with the full thing.


> Finally, since this is an override, is it valid to only override the
> parameters that need overriding? I don't really have an opinion either
> way. It just needs to be explicitly documented.

I'll pimp the documentation. My gut reaction is to specify everything, since
this should be a very conscious decision, and having to fully specify the mode
seems like the right thing to do.

Thanks for your review!

Sean

> 
> > +                display_timing's "typical" mode, and whose restrictions cannot
> > +                be applied across the entire platform. The mode must fall
> > +                within the bounds of the panel's specified display_timing, and
> > +                cannot be used if the panel already specifies a single fixed
> > +                mode. The format is specified under "timing subnode" in
> > +                display-timing.txt
> > +
> >
> >  Example:
> >
> > @@ -18,4 +26,16 @@ Example:
> >                 enable-gpios = <&gpio 90 0>;
> >
> >                 backlight = <&backlight>;
> > +
> > +               override-mode {
> > +                       clock-frequency = <266604720>;
> > +                       hactive = <2400>;
> > +                       hfront-porch = <48>;
> > +                       hback-porch = <84>;
> > +                       hsync-len = <32>;
> > +                       vactive = <1600>;
> > +                       vfront-porch = <3>;
> > +                       vback-porch = <120>;
> > +                       vsync-len = <10>;
> > +               }
> >         };

-- 
Sean Paul, Software Engineer, Google / Chromium OS
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
