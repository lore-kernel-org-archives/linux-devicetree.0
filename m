From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v5 3/4] ARM: dts: sunxi: Add Allwinner H3 DTSI
Date: Tue, 8 Dec 2015 09:06:58 +0100
Message-ID: <20151208090658.e471fcde7fd5e79c69706115@free.fr>
References: <1449264283-25360-1-git-send-email-jenskuske@gmail.com>
	<1449264283-25360-4-git-send-email-jenskuske@gmail.com>
	<20151207091257.070723b67db726d9f05c6550@free.fr>
	<5665D38E.4050406@gmail.com>
Reply-To: moinejf-GANU6spQydw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCV6DL6LYMNBBKE7TKZQKGQEMXAOEPQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <5665D38E.4050406-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Emilio =?ISO-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 7 Dec 2015 19:44:30 +0100
Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> >> +					     "bus_lcd0", "bus_lcd1", "bus_deint",
>=20
> > 	"bus_tcon0", "bus_tcon1", "bus_deint",
> >=20
> > (the tcon1 clock is used by both lcd0 and lcd1, while
> >  the tcon0 clock is used for TV output from lcd1)
>=20
> Hi,
>=20
> These are only the ahb bus gates, not the module clocks.
> Naming them lcd might be a bit confusing, but it follows the naming we
> used since sun4i. And the tcon modules are still called lcd0 and lcd1
> module in the manual too.

There is no reference to TCON0 in the LCDs registers (H3 V1.1 pages 428
and 435), only TCON1.

> Interestingly there is only a tcon0 module clock in the manual and no
> tcon1, but that is not part of this patch.

Well, I looked again in the 3.4 kernel and, for the LCD0/HDMI, there is
no clock setting for TCON1: it just receives the AHB1 clock.

This means that its gate ("bus_lcd1" or "ahb1_tcon1") must be enabled
when streaming on LCD0 or LCD1.

The role of tcon0 is not yet clear to me, but it seems that its clock
is the streaming clock for LCD1/TV, as the HDMI clock is for LCD0/HDMI.

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
