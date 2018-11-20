From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 03/12] drm/sun4i: sun6i_mipi_dsi: Setup
 burst mode timings
Date: Tue, 20 Nov 2018 16:45:32 +0100
Message-ID: <20181120154532.mykbbrc3homwf2fi@flea>
References: <20181116163916.29621-1-jagan@amarulasolutions.com>
 <20181116163916.29621-4-jagan@amarulasolutions.com>
 <20181119083036.riydru5xefao3xte@flea>
 <CAMty3ZBDBDqtH5_m4g-kkKKx+JqcC-r9mc-H+_WWgkLubMWPew@mail.gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xfrsutrsshbzfw5b"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBHWY2DPQKGQEM5WT7KA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAMty3ZBDBDqtH5_m4g-kkKKx+JqcC-r9mc-H+_WWgkLubMWPew-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, TL Lim <tllim-F7SikzrIcFYdnm+yROfE0A@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org


--xfrsutrsshbzfw5b
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, Nov 19, 2018 at 04:30:37PM +0530, Jagan Teki wrote:
> On Mon, Nov 19, 2018 at 2:00 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> >
> > On Fri, Nov 16, 2018 at 10:09:07PM +0530, Jagan Teki wrote:
> > > Burst mode display timings are different from convectional
> > > video mode so update the horizontal and vertical timings.
> > >
> > > Reference code taken from BSP (from linux-sunxi/
> > > drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c)
> > >
> > > dsi_hsa  = 0;
> > > dsi_hbp  = 0;
> > > dsi_hact = x*dsi_pixel_bits[format]/8;
> > > dsi_hblk = dsi_hact;
> > > dsi_hfp  = 0;
> > > dsi_vblk = 0;
> > >
> > > Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> >
> > How is that matching the code you have in the rest of your patch?
> 
> +       if (device->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
> +               timings.hblk = (mode->hdisplay * Bpp);
> +       else
> +               sun6i_dsi_get_timings(dsi, mode, &timings);
> 
> It's again your request to "keep the couple of function to make more
> readable"

That function in particular doesn't make it much more readable, but
more importantly, your commit log doesn't match what you code does.

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--xfrsutrsshbzfw5b--
