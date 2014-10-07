From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: enable init rate for clock
Date: Tue, 07 Oct 2014 21:37:48 +0200
Message-ID: <3345042.lGjGYUIfnV@phil>
References: <1412674438-26160-1-git-send-email-kever.yang@rock-chips.com> <1854393.Qf7h4x8eso@phil> <CAD=FV=WwXXQ6941WuATBiNqZ0sM3EkSo-EHHoqn3uGmZdNvW5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=WwXXQ6941WuATBiNqZ0sM3EkSo-EHHoqn3uGmZdNvW5w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Addy Ke <addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jianqun Xu <xjq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, han jiang <hj-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?utf-8?B?5oi05YWL6ZyWIChKYWNrKQ==?= <dkl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Dienstag, 7. Oktober 2014, 12:20:38 schrieb Doug Anderson:
> Heiko,
>=20
> On Tue, Oct 7, 2014 at 11:27 AM, Heiko St=FCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wr=
ote:
> > Am Dienstag, 7. Oktober 2014, 10:03:19 schrieb Doug Anderson:
> >> Kever,
> >>=20
> >> On Tue, Oct 7, 2014 at 2:33 AM, Kever Yang <kever.yang@rock-chips.=
com>
> >=20
> > wrote:
> >> > We need to initialize PLL rate and some of bus clock rate while
> >> > kernel init, for there is no other module will do that.
> >> >=20
> >> > Signed-off-by: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >> > ---
> >> >=20
> >> >  arch/arm/boot/dts/rk3288.dtsi | 10 ++++++++++
> >> >  1 file changed, 10 insertions(+)
> >> >=20
> >> > diff --git a/arch/arm/boot/dts/rk3288.dtsi
> >> > b/arch/arm/boot/dts/rk3288.dtsi
> >> > index 874e66d..2f4519b 100644
> >> > --- a/arch/arm/boot/dts/rk3288.dtsi
> >> > +++ b/arch/arm/boot/dts/rk3288.dtsi
> >> > @@ -455,6 +455,16 @@
> >> >=20
> >> >                 rockchip,grf =3D <&grf>;
> >> >                 #clock-cells =3D <1>;
> >> >                 #reset-cells =3D <1>;
> >> >=20
> >> > +               assigned-clocks =3D <&cru PLL_GPLL>, <&cru PLL_C=
PLL>,
> >> > +                                 <&cru PLL_NPLL>, <&cru ACLK_CP=
U>,
> >> > +                                 <&cru HCLK_CPU>, <&cru PCLK_CP=
U>,
> >> > +                                 <&cru ACLK_PERI>, <&cru HCLK_P=
ERI>,
> >> > +                                 <&cru PCLK_PERI>;
> >> > +               assigned-clock-rates =3D <594000000>, <400000000=
>,
> >> > +                                      <500000000>, <300000000>,
> >>=20
> >> When I boot up, I see that ACLK_CPU was 297000000.  You specified
> >> 300000000.  Did you expect to get 300?  If you expected 297, I thi=
nk
> >> you should put 297.  If you expected 300 then we have some debuggi=
ng
> >> to do.  Note: I'm not quite sure how you'd expect to get 300 given
> >> that none of the PLLs divide evenly to 300...
> >=20
> > I'd think 300 is simply the target value. I.e. take the closest rat=
e <=3D
> > 300
> > MHz, same for 150 etc. I somehow like the approach of specifying wh=
at the
> > rate _should_ ideally be :-) .
> >=20
> > Also reduces the amount of thougths necessary (and possible
> > head-scratching) when adapting the pll rates to some other constrai=
nts
> > (child-clocks already have the target rates and cannot drop to some=
 even
> > stranger value).
> OK, fair enough.  I guess maybe I've overly paranoid and like to make
> sure that someone has thought through exactly what various core clock=
s
> should be and made sure that the voltage matched and that clocks were
> never out of spec.  ...but if others really like specifying more idea=
l
> values then I'm OK with it.

Especially as clocks like ACLK_CPU can select from different plls (cpll=
 and=20
gpll on the rk3288) it would be even more difficult to predict which pa=
th the=20
clock selection would take. So it makes sense to specifiy the value we =
wish for=20
and let the common-clock-framework do its magic to select the best sour=
ces.


>I will say that I'd really like the PLLs
> to be exact, though.  I think those are now...

agreed. PLL rates should be exact.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
