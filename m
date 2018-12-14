From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v2 11/12] drm/panel: Add Feiyang
 FY07024DI26A30-D MIPI-DSI LCD panel
Date: Fri, 14 Dec 2018 16:35:11 +0530
Message-ID: <CAMty3ZCkGudTL9NLnWjTPD8+xqEzY2d0oLN9x=64Hk8MzKTM5g@mail.gmail.com>
References: <20181116163916.29621-1-jagan@amarulasolutions.com>
 <20181116163916.29621-12-jagan@amarulasolutions.com> <20181213150736.GL154160@art_vandelay>
 <CAMty3ZAv1dHCRCShXYbxqMm4wV9WGDpAKPji+3G21eWq34ODaA@mail.gmail.com> <20181213194804.GM154160@art_vandelay>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBB444Z3QAKGQELBR3SOA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181213194804.GM154160@art_vandelay>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>
Cc: Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, TL Lim <tllim-F7SikzrIcFYdnm+yROfE0A@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 14, 2018 at 1:25 AM Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org> wrote:
>
> On Fri, Dec 14, 2018 at 12:56:03AM +0530, Jagan Teki wrote:
> > On Thu, Dec 13, 2018 at 8:37 PM Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org> wrote:
> > >
> > > On Fri, Nov 16, 2018 at 10:09:15PM +0530, Jagan Teki wrote:
> > > > Feiyang FY07024DI26A30-D is 1024x600, 4-lane MIPI-DSI LCD panel.
> > > >
> > > > Add panel driver for it.
> > > >
> > > > Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> > > > ---
> > > >  MAINTAINERS                                   |   6 +
> > > >  drivers/gpu/drm/panel/Kconfig                 |   9 +
> > > >  drivers/gpu/drm/panel/Makefile                |   1 +
> > > >  .../drm/panel/panel-feiyang-fy07024di26a30d.c | 286 ++++++++++++++++++
> > > >  4 files changed, 302 insertions(+)
> > > >  create mode 100644 drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
> > > >
>
> /snip
>
> > > > diff --git a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
> > > > new file mode 100644
> > > > index 000000000000..a4b46bd8fdbe
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
>
> /snip
>
> > > > +static int feiyang_prepare(struct drm_panel *panel)
> > > > +{
> > > > +     struct feiyang *ctx = panel_to_feiyang(panel);
> > > > +     struct mipi_dsi_device *dsi = ctx->dsi;
> > > > +     unsigned int i;
> > > > +     int ret;
> > > > +
> > > > +     ret = regulator_enable(ctx->dvdd);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     msleep(100);
> > >
> > > nit: You should do your best to correlate the sleeps with the timing parameters
> > > from the datasheet with a comment.
> > >
> > > ie:
> > >         /* T1: > 100ms */
> > >         msleep(100);
> >
> > Sorry, what does this mean?
>
> On page 9 of the datasheet you sent me [1], it has the delays required to safely
> power up the panel. This delay is the time between dvdd going high and avdd
> going high. On the figure in the datasheet, this would be T2 (T1 is dvdd rise

time between dvdd going high and avdd going high is T1 + T3 right?

T2 > 0ms
T3 > 20ms

In this case the delay can be msleep(20) ?

> time and should be handled in the regulator subsystem (iirc)). Also according to
> the datasheet, T2 just needs to be > 0, so you don't even need this delay. You
> could replace this with a comment like:
>
>         /* T1 (dvdd rise time) + T2 (dvdd->avdd) > 0 */
>
> So for all of the msleeps below you should get the delays from the datasheet and
> add a comment referencing them.

T5 and T6 are delay between avdd to reset enable it can be 10 + 10
=&gt; 20ms and finally T12 which is 200 after reset.

What about the delay between resets, I need to understand it a bit.
