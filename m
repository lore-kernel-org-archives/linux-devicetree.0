From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: enable init rate for clock
Date: Tue, 7 Oct 2014 14:10:12 -0700
Message-ID: <CAD=FV=WnSM1swHG7aEFk0ox11QmhMHM=WX6gD9jzPbXtUqnfTg@mail.gmail.com>
References: <1412674438-26160-1-git-send-email-kever.yang@rock-chips.com>
	<1854393.Qf7h4x8eso@phil>
	<CAD=FV=WwXXQ6941WuATBiNqZ0sM3EkSo-EHHoqn3uGmZdNvW5w@mail.gmail.com>
	<3345042.lGjGYUIfnV@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3345042.lGjGYUIfnV@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Addy Ke <addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jianqun Xu <xjq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, han jiang <hj-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?UTF-8?B?5oi05YWL6ZyWIChKYWNrKQ==?= <dkl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Oct 7, 2014 at 12:37 PM, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> w=
rote:
> Am Dienstag, 7. Oktober 2014, 12:20:38 schrieb Doug Anderson:
>> Heiko,
>>
>> On Tue, Oct 7, 2014 at 11:27 AM, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org=
> wrote:
>> > Am Dienstag, 7. Oktober 2014, 10:03:19 schrieb Doug Anderson:
>> >> Kever,
>> >>
>> >> On Tue, Oct 7, 2014 at 2:33 AM, Kever Yang <kever.yang@rock-chips=
=2Ecom>
>> >
>> > wrote:
>> >> > We need to initialize PLL rate and some of bus clock rate while
>> >> > kernel init, for there is no other module will do that.
>> >> >
>> >> > Signed-off-by: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> >> > ---
>> >> >
>> >> >  arch/arm/boot/dts/rk3288.dtsi | 10 ++++++++++
>> >> >  1 file changed, 10 insertions(+)
>> >> >
>> >> > diff --git a/arch/arm/boot/dts/rk3288.dtsi
>> >> > b/arch/arm/boot/dts/rk3288.dtsi
>> >> > index 874e66d..2f4519b 100644
>> >> > --- a/arch/arm/boot/dts/rk3288.dtsi
>> >> > +++ b/arch/arm/boot/dts/rk3288.dtsi
>> >> > @@ -455,6 +455,16 @@
>> >> >
>> >> >                 rockchip,grf =3D <&grf>;
>> >> >                 #clock-cells =3D <1>;
>> >> >                 #reset-cells =3D <1>;
>> >> >
>> >> > +               assigned-clocks =3D <&cru PLL_GPLL>, <&cru PLL_=
CPLL>,
>> >> > +                                 <&cru PLL_NPLL>, <&cru ACLK_C=
PU>,
>> >> > +                                 <&cru HCLK_CPU>, <&cru PCLK_C=
PU>,
>> >> > +                                 <&cru ACLK_PERI>, <&cru HCLK_=
PERI>,
>> >> > +                                 <&cru PCLK_PERI>;
>> >> > +               assigned-clock-rates =3D <594000000>, <40000000=
0>,
>> >> > +                                      <500000000>, <300000000>=
,
>> >>
>> >> When I boot up, I see that ACLK_CPU was 297000000.  You specified
>> >> 300000000.  Did you expect to get 300?  If you expected 297, I th=
ink
>> >> you should put 297.  If you expected 300 then we have some debugg=
ing
>> >> to do.  Note: I'm not quite sure how you'd expect to get 300 give=
n
>> >> that none of the PLLs divide evenly to 300...
>> >
>> > I'd think 300 is simply the target value. I.e. take the closest ra=
te <=3D
>> > 300
>> > MHz, same for 150 etc. I somehow like the approach of specifying w=
hat the
>> > rate _should_ ideally be :-) .
>> >
>> > Also reduces the amount of thougths necessary (and possible
>> > head-scratching) when adapting the pll rates to some other constra=
ints
>> > (child-clocks already have the target rates and cannot drop to som=
e even
>> > stranger value).
>> OK, fair enough.  I guess maybe I've overly paranoid and like to mak=
e
>> sure that someone has thought through exactly what various core cloc=
ks
>> should be and made sure that the voltage matched and that clocks wer=
e
>> never out of spec.  ...but if others really like specifying more ide=
al
>> values then I'm OK with it.
>
> Especially as clocks like ACLK_CPU can select from different plls (cp=
ll and
> gpll on the rk3288) it would be even more difficult to predict which =
path the
> clock selection would take. So it makes sense to specifiy the value w=
e wish for
> and let the common-clock-framework do its magic to select the best so=
urces.
>
>
>>I will say that I'd really like the PLLs
>> to be exact, though.  I think those are now...
>
> agreed. PLL rates should be exact.

OK, fair enough.  Then you can give my:

Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Tested-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

=2E..of course I'd still like comments addressed for part 1 of this ser=
ies.  ;)

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
