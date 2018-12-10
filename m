From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [linux-sunxi] Re: [PATCH v4 08/26] drm/sun4i: sun6i_mipi_dsi: Fix
 VBP size calculation
Date: Mon, 10 Dec 2018 21:37:23 +0530
Message-ID: <CAMty3ZB4uSxMETSrGbod54N++rimTmv1jNnCPKCy0PRa2e9WFw@mail.gmail.com>
References: <20181113111633.20189-1-jagan@amarulasolutions.com>
 <20181113111633.20189-9-jagan@amarulasolutions.com> <20181115095551.uctdkfmuwlnzhjnn@flea>
 <CAMty3ZAEHiovm6OF6JvJVQR4aqpG1Q3ML5YqxJkF2ntwRkUO=A@mail.gmail.com>
 <20181120155715.andrjp5kg6ugcv72@flea> <CAMty3ZCUOJmvekupOwh281g5HaazTpBbukWQY2Pv2OYypAwciw@mail.gmail.com>
 <20181127102450.b65jzhrdpxn5rxmk@flea> <CAMty3ZDTvn4VF_oOvEi2jCw9Rw5WPd1LQT3SZ5X1K0fJAFg2cQ@mail.gmail.com>
 <20181207132136.oa4nzpczytzxhl2d@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181207132136.oa4nzpczytzxhl2d@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jernej Skrabec <jernej.skrabec@siol.net>, Vasily Khoruzhick <anarsoul@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-amarula@amarulasolutions.com
List-Id: devicetree@vger.kernel.org

On Fri, Dec 7, 2018 at 6:51 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Tue, Nov 27, 2018 at 04:34:35PM +0530, Jagan Teki wrote:
> > On Tue, Nov 27, 2018 at 3:55 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > >
> > > On Tue, Nov 20, 2018 at 09:55:42PM +0530, Jagan Teki wrote:
> > > > On Tue, Nov 20, 2018 at 9:27 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > > > >
> > > > > On Thu, Nov 15, 2018 at 11:19:53PM +0530, Jagan Teki wrote:
> > > > > > On Thu, Nov 15, 2018 at 3:26 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > > > > > >
> > > > > > > Hi,
> > > > > > >
> > > > > > > On Tue, Nov 13, 2018 at 04:46:15PM +0530, Jagan Teki wrote:
> > > > > > > > The horizontal and vertical back porch calculation in BSP
> > > > > > > > code is simply following the Linux drm comment diagram, in
> > > > > > > > include/drm/drm_modes.h which is
> > > > > > > >
> > > > > > > > [hv]back porch = [hv]total - [hv]sync_end
> > > > > > > >
> > > > > > > > BSP code form BPI-M64-bsp is calculating vertical back porch as
> > > > > > > > (from linux-sunxi/drivers/video/sunxi/disp2/disp/de/disp_lcd.c)
> > > > > > > >
> > > > > > > > timmings->ver_sync_time= panel_info->lcd_vspw;
> > > > > > > > timmings->ver_back_porch= panel_info->lcd_vbp-panel_info->lcd_vspw;
> > > > > > > >
> > > > > > > > vbp = panel->lcd_vbp;
> > > > > > > > vspw = panel->lcd_vspw;
> > > > > > > > dsi_dev[sel]->dsi_basic_size0.bits.vbp = vbp-vspw;
> > > > > > > > dsi_dev[sel]->dsi_basic_size0.bits.vbp = panel->lcd_vbp - panel->lcd_vspw;
> > > > > > > > =>  timmings->ver_back_porch + panel_info->lcd_vspw - panel_info->lcd_vspw
> > > > > > > > =>  timmings->ver_back_porch
> > > > > > > > =>  mode->vtotal - mode->end
> > > > > > > >
> > > > > > > > Which evatually same as mode->vtotal - mode->vsync_end so update the
> > > > > > > > same in SUN6I_DSI_BASIC_SIZE0_VBP
> > > > > > > >
> > > > > > > > On the information note, existing SUN6I_DSI_BASIC_SIZE0_VSA is proper
> > > > > > > > value.
> > > > > > > >
> > > > > > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > > > > >
> > > > > > > I've tested your changes on my A33 board, and this commit will break
> > > > > > > it.
> > > > > > >
> > > > > > > It creates vblank timeouts, and visual artifacts at the bottom of the
> > > > > > > display.
> > > > > >
> > > > > > Strange, VBP is earlier gives front porch which is anyway wrong.
> > > > > >
> > > > > > >
> > > > > > > Later commits seem to fix the issue, but will create some blanking on
> > > > > > > the upper third of the display.
> > > > > > >
> > > > > > > Since the documentation is quite sparse, and a MIPI-DSI analyzer is
> > > > > > > way too expensive, I'd really like to have at least what each of these
> > > > > > > commits are actually fixing, and what symptoms each of these were
> > > > > > > causing, and not just "the BSP does it".
> > > > > >
> > > > > > W/o this 2-lane panel is breaking, same vblank timeout and visual
> > > > > > artifacts at the bottom of the panel. though the commits may reference
> > > > > > BSP, I have at-least tested on 3 different panels for us to prove its
> > > > > > working.
> > > > > >
> > > > > > > Having some datasheet for the panels you had working would help too.
> > > > > >
> > > > > > Unfortunately datasheet doesn't have any required information what we
> > > > > > actually looking for.
> > > > >
> > > > > Not even the timings? How did you get that information then?
> > > >
> > > > datasheet has timing values, but this changes need controller
> > > > information about VBP register that I don't have. But again existing
> > > > VBP is not back porch for real, it's front porch.
> > >
> > > Yet, this breaks the existing setup. So again:
> >
> > Was it with 4-lane or 2-lane panel? can you test it with 2-lane panel?
> > I can see the issue on 2-lane but the 4-lane working fine with this
> > patch even.
>
> It's a 4 lane display.

Thanks, look like my panel timings seems reverse b/w BP and FP. It
work irrespective of this change after proper update.
