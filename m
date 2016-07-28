From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/9] clk: sunxi-ng: mux: Add support for mux tables
Date: Thu, 28 Jul 2016 15:28:42 +0200
Message-ID: <20160728132842.GA6682@lukather>
References: <1469516671-19377-1-git-send-email-wens@csie.org>
 <1469516671-19377-5-git-send-email-wens@csie.org>
 <20160726194306.9b6aadd3d1669bd6f5a54d99@free.fr>
 <20160727065934.GD6560@lukather>
 <20160727091827.e26f72701ce5758fa29aff7a@free.fr>
 <20160727074020.GH6560@lukather>
 <20160727103649.9e6ef332847b5a5c8fac66af@free.fr>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBC4R5C6AKGQE5BAOGTY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20160727103649.9e6ef332847b5a5c8fac66af-GANU6spQydw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Wed, Jul 27, 2016 at 10:36:49AM +0200, Jean-Francois Moine wrote:
> On Wed, 27 Jul 2016 09:40:20 +0200
> Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> 
> > > > Parenting functions would also not work as expected,
> > > > clk_hw_get_parent_by_index being the obvious example, in that case
> > > > returning the empty string for an invalid parent, while it should
> > > > really return NULL.
> > > 
> > > I don't see why the clock should be orphan.
> > > Then, when a parent is "", clk_hw_get_parent_by_index() returns NULL.
> > 
> > Why? It should return NULL when there's no parent, while you
> > explicitly registered a parent.
> 
> "" is not an existing parent. It could be "none" / "dum" / "toto" / ...
> with the same result: 'this index cannot be used in mux'.

And the clock is marked as orphan, while it really isn't.

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--vkogqOf2sHV7VnPd--
