From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v6 11/22] clk: sunxi-ng: a64: Add minimum rate for PLL_MIPI
Date: Fri, 1 Feb 2019 22:03:53 +0530
Message-ID: <CAMty3ZBzUKfXW33JE6BGc8WOrcW1pGZH91x-2C9BLY-LDQRLgg@mail.gmail.com>
References: <20190124195900.22620-1-jagan@amarulasolutions.com>
 <20190124195900.22620-12-jagan@amarulasolutions.com> <20190125212433.ni2jg3wvpyjazlxf@flea>
 <CAMty3ZAsH2iZ+JEqTE3D58aXfGuhMSg9YoO56ZhhOeE4c4yQHQ@mail.gmail.com>
 <20190129151348.mh27btttsqcmeban@flea> <CAMty3ZAjAoti8Zu80c=OyCA+u-jtQnkidsKSNz_c2OaRswqc3w@mail.gmail.com>
 <20190201143102.rcvrxstc365mezvx@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190201143102.rcvrxstc365mezvx@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>, Michael Trimarchi <michael@amarulasolutions.com>, linux-amarula@amarulasolutions.com, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 1, 2019 at 8:01 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Tue, Jan 29, 2019 at 11:01:31PM +0530, Jagan Teki wrote:
> > On Tue, Jan 29, 2019 at 8:43 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > >
> > > On Mon, Jan 28, 2019 at 03:06:10PM +0530, Jagan Teki wrote:
> > > > On Sat, Jan 26, 2019 at 2:54 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > > > >
> > > > > On Fri, Jan 25, 2019 at 01:28:49AM +0530, Jagan Teki wrote:
> > > > > > Minimum PLL used for MIPI is 500MHz, as per manual, but
> > > > > > lowering the min rate by 300MHz can result proper working
> > > > > > nkms divider with the help of desired dclock rate from
> > > > > > panel driver.
> > > > > >
> > > > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > > > > Acked-by: Stephen Boyd <sboyd@kernel.org>
> > > > >
> > > > > Going 200MHz below the minimum doesn't seem really reasonable. What
> > > > > is the issue that you are trying to fix here?
> > > > >
> > > > > It looks like it's picking bad dividers, but if that's the case, this
> > > > > isn't the proper fix.
> > > >
> > > > As I stated in earlier patches, the whole idea is pick the desired
> > > > dclk divider based dclk rate. So the dotclock, sun4i_dclk_round_rate
> > > > is unable to get the proper dclk divider at the end, so it eventually
> > > > picking up wrong divider value and fired vblank timeout.
> > > >
> > > > So, we come-up with optimal and working min_rate 300MHz in pll-mipi to
> > > > get the desired clock something like below.
> > > > [    2.415773] [drm] No driver support for vblank timestamp query.
> > > > [    2.424116] sun4i_dclk_round_rate: min_div = 4 max_div = 127, rate = 55000000
> > > > [    2.424172] ideal = 220000000, rounded = 0
> > > > [    2.424176] ideal = 275000000, rounded = 0
> > > > [    2.424194] ccu_nkm_round_rate: rate = 330000000
> > > > [    2.424197] ideal = 330000000, rounded = 330000000
> > > > [    2.424201] sun4i_dclk_round_rate: div = 6 rate = 55000000
> > > > [    2.424205] sun4i_dclk_round_rate: min_div = 4 max_div = 127, rate = 55000000
> > > > [    2.424209] ideal = 220000000, rounded = 0
> > > > [    2.424213] ideal = 275000000, rounded = 0
> > > > [    2.424230] ccu_nkm_round_rate: rate = 330000000
> > > > [    2.424233] ideal = 330000000, rounded = 330000000
> > > > [    2.424236] sun4i_dclk_round_rate: div = 6 rate = 55000000
> > > > [    2.424253] ccu_nkm_round_rate: rate = 330000000
> > > > [    2.424270] ccu_nkm_round_rate: rate = 330000000
> > > > [    2.424278] sun4i_dclk_recalc_rate: val = 1, rate = 330000000
> > > > [    2.424281] sun4i_dclk_recalc_rate: val = 1, rate = 330000000
> > > > [    2.424306] ccu_nkm_set_rate: rate = 330000000, parent_rate = 297000000
> > > > [    2.424309] ccu_nkm_set_rate: _nkm.n = 5
> > > > [    2.424311] ccu_nkm_set_rate: _nkm.k = 2
> > > > [    2.424313] ccu_nkm_set_rate: _nkm.m = 9
> > > > [    2.424661] sun4i_dclk_set_rate div 6
> > > > [    2.424668] sun4i_dclk_recalc_rate: val = 6, rate = 55000000
> > > >
> > > > But look like this wouldn't valid for all other dclock rates, say BPI
> > > > panel has 30MHz clock that would failed with this logic.
> > > >
> > > > On the other side Allwinner BSP calculating dclk divider based on the
> > > > SoC's. for A33 [1] it is fixed dclk divider of 4 and for A64 is is
> > > > calculated based on the bpp/lanes.
> > >
> > > It looks like the A64 has the same divider of 4:
> > > https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c#L12
> > >
> > > I think you're confusing it with the ratio between the pixel clock and
> > > the dotclock, called dsi_div:
> > > https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/disp_al.c#L198
> >
> > Ahh.. I thought this initially but as far as DSI clock computation is
> > concern, the L12 tcon_div is local variable which is used for edge0
> > computation in burst mode and not for the dsi clock computation. Since
> > the BSP is unable to get the tcon_div during edge0 computation, they
> > defined it locally I think.
> >
> > You can see the lcd_clk_config() code [2], where we can see DSI clock
> > computation using dsi_div value.
> >
> > Here is dump after the in Line 792 which is after computation[3]
> > [   10.800737] lcd_clk_config: dsi_div = 6, tcon_div = 4, lcd_div = 1
> > [   10.800743] lcd_clk_config: lcd_dclk_freq = 55, dclk_rate = 55000000
> > [   10.800749] lcd_clk_config: lcd_rate = 330000000, pll_rate = 330000000
> >
> > The above dump the lcd_rate 330MHz is computed with panel clock, 55MHz
> > into dsi_div 6. So this can be our actual divider values dclk_min_div,
> > dclk_max_div in sun4i_dclk_round_rate (from
> > drivers/gpu/drm/sun4i/sun4i_dotclock.c)
>
> I wish it was in your commit log in the first place, instead of having
> to exchange multiple mails over this.
>
> However, I don't think that's quite true, and it might be a bug in
> Allwinner's implementation (or rather something quite confusing).
>
> You're right that the lcd_rate and pll_rate seem to be generated from
> the pixel clock, and it indeed looks like the ratio between the pixel
> clock and the TCON dotclock is defined through the number of bits per
> lanes.
>
> However, in this case, dsi_rate is actually the same than lcd_rate,
> since pll_rate is going to be divided by dsi_div:
> https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/disp_lcd.c#L791
>
> Since lcd_div is 1, it also means that in this case, dsi_rate ==
> dclk_rate.

