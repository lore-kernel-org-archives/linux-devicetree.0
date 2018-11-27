From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 08/26] drm/sun4i: sun6i_mipi_dsi: Fix VBP
 size calculation
Date: Tue, 27 Nov 2018 11:24:50 +0100
Message-ID: <20181127102450.b65jzhrdpxn5rxmk@flea>
References: <20181113111633.20189-1-jagan@amarulasolutions.com>
 <20181113111633.20189-9-jagan@amarulasolutions.com>
 <20181115095551.uctdkfmuwlnzhjnn@flea>
 <CAMty3ZAEHiovm6OF6JvJVQR4aqpG1Q3ML5YqxJkF2ntwRkUO=A@mail.gmail.com>
 <20181120155715.andrjp5kg6ugcv72@flea>
 <CAMty3ZCUOJmvekupOwh281g5HaazTpBbukWQY2Pv2OYypAwciw@mail.gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pf6ls3yybuynq446"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBBNX6TPQKGQEGFI35VA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAMty3ZCUOJmvekupOwh281g5HaazTpBbukWQY2Pv2OYypAwciw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org


--pf6ls3yybuynq446
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Tue, Nov 20, 2018 at 09:55:42PM +0530, Jagan Teki wrote:
> On Tue, Nov 20, 2018 at 9:27 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> >
> > On Thu, Nov 15, 2018 at 11:19:53PM +0530, Jagan Teki wrote:
> > > On Thu, Nov 15, 2018 at 3:26 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Tue, Nov 13, 2018 at 04:46:15PM +0530, Jagan Teki wrote:
> > > > > The horizontal and vertical back porch calculation in BSP
> > > > > code is simply following the Linux drm comment diagram, in
> > > > > include/drm/drm_modes.h which is
> > > > >
> > > > > [hv]back porch = [hv]total - [hv]sync_end
> > > > >
> > > > > BSP code form BPI-M64-bsp is calculating vertical back porch as
> > > > > (from linux-sunxi/drivers/video/sunxi/disp2/disp/de/disp_lcd.c)
> > > > >
> > > > > timmings->ver_sync_time= panel_info->lcd_vspw;
> > > > > timmings->ver_back_porch= panel_info->lcd_vbp-panel_info->lcd_vspw;
> > > > >
> > > > > vbp = panel->lcd_vbp;
> > > > > vspw = panel->lcd_vspw;
> > > > > dsi_dev[sel]->dsi_basic_size0.bits.vbp = vbp-vspw;
> > > > > dsi_dev[sel]->dsi_basic_size0.bits.vbp = panel->lcd_vbp - panel->lcd_vspw;
> > > > > =>  timmings->ver_back_porch + panel_info->lcd_vspw - panel_info->lcd_vspw
> > > > > =>  timmings->ver_back_porch
> > > > > =>  mode->vtotal - mode->end
> > > > >
> > > > > Which evatually same as mode->vtotal - mode->vsync_end so update the
> > > > > same in SUN6I_DSI_BASIC_SIZE0_VBP
> > > > >
> > > > > On the information note, existing SUN6I_DSI_BASIC_SIZE0_VSA is proper
> > > > > value.
> > > > >
> > > > > Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> > > >
> > > > I've tested your changes on my A33 board, and this commit will break
> > > > it.
> > > >
> > > > It creates vblank timeouts, and visual artifacts at the bottom of the
> > > > display.
> > >
> > > Strange, VBP is earlier gives front porch which is anyway wrong.
> > >
> > > >
> > > > Later commits seem to fix the issue, but will create some blanking on
> > > > the upper third of the display.
> > > >
> > > > Since the documentation is quite sparse, and a MIPI-DSI analyzer is
> > > > way too expensive, I'd really like to have at least what each of these
> > > > commits are actually fixing, and what symptoms each of these were
> > > > causing, and not just "the BSP does it".
> > >
> > > W/o this 2-lane panel is breaking, same vblank timeout and visual
> > > artifacts at the bottom of the panel. though the commits may reference
> > > BSP, I have at-least tested on 3 different panels for us to prove its
> > > working.
> > >
> > > > Having some datasheet for the panels you had working would help too.
> > >
> > > Unfortunately datasheet doesn't have any required information what we
> > > actually looking for.
> >
> > Not even the timings? How did you get that information then?
> 
> datasheet has timing values, but this changes need controller
> information about VBP register that I don't have. But again existing
> VBP is not back porch for real, it's front porch.

Yet, this breaks the existing setup. So again:

> > > > Since the documentation is quite sparse, and a MIPI-DSI analyzer is
> > > > way too expensive, I'd really like to have at least what each of these
> > > > commits are actually fixing, and what symptoms each of these were
> > > > causing, and not just "the BSP does it".

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--pf6ls3yybuynq446--
