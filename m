From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v6 11/22] clk: sunxi-ng: a64: Add minimum
 rate for PLL_MIPI
Date: Tue, 29 Jan 2019 16:13:48 +0100
Message-ID: <20190129151348.mh27btttsqcmeban@flea>
References: <20190124195900.22620-1-jagan@amarulasolutions.com>
 <20190124195900.22620-12-jagan@amarulasolutions.com>
 <20190125212433.ni2jg3wvpyjazlxf@flea>
 <CAMty3ZAsH2iZ+JEqTE3D58aXfGuhMSg9YoO56ZhhOeE4c4yQHQ@mail.gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sk46bbi4mwes7v4f"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBMG3YHRAKGQEXMEHIHI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAMty3ZAsH2iZ+JEqTE3D58aXfGuhMSg9YoO56ZhhOeE4c4yQHQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--sk46bbi4mwes7v4f
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, Jan 28, 2019 at 03:06:10PM +0530, Jagan Teki wrote:
> On Sat, Jan 26, 2019 at 2:54 AM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> >
> > On Fri, Jan 25, 2019 at 01:28:49AM +0530, Jagan Teki wrote:
> > > Minimum PLL used for MIPI is 500MHz, as per manual, but
> > > lowering the min rate by 300MHz can result proper working
> > > nkms divider with the help of desired dclock rate from
> > > panel driver.
> > >
> > > Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> > > Acked-by: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >
> > Going 200MHz below the minimum doesn't seem really reasonable. What
> > is the issue that you are trying to fix here?
> >
> > It looks like it's picking bad dividers, but if that's the case, this
> > isn't the proper fix.
> 
> As I stated in earlier patches, the whole idea is pick the desired
> dclk divider based dclk rate. So the dotclock, sun4i_dclk_round_rate
> is unable to get the proper dclk divider at the end, so it eventually
> picking up wrong divider value and fired vblank timeout.
> 
> So, we come-up with optimal and working min_rate 300MHz in pll-mipi to
> get the desired clock something like below.
> [    2.415773] [drm] No driver support for vblank timestamp query.
> [    2.424116] sun4i_dclk_round_rate: min_div = 4 max_div = 127, rate = 55000000
> [    2.424172] ideal = 220000000, rounded = 0
> [    2.424176] ideal = 275000000, rounded = 0
> [    2.424194] ccu_nkm_round_rate: rate = 330000000
> [    2.424197] ideal = 330000000, rounded = 330000000
> [    2.424201] sun4i_dclk_round_rate: div = 6 rate = 55000000
> [    2.424205] sun4i_dclk_round_rate: min_div = 4 max_div = 127, rate = 55000000
> [    2.424209] ideal = 220000000, rounded = 0
> [    2.424213] ideal = 275000000, rounded = 0
> [    2.424230] ccu_nkm_round_rate: rate = 330000000
> [    2.424233] ideal = 330000000, rounded = 330000000
> [    2.424236] sun4i_dclk_round_rate: div = 6 rate = 55000000
> [    2.424253] ccu_nkm_round_rate: rate = 330000000
> [    2.424270] ccu_nkm_round_rate: rate = 330000000
> [    2.424278] sun4i_dclk_recalc_rate: val = 1, rate = 330000000
> [    2.424281] sun4i_dclk_recalc_rate: val = 1, rate = 330000000
> [    2.424306] ccu_nkm_set_rate: rate = 330000000, parent_rate = 297000000
> [    2.424309] ccu_nkm_set_rate: _nkm.n = 5
> [    2.424311] ccu_nkm_set_rate: _nkm.k = 2
> [    2.424313] ccu_nkm_set_rate: _nkm.m = 9
> [    2.424661] sun4i_dclk_set_rate div 6
> [    2.424668] sun4i_dclk_recalc_rate: val = 6, rate = 55000000
> 
> But look like this wouldn't valid for all other dclock rates, say BPI
> panel has 30MHz clock that would failed with this logic.
> 
> On the other side Allwinner BSP calculating dclk divider based on the
> SoC's. for A33 [1] it is fixed dclk divider of 4 and for A64 is is
> calculated based on the bpp/lanes.

It looks like the A64 has the same divider of 4:
https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c#L12

I think you're confusing it with the ratio between the pixel clock and
the dotclock, called dsi_div:
https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/disp_al.c#L198

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--sk46bbi4mwes7v4f--
