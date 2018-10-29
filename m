From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v3 12/25] drm/sun4i: sun6i_mipi_dsi: Add DSI
 hblk packet overhead
Date: Mon, 29 Oct 2018 19:56:27 +0530
Message-ID: <CAMty3ZBHU5eXRLLJmUroLgSKcF6O9gHOHRM1XBnt9_Lp7B8rEA@mail.gmail.com>
References: <20181026144344.27778-1-jagan@amarulasolutions.com>
 <20181026144344.27778-13-jagan@amarulasolutions.com> <20181029092227.mdxgvg5aqzh22j72@flea>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBBINR3TPAKGQE2CGTH7I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181029092227.mdxgvg5aqzh22j72@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 29, 2018 at 2:52 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
>
> On Fri, Oct 26, 2018 at 08:13:31PM +0530, Jagan Teki wrote:
> > Add 10 bytes packet overhead for hblk where blank is set using
> > a blanking packet like (4 bytes + 4 bytes + payload + 2 bytes)
> >
> > This is according to BSP code from BPI-M64-bsp
> > (in drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c)
> > dsi_hblk = (ht-hspw)*dsi_pixel_bits[format]/8-(4+4+2);
> >
> > So, add 10 bytes packet overhead for DSI hblk.
> >
> > Tested on 2-lane, 4-lane MIPI-DSI LCD panels.
> >
> > Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> > Tested-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> > ---
> > Changes for v3:
> > - new patch
> > Changes for v2:
> > - none
> >
> >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > index 596e560263bf..cf42be1f1ba1 100644
> > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > @@ -461,7 +461,7 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
> >  {
> >       struct mipi_dsi_device *device = dsi->device;
> >       unsigned int Bpp = mipi_dsi_pixel_format_to_bpp(device->format) / 8;
> > -     u16 hbp, hfp, hsa, hblk, vblk;
> > +     u16 hbp, hfp, hsa, hblk_max, hblk, vblk;
> >       size_t bytes;
> >       u8 *buffer;
> >
> > @@ -494,8 +494,13 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
> >
> >       /*
> >        * hblk seems to be the line + porches length.
> > +      * The blank is set using a blanking packet (4 bytes + 4 bytes +
> > +      * payload + 2 bytes). So minimal size is 10 bytes
> >        */
> > -     hblk = (mode->htotal - (mode->hsync_end - mode->hsync_start)) * Bpp;
> > +#define HBLK_PACKET_OVERHEAD 10
> > +     hblk_max = (mode->htotal - (mode->hsync_end - mode->hsync_start)) * Bpp;
> > +     hblk_max -= HBLK_PACKET_OVERHEAD;
> > +     hblk = max((unsigned int)HBLK_PACKET_OVERHEAD, hblk_max);
>
> I'd rather use the same convention than the other assignments done
> before in that function.

Yes, old code did use hsa. but it's added 10 bytes packet head instead
of subtracting it.

hblk = mode->htotal * Bpp - hsa;
=> mode->htotal * Bpp - (mode->hsync_end - mode->hsync_start) * Bpp -
HSA_PACKET_OVERHEAD);
=> (mode->htotal - (mode->hsync_end - mode->hsync_start)) * Bpp +
HSA_PACKET_OVERHEAD;

And it should be
(mode->htotal - (mode->hsync_end - mode->hsync_start)) * Bpp -
HSA_PACKET_OVERHEAD;

This patch is simply doing the same by explicitly adding packet over
ahead macro, which again used in hfp.
