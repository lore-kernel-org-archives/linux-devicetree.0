From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/15] clk: divider: Make divider_round_rate
 take the parent clock
Date: Thu, 9 Mar 2017 11:55:35 +0100
Message-ID: <20170309105535.wdypl3j2ha4ekzyb@lukather>
References: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard@free-electrons.com>
 <7ebd073b4941e4b7c619f15ff0a375ff7919d403.1488876832.git-series.maxime.ripard@free-electrons.com>
 <20170307141157.GC10239@codeaurora.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s5ft7t2tnadun7xg"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBKHJQTDAKGQEBS6NDDA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170307141157.GC10239-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>, Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--s5ft7t2tnadun7xg
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi Stephen,

On Tue, Mar 07, 2017 at 06:11:57AM -0800, Stephen Boyd wrote:
> On 03/07, Maxime Ripard wrote:
> > So far, divider_round_rate only considers the parent clock returned by
> > clk_hw_get_parent.
> > 
> > This works fine on clocks that have a single parents, this doesn't work on
> > muxes, since we will only consider the first parent, while other parents
> > may totally be able to provide a better combination.
> > 
> > Clocks in that case cannot use divider_round_rate, so would have to come up
> > with a very similar logic to work around it. Instead of having to do
> > something like this, and duplicate that logic everywhere, give an
> > additional parameter for the parent clock to consider.
> > 
> > Current users have been converted using the following coccinelle script
> > 
> > @@
> > identifier hw, rate, prate, table, width, flags;
> > @@
> > 
> > -long divider_round_rate(struct clk_hw *hw,
> > +long divider_round_rate(struct clk_hw *hw, struct clk_hw *parent,
> >                         unsigned long rate,
> >                         unsigned long *prate,
> >                         const struct clk_div_table *table,
> >                         u8 width,
> >                         unsigned long flags) { ... }
> > 
> > @@
> > identifier fn, hw;
> > expression E2, E3, E4, E5, E6;
> > @@
> >  fn (struct clk_hw *hw, ...) {
> >  <...
> > -divider_round_rate(hw, E2, E3, E4, E5, E6)
> > +divider_round_rate(hw, clk_hw_get_parent(hw), E2, E3, E4, E5, E6)
> >  ...>
> > }
> 
> Why not introduce another function like 
> 
> 	divider_round_rate_parent()
> 	divider_round_rate_mux()
> 
> that takes the extra parent argument? Technically, a divider is
> considered to only have one parent, and if it has more than one
> parent, then it is a mux and a divider.

Yes, that would work too, without needing the cross tree change. I'll
do that in the next version.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--s5ft7t2tnadun7xg--
