From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Re: [PATCH v2 02/15] clk: sunxi-ng: Add check for
 minimal rate to NKM PLLs
Date: Mon, 5 Nov 2018 11:11:10 +0100
Message-ID: <20181105101110.agfik3oppd6ck25c@flea>
References: <20181023155035.9101-1-jagan@amarulasolutions.com>
 <20181023155035.9101-3-jagan@amarulasolutions.com>
 <20181024180436.5n3i3z6h2yezc4cv@flea>
 <CAMty3ZC2wn-DjR+93yc-n-bAmVCHaEqR_=4XPddoo+7LjebTEg@mail.gmail.com>
 <20181029085843.3bslqwktxbp2ywk2@flea>
 <e7566001-8933-adbb-4c30-7a3f66ebae4e@openedev.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="24qnld42rl357a2y"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBP5OQDPQKGQE2GRFWKA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <e7566001-8933-adbb-4c30-7a3f66ebae4e-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Cc: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--24qnld42rl357a2y
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, Oct 29, 2018 at 06:10:47PM +0530, Jagan Teki wrote:
> On 29/10/18 2:28 PM, Maxime Ripard wrote:
> > On Thu, Oct 25, 2018 at 04:25:59PM +0530, Jagan Teki wrote:
> > > On Wed, Oct 24, 2018 at 11:34 PM Maxime Ripard
> > > <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> > > > 
> > > > On Tue, Oct 23, 2018 at 09:20:22PM +0530, Jagan Teki wrote:
> > > > > Some NKM PLLs doesn't work well when their output clock rate is set below
> > > > > certain rate.
> > > > > 
> > > > > So, add support for minimal rate for relevant PLLs.
> > > > > 
> > > > > Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> > > > > ---
> > > > > Changes for v2:
> > > > > - new patch
> > > > > 
> > > > >   drivers/clk/sunxi-ng/ccu_nkm.c | 7 +++++++
> > > > >   drivers/clk/sunxi-ng/ccu_nkm.h | 1 +
> > > > >   2 files changed, 8 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
> > > > > index 841840e35e61..d17539dc88dd 100644
> > > > > --- a/drivers/clk/sunxi-ng/ccu_nkm.c
> > > > > +++ b/drivers/clk/sunxi-ng/ccu_nkm.c
> > > > > @@ -125,6 +125,13 @@ static unsigned long ccu_nkm_round_rate(struct ccu_mux_internal *mux,
> > > > >        if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
> > > > >                rate *= nkm->fixed_post_div;
> > > > > 
> > > > > +     if (rate < nkm->min_rate) {
> > > > > +             rate = nkm->min_rate;
> > > > > +             if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
> > > > > +                     rate /= nkm->fixed_post_div;
> > > > 
> > > > I'm not sure this is right. Is the post divider taken into account to
> > > > calculate the minimum, or is the minimum on the rate before the fixed
> > > > post divider.
> > > 
> > > Since we are returning from here, we need to take care post div which
> > > is actually doing at the end of round_rate.
> > 
> > That's not my point though. Does the rate needs to be superior to min
> > / post_div, or min?
> 
> ie what I'm trying to say, since it's common code min or max should /
> post_div and PLL_MIPI doesn't use any post_div.
> 
> We need to take care post_div though the current test (PLL_MIPI) in not used
> since it's common code. just like nkmp, nm etc.
> 
> > 
> > > > 
> > > > How did you test this?
> > > 
> > > I've not used this on PLL_MIPI atleast, so I didn't test this.
> > 
> > If you've never tested this, why are you adding that code?
> 
> Like above, it's common code. otherwise might effect.

Adding untested, unverified and unneeded code is just bloat, nothing
else.

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--24qnld42rl357a2y--
