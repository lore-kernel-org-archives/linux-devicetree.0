From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 2/5] staging: vc04_services: Remove cache-line-size property.
Date: Wed, 07 Mar 2018 09:51:09 -0800
Message-ID: <87371bydte.fsf@anholt.net>
References: <20180305202806.21219-1-eric@anholt.net> <20180305202806.21219-3-eric@anholt.net> <a8f369f5-691c-c05f-4c7c-2eadcf4c48c8@i2se.com> <87muzl9ger.fsf@anholt.net> <638bd870-bb17-a0e1-d2aa-30a364b53279@raspberrypi.org> <1332781939.275857.1520424630939@email.1und1.de> <51dc71d7-e8f5-2785-ad13-a941bc9278ab@raspberrypi.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51dc71d7-e8f5-2785-ad13-a941bc9278ab@raspberrypi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Elwell <phil@raspberrypi.org>, Stefan Wahren <stefan.wahren@i2se.com>, Rob Herring <robh+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Phil Elwell <phil@raspberrypi.org> writes:

> On 07/03/2018 12:10, Stefan Wahren wrote:
>> Hi Phil,
>
> <snip>
>
>>> It is the L2 cache line size that matters, but as long as you end up wi=
th
>>> the numbers Stefan mentioned - 32 on BCM2835, 64 on BCM2836 and BCM2837=
 -
>>> I'm not too bothered how you get there.
>>=20
>> i think a kernel with bcm2835_defconfig on RPi 2 could be such a corncas=
e.
>>=20
>> Am i right that the firmware doesn't rely on the existence of "cache-lin=
e-size"?
>
> Because of the way partial cache lines are handled it is more important t=
hat the
> two sides agree than that the value is correct. As a result, the firmware=
 treats
> the absence of a "cache_line_size" DT parameter (that sets the "cache-lin=
e-size"
> property) in the DTB as an indication that the kernel driver pre-dates th=
e ability
> to switch, and uses the old fixed value of 32 as a fallback. Otherwise it=
 sets the
> parameter and the internal value used by the VPU-side VCHIQ to the correc=
t value.
>
> There are a number of ways to fix this, the easiest of which is to assume=
 that the kernel
> driver will either read the property or be able to work out the correct v=
alue, so
> the VPU should always use the correct value regardless of the success of =
applying
> the parameter/changing the property.

Oh, interesting.  So with my patch, we end up with a mismatch where VPU
is treating things as 32, and the kernel is using 64.  I wasn't seeing
errors in vchiq_test in this state, which is a bit concerning.

I'll go ahead and drop this patch and replace it with a comment in the
code about this discussion.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlqgJo0ACgkQtdYpNtH8
nui7ThAAtLCQi7b6EfWvhcD/rnr01h1wRMmVpAEyVUozxYAqf9CaZ2BmUj/8OQgg
mXfjSSghygbsUAvtsKYLXgUkkGwTZiKhneeGpL5uirtLmQYB5xsDxGck2YaG5yxH
rPFRt7sMph9SSxqrKR0k3uUdSFlB9zqz3TkGzP2OBuAAI4aiaOZ8B1xKN9+UKbJC
b/hftzvA97/T1Zfh+L2NWT2mo064CeX5f1B0Oy3j+BgdJfQLpdi19VBB+XPItfSa
9rdp8rz0wysijqxXSAo53NOK/S/m3e07naT8EvKvGt6QLQ5m0kPwBtU99Z9A4mOX
g0r5tjVYJP8JOa4ISZVjq0gXiFe+Gofe/PjD4a+6AU9sWTntAAnLvcBl+XLOyWKU
n6aS9/OKTmFcz9NEuCtE5wd4sSli64jUHaJ/T6DiII21d5qeyzI+7HduMmpEbFow
9GohhThqn3/YXQeKZwhV2DA8Dd3Ih8VICe1N8fWaHrP0qj6K7BrXhtCACMH3pJ/G
ro9AW2dYkYzPqrxsLtnJo61cir6shh5URqcE4y3NRZkwpPFAkdj9ERA+gM6u7Dbk
rN11aP/xeqVNr+TF/+FPKZMpSw3vIJq7R7p8JyKVtNc0wclXGAoBGL9nCy5vL+AV
PZntlxaVGpGH4YDOXzW9vR3AkOF2hK8LfZ9d5GFIFBeZ2lG9RsQ=
=D+hT
-----END PGP SIGNATURE-----
--=-=-=--
