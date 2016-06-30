From: Siarhei Siamashka <siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 14/14] ARM: dts: sun8i: Enable DVFS on
 Orange Pi One
Date: Thu, 30 Jun 2016 17:23:30 +0300
Message-ID: <20160630172330.0608178e@i7>
References: <20160625034511.7966-1-megous@megous.com>
	<20160625034511.7966-15-megous@megous.com>
	<CAOMqctTe==M1SXxbdR8y33yh51fiFGn+oSaKJXhbnpLVTn-New@mail.gmail.com>
Reply-To: siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCH4DA7NUEBBBZOW2S5QKGQEYQBI4BI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAOMqctTe==M1SXxbdR8y33yh51fiFGn+oSaKJXhbnpLVTn-New-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org, dev <dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 30 Jun 2016 13:13:48 +0200
Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Hello,
> 
> On 25 June 2016 at 05:45,  <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org> wrote:
> > From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> >
> > Use Xulong Orange Pi One GPIO based regulator for
> > passive cooling and thermal management.
> >
> > Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/sun8i-h3-orangepi-one.dts | 39 +++++++++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
> > index b1bd6b0..a38d871 100644
> > --- a/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
> > +++ b/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
> > @@ -109,6 +109,45 @@
> >         };
> >  };
> >
> > +&cpu0 {
> > +       operating-points = <
> > +               /* kHz    uV */
> > +               1296000 1300000
> > +               1200000 1300000  
> 
> First problem is that the board boots at 1008000 which is not listed
> and the kernel complains.
> 
> Second problem is that the board locks up during boot with this enabled.
> 
> Do you have some suggestion for alternate configuration to test?

Maybe try the Allwinner's original DVFS table instead of these
undervolted values and see if it helps?

https://linux-sunxi.org/index.php?title=Xunlong_Orange_Pi_PC&oldid=17753#CPU_clock_speed_limit

While undervolting is tempting because it helps to decrease the SoC
temperature and avoid throttling, different units may have different
tolerances and one needs to be very careful when picking defaults
that are intended to work correctly on all boards. Some safety
headroom exists there for a reason.

If I remember correctly, some people pushed for undervolting experiments
at least twice in the past (on the Banana Pi and C.H.I.P.). In both
cases this did not end up well and had to be fixed later to solve
reliability problems.

In order to allow individual per-unit tuning, a concept of "speed
grading" may be probably introduced later. So that the board is tested
for reliability and then the speed grade rating is stored somewhere on
the non-removable storage (EEPROM, SPI flash, eFUSE, ...). Some SoC
manufacturers, such as Samsung, are already doing this with their chips.
