From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 01/10] dt/bindings: Add binding for BCM2835 mailbox driver
Date: Thu, 12 Mar 2015 16:23:52 -0700
Message-ID: <87egothkaf.fsf@eliezer.anholt.net>
References: <1425329684-23968-1-git-send-email-eric@anholt.net> <1425329684-23968-2-git-send-email-eric@anholt.net> <20150303080550.GF6976@x1> <87vbih98za.fsf@eliezer.anholt.net> <54F66FDD.2040409@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54F66FDD.2040409-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:

> On 03/03/2015 12:28 PM, Eric Anholt wrote:
>> Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:
>>=20
>>> On Mon, 02 Mar 2015, Eric Anholt wrote:
>>>> +Example: + +mailbox: mailbox@7e00b800 { +	compatible =3D=20
>>>> "brcm,bcm2835-mbox"; +	reg =3D <0x7e00b880 0x40>; +	interrupts =3D=20
>>>> <0 1>; +	#mbox-cells =3D <1>; +};
>>>=20
>>> It would be good to see the client examples here as well.
>>> Please consider pulling in brcm,bcm2835-mbox-power.txt and=20
>>> brcm,bcm2835-mbox-property.txt.
>>=20
>> Oh, so have those two just smashed into this file as one set of=20
>> documentation for everything to do with mailbox on bcm2835?  That=20
>> seems good to me.  When I was adding the client drivers, the fact=20
>> that the other brcm file was named after the compatible string
>> made me generate new files under then new compatible strings, but
>> the other drivers already in the tree obviously aren't formatted
>> that way.
>
> The HW mailbox seems like a different process to the upper-layer
> protocols/message formats running over the top of it. Sure right now
> the Pi has a single firmware, but do all bcm2835-based devices share
> the same firmware? Is so, we'd be warranted in lumping the HW and
> firmware protocol together, but I rather wonder whether e.g. the
> bcm2835-based Roku uses the same firmware protocol?

I've confirmed: While their firmware would have been forked from the
same source, there's no reason to expect their shipped firmware
protocols (like my power domain or property channel drivers use) to
match RPi's.

The power-domain rework ended up not working out -- it needs the
power-domain part of device/base to support throwing -EPROBE_DEFER if
the driver hasn't probed yet, unless we're willing to just bake in the
power domain driver in static init ordering.  Device base maintainers
weren't excited about my patch for -EPROBE_DEFER, because then a new DT
would mean we start failing to probe the USB driver in an older kernel,
which whould be a regression in the case that the user had U-Boot
setting up USB for them.

Meanwhile, it looks like the thing being done in the firmware for USB is
not just a power domain, but also configuration of the USB PHY.  This
led me to wonder if I could just write native support for the PHY and
the power domains instead of asking the firmware to do it, but this is
going to take more investigation.

As a result, I'm going to shelve my power domain and property channel
work for the moment, and just submit the core mailbox support that I
feel pretty confident about for now.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVAiAIAAoJELXWKTbR/J7oPbUP/2U5Z1i4suC+5eCI8W4t+0AY
myKhqUnRveo+beS5jaTVQPvbiyo9Y38Y1Jbjk+J3cDfHXJH4Fyn9efUC1ACfDW4+
VRhjVnLS6yTgHrMYXEIZAE80DIf0Ale/m3EWUXx9Vv+7FTjN13HlPEieaCVETItf
TLAZua4PmKdQ1j51VlBTvEoGaO4ShbRA4GsguT6pU/j3cQTDUZOkdICGqGROiop4
W9jcIR46T8FqVVUZ3ggyCv5/TjWSGdbmm5/8dRNBzDpoIzPhJu1IKXQsZG/Q8zl/
QPTw9rcSoJcAyUuSKJqM3/cJnLeS9yf1wJ4odjhZYelybPXhy5a5GqAdckIpm3m/
mcuTkoqj6l8oTgvOqm7f2iyaLcfBLSn9lxM6s4Bk+uTc7d+YRWE8JulFaub4JdC4
T7ATPoe8mbQVhEFUZPSH72Z0WUwsDlrDwmgF/aMoG2q1ghguae2psdXGHera6uzN
RHyPXIY3JHWF78w5cv5hVwxYOrPSc/9XGHTbtF446rVL4S20xH7VvOBm1dv1Pz8v
xVZGe8oIuJNuhA5A3Evgp6JZJF4uYD9NPlZHnFCVgRHhOO1XexQmtG8sX93FzoQG
y7JJIlIrkQCqWsRL+0/1Exeeg6Uwps49VWI/R6Zs+51GZKbDP4rhYDzjXz+zZvv0
nFojNukxJdRiXTltlgEy
=cP62
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
