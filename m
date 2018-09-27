From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH 07/12] drm/sun4i: sun6i_mipi_dsi: Fix TCON
 DRQ set bits
Date: Thu, 27 Sep 2018 23:15:50 +0530
Message-ID: <CAMty3ZDUxqokipNqnn6c618pebdVBWc8Pfzaz+4+SYqR42Yerg@mail.gmail.com>
References: <20180927114850.24565-1-jagan@amarulasolutions.com>
 <20180927114850.24565-8-jagan@amarulasolutions.com> <20180927165853.dpluekbqzat663q7@flea>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBBWNOWTOQKGQEICXIXZY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180927165853.dpluekbqzat663q7@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 27, 2018 at 10:28 PM Maxime Ripard
<maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
>
> On Thu, Sep 27, 2018 at 05:18:45PM +0530, Jagan Teki wrote:
> > TCON DRQ set bits for non-burst DSI mode can computed via
> > horizontal front porch instead of front porch + sync timings.
> >
> > Since there no documentation for TCON_DRQ_REG(0x7c) register
> > this change is taken as reference from BPI-M64-bsp.
>
> Detailing more what the issue is would be great.
>
> > Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> > ---
> >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > index 599284971ab6..9918fdb990ff 100644
> > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > @@ -367,9 +367,9 @@ static void sun6i_dsi_setup_burst(struct sun6i_dsi *dsi,
> >       struct mipi_dsi_device *device = dsi->device;
> >       u32 val = 0;
>
> The computation here is in the A64 driver:
>
> if ((panel->lcd_ht - panel->lcd_x - panel->lcd_hbp) < 21) {
>         dsi_dev[sel]->dsi_tcon_drq.bits.drq_mode = 0;
> } else {
>         dsi_dev[sel]->dsi_tcon_drq.bits.drq_set =
>                 (panel->lcd_ht-panel->lcd_x-panel->lcd_hbp-20) *
>                 dsi_pixel_bits[panel->lcd_dsi_format]/(8*4);
> }
>
> It is testing that the sync + front porch is smaller than 21, and
> otherwise sets the drq.
>
> > -     if ((mode->hsync_end - mode->hdisplay) > 20) {
>
> My code here is testing that the difference between hsync_end and
> hdisplay is superior to 20, and sets the DRQ if true. The condition is
> reversed, but otherwise, that difference is the front porch plus the
> sync length.

True, I understand this, but does drq setting here is specific to SoC?
I thought of finding DRQ in A31 BSP but I couldn't find the code. do
you have bsp somewhere in github?

>
> > +     if ((mode->hsync_start - mode->hdisplay) > 20) {
>
> However, you are testing for just the front porch, unlike what your
> commit log is saying, and unlike what allwinner's code is saying. So
> this deserves some explanation.

but A64 is doing this, do you think it's completely A64 specific or
testing panel with front porch drq?
