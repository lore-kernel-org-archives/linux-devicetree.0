From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Re: [PATCH 06/12] drm/sun4i: sun6i_mipi_dsi: Fix
 VBP size calculation
Date: Mon, 8 Oct 2018 17:05:21 +0200
Message-ID: <20181008150521.mespl2oqkc4j6tjb@flea>
References: <20180927114850.24565-1-jagan@amarulasolutions.com>
 <20180927114850.24565-7-jagan@amarulasolutions.com>
 <20180927152126.vovnvwmqdfpuxgdm@flea>
 <CAMty3ZABx9Fod5W_T7JciZEsn7jGvuM-LsBFATdA=hQ2CVwELw@mail.gmail.com>
 <20180929135302.ymdzapz5npvapti2@flea>
 <63b40c20-670b-1c53-bf5e-62f64e6e02f0@openedev.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rkrm4oitetupjisc"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBPPE5XOQKGQEAVVAFCQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <63b40c20-670b-1c53-bf5e-62f64e6e02f0-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Cc: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--rkrm4oitetupjisc
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, Oct 01, 2018 at 01:39:17PM +0530, Jagan Teki wrote:
> On Saturday 29 September 2018 07:23 PM, Maxime Ripard wrote:
> > On Thu, Sep 27, 2018 at 09:50:34PM +0530, Jagan Teki wrote:
> > > On Thu, Sep 27, 2018 at 8:51 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> > > > 
> > > > On Thu, Sep 27, 2018 at 05:18:44PM +0530, Jagan Teki wrote:
> > > > > According to horizontal and vertical timings are defined
> > > > > per the diagram from include/drm/drm_modes.h
> > > > > 
> > > > > Back porch = [hv]total - [hv]sync_end
> > > > > 
> > > > > So, update SUN6I_DSI_BASIC_SIZE0_VBP calculation as
> > > > > mode->vtotal - mode->vsync_end
> > > > > 
> > > > > Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> > > > > ---
> > > > >   drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 4 ++--
> > > > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > > > index 1c7e42015645..599284971ab6 100644
> > > > > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > > > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > > > @@ -526,8 +526,8 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
> > > > >        regmap_write(dsi->regs, SUN6I_DSI_BASIC_SIZE0_REG,
> > > > >                     SUN6I_DSI_BASIC_SIZE0_VSA(mode->vsync_end -
> > > > >                                               mode->vsync_start) |
> > > > > -                  SUN6I_DSI_BASIC_SIZE0_VBP(mode->vsync_start -
> > > > > -                                            mode->vdisplay));
> > > > > +                  SUN6I_DSI_BASIC_SIZE0_VBP(mode->vtotal -
> > > > > +                                            mode->vsync_end));
> > > > 
> > > > Is it purely theoretical, or did you find some source that back that?
> > > 
> > > VSA is done as per that, sync_end - sync start would give sync time.
> > 
> > That's a different register though.
> > 
> > > VBP also done in BPI-M64-bsp[1] which results back porch existing code
> > > results fron porch.
> > > 
> > > [1] https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c#L955
> > 
> > That code does back porch - sync length. Such a calculation doesn't
> > make much sense as is, but you're saying that it results in the front
> > porch. Again, what makes you say that?
> 
> No what code shows is not a real back porch value used for drm it's panel
> back porch value which is a DTS property in BSP.
> (I made wrong comment on previous mail as front porch, sorry)
> 
> here is the real code
> 
> from drivers/video/sunxi/disp2/disp/de/disp_lcd.c
> timmings->ver_sync_time= panel_info->lcd_vspw;
> timmings->ver_back_porch= panel_info->lcd_vbp-panel_info->lcd_vspw;
> 
> 
> u32 vbp = panel->lcd_vbp;
> u32 vspw = panel->lcd_vspw;
> dsi_dev[sel]->dsi_basic_size0.bits.vbp = vbp-vspw;
> 
> So,
> 
> dsi_dev[sel]->dsi_basic_size0.bits.vbp = panel->lcd_vbp - panel->lcd_vspw;
> 
> =>  timmings->ver_back_porch + panel_info->lcd_vspw - panel_info->lcd_vspw
> =>  timmings->ver_back_porch
> =>  mode->vtotal - mode->end
> 
> VSA, which a proper value.
> 
> dsi_dev[sel]->dsi_basic_size0.bits.vsa = vspw;
> => panel_info->lcd_vspw;
> => timmings->ver_sync_time
> => mode->vsync_end - mode->vsync_start

Then please write that in your commit log.

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--rkrm4oitetupjisc--
