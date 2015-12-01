From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: soc: add document for rockchip reboot notifier driver
Date: Tue, 01 Dec 2015 16:47:36 +0100
Message-ID: <10512572.1QQvFtIA3T@diego>
References: <1447840044-19689-1-git-send-email-andy.yan@rock-chips.com> <CANbgqARHxXorh8Svuw7tHMT60=j35BEqhMnuCOB6u6-d0NPxEQ@mail.gmail.com> <CANbgqARCYP0rfTPSJLNEnCdrb1+mCYYznnRVH6o8Bj5sWt9fDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANbgqARCYP0rfTPSJLNEnCdrb1+mCYYznnRVH6o8Bj5sWt9fDw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Yan <andyshrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Ben Chan <benchan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Andy,

Am Dienstag, 1. Dezember 2015, 23:10:15 schrieb Andy Yan:
> 2015-11-23 21:15 GMT+08:00 Andy Yan <andyshrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> > 2015-11-20 9:58 GMT+08:00 Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
> >> On Thu, Nov 19, 2015 at 7:16 PM, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org=
>
> >>=20
> >> wrote:
> >> > On 2015=E5=B9=B411=E6=9C=8819=E6=97=A5 12:35, Heiko Stuebner wro=
te:
> >> >> Am Donnerstag, 19. November 2015, 09:17:37 schrieb Andy Yan:
> >> >>> On 2015=E5=B9=B411=E6=9C=8819=E6=97=A5 06:59, Rob Herring wrot=
e:
> >> >>>> On Wed, Nov 18, 2015 at 05:53:30PM +0800, Andy Yan wrote:
> >> >>>>> Add devicetree binding document for rockchip reboot nofifier=
 driver
> >> >>>>=20
> >> >>>> Just reading the subject this is way too specific to the Linu=
x
> >> >>>> driver
> >> >>>> needs rather than a h/w description. Please don't create fake=
 DT
