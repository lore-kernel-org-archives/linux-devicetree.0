From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v2 02/15] clk: sunxi-ng: Add check for minimal rate to NKM PLLs
Date: Thu, 25 Oct 2018 16:25:59 +0530
Message-ID: <CAMty3ZC2wn-DjR+93yc-n-bAmVCHaEqR_=4XPddoo+7LjebTEg@mail.gmail.com>
References: <20181023155035.9101-1-jagan@amarulasolutions.com>
 <20181023155035.9101-3-jagan@amarulasolutions.com> <20181024180436.5n3i3z6h2yezc4cv@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181024180436.5n3i3z6h2yezc4cv@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jernej Skrabec <jernej.skrabec@siol.net>, Vasily Khoruzhick <anarsoul@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On Wed, Oct 24, 2018 at 11:34 PM Maxime Ripard
<maxime.ripard@bootlin.com> wrote:
>
> On Tue, Oct 23, 2018 at 09:20:22PM +0530, Jagan Teki wrote:
> > Some NKM PLLs doesn't work well when their output clock rate is set below
> > certain rate.
> >
> > So, add support for minimal rate for relevant PLLs.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v2:
> > - new patch
> >
> >  drivers/clk/sunxi-ng/ccu_nkm.c | 7 +++++++
> >  drivers/clk/sunxi-ng/ccu_nkm.h | 1 +
> >  2 files changed, 8 insertions(+)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
> > index 841840e35e61..d17539dc88dd 100644
> > --- a/drivers/clk/sunxi-ng/ccu_nkm.c
> > +++ b/drivers/clk/sunxi-ng/ccu_nkm.c
> > @@ -125,6 +125,13 @@ static unsigned long ccu_nkm_round_rate(struct ccu_mux_internal *mux,
> >       if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
> >               rate *= nkm->fixed_post_div;
> >
> > +     if (rate < nkm->min_rate) {
> > +             rate = nkm->min_rate;
> > +             if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
> > +                     rate /= nkm->fixed_post_div;
>
> I'm not sure this is right. Is the post divider taken into account to
> calculate the minimum, or is the minimum on the rate before the fixed
> post divider.

Since we are returning from here, we need to take care post div which
is actually doing at the end of round_rate.

>
> How did you test this?

I've not used this on PLL_MIPI atleast, so I didn't test this.
