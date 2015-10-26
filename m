From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: dts: sunxi: Add Allwinner H3 DTSI
Date: Mon, 26 Oct 2015 22:06:23 +0100
Message-ID: <20151026210623.GB10947@lukather>
References: <1445444428-4652-1-git-send-email-jenskuske@gmail.com>
 <1445444428-4652-2-git-send-email-jenskuske@gmail.com>
 <20151023181406.GK10947@lukather>
 <20151023212013.50bcbe4a@OPI2>
 <20151024071328.GQ10947@lukather>
 <20151024104749.179dab64@OPI2>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i+pmTOJ7usc0SF/I"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBUNLXKYQKGQETWO35QA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151024104749.179dab64@OPI2>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--i+pmTOJ7usc0SF/I
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sat, Oct 24, 2015 at 10:47:49AM +0200, Jean-Francois Moine wrote:
> On Sat, 24 Oct 2015 09:13:28 +0200
> Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> 
> > Or simply
> > 
> > bus_gates {
> > 	clocks = <&ahb1>, <&ahb2>;
> > 	clock-indices = <5>, <6>, <8>, ...
> > 	clock-output-names = "bus_ce", "bus_dma", "bus_mmc0"
> > };
> 
> I don't understand: the apb1, apb2, ahb1 and ahb2 clocks may be
> programmed independently to different frequencies

I don't understand why you're talking about frequencies here.

> and you have to know which of them is the parent of each leaf clock.

Indeed, but that's also doable here. Just not in the DT.

> So, either you hard-code the parents as Jens did in a first proposal,
> or you define the full list of parents in the DT as in the last
> proposal, or you use a container per parent in the DT as I proposed.
> 
> There could be an other solution using the output clock name to define
> the parent clock:
> 
> bus_gates {
> 	clocks = <&ahb1>, <&ahb2>, <&apb1>, <&apb2>;
> 	clock-indices = <5>, <6>, <8>, ...
> 	clock-output-names = "ahb1_ce", "ahb1_dma", "ahb1_mmc0"
> };
> 
> with the documentation:
> 
> 	"the clocks MUST be defined in order: ahb1, ahb2, apb1, apb2."
> 
> and the code
> 
> 	if (strncmp(clock_name, "ahb1", 4) == 0)
> 		clk_parent = of_clk_get_parent_name(node, 0);
> 	else if (..)
> 
> but it seems a bit hacky.

It's exactly what I suggested, without the string comparison, but
relying on the ID instead.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--i+pmTOJ7usc0SF/I--
