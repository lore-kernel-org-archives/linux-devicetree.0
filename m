From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] clockevents: rockchip: Add rockchip timer for rk3288
Date: Wed, 14 Jan 2015 18:45:38 +0100
Message-ID: <4543438.UYNY2cLhNF@phil>
References: <1420542233-16897-1-git-send-email-daniel.lezcano@linaro.org> <3085252.tjZK7l7tBp@phil> <54B694F0.1000405@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54B694F0.1000405-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Daniel,

Am Mittwoch, 14. Januar 2015, 17:10:24 schrieb Daniel Lezcano:
> On 01/13/2015 12:20 AM, Heiko St=FCbner wrote:
> >> +- clock-frequency: the frequency the timer is running
> >> +
> >> +Example:
> >> +	timer: timer@ff810000 {
> >> +		compatible =3D "rockchip,rk3288-timer";
> >> +		reg =3D <0xff810000 0x20>;
> >> +		interrupts =3D <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> >> +		clock-frequency =3D <24000000>;
> >=20
> > wouldn't it make sense to use the actual supplying clock?
> >=20
> > For the timer you want to use it is just the non-gateable &xin24m, =
but the
> > timers in the other block (timer0-5) actually do have gateable cloc=
ks.
> >=20
> > Similarly there is a pclk_timer supplying at least one of the two a=
ctual
> > blocks. I'll try to inquire how the blocks are actually supplied.
>=20
> Ok, are you suggesting I should use another timer so we can gate it f=
or
> power efficiency ?

As you want a timer that is running during suspend, I think the one you=
're=20
using right now is the correct one ... the others (timer0-5) are in the=
 cpu-
domain instead of the alive-domain

My intention was more to not have a clock-frequency property, but to si=
mply=20
use the correct cock frequency.

clocks =3D <&xin24m>, <&cru PCLK_TIMER>;
clock-names =3D "timer", "pclk";

[same binding as dw_apb_timer]


rockchip_timer.c:

tclk =3D of_clk_get_by_name(np, "timer");
clk_prepare_enable(tclk);
bc_timer.freq =3D clk_get_rate(tclk);

etc...

essentially like db_apb_timer_of.c does it :-)


We currently don't implement the gates Jack mentioned, but as they're o=
pen=20
anyway we can just use xin24m directly for now.
And the pclk should probably be enabled too, as with 3.19-rc it gets di=
sabled=20
when unused.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
