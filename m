From: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: rockchip: Adding LEDs handling via leds-gpio
 for the Radxa Rock2 Square
Date: Wed, 30 Dec 2015 17:07:54 +0100
Message-ID: <CABgxDoLS+WKX+5YGGgHHzsnxHRF9iMqUDo7nmBm6YXD99J5GAA@mail.gmail.com>
References: <1451474219-1313-1-git-send-email-romain.perier@gmail.com>
	<3613784.8JLtyMHEE9@diego>
	<1451490343.11453.28.camel@collabora.co.uk>
	<3020768.zersTrE99c@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3020768.zersTrE99c@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

I agree with Sjoerd, that's more useful to keep these LEDs in sync
with the default vendor behaviour than put their default state to off
and ask the user to manipulate them explicitly... in the worst case,
he can still change the default state from sysfs...



2015-12-30 16:53 GMT+01:00 Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>:
>> > even a oneliner is generally preferred, compared to no commit mess=
age
>> > at all
>> > ;-)

Well, lack of inspiration :P
No, just kidding, I agree.

>> >
>> > > Signed-off-by: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> > > ---
>> > >  arch/arm/boot/dts/rk3288-rock2-square.dts | 17 ++++++++++++++++=
+
>> > >  1 file changed, 17 insertions(+)
>> > >
>> > > diff --git a/arch/arm/boot/dts/rk3288-rock2-square.dts
>> > > b/arch/arm/boot/dts/rk3288-rock2-square.dts index c5453a0..a3302=
0f
>> > > 100644
>> > > --- a/arch/arm/boot/dts/rk3288-rock2-square.dts
>> > > +++ b/arch/arm/boot/dts/rk3288-rock2-square.dts
>> > > @@ -56,6 +56,23 @@
>> > >           pinctrl-0 =3D <&ir_int>;
>> > >   };
>> > >
>> > > + gpio-leds {
>> > > +         compatible =3D "gpio-leds";
>> > > +
>> > > +         heartbeat {
>> > > +                 gpios =3D <&gpio7 15 GPIO_ACTIVE_LOW>;
>> > > +                 label =3D "rock2:green:heartbeat";
>> > > +                 linux,default-trigger =3D "heartbeat";
>> > > +         };
>> > > +
>> > > +         mmc {
>> > > +                 gpios =3D <&gpio0 11 GPIO_ACTIVE_LOW>;
>> > > +                 label =3D "rock2:blue:mmc";
>> > > +                 linux,default-trigger =3D "mmc0";
>> > > +         };
>> >
>> > the rock2 core schematics seem to not list these leds at all
>> > (especially when
>> > looking at the gpio-side). But looking at the schematics my guess
>> > would be
>> > led_state1 and led_state2, so the naming should reflect that
>> > (rock2:green:state1 ...).

I used the schematic and the vendor devicetree to retrieve these inform=
ations.


> Anybody opposed to me adding the following commit message?
>
> ----
> Describe the two user-controllable LEDs on Rock2-square boards.
> The default-triggers mimic the behaviour of the vendor-kernel to
> keep functionalities in sync.
> ----

+1
Please do.

Do you want a v2 patch ? (the label of these leds is wrong)

Romain
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
