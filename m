From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 2/7] drm/panel: simple: Add ability to override typical timing
Date: Mon, 1 Jul 2019 09:39:24 -0700
Message-ID: <CAD=FV=V_wTD1xpkXRe-z2HsZ8QXKq7jmq8CsfhMnFxi-5XDJjw@mail.gmail.com>
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190401171724.215780-3-dianders@chromium.org> <20190630202246.GB15102@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190630202246.GB15102@ravnborg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Sean Paul <seanpaul@chromium.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>, Jeffy Chen <jeffy.chen@rock-chips.com>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Boris Brezillon <boris.brezillon@collabora.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, =?UTF-8?Q?Enric_Balletb=C3=B2?= <enric.balletbo@collabora.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, Ezequiel Garcia <ezequiel@collabora.com>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Sun, Jun 30, 2019 at 1:22 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> > @@ -91,6 +92,8 @@ struct panel_simple {
> >       struct i2c_adapter *ddc;
> >
> >       struct gpio_desc *enable_gpio;
> > +
> > +     struct drm_display_mode override_mode;
> I fail to see where this poiter is assigned.

In panel_simple_parse_override_mode().  Specifically:

drm_display_mode_from_videomode(&vm, &panel->override_mode);


> @@ -152,6 +162,44 @@ static int panel_simple_get_fixed_modes(struct panel_simple *panel)
> >               num++;
> >       }
> >
> > +     return num;
> > +}
> > +
> > +static int panel_simple_get_non_edid_modes(struct panel_simple *panel)
> > +{
> > +     struct drm_connector *connector = panel->base.connector;
> > +     struct drm_device *drm = panel->base.drm;
> > +     struct drm_display_mode *mode;
> > +     bool has_override = panel->override_mode.type;
> This looks suspicious.
> panel->override_mode.type is an unsigned int that may have a number of
> bits set.
> So the above code implicitly convert a .type != 0 to a true.
> This can be expressed in a much more reader friendly way.

You would suggest that I add a boolean field to a structure to
indicate whether an override mode is present?  I will certainly do
that if you're sure that's what you want, but my understanding of the
convention for much of the kernel is that you generally rely on
structures being zero-initialized and then (assuming that zero isn't a
valid value) it's safe to confirm they've been initialized by seeing
that they're non-zero.

In this case panel_simple_parse_override_mode() will _definitely_ set
a non-zero value for this field in the case that it ran to completion.
...and, even further, the end of that function has a WARN_ON() if it
doesn't.

Any chance you missed reading panel_simple_parse_override_mode() in
the original patch?


> And on top of this, I cannot see that panel->override_mode points to a
> valid instance of display_mode, at least not always.

override_mode isn't a pointer, right?  It's a structure straight in
the panel.  So all its fields will be initted to 0 by the kzalloc in
panel_simple_probe().  If the type is non-zero then we know
panel_simple_parse_override_mode() finished to completion.


> > @@ -268,7 +316,7 @@ static int panel_simple_get_modes(struct drm_panel *panel)
> >       }
> >
> >       /* add hard-coded panel modes */
> > -     num += panel_simple_get_fixed_modes(p);
> > +     num += panel_simple_get_non_edid_modes(p);
> >
> >       return num;
> >  }
> > @@ -299,10 +347,58 @@ static const struct drm_panel_funcs panel_simple_funcs = {
> >       .get_timings = panel_simple_get_timings,
> >  };
> >
> > +#define PANEL_SIMPLE_BOUNDS_CHECK(to_check, bounds, field) \
> > +     (to_check->field.typ >= bounds->field.min && \
> > +      to_check->field.typ <= bounds->field.max)
> > +static void panel_simple_parse_override_mode(struct device *dev,
> > +                                          struct panel_simple *panel,
> > +                                          const struct display_timing *ot)
> > +{
> > +     const struct panel_desc *desc = panel->desc;
> > +     struct videomode vm;
> > +     unsigned int i;
> > +
> > +     if (WARN_ON(desc->num_modes)) {
> > +             dev_err(dev, "Reject override mode: panel has a fixed mode\n");
> > +             return;
> > +     }
> > +     if (WARN_ON(!desc->num_timings)) {
> > +             dev_err(dev, "Reject override mode: no timings specified\n");
> > +             return;
> > +     }
> > +
> > +     for (i = 0; i < panel->desc->num_timings; i++) {
> > +             const struct display_timing *dt = &panel->desc->timings[i];
> > +
> > +             if (!PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, hactive) ||
> > +                 !PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, hfront_porch) ||
> > +                 !PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, hback_porch) ||
> > +                 !PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, hsync_len) ||
> > +                 !PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, vactive) ||
> > +                 !PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, vfront_porch) ||
> > +                 !PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, vback_porch) ||
> > +                 !PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, vsync_len))
> > +                     continue;
> > +
> > +             if (ot->flags != dt->flags)
> > +                     continue;
> The binding do not say anything about flags. Is this check really
> needed?

Flags here is an implementation detail of the Linux driver and the
bindings are supposed to be Linux-agnostic.  The bindings started out
talking about lots of stuff that happened in the driver and I was told
to take all those out.  ;-)

Specifically note that flags here holds whether we have specified a
positive or negative for hsync or vsync.  These are the "hsync-active"
and "vsync-active" properties of the panel bindings.  Take a look at
of_parse_display_timing().

...so to summarize the flags here is just a different set of
properties to check like the checks above.


> > +
> > +             videomode_from_timing(ot, &vm);
> > +             drm_display_mode_from_videomode(&vm, &panel->override_mode);
>
> > +             panel->override_mode.type |= DRM_MODE_TYPE_DRIVER |
> > +                                          DRM_MODE_TYPE_PREFERRED;
> > +             break;
> > +     }
> > +
> > +     if (WARN_ON(!panel->override_mode.type))
> > +             dev_err(dev, "Reject override mode: No display_timing found\n");
> > +}
> > +
> >  static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
> >  {
> >       struct device_node *backlight, *ddc;
> >       struct panel_simple *panel;
> > +     struct display_timing dt;
> >       int err;
> >
> >       panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
> > @@ -348,6 +444,9 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
> >               }
> >       }
> >
> > +     if (!of_get_display_timing(dev->of_node, "panel-timing", &dt))
> > +             panel_simple_parse_override_mode(dev, panel, &dt);
> > +
> Naming bike-shedding.
> With the new node name, the function name
> panel_simple_parse_override_mode() could use an update.
> Maybe: panel_simple_parse_panel_timing_node()

Happy to change the name to panel_simple_parse_panel_timing_node().

---

Summary of the above:

* Unless you say otherwise, I will leave the check of "type != 0" and
not introduce a new boolean.

* Only action request is rename of panel_simple_parse_override_mode()
to panel_simple_parse_panel_timing_node()

NOTE: Since this feedback is minor and this patch has been outstanding
for a while (and is blocking other work), I am assuming that the best
path forward is for Heiko to land this patch with Thierry's Ack and
I'll send a follow-up.  Please yell if you disagree.  I'll respond to
each of your emails separately and then wait for your response before
sending the follow-up series.


-Doug