Yes, but the lcd_rate and dsi_rate are not same, since dsi_rate is
again computed as dsi_div with pll_rate.

lcd_rate = dclk_rate * 6;
pll_rate = lcd_rate * 1;
dsi_rate = pll_rate / 6;

[   14.719981] tcon_div = 4, lcd_div = 1, dsi_div = 6, dsi_rate = 148500000
[   14.722666] dsi_div = 6, lcd_div = 1
[   14.722695] [DISP]disp_module_init finish
[   14.727699] lcd_rate = 180000000, pll_rate = 180000000
[   14.730269] dsi_rate = 30000000

> The DSI module clock however, is always set to 148.5 MHz. Indeed, if
> we look at:
> https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/disp_lcd.c#L804
>
> We can see that the rate in clk_info is used if it's different than
> 0. This is filled by disp_al_lcd_get_clk_info, which, in the case of a
> DSI panel, will hardcode it to 148.5 MHz:
> https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/disp_al.c#L164
>
> So, the DSI clock is set to this here:
> https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/disp_lcd.c#L805
>
> The TCON *module* clock (the one in the clock controller) has been set
> to lcd_rate (so the pixel clock times the number of bits per lane) here:
> https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/disp_lcd.c#L800
>
> And the PLL has been set to the same rate here:
> https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/disp_lcd.c#L794
>
> Let's take a step back now: that function we were looking at,
> lcd_clk_config, is called by lcd_clk_enable, which is in turn called
> by disp_lcd_enable here:
> https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/disp_lcd.c#L1328
>
> The next function being called is disp_al_lcd_cfg, and that function
> will hardcode the TCON dotclock divider to 4, here:
> https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/disp_al.c#L240

Haa.. this is reason I have TCON_DCLK register value is 4 in BSP
# devmem 0x01c0c044
0xF0000004

> So, in the end, the dotclock divider is always 4, the DSI module clock
> is set to 148.5 MHz, and the TCON module clock is set to 330MHz. Since
> the TCON module clock doesn't have a divider, the PLL is set at that
> same value but this is redundant.

330 or 180MHz. if we have pixel clock 30MHz with 6 div value it's 180MHz.

>
> I'll experiment with this and try to see how it works on the A33.

OK, thanks. will try digging further on this from my side as well.
