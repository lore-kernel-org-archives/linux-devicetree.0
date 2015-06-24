From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: mt8173: add clock_null
Date: Wed, 24 Jun 2015 12:24:42 +0200
Message-ID: <1510058.fTE6dlSRsH@diego>
References: <1434605351-64592-1-git-send-email-eddie.huang@mediatek.com> <8860488.JuX1EN5tWB@diego> <1435132455.28866.21.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435132455.28866.21.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi James,

Am Mittwoch, 24. Juni 2015, 15:54:15 schrieb James Liao:
> On Mon, 2015-06-22 at 14:53 +0200, Heiko St=FCbner wrote:
> > Hi James,
> >=20
> > Am Montag, 22. Juni 2015, 11:38:37 schrieb James Liao:
> > > On Fri, 2015-06-19 at 13:36 +0200, Heiko Stuebner wrote:
> > >=20
> > > Some clocks such as clkph_mck_o, we don't really care where they =
come
> > > from and what frequencies are. We model these clocks just because=
 they
> > > or their derived clocks can be the source of topckgen muxes. Is t=
here a
> > > better way to model "don't care" clocks?
> >=20
> > There are two different concepts at work here. You might not care i=
n your
> > kernel driver implementation _at the moment_ where the clocks come =
from;
> > but the devicetree is supposed to model how the hardware is structu=
red
> > and not contain implementation specific details.
>=20
> If we model "don't care" clocks inside the driver (i.e. create clk_nu=
ll
> in clock driver), then we don't need to model the dummy clock in devi=
ce.
> Is it an acceptable way?
>=20
> > So the clock tree should be modeled according to how the hardware i=
s layed
> > out not how you want to use the clocks at the moment :-) .
> >=20
> > It would it any case be good, if you could describe where these clo=
cks
> > come
> > from in the hardware, so we can find the best solution on how to mo=
del
> > those.
> In fact, I don't know where these clocks come from at all, especially
> when they come from outside of SoC. Besides, some clocks don't need t=
o
> model in CCF, but they can be the source of clocks that controlled by
> CCF.

If a clock is used inside the ccf driver, its tree should be modeled ac=
cording=20
to the hardware - including these external clocks. Somebody (at least s=
ome=20
chip designer or so) should know where these clocks actually come from =
;-) .


> I don't think ALL clocks on a SoC need to be handled in CCF, so there
> should be some clocks don't have a "real" or "correct" parent. In
> current implementation I use a dummy clock (clk_null) to be the unrea=
l
> parent.

You are right that not all clocks needs to be implemented in a ccf _dri=
ver_,=20
but as the devicetree binding describes the hardware and is supposed to=
 be=20
stable and (nearly) unchangeable outside-connections of the clock block=
 need=20
to be defined carefully.


> Do you think we should model as more clocks as we can in CCF even we
> don't need them? If no, how do we handle those clocks which are not
> handled in CCF but can be parent of CCF clocks?

In general I think everything that has a connection to the outside (ext=
ernal=20
source clock and clocks used by soc ips) should be modeled precisely. W=
hat=20
then happens inside the clock controller is less important, as it norma=
lly can=20
be fixed later on too.


Citing my own code [which got inspired on how Samsung did this], Rockch=
ip=20
clock controllers also have numerous possible external clock inputs wit=
h only=20
the 24MHz oscillator being required [0].

All the other clocks may or may not be present. For example xin32k norm=
ally=20
comes from an i2c-connected rtc or pmic chip which gets probed a lot la=
ter in=20
the boot process, so we rely on the orphan-handling of the ccf for thes=
e.


So please really try to find out what these clocks are in the first pla=
ce ...=20
somebody must know this ;-)


Heiko


[0]=20
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/devicetree/bindings/clock/rockchip,rk3288-cru.txt#n26


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
