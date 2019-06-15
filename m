From: "dbasehore ." <dbasehore@chromium.org>
Subject: Re: [PATCH 1/5] drm/panel: Add helper for reading DT rotation
Date: Fri, 14 Jun 2019 17:44:24 -0700
Message-ID: <CAGAzgsqv8qYM-+_4bPLHtyiaox2jFLMMka8n1Wnk-q5LVPKqDg@mail.gmail.com>
References: <20190611040350.90064-1-dbasehore@chromium.org>
 <20190611040350.90064-2-dbasehore@chromium.org> <20190612211807.GA13155@ravnborg.org>
 <CAGAzgsqgbr5rWpyWB1H_66=kxBRb7kw4wE7h34TJfE7eJ1mSQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGAzgsqgbr5rWpyWB1H_66=kxBRb7kw4wE7h34TJfE7eJ1mSQQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org, Intel Graphics <intel-gfx@lists.freedesktop.org>, moderated list:ARM/FREESCALE IMX
List-Id: devicetree@vger.kernel.org

On Fri, Jun 14, 2019 at 5:43 PM dbasehore . <dbasehore@chromium.org> wrote:
>
> On Wed, Jun 12, 2019 at 2:18 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Hi Derek.
> >
> > On Mon, Jun 10, 2019 at 09:03:46PM -0700, Derek Basehore wrote:
> > > This adds a helper function for reading the rotation (panel
> > > orientation) from the device tree.
> > >
> > > Signed-off-by: Derek Basehore <dbasehore@chromium.org>
> > > ---
> > >  drivers/gpu/drm/drm_panel.c | 41 +++++++++++++++++++++++++++++++++++++
> > >  include/drm/drm_panel.h     |  7 +++++++
> > >  2 files changed, 48 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> > > index dbd5b873e8f2..3b689ce4a51a 100644
> > > --- a/drivers/gpu/drm/drm_panel.c
> > > +++ b/drivers/gpu/drm/drm_panel.c
> > > @@ -172,6 +172,47 @@ struct drm_panel *of_drm_find_panel(const struct device_node *np)
> > >       return ERR_PTR(-EPROBE_DEFER);
> > >  }
> > >  EXPORT_SYMBOL(of_drm_find_panel);
> > > +
> > > +/**
> > > + * of_drm_get_panel_orientation - look up the rotation of the panel using a
> > > + * device tree node
> > > + * @np: device tree node of the panel
> > > + * @orientation: orientation enum to be filled in
> > The comment says "enum" but the type used is an int.
> > Why not use enum drm_panel_orientation?
> >
>
> The binding is just an int value, but I can change it to the enum.

Oops, I see what happened here. The way I wrote it should actually use the enum

>
> > > + *
> > > + * Looks up the rotation of a panel in the device tree. The rotation in the
> > > + * device tree is counter clockwise.
> > > + *
> > > + * Return: 0 when a valid rotation value (0, 90, 180, or 270) is read or the
> > > + * rotation property doesn't exist. -EERROR otherwise.
> > > + */
> > Initially I read -EEROOR as a specific error code.
> > But I gues the semantic is to say that a negative error code is returned
> > if something was wrong.
> > As we do not use the "-EERROR" syntax anywhere else in drm, please
> > reword like we do in other places.
> >
> >
> > Also - it is worth to mention that the rotation returned is
> > DRM_MODE_PANEL_ORIENTATION_UNKNOWN if the property is not specified.
> > I wonder if this is correct, as no property could also been
> > interpretated as DRM_MODE_PANEL_ORIENTATION_NORMAL.
> > And in most cases the roation property is optional, so one could
> > assume that no property equals 0 degree.
> >
> >
> >         Sam
> >
> > > +int of_drm_get_panel_orientation(const struct device_node *np, int *orientation)
> > > +{
> > > +     int rotation, ret;
> > > +
> > > +     ret = of_property_read_u32(np, "rotation", &rotation);
> > > +     if (ret == -EINVAL) {
> > > +             /* Don't return an error if there's no rotation property. */
> > > +             *orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
> > > +             return 0;
> > > +     }
> > > +
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > > +     if (rotation == 0)
> > > +             *orientation = DRM_MODE_PANEL_ORIENTATION_NORMAL;
> > > +     else if (rotation == 90)
> > > +             *orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP;
> > > +     else if (rotation == 180)
> > > +             *orientation = DRM_MODE_PANEL_ORIENTATION_BOTTOM_UP;
> > > +     else if (rotation == 270)
> > > +             *orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP;
> > > +     else
> > > +             return -EINVAL;
> > > +
> > > +     return 0;
> > > +}
> > > +EXPORT_SYMBOL(of_drm_get_panel_orientation);
> > >  #endif
> > >
> > >  MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
> > > diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> > > index 8c738c0e6e9f..13631b2efbaa 100644
> > > --- a/include/drm/drm_panel.h
> > > +++ b/include/drm/drm_panel.h
> > > @@ -197,11 +197,18 @@ int drm_panel_detach(struct drm_panel *panel);
> > >
> > >  #if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL)
> > >  struct drm_panel *of_drm_find_panel(const struct device_node *np);
> > > +int of_drm_get_panel_orientation(const struct device_node *np,
> > > +                              int *orientation);
> > >  #else
> > >  static inline struct drm_panel *of_drm_find_panel(const struct device_node *np)
> > >  {
> > >       return ERR_PTR(-ENODEV);
> > >  }
> > > +int of_drm_get_panel_orientation(const struct device_node *np,
> > > +                              int *orientation)
> > > +{
> > > +     return -ENODEV;
> > > +}
> > >  #endif
> > >
> > >  #endif
> > > --
> > > 2.22.0.rc2.383.gf4fbbf30c2-goog
