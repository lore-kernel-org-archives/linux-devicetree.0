From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: sunxi: Introduce Allwinner H3 support
Date: Wed, 6 May 2015 14:22:00 +0200
Message-ID: <20150506122200.GE11057@lukather>
References: <1430904693-1404-1-git-send-email-jenskuske@gmail.com>
 <1430904693-1404-2-git-send-email-jenskuske@gmail.com>
 <20150506100446.GA11057@lukather>
 <5549EBB5.8040806@gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k3qmt+ucFURmlhDS"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBH4QVCVAKGQEELX7FEY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5549EBB5.8040806-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--k3qmt+ucFURmlhDS
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Wed, May 06, 2015 at 12:23:49PM +0200, Jens Kuske wrote:
> On 06/05/15 12:04, Maxime Ripard wrote:
> > Hi,
> > 
> > On Wed, May 06, 2015 at 11:31:28AM +0200, Jens Kuske wrote:
> >> The Allwinner H3 is a quad-core Cortex-A7-based SoC. It is very similar
> >> to other sun8i family SoCs like the A23.
> >>
> >> Signed-off-by: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> ---
> >>  Documentation/devicetree/bindings/arm/sunxi.txt | 1 +
> >>  arch/arm/mach-sunxi/Kconfig                     | 2 +-
> >>  arch/arm/mach-sunxi/sunxi.c                     | 3 ++-
> >>  3 files changed, 4 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/sunxi.txt b/Documentation/devicetree/bindings/arm/sunxi.txt
> >> index 42941fd..3cb4b94 100644
> >> --- a/Documentation/devicetree/bindings/arm/sunxi.txt
> >> +++ b/Documentation/devicetree/bindings/arm/sunxi.txt
> >> @@ -9,4 +9,5 @@ using one of the following compatible strings:
> >>    allwinner,sun6i-a31
> >>    allwinner,sun7i-a20
> >>    allwinner,sun8i-a23
> >> +  allwinner,sun8i-h3
> >>    allwinner,sun9i-a80
> >> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> >> index 81502b9..47ac5b4 100644
> >> --- a/arch/arm/mach-sunxi/Kconfig
> >> +++ b/arch/arm/mach-sunxi/Kconfig
> >> @@ -35,7 +35,7 @@ config MACH_SUN7I
> >>  	select SUN5I_HSTIMER
> >>  
> >>  config MACH_SUN8I
> >> -	bool "Allwinner A23 (sun8i) SoCs support"
> >> +	bool "Allwinner A23 / H3 (sun8i) SoCs support"
> > 
> > I'd prefer that we have something similar to sun9i, just mentionning
> > the family here, instead of an ever-growing list of SoCs.
> > 
> > This used to be easy to maintain, with the new naming scheme, we
> > already have at least 4 SoCs part of sun8i.
> 
> According to Allwinners new naming scheme A20/A31/A31s are also part of
> sun8i (sun8iw[1,2]), but I think we can agree to use sun8i for the new
> SoCs, starting from A23.

Yep, we can't really change the family half-way, and using sun8i for
the newer SoCs (A23, A33, A83, H3, V*, etc.) works just as well.


-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--k3qmt+ucFURmlhDS--
