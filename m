From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v5 3/4] ARM: dts: sunxi: Add Allwinner H3 DTSI
Date: Tue, 8 Dec 2015 10:19:49 +0100
Message-ID: <20151208101949.4c596117eb3b6b4551dd0cea@free.fr>
References: <1449264283-25360-1-git-send-email-jenskuske@gmail.com>
	<1449264283-25360-4-git-send-email-jenskuske@gmail.com>
	<20151207091257.070723b67db726d9f05c6550@free.fr>
	<5665D38E.4050406@gmail.com>
	<20151208090658.e471fcde7fd5e79c69706115@free.fr>
	<20151208083224.GN27957@lukather>
Reply-To: moinejf-GANU6spQydw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCV6DL6LYMNBBOOBTKZQKGQEUX3OZ4A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20151208083224.GN27957@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Emilio =?ISO-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 8 Dec 2015 09:32:24 +0100
Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> If the H3 display block is done the same way than the A10 (and later)
> one on this aspect, then the TCON has two channels with two different
> streaming (or functional, you pick the name) clocks. The channel 0 is
> usually used for RGB, the channel 1 for HDMI, composite and VGA.
>=20
> Maybe they just added different bus gates for those two different
> channels, and moved HDMI to the channel 0.
>=20
> Anyway, that can always be changed later on if we have more clue on
> what's going on.

I don't know about the other Allwinner chips, and your DRM driver for
these ones cannot be reused for the H3 because its display engine
(DE.2) is completely different.

The DE2 runs at 432MHz and treats both LCDs. The TCON1 runs at a fixed
rate, 200MHz, and the streaming rates are defined by the HDMI (LCD0) and
TCON0 (LCD1) clocks.

BTW, I hope to submit a H3 DRM driver before new year.

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
