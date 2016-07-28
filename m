From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH 4/9] clk: sunxi-ng: mux: Add support for mux tables
Date: Thu, 28 Jul 2016 16:23:05 +0200
Message-ID: <20160728162305.b157e6a8073c7db375f2b5d3@free.fr>
References: <1469516671-19377-1-git-send-email-wens@csie.org>
	<1469516671-19377-5-git-send-email-wens@csie.org>
	<20160726194306.9b6aadd3d1669bd6f5a54d99@free.fr>
	<20160727065934.GD6560@lukather>
	<20160727091827.e26f72701ce5758fa29aff7a@free.fr>
	<20160727074020.GH6560@lukather>
	<20160727103649.9e6ef332847b5a5c8fac66af@free.fr>
	<20160728132842.GA6682@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160728132842.GA6682@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 28 Jul 2016 15:28:42 +0200
Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> On Wed, Jul 27, 2016 at 10:36:49AM +0200, Jean-Francois Moine wrote:
> > On Wed, 27 Jul 2016 09:40:20 +0200
> > Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> >=20
> > > > > Parenting functions would also not work as expected,
> > > > > clk_hw_get_parent_by_index being the obvious example, in that=
 case
> > > > > returning the empty string for an invalid parent, while it sh=
ould
> > > > > really return NULL.
> > > >=20
> > > > I don't see why the clock should be orphan.
> > > > Then, when a parent is "", clk_hw_get_parent_by_index() returns=
 NULL.
> > >=20
> > > Why? It should return NULL when there's no parent, while you
> > > explicitly registered a parent.
> >=20
> > "" is not an existing parent. It could be "none" / "dum" / "toto" /=
 ...
> > with the same result: 'this index cannot be used in mux'.
>=20
> And the clock is marked as orphan, while it really isn't.

Sorry for I don't follow you.

A clock is orphan when it has no parent. In our case, there are many
possible parents and, at startup time, the hardware or the boot sets
the mux to point to a real parent, with an index out of the usused
values.
Yes, the clock may be orphan, as the other clocks, but just the time
this real parent becomes visible.

So, how could such a clock stay marked as orphan?

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
