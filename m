From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Add devicetree for the Raspberry Pi 3, for arm32 (v5)
Date: Tue, 25 Apr 2017 09:45:05 -0700
Message-ID: <87d1c0phbi.fsf@eliezer.anholt.net>
References: <20170424200037.25615-1-eric@anholt.net> <68d88bf7-1f47-4056-3b70-7b97d9a02953@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <68d88bf7-1f47-4056-3b70-7b97d9a02953-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:

> Am 24.04.2017 um 22:00 schrieb Eric Anholt:
>> Raspbian and Fedora have decided to support the Pi3 in 32-bit mode for
>> now, so it's useful to be able to test that mode on an upstream
>> kernel.  It's also been useful for me to use the same board for 32-bit
>> and 64-bit development.
>>
>> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/Makefile            | 1 +
>>  arch/arm/boot/dts/bcm2837-rpi-3.b.dts | 1 +
>>  2 files changed, 2 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/bcm2837-rpi-3.b.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 011808490fed..eded842d9978 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -72,6 +72,7 @@ dtb-$(CONFIG_ARCH_BCM2835) += \
>>  	bcm2835-rpi-b-plus.dtb \
>>  	bcm2835-rpi-a-plus.dtb \
>>  	bcm2836-rpi-2-b.dtb \
>> +	bcm2837-rpi-3-b.dtb \
>>  	bcm2835-rpi-zero.dtb
>>  dtb-$(CONFIG_ARCH_BCM_5301X) += \
>>  	bcm4708-asus-rt-ac56u.dtb \
>> diff --git a/arch/arm/boot/dts/bcm2837-rpi-3.b.dts b/arch/arm/boot/dts/bcm2837-rpi-3.b.dts
>> new file mode 100644
>> index 000000000000..8c8aa4d1e9b3
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/bcm2837-rpi-3.b.dts
>> @@ -0,0 +1 @@
>> +#include "arm64/broadcom/bcm2837-rpi-3.b.dts"
>
> Looks like a typo in the dts filename and in the include ( dot instead
> of dash ).

Sorry about that, everyone.  I remember doing builds of the patch, but
maybe things succeeded because there was already a .dtb present in my
tree or something.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlj/fREACgkQtdYpNtH8
nugKNhAAg+veNZrdr4AvhBhR7/FtI8ifUKakX9V+QlafI8M1mrXkg2vme91aMLHT
KcpK66v9r2Y5LVN5eZBTFwuBqaKK1aQQfx0UXX4I+op+ZUUnl+9eXAZ9QhJou3pY
qIWOLgE7T6J2bEHqGbJE3ZigOgLVG8IIdW7nyj4GStRnisVgNtKGp+xwCPXzFVKS
wo1zTxa75DfIqYBJzSkE4Bv1t3rlk+1nofcwr1jGksi544kLFgRFr78cc9mpRKs+
w2q8QxSe+tNWSVvrV7pDwEp/Vve6HdqB7B+gzI0eLG/FcOu5dcb0ob/YnEbm3M5/
nbmfz/sxAxjmB8E8YS2c6bWqJm8AO3wf7kly82SknmGhpu20W28z1bO2ElaX2hIK
8K7SXVpVWu1Fawbp6JaM1Oi0pDjqx8CY8c+ePLa+X05oaw2RYsRKmAX3Flx4DBaw
rAq31YH7i1s1kA/JRtpv2+nfVzk86DOPD7OLd7XRHaBzkhW24SSS8R5Mf3zui/rh
ceT/USywc1s8uSsLqaDSBSkxA+QvNKuIIAFYjo719W7FG/io08lZyTT2sx8f+rbO
6L677TZ1jMrLQgzomBeGJ99ey9rsIOHxDxMn6czzoSKCrv/LxZBtJT/ycVYHb1oN
EBAkZjY/Fh7ZApkOUvCLa754VqoeqbofTxADsFlyDMDL+UZgzts=
=wn2q
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
