From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH 1/3] clk: sunxi: Add a driver for the CCU
Date: Fri, 1 Jul 2016 08:34:02 +0200
Message-ID: <20160701083402.4f528ca4ed7fbd4877e4ef7b@free.fr>
References: <cover.1467135898.git.moinejf@free.fr>
	<a55dc5d1a9f02dc4d71d5c21064bffebe5a7b149.1467135898.git.moinejf@free.fr>
	<20160628204502.GG5550@lukather>
	<20160629101256.93895e6ff9184efa340f69dd@free.fr>
	<20160630211635.GE5485@lukather>
Reply-To: moinejf-GANU6spQydw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCV6DL6LYMNBBZU53C5QKGQEKBIXYHQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160630211635.GE5485@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 30 Jun 2016 23:16:35 +0200
Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> > > I'm sorry, but the whole point of the initial serie was to rework and
> > > simplify things, precisely because dealing with the clk_factors code
> > > was just too difficult nowadays. And this doesn't solve anything on
> > > that aspect.
> >=20
> > In my code, all the clock factors I know about are handled.
> > Basically, the requested and the parent rates give a multiplier and a
> > divider. These ones are dispatched into the specific clock factors
> > according to their constraints.
>=20
> You missed the "simplify" part. The other reason for this serie to
> exist was to be consistent with what the other architectures are
> doing, which is not the case here either.

The other architectures have not a so complex mechanism as Allwinner's.
The 'divider'/'fractional-divider'/multiplier'/... "standard" functions
cannot be used in ou case. Your 'sunxi-ng' just add new structures to
replace them, and, in fact, you are building an other restricted
composite clock system. which will be unusable when new SoCs will
appear.

Yes, I should not have include the reset/bus gate/factor computation
stuff in my patch series. Because the only important part is to have a
flat definition of all the parameters giving this more simplification:
one structure and one source file.

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
