From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/3] drm/panel: simple: Add ability to override typical
 timing
Date: Wed, 7 Feb 2018 14:27:13 -0500
Message-ID: <20180207192713.mdelg7j6dsbcnpsm@art_vandelay>
References: <20180206165626.37692-1-seanpaul@chromium.org>
 <20180206165626.37692-2-seanpaul@chromium.org>
 <CAL_JsqJer8ZrLyPHz=hBo9smSv7aXhtP3hOJzQojt7ofUiHo=w@mail.gmail.com>
 <20180206214812.fzh3tr3zflzunw6n@art_vandelay>
 <CAL_JsqJDvPN3CtKtj980egDRuC-ZjiKOAWe5ECYVBSv4hVOnYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJDvPN3CtKtj980egDRuC-ZjiKOAWe5ECYVBSv4hVOnYw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 07, 2018 at 11:41:49AM -0600, Rob Herring wrote:
> On Tue, Feb 6, 2018 at 3:48 PM, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> > On Tue, Feb 06, 2018 at 02:19:34PM -0600, Rob Herring wrote:
> >> On Tue, Feb 6, 2018 at 10:56 AM, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> >> > This patch adds the ability to override the typical display timing for a
> >> > given panel. This is useful for devices which have timing constraints
> >> > that do not apply across the entire display driver (eg: to avoid
> >> > crosstalk between panel and digitizer on certain laptops). The rules are
> >> > as follows:
> >> >
> >> > - panel must not specify fixed mode (since the override mode will
> >> >   either be the same as the fixed mode, or we'll be unable to
> >> >   check the bounds of the overried)
> >> > - panel must specify at least one display_timing range which will be
> >> >   used to ensure the override mode fits within its bounds
> >> >
> >> > Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >> > Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> >> > Cc: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >> > Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> > Cc: Stéphane Marchesin <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >> > Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >> > Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> >> > Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> >> > Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >> > ---
> >> >  .../bindings/display/panel/simple-panel.txt        | 20 +++++++
> >>
> >> The binding should be a separate patch.
> >>
> >
> > Ack, will split.
> >
> >
> >> >  drivers/gpu/drm/panel/panel-simple.c               | 69 +++++++++++++++++++++-
> >> >  2 files changed, 88 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/Documentation/devicetree/bindings/display/panel/simple-panel.txt b/Documentation/devicetree/bindings/display/panel/simple-panel.txt
> >> > index 16d8ff088b7d..590bbff6fc90 100644
> >> > --- a/Documentation/devicetree/bindings/display/panel/simple-panel.txt
> >> > +++ b/Documentation/devicetree/bindings/display/panel/simple-panel.txt
> >> > @@ -7,6 +7,14 @@ Optional properties:
> >> >  - ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
> >> >  - enable-gpios: GPIO pin to enable or disable the panel
> >> >  - backlight: phandle of the backlight device attached to the panel
> >> > +- override-mode: For devices which require a mode which differs from the
> >>
> >> This is not a property, but a node so it needs its own section.
> >>
> >> Also, it's not real clear from display-timing.txt, but the modes
> >> should be grouped under a display-timings node. Looks like we haven't
> >> been good at enforcing that as "panel-timing" is also common when
> >> there's a single mode. I'd rather not have another way. With a
> >> standard node name, we can validate the node more easily.
> >>
> >> We'd lose the fact that this is explicitly an override, but I'd doubt
> >> Thierry is going to start letting in panels with no timings.
> >>
> >
> > Yeah, I noticed that the timing subnode was specified as nestled in
> > display-timings. I figured since there can only be one override mode, and the
> > of_get_display_timing function was exported, it would be Ok to just reuse the
> > format of the subnode. I'll respin with the full thing.
> 
> TBC, I'm fine if you use panel-timing as that's already established
> for cases were only 1 mode exists.

Ah! So the dt change you were asking for was just s/override-mode/panel-timing/.
I'll respin a v3 with the improved documentation and reinstate the "panel-timing"
subnode.

Sean

> 
> Rob

-- 
Sean Paul, Software Engineer, Google / Chromium OS
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
