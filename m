From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: mt8173: add clock_null
Date: Wed, 24 Jun 2015 15:54:15 +0800
Message-ID: <1435132455.28866.21.camel@mtksdaap41>
References: <1434605351-64592-1-git-send-email-eddie.huang@mediatek.com>
	 <8371528.SNAmOgosfF@phil> <1434944317.25948.8.camel@mtksdaap41>
	 <8860488.JuX1EN5tWB@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8860488.JuX1EN5tWB@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On Mon, 2015-06-22 at 14:53 +0200, Heiko St=FCbner wrote:
> Hi James,
>=20
> Am Montag, 22. Juni 2015, 11:38:37 schrieb James Liao:
> > On Fri, 2015-06-19 at 13:36 +0200, Heiko Stuebner wrote:
> >=20
> > Some clocks such as clkph_mck_o, we don't really care where they co=
me
> > from and what frequencies are. We model these clocks just because t=
hey
> > or their derived clocks can be the source of topckgen muxes. Is the=
re a
> > better way to model "don't care" clocks?
>=20
> There are two different concepts at work here. You might not care in =
your=20
> kernel driver implementation _at the moment_ where the clocks come fr=
om; but=20
> the devicetree is supposed to model how the hardware is structured an=
d not=20
> contain implementation specific details.

If we model "don't care" clocks inside the driver (i.e. create clk_null
in clock driver), then we don't need to model the dummy clock in device=
=2E
Is it an acceptable way?

> So the clock tree should be modeled according to how the hardware is =
layed out=20
> not how you want to use the clocks at the moment :-) .
>=20
> It would it any case be good, if you could describe where these clock=
s come=20
> from in the hardware, so we can find the best solution on how to mode=
l those.

In fact, I don't know where these clocks come from at all, especially
when they come from outside of SoC. Besides, some clocks don't need to
model in CCF, but they can be the source of clocks that controlled by
CCF.

I don't think ALL clocks on a SoC need to be handled in CCF, so there
should be some clocks don't have a "real" or "correct" parent. In
current implementation I use a dummy clock (clk_null) to be the unreal
parent.

Do you think we should model as more clocks as we can in CCF even we
don't need them? If no, how do we handle those clocks which are not
handled in CCF but can be parent of CCF clocks?


Best regards,

James


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