> >>=20
> >> nodes
> >>=20
> >> >>>> just to bind to drivers. Whatever &pmu is is probably what sh=
ould
> >>=20
> >> have
> >>=20
> >> >>>> the DT node. Let the driver for it create child devices if yo=
u need
> >> >>>> that.
> >> >>>>=20
> >> >>>       This is note a fake DT nodes, we really need it to tell =
the
> >>=20
> >> driver
> >>=20
> >> >>>        which register to use to store the reboot mode. Because
> >>=20
> >> rockchip
> >>=20
> >> >>>        use different register file to store the reboot mode on
> >>=20
> >> different
> >>=20
> >> >>>        platform, on rk3066,rk3188, rk3288,it use  one of the P=
MU
> >> >>>=20
> >> >>> register, on
> >> >>>=20
> >> >>>        the incoming RK3036, it use one of the GRF register, an=
d it
> >> >>>        use
> >> >>>=20
> >> >>> one  of
> >> >>>=20
> >> >>>        the PMUGRF register for arm64 platform rk3368. On the o=
ther
> >>=20
> >> hand,
> >>=20
> >> >>> the
> >> >>>=20
> >> >>>        PMU/GRF/PMUGRF register file are mapped as "syscon", th=
en
> >> >>>=20
> >> >>> referenced
> >> >>>=20
> >> >>>        by other DT nodes by phandle. So maybe let it as a sepa=
rate DT
> >> >>>=20
> >> >>> node here
> >> >>>=20
> >> >>>        is better.
> >> >>=20
> >> >> or alternatively we could do something similar to what the bl-s=
witcher
> >> >> cupfreq-driver does. Take a look at
> >> >>=20
> >> >> drivers/cpufreq/arm_big_little.c
> >> >> drivers/clk/clk-mb86s7x.c
> >> >>=20
> >> >> We already have the core restart-handler code in the clock-tree=
, so
> >>=20
> >> could
> >>=20
> >> >> maybe simply do the
> >> >>=20
> >> >>         platform_device_register_simple("rockchip-reboot", -1, =
NULL,
> >>=20
> >> 0);
> >>=20
> >> >> in that common code?
> >> >>=20
> >> >> Though I'm not yet sure how to get the platform-data. I guess o=
ne
> >>=20
> >> option
> >>=20
> >> >> would
> >> >> be to do things like the 3288 suspend code does
> >> >> (arch/arm/mach-rockchip/pm.c
> >> >> at the bottom), by having the per-soc-data in the driver and th=
en
> >>=20
> >> matching
> >>=20
> >> >> against the pmu. Because the pmu is not part of the clock contr=
oller
> >> >> binding
> >> >> (and probably also shouldn't be).
> >> >>=20
> >> >    Thanks for your suggestion.
> >> >   =20
> >> >     I have read the code you list above, if we implement the reb=
oot
> >>=20
> >> notifier
> >>=20
> >> >     driver like this, the driver need to add much more code to f=
ind the
> >> >=20
> >> > platform
> >> >=20
> >> >     data(like arch/arm/mach-rockhcip/pm.c), what's more, if we h=
ave a
> >>=20
> >> new
> >>=20
> >> > soc
> >> >=20
> >> >     in the future and the soc use a different register here, we =
need
> >>=20
> >> modify
> >>=20
> >> > the
> >> >=20
> >> >     driver to add a new platform data again, this will bring add=
itional
> >> >=20
> >> > work.
> >> >=20
> >> >     Use the DT node pass the register will make the driver code =
simple
> >>=20
> >> and
> >>=20
> >> > clear.
> >> >=20
> >> >     Is there any hurt to put this information in the DT?
> >>=20
> >> Add the data you need to the PMU node. Then the PMU driver can get=
 it
> >> and pass to the child driver.
> >>=20
> >> Rob
> >> --
> >>=20
> >     Do you mean I should implement the DT node like this=EF=BC=9F
> >   =20
> >    diff --git a/arch/arm/boot/dts/rk3xxx.dtsi
> >=20
> > b/arch/arm/boot/dts/rk3xxx.dtsi
> > index 7b14d7a..1735d09 100644
> > --- a/arch/arm/boot/dts/rk3xxx.dtsi
> > +++ b/arch/arm/boot/dts/rk3xxx.dtsi
> > @@ -103,12 +103,6 @@
> >=20
> >                 };
> >        =20
> >         };
> >=20
> > -       reboot {
> > -               compatible =3D "rockchip,reboot";
> > -               rockchip,regmap =3D <&pmu>;
> > -               offset =3D <0x40>;
> > -       };
> > -
> >=20
> >         xin24m: oscillator {
> >        =20
> >                 compatible =3D "fixed-clock";
> >                 clock-frequency =3D <24000000>;
> >=20
> > @@ -249,7 +243,11 @@
> >=20
> >         pmu: pmu@20004000 {
> >        =20
> >                 compatible =3D "rockchip,rk3066-pmu", "syscon";
> >=20
> > -               reg =3D <0x20004000 0x100>;
> > +              reg =3D <0x20004000 0x100>;
> > +              reboot {
> > +                       compatible =3D "rockchip,reboot";
> > +                       offset =3D <0x40>;
> > +               };
> >=20
> >         };
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> > b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> > index cd02229..8a9837a 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> > @@ -202,12 +202,6 @@
> >=20
> >                 method =3D "smc";
> >        =20
> >         };
> >=20
> > -       reboot {
> > -               compatible =3D "rockchip,reboot";
> > -               rockchip,regmap =3D <&pmugrf>;
> > -               offset =3D <0x200>;
> > -       };
> > -
> >=20
> >         timer {
> >        =20
> >                 compatible =3D "arm,armv8-timer";
> >                 interrupts =3D <GIC_PPI 13
> >=20
> > @@ -493,6 +487,10 @@
> >=20
> >         pmugrf: syscon@ff738000 {
> >        =20
> >                 compatible =3D "rockchip,rk3368-pmugrf", "syscon";

    compatible =3D "rockchip,rk3368-pmugrf", "syscon", "simple-mfd";


> >                 reg =3D <0x0 0xff738000 0x0 0x1000>;
> >=20
> > +              reboot {
> > +                       compatible =3D "rockchip,reboot";
> > +                       offset =3D <0x200>;
> > +               };
> >=20
> >         };
>=20
>   Is there any further suggestion for this? If not, I will send the V=
4 with
> the DT node as a subnode in PMU or PMUGRF.

I guess Rob is the authority on this, but I'm not sure on the "devicetr=
ee=20
describes hardware" level.

On the one hand it is not really a hardware-device, but on the other ha=
nd it=20
is a firmware-interface (like psci etc, that's already in the devicetre=
e=20
elsewhere), so I'd guess it should be ok.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
