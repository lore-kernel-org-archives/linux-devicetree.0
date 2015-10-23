From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: dts: sunxi: Add Allwinner H3 DTSI
Date: Fri, 23 Oct 2015 20:09:27 +0200
Message-ID: <20151023180927.GJ10947@lukather>
References: <1445444428-4652-1-git-send-email-jenskuske@gmail.com>
 <1445444428-4652-2-git-send-email-jenskuske@gmail.com>
 <20151022080508.GN10947@lukather>
 <20151022102959.09f0a1f4@OPI2>
 <20151022084735.GR10947@lukather>
 <20151022105745.2cc158a3@OPI2>
 <20151022091410.GW10947@lukather>
 <5628C8E2.6040703@gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xcivb/T/gnJQjo5J"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBWPPVGYQKGQEWSJTLJY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5628C8E2.6040703-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--xcivb/T/gnJQjo5J
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Thu, Oct 22, 2015 at 01:30:42PM +0200, Jens Kuske wrote:
> On 22/10/15 11:14, Maxime Ripard wrote:
> > On Thu, Oct 22, 2015 at 10:57:45AM +0200, Jean-Francois Moine wrote:
> >> On Thu, 22 Oct 2015 10:47:35 +0200
> >> Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> >>
> >>> Not really. The uart0 reset is the bit 16, in the reset register 4.
> >>>
> >>> 4 * 32 + 16 = 44.
> >>>
> >>> Not 112, but still not 208 either.
> >>
> >> The registers are numbered 1..5, then
> >>
> >> (4 - 1) * 32 + 16 = 112
> > 
> > Not on my version, and even then, UARTs are on the last reset
> > register, which would still make 144.
> > 
> > Maxime
> > 
> 
> There are holes between reg2 and reg3 and reg4 for some reason, but even
> if we would correct that with some of_xlate() function they won't
> completely line up with the gates.

Indeed. Still, dealing with the holes and sticking to what the
datasheet says seems like the right solution.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--xcivb/T/gnJQjo5J--
