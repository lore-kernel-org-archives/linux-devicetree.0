From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v6 7/9] clk: mediatek: Add subsystem clocks of MT8173
Date: Thu, 6 Aug 2015 12:20:59 +0200
Message-ID: <20150806102059.GQ18700@pengutronix.de>
References: <1438676218-11310-1-git-send-email-jamesjj.liao@mediatek.com>
 <1438676218-11310-8-git-send-email-jamesjj.liao@mediatek.com>
 <20150805064605.GZ18700@pengutronix.de>
 <1438849431.27884.9.camel@mtksdaap41>
 <20150806085354.GN18700@pengutronix.de>
 <1438851644.27884.21.camel@mtksdaap41>
 <CAGS+omAAYZyZJ4+eSdu2jmwThvHg1YpVoehui_cqNp4A5fURWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGS+omAAYZyZJ4+eSdu2jmwThvHg1YpVoehui_cqNp4A5fURWg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Heiko Stubner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 06, 2015 at 05:13:21PM +0800, Daniel Kurtz wrote:
> On Thu, Aug 6, 2015 at 5:00 PM, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> > Hi Sascha,
> >
> > On Thu, 2015-08-06 at 10:53 +0200, Sascha Hauer wrote:
> >> On Thu, Aug 06, 2015 at 04:23:51PM +0800, James Liao wrote:
> >> > On Wed, 2015-08-05 at 08:46 +0200, Sascha Hauer wrote:
> >> > > On Tue, Aug 04, 2015 at 04:16:56PM +0800, James Liao wrote:
> >> > > >  static const struct mtk_fixed_clk fixed_clks[] __initconst = {
> >> > > >         FIXED_CLK(CLK_TOP_CLKPH_MCK_O, "clkph_mck_o", "clk26m", 400 * MHZ),
> >> > > >         FIXED_CLK(CLK_TOP_USB_SYSPLL_125M, "usb_syspll_125m", "clk26m", 125 * MHZ),
> >> > > > +       FIXED_CLK(CLK_TOP_DSI0_DIG, "dsi0_dig", "clk26m", 130 * MHZ),
> >> > > > +       FIXED_CLK(CLK_TOP_DSI1_DIG, "dsi1_dig", "clk26m", 130 * MHZ),
> >> > > > +       FIXED_CLK(CLK_TOP_LVDS_PXL, "lvds_pxl", "lvdspll", 148.5 * MHZ),
> >> > > > +       FIXED_CLK(CLK_TOP_LVDS_CTS, "lvds_cts", "lvdspll", 51.975 * MHZ),
> >> > >
> >> > > I would expect 51975 * KHZ here to avoid fractional numbers. Probably
> >> > > gcc calculates that during compile time so this will work as expected,
> >> > > still I'm not sure this is good style to use fractional numbers here.
> >> >
> >> > As I know all constants will be calculated in compile time, so there
> >> > should be no difference between 51.975 * MHZ and 51975 * KHz.
> >> >
> >> > > Anyway, on my system lvdspll is running at 150MHz. Are you sure there is
> >> > > a clock derived from this running at 148.5MHz? Is it really correct to
> >> > > use a fixed clock here or should it rather be lvdspll directly?
> >> >
> >> > Here is the clock hierarchy between lvdspll and lvds_pxl:
> >> >
> >> >             --------       AD_VPLL_DPIX_CK  --------   lvds_pxl  -----
> >> >            |        |--------------------->|        |---------->|
> >> >            |        |                      | cksys  |           |
> >> > LVDSPLL -->| LVDSTX |                      | buffer |           | MMSYS
> >> >            |        | AD_LVDSTX_CLKDIG_CTS | test   |  lvds_cts |
> >> >            |        |--------------------->|        |---------->|
> >> >             --------                        --------             -----
> >> >
> >> > Some clocks and blocks are not modeled into CCF. But we prefer to enable
> >> > lvdspll before enabling lvds_pxl. So I modeled lvds_pxl (and lvds_cts)
> >> > as a fixed-rate clock with a source from lvdspll.
> >> >
> >> > The frequency of these fixed-rate clocks (such as 148.5 MHz) are typical
> >> > rate. In fact, we don't care about the actual rate of these clocks. We
> >> > just care about the enable / disable sequence of them.
> >>
> >> Please either use the real rate or 0 (along with a explaining why). Using
> >> a frequency with four to five significant digits makes me think that the
> >> actual rate is very important.
> >
> > Oops, your suggestion is much different from Daniel's.
> >
> > Daniel, could you help to comment about how we model these clocks?
> 
> First of all, for clocks where the rate doesn't matter, it doesn't
> matters to what rate we set the clock.
> 
> As for the color of our shed, "the designer says these are the typical
> rates" sounds good enough to me for a "real rate", so I prefer using
> the rates in James' patch.
> 
> If not sure what Sascha's concern is, but if he insists on 0, I'm fine
> with that too.

I only find it confusing. I'd expect either the correct rate or an
obviously dummy rate. Whatever we choose a comment explaining the
background would really help here. Otherwise we won't know later
whether this 148.5 MHz rate was introduced because a) The consumers
depend on this rate being reported, b) It really is the correct rate or
c) we don't care about the rate.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
