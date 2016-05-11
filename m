From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: Re: [PATCH v4 01/11] clk: sunxi: Add display and
 TCON0 clocks driver
Date: Wed, 11 May 2016 15:15:41 -0700
Message-ID: <20160511221541.GG3492@codeaurora.org>
References: <1461590572-4027-1-git-send-email-maxime.ripard@free-electrons.com>
 <1461590572-4027-2-git-send-email-maxime.ripard@free-electrons.com>
 <20160506223002.GE3492@codeaurora.org>
 <20160508200308.GF6167@lukather>
 <20160509223238.GW3492@codeaurora.org>
 <20160509223924.GX3492@codeaurora.org>
 <1462907459.9981.0.camel@plaes.org>
Reply-To: sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDHZXHXDRAMBBEG6Z24QKGQERLOSP4I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1462907459.9981.0.camel-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/10, Priit Laes wrote:
> On Mon, 2016-05-09 at 15:39 -0700, Stephen Boyd wrote:
> > On 05/09, Stephen Boyd wrote:
> > >=20
> > >=20
> > > Ok I applied this one to clk-next.
> > >=20
> > And I squashed this in to silence the following checker warning.
> >=20
> > drivers/clk/sunxi/clk-sun4i-display.c:110:33: warning: Variable
> > length array is used.
> >=20
> > ---8<---
> > diff --git a/drivers/clk/sunxi/clk-sun4i-display.c
> > b/drivers/clk/sunxi/clk-sun4i-display.c
> > index f02e250e64ed..f8ff6c4a5633 100644
> > --- a/drivers/clk/sunxi/clk-sun4i-display.c
> > +++ b/drivers/clk/sunxi/clk-sun4i-display.c
> > @@ -107,7 +107,7 @@ static int sun4i_a10_display_reset_xlate(struct
> > reset_controller_dev *rcdev,
> > =C2=A0static void __init sun4i_a10_display_init(struct device_node *nod=
e,
> > =C2=A0					=C2=A0=C2=A0const struct
> > sun4i_a10_display_clk_data *data)
> > =C2=A0{
> > -	const char *parents[data->parents];
> > +	const char *parents[4];
>=20
> This change breaks at least de_[bf]e clocks which have 3 clock parents.
>=20

I just used the largest data->parents number, which was 4. How
does that break anything?

--=20
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
