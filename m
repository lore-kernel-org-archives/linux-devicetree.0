From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/6] clk: sunxi: Add H3 clocks support
Date: Sat, 9 May 2015 13:29:36 +0200
Message-ID: <20150509112936.GU11057@lukather>
References: <1430904693-1404-1-git-send-email-jenskuske@gmail.com>
 <1430904693-1404-3-git-send-email-jenskuske@gmail.com>
 <CAGb2v67dHFTttPhddOo+a2Rh0jaCxHqRw=Eo3jkNnFGCOfawRQ@mail.gmail.com>
 <5549EA63.5060602@gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iBHcHRCIarfY7C0j"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBO67W6VAKGQEFQUZF5A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5549EA63.5060602-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--iBHcHRCIarfY7C0j
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Wed, May 06, 2015 at 12:18:11PM +0200, Jens Kuske wrote:
> >>  /**
> >>   * sunxi_divs_clk_setup() - Setup function for leaf divisors on clocks
> >>   *
> >> @@ -1252,6 +1288,7 @@ static const struct of_device_id clk_factors_match[] __initconst = {
> >>         {.compatible = "allwinner,sun5i-a13-ahb-clk", .data = &sun5i_a13_ahb_data,},
> >>         {.compatible = "allwinner,sun4i-a10-apb1-clk", .data = &sun4i_apb1_data,},
> >>         {.compatible = "allwinner,sun7i-a20-out-clk", .data = &sun7i_a20_out_data,},
> >> +       {.compatible = "allwinner,sun8i-h3-pll8-clk", .data = &sun8i_h3_pll8_data,},
> > 
> > Matching comment above, no need to add a new compatible for something that's
> > the same.
> 
> PLL8 doesn't have a x2 output according to User Manual, but I did it
> wrong anyway, see first comment.

Don't worry too much about that output.

It's not really an output, it's a pre-multiplier on a single
child. We're discussing with Chen-Yu about refactoring this anyway, so
it will probably go away in a near future.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--iBHcHRCIarfY7C0j--
