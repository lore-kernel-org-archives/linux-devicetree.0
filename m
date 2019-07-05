From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add support for Sharp LD-D5116Z01B panel
Date: Fri, 5 Jul 2019 12:35:30 -0600
Message-ID: <CAOCk7NrVSCt18QfMs+_nW1rDMuhK_dPKWL0roESmwEEy4u3BZQ@mail.gmail.com>
References: <20190705165450.329-1-jeffrey.l.hugo@gmail.com>
 <20190705165755.515-1-jeffrey.l.hugo@gmail.com> <20190705172058.GA2788@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190705172058.GA2788@ravnborg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: thierry.reding@gmail.com, Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, DTML <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 5, 2019 at 11:21 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Jeffrey.
>
> Patch looks good, but there is a few fields that are not initialized.
> Did you forget them, or are they not needed?

Thanks for the review.  Overlooked some of them.

>
> On Fri, Jul 05, 2019 at 09:57:55AM -0700, Jeffrey Hugo wrote:
> > The Sharp LD-D5116Z01B is a 12.3" eDP panel with a 1920X1280 resolution.
> >
> > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index 5a93c4edf1e4..e6f578667324 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -2354,6 +2354,29 @@ static const struct panel_desc samsung_ltn140at29_301 = {
> >       },
> >  };
> >
> > +static const struct drm_display_mode sharp_ld_d5116z01b_mode = {
> > +     .clock = 168480,
> > +     .hdisplay = 1920,
> > +     .hsync_start = 1920 + 48,
> > +     .hsync_end = 1920 + 48 + 32,
> > +     .htotal = 1920 + 48 + 32 + 80,
> > +     .vdisplay = 1280,
> > +     .vsync_start = 1280 + 3,
> > +     .vsync_end = 1280 + 3 + 10,
> > +     .vtotal = 1280 + 3 + 10 + 57,
> > +     .vrefresh = 60,
> > +};
> No .flags? Is it not needed for an eDP panel?

The flags don't appear to make sense per my understanding of eDP.
Therefore I intended .flags to be 0, which it implicitly is because
this is a static struct.  Would you prefer I explicitly list .flags =
0?

>
> > +
> > +static const struct panel_desc sharp_ld_d5116z01b = {
> > +     .modes = &sharp_ld_d5116z01b_mode,
> > +     .num_modes = 1,
> > +     .bpc = 8,
> > +     .size = {
> > +             .width = 260,
> > +             .height = 120,
> > +     },
> > +};
> No .bus_format?

Ah, yes.  Looks like it should be MEDIA_BUS_FMT_RGB888_1X24
Will fix.

> No .bus_flags?

eDP is differential signaling, so what I see generally doesn't apply,
but DRM_BUS_FLAG_DATA_MSB_TO_LSB does apply, so I'll add that.
