From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: mt8173: add clock_null
Date: Tue, 30 Jun 2015 17:07:09 +0800
Message-ID: <1435655229.19330.15.camel@mtksdaap41>
References: <1434605351-64592-1-git-send-email-eddie.huang@mediatek.com>
	 <8860488.JuX1EN5tWB@diego> <1435132455.28866.21.camel@mtksdaap41>
	 <1510058.fTE6dlSRsH@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1510058.fTE6dlSRsH@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, ted.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2015-06-24 at 12:24 +0200, Heiko St=FCbner wrote:
> Am Mittwoch, 24. Juni 2015, 15:54:15 schrieb James Liao:
> > On Mon, 2015-06-22 at 14:53 +0200, Heiko St=FCbner wrote:
> > > Am Montag, 22. Juni 2015, 11:38:37 schrieb James Liao:
> > > > On Fri, 2015-06-19 at 13:36 +0200, Heiko Stuebner wrote:
> > > > Some clocks such as clkph_mck_o, we don't really care where the=
y come
> > > > from and what frequencies are. We model these clocks just becau=
se they
> > > > or their derived clocks can be the source of topckgen muxes. Is=
 there a
> > > > better way to model "don't care" clocks?
> > >=20
> > > There are two different concepts at work here. You might not care=
 in your
> > > kernel driver implementation _at the moment_ where the clocks com=
e from;
> > > but the devicetree is supposed to model how the hardware is struc=
tured
> > > and not contain implementation specific details.
> >=20
> > If we model "don't care" clocks inside the driver (i.e. create clk_=
null
> > in clock driver), then we don't need to model the dummy clock in de=
vice.
> > Is it an acceptable way?
> >=20
> > > So the clock tree should be modeled according to how the hardware=
 is layed
> > > out not how you want to use the clocks at the moment :-) .
> > >=20
> > > It would it any case be good, if you could describe where these c=
locks
> > > come
> > > from in the hardware, so we can find the best solution on how to =
model
> > > those.
> > In fact, I don't know where these clocks come from at all, especial=
ly
> > when they come from outside of SoC. Besides, some clocks don't need=
 to
> > model in CCF, but they can be the source of clocks that controlled =
by
> > CCF.
>=20
> If a clock is used inside the ccf driver, its tree should be modeled =
according=20
> to the hardware - including these external clocks. Somebody (at least=
 some=20
> chip designer or so) should know where these clocks actually come fro=
m ;-) .
>=20
>=20
> > I don't think ALL clocks on a SoC need to be handled in CCF, so the=
re
> > should be some clocks don't have a "real" or "correct" parent. In
> > current implementation I use a dummy clock (clk_null) to be the unr=
eal
> > parent.
>=20
> You are right that not all clocks needs to be implemented in a ccf _d=
river_,=20
> but as the devicetree binding describes the hardware and is supposed =
to be=20
> stable and (nearly) unchangeable outside-connections of the clock blo=
ck need=20
> to be defined carefully.
>=20
>=20
> > Do you think we should model as more clocks as we can in CCF even w=
e
> > don't need them? If no, how do we handle those clocks which are not
> > handled in CCF but can be parent of CCF clocks?
>=20
> In general I think everything that has a connection to the outside (e=
xternal=20
> source clock and clocks used by soc ips) should be modeled precisely.=
 What=20
> then happens inside the clock controller is less important, as it nor=
mally can=20
> be fixed later on too.
>=20
>=20
> Citing my own code [which got inspired on how Samsung did this], Rock=
chip=20
> clock controllers also have numerous possible external clock inputs w=
ith only=20
> the 24MHz oscillator being required [0].
>=20
> All the other clocks may or may not be present. For example xin32k no=
rmally=20
> comes from an i2c-connected rtc or pmic chip which gets probed a lot =
later in=20
> the boot process, so we rely on the orphan-handling of the ccf for th=
ese.
>=20
>=20
> So please really try to find out what these clocks are in the first p=
lace ...=20
> somebody must know this ;-)
>=20
>=20
> Heiko
>=20
>=20
> [0]=20
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/devicetree/bindings/clock/rockchip,rk3288-cru.txt#n26

Hi Heiko,

There are 4 clocks which are derived from clk_null directly in current
topckgen implementation:

	clkph_mck_o, dpi_ck, usb_syspll_125m, hdmitx_dig_cts

Our designer mentioned 2 things about external clocks:

1. These 4 clocks come from analog macro, not from PLL, nor from
external clocks directly.

2. MT8173 only has 2 external clocks: 26M and 32K.

Analog macro may refer to 26M or other clocks to generate clocks with
specified frequency. But we don't know and don't care how they generate
these clocks. So we want to use a dummy clock to be the root of these 4
clocks.


Hi Sascha,

Do you have any suggestion on clk_null?


Best regards,

James


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
