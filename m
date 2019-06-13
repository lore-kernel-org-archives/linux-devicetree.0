From: "dbasehore ." <dbasehore@chromium.org>
Subject: Re: [PATCH 2/5] dt-bindings: display/panel: Expand rotation documentation
Date: Thu, 13 Jun 2019 14:00:26 -0700
Message-ID: <CAGAzgsrNhumP2DEOff34cZ3UY=CV-EG1RM06Uf_tX3gdUMeSQg@mail.gmail.com>
References: <20190611040350.90064-1-dbasehore@chromium.org>
 <20190611040350.90064-3-dbasehore@chromium.org> <CAL_JsqLM1CikZ8+NPjLk2CEW-z9vPynZpVG20x0jsa7hVq0LvA@mail.gmail.com>
 <CAGAzgsoWGqf0JQPNyRFnv2xZTMxje6idce7Dy5FZzuxj30mQyw@mail.gmail.com> <CAL_Jsq+9K764hFT6GG=4paumGaxOUbnts4VJvTZ9a8Y-YPWdhg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+9K764hFT6GG=4paumGaxOUbnts4VJvTZ9a8Y-YPWdhg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org, Intel Graphics <intel-gfx@lists.freedesktop.org>, moderated list:
List-Id: devicetree@vger.kernel.org

On Thu, Jun 13, 2019 at 5:52 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Tue, Jun 11, 2019 at 4:02 PM dbasehore . <dbasehore@chromium.org> wrote:
> >
> > On Tue, Jun 11, 2019 at 8:25 AM Rob Herring <robh+dt@kernel.org> wrote:
> > >
> > > On Mon, Jun 10, 2019 at 10:03 PM Derek Basehore <dbasehore@chromium.org> wrote:
> > > >
> > > > This adds to the rotation documentation to explain how drivers should
> > > > use the property and gives an example of the property in a devicetree
> > > > node.
> > > >
> > > > Signed-off-by: Derek Basehore <dbasehore@chromium.org>
> > > > ---
> > > >  .../bindings/display/panel/panel.txt          | 32 +++++++++++++++++++
> > > >  1 file changed, 32 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/panel/panel.txt b/Documentation/devicetree/bindings/display/panel/panel.txt
> > > > index e2e6867852b8..f35d62d933fc 100644
> > > > --- a/Documentation/devicetree/bindings/display/panel/panel.txt
> > > > +++ b/Documentation/devicetree/bindings/display/panel/panel.txt
> > > > @@ -2,3 +2,35 @@ Common display properties
> > > >  -------------------------
> > > >
> > > >  - rotation:    Display rotation in degrees counter clockwise (0,90,180,270)
> > > > +
> > > > +Property read from the device tree using of of_drm_get_panel_orientation
> > >
> > > Don't put kernel specifics into bindings.
> >
> > Will remove that. I'll clean up the documentation to indicate that
> > this binding creates a panel orientation property unless the rotation
> > is handled in the Timing Controller on the panel if that sounds fine.
>
> Even if the timing ctrlr handles it, don't you still need to know what
> the native orientation is?

Not really. For all intents and purposes, the orientation of the panel
has changed.

>
> > > > +
> > > > +The panel driver may apply the rotation at the TCON level, which will
> > >
> > > What's TCON? Something Mediatek specific IIRC.
> >
> > The TCON is the Timing controller, which is on the panel. Every panel
> > has one. I'll add to the doc that the TCON is in the panel, etc.
> >
> > >
> > > > +make the panel look like it isn't rotated to the kernel and any other
> > > > +software.
> > > > +
> > > > +If not, a panel orientation property should be added through the SoC
> > > > +vendor DRM code using the drm_connector_init_panel_orientation_property
> > > > +function.
> > >
> > > The 'rotation' property should be defined purely based on how the
> > > panel is mounted relative to a device's orientation. If the display
> > > pipeline has some ability to handle rotation, that's a feature of the
> > > display pipeline and not the panel.
> >
> > This is how the panel orientation property is already handled in the
> > kernel. See drivers/gpu/drm/i915/vlv_dsi.c for more details.
>
> The point is your description is all about the kernel. This is a
> binding which is not kernel specific.

Ah, I see. I thought you were saying what the implementation should be.

>
> > > > +
> > > > +Example:
> > >
> > > This file is a collection of common properties. It shouldn't have an
> > > example especially as this example is mostly non-common properties.
> >
> > Just copied one of our DTS entries that uses the property. I'll remove
> > everything under compatible except for rotation and status.
>
> Just remove the example or add what you want to the "boe,himax8279d8p"
> binding doc. We are moving towards examples being compiled and
> validated, so incomplete ones won't work.

Ok, will do.

>
> Rob

Thanks for the quick reviews.
