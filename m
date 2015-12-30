From: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: rockchip: Adding LEDs handling via leds-gpio
 for the Radxa Rock2 Square
Date: Wed, 30 Dec 2015 16:45:43 +0100
Message-ID: <1451490343.11453.28.camel@collabora.co.uk>
References: <1451474219-1313-1-git-send-email-romain.perier@gmail.com>
	 <3613784.8JLtyMHEE9@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3613784.8JLtyMHEE9@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2015-12-30 at 16:20 +0100, Heiko St=C3=BCbner wrote:
> Hi Romain,
>=20
> Am Mittwoch, 30. Dezember 2015, 12:16:59 schrieb Romain Perier:
>=20
> even a oneliner is generally preferred, compared to no commit message
> at all=C2=A0
> ;-)
>=20
> > Signed-off-by: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> > =C2=A0arch/arm/boot/dts/rk3288-rock2-square.dts | 17 ++++++++++++++=
+++
> > =C2=A01 file changed, 17 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/rk3288-rock2-square.dts
> > b/arch/arm/boot/dts/rk3288-rock2-square.dts index c5453a0..a33020f
> > 100644
> > --- a/arch/arm/boot/dts/rk3288-rock2-square.dts
> > +++ b/arch/arm/boot/dts/rk3288-rock2-square.dts
> > @@ -56,6 +56,23 @@
> > =C2=A0		pinctrl-0 =3D <&ir_int>;
> > =C2=A0	};
> >=20
> > +	gpio-leds {
> > +		compatible =3D "gpio-leds";
> > +
> > +		heartbeat {
> > +			gpios =3D <&gpio7 15 GPIO_ACTIVE_LOW>;
> > +			label =3D "rock2:green:heartbeat";
> > +			linux,default-trigger =3D "heartbeat";
> > +		};
> > +
> > +		mmc {
> > +			gpios =3D <&gpio0 11 GPIO_ACTIVE_LOW>;
> > +			label =3D "rock2:blue:mmc";
> > +			linux,default-trigger =3D "mmc0";
> > +		};
>=20
> the rock2 core schematics seem to not list these leds at all
> (especially when=C2=A0
> looking at the gpio-side). But looking at the schematics my guess
> would be=C2=A0
> led_state1 and led_state2, so the naming should reflect that=C2=A0
> (rock2:green:state1 ...).
>=20
> Also I'd like to refrain from encoding user-specific configurations
> in the=C2=A0
> devicetree - aka please do a default trigger of "off" for those
> generic leds.

Seems a grey area. The vendor kernel configures these LEDs with the
same default triggers as Romains patch does, so one could argue these
are the intended usages for those LEDs (as such it's hardware
description not use-specific configuration?).=C2=A0

In any case having sensible default triggers (e.g. having the default
mainline behaviour act the same as the vendor behaviour) seems quite a
lot more useful then keeping these LEDs off and forcing usespace to set
them up.


> Thanks
> Heiko
>=20
> > +	};
> > +
> > +
> > =C2=A0	sound {
> > =C2=A0		compatible =3D "simple-audio-card";
> > =C2=A0		simple-audio-card,name =3D "SPDIF";
>=20

--=20
Sjoerd Simons
Collabora Ltd.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
