From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 7/9] ARM: Add Kconfig support for bcm2836.
Date: Tue, 21 Apr 2015 13:38:12 -0700
Message-ID: <87lhhl9pzf.fsf@eliezer.anholt.net>
References: <1429639796-2169-1-git-send-email-eric@anholt.net> <1429639796-2169-8-git-send-email-eric@anholt.net> <13864545.foFMzEn7Xk@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <13864545.foFMzEn7Xk@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> writes:

> On Tuesday 21 April 2015 11:09:54 Eric Anholt wrote:
>> @@ -116,17 +122,19 @@ config ARCH_BCM283X
>>  config ARCH_BCM2835
>>         bool "Broadcom BCM2835 family" if ARCH_MULTI_V6
>>         select ARCH_BCM283X
>> -       select ARCH_REQUIRE_GPIOLIB
>> -       select ARM_AMBA
>>         select ARM_ERRATA_411920
>>         select ARM_TIMER_SP804
>> -       select CLKSRC_OF
>> -       select PINCTRL
>> -       select PINCTRL_BCM2835
>>         help
>>           This enables support for the Broadcom BCM2835 SoC. This SoC is
>>           used in the Raspberry Pi and Roku 2 devices.
>>=20=20
>> +config ARCH_BCM2836
>> +       bool "Broadcom BCM2836 family" if ARCH_MULTI_V7
>> +       select ARCH_BCM283X
>> +       help
>> +         This enables support for the Broadcom BCM2836 SoC. This SoC is
>> +         used in the Raspberry Pi 2
>> +
>
> The description for the first one says "Broadcom BCM2835 family", and I
> guess they are both in the same family. How about leaving the
> CONFIG_BCM2835 symbol to mean one of them, and just duplicating the
> DEBUG_LL symbols?
>
> You could do something like
>
> config ARCH_BCM2835
>         bool "Broadcom BCM2835 family" if ARCH_MULTI_V6 || ARCH_MULTI_V7
>         select ARCH_BCM283X
>         select ARCH_REQUIRE_GPIOLIB
>         select ARM_AMBA
>         select ARM_ERRATA_411920 if ARCH_MULTI_V6
>         select ARM_TIMER_SP804 if ARCH_MULTI_V6
>         select CLKSRC_OF
>         select PINCTRL
>         select PINCTRL_BCM2835
>         help
>           This enables support for the Broadcom BCM2835 and BCM2836 SoCs.
> 	  These SoCs is used in the Raspberry Pi and Roku 2 devices.
>
> That should make it less confusing to the user, because they don't have
> to know which specific SoC they are building for, other than enabling
> the right architecture level.

Seems reasonable to me.  What do the 2835 maintainers think?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVNrU0AAoJELXWKTbR/J7ogI8P/08a1Q2RkfvmvETpMPd3nTcw
NJFzU430TV2ZZDzHpspiF2I9r1cKtVXH9HEPZ2Sabpr4pwbe8fn0mPdqNLfIDDsF
/orkY1Ik9verhjD72SctnkKodHbHel7sAr/53DWH4v9X9J5dpLJvL+nxTj6gU5dn
Sr0lk6eZsCaoNvb5deLcI4/nn2iFSyq//BGuqarQhGhx+VWLxZ/1o+SGyoYTzv2a
ghSNt4KMu3oui1tqI1qoNNBp6Ckh8III9cWdSv1svoWphncZF41F1qifTxVSP3Dw
JK3/Q6ganlKlZGMcI107mbXdTuY7IJrN7T0y6T+adbI+DLi48oza2gVuRbMefbru
deAFafGXqOXuKpihIGSTrjZMNrvhkquqc8qeLzG0X1+0DczYIx0rgLq/AoOypZ0b
f9GyKZZIDO7ZA2Fju2AY+mSNGxqgEaMoeY2MczP2PZk7F+YQb7RT6wEe+9Au76tw
nNGqhaX8GNMb+LWyfXSU2WPm1dNZ2GPQkIUbNoKFpkPd/hUcWpwf/Ns9mlTR1MjN
euwxNY+jUWZ+l0Jkp9zQCecXvndk49PaJ4kkZ7KwBRoTHf7IHXbdEbDjCHoLb22w
v15QEvY717GsAnl88v1A0uQSdmr4c17OLU7l8EambyKHWn1h29WSeI3BvlpAQJGg
WaT4LsyX6AMIGahIhQtj
=wm13
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
