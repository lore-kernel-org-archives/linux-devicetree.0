From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 3/4] ARM: dts: sunxi: Add Allwinner H3 DTSI
Date: Tue, 8 Dec 2015 09:32:24 +0100
Message-ID: <20151208083224.GN27957@lukather>
References: <1449264283-25360-1-git-send-email-jenskuske@gmail.com>
 <1449264283-25360-4-git-send-email-jenskuske@gmail.com>
 <20151207091257.070723b67db726d9f05c6550@free.fr>
 <5665D38E.4050406@gmail.com>
 <20151208090658.e471fcde7fd5e79c69706115@free.fr>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wmhq21yAGFMoSpeN"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBGNLTKZQKGQELILCHZA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151208090658.e471fcde7fd5e79c69706115-GANU6spQydw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--wmhq21yAGFMoSpeN
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Tue, Dec 08, 2015 at 09:06:58AM +0100, Jean-Francois Moine wrote:
> On Mon, 7 Dec 2015 19:44:30 +0100
> Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
> > >> +					     "bus_lcd0", "bus_lcd1", "bus_deint",
> > 
> > > 	"bus_tcon0", "bus_tcon1", "bus_deint",
> > > 
> > > (the tcon1 clock is used by both lcd0 and lcd1, while
> > >  the tcon0 clock is used for TV output from lcd1)
> > 
> > Hi,
> > 
> > These are only the ahb bus gates, not the module clocks.
> > Naming them lcd might be a bit confusing, but it follows the naming we
> > used since sun4i. And the tcon modules are still called lcd0 and lcd1
> > module in the manual too.
> 
> There is no reference to TCON0 in the LCDs registers (H3 V1.1 pages 428
> and 435), only TCON1.
> 
> > Interestingly there is only a tcon0 module clock in the manual and no
> > tcon1, but that is not part of this patch.
> 
> Well, I looked again in the 3.4 kernel and, for the LCD0/HDMI, there is
> no clock setting for TCON1: it just receives the AHB1 clock.
> 
> This means that its gate ("bus_lcd1" or "ahb1_tcon1") must be enabled
> when streaming on LCD0 or LCD1.
> 
> The role of tcon0 is not yet clear to me, but it seems that its clock
> is the streaming clock for LCD1/TV, as the HDMI clock is for LCD0/HDMI.

If the H3 display block is done the same way than the A10 (and later)
one on this aspect, then the TCON has two channels with two different
streaming (or functional, you pick the name) clocks. The channel 0 is
usually used for RGB, the channel 1 for HDMI, composite and VGA.

Maybe they just added different bus gates for those two different
channels, and moved HDMI to the channel 0.

Anyway, that can always be changed later on if we have more clue on
what's going on.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--wmhq21yAGFMoSpeN--
