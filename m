From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 4/8] ARM: dts: bcm283x: Add a new EMMC pin group from the downstream tree.
Date: Fri, 09 Sep 2016 14:22:24 -0700
Message-ID: <87zing7oq7.fsf@eliezer.anholt.net>
References: <1473244289-20728-1-git-send-email-kraxel@redhat.com> <1473244289-20728-5-git-send-email-kraxel@redhat.com> <87650770.23554.026b1e4b-e35d-48e6-9394-7eeea0ff9add.open-xchange@email.1und1.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87650770.23554.026b1e4b-e35d-48e6-9394-7eeea0ff9add.open-xchange@email.1und1.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>, Gerd Hoffmann <kraxel@redhat.com>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stefan Wahren <stefan.wahren@i2se.com> writes:

>> Gerd Hoffmann <kraxel@redhat.com> hat am 7. September 2016 um 12:31
>> geschrieben:
>>=20
>>=20
>> From: Eric Anholt <eric@anholt.net>
>>=20
>> This will be used for having EMMC (sdhci-bcm2835.c) drive the
>> wireless.
>
> sdhci-bcm2835.c has been replaced by sdhci-iproc.c
>
>>=20
>> Signed-off-by: Eric Anholt <eric@anholt.net>
>> ---
>>  arch/arm/boot/dts/bcm283x.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>>=20
>> diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.=
dtsi
>> index 062d09db..b6b1950 100644
>> --- a/arch/arm/boot/dts/bcm283x.dtsi
>> +++ b/arch/arm/boot/dts/bcm283x.dtsi
>> @@ -257,6 +257,11 @@
>>  				brcm,pins =3D <32 33>;
>>  				brcm,function =3D <BCM2835_FSEL_ALT3>;
>>  			};
>> +			emmc_gpio34: emmc_gpio34 {
>> +				brcm,pins =3D <34 35 36 37 38 39>;
>> +				brcm,function =3D <BCM2835_FSEL_ALT3>;
>> +				brcm,pull =3D <0 2 2 2 2 2>;
>
> How about adding pull defines to include/dt-bindings/pinctrl/bcm2835.h?

A fine idea, but it should not be a requirement for this series.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJX0ygQAAoJELXWKTbR/J7ofFsP/2MIeSRF6hhE/L/0Og7DLrKc
02WOB2iFJS0xL/+K8AlKQIIfovVWm8l38i9jzyCognYSOIX3VTJGYkc4/9oqK7Zz
zMBZN0cJoYU7Hv5ysI/clO22dZn0CRcA8Xgy1z6lrMNYZTY5MH1fAdjAcKS2pmZ0
dozaziLSoUOTKFQh9sUbx2mmsi3H56kfJJVMR7393DJKz6ZsUwsx1QrjelLl23lR
T3U4GPedVWZ0MUjdMPR3pe0kzNkYVOntPoS4a4gTWkb/RqI11+cle85UJNtbAla4
IUu/2T4PiN7CBaXYTJm4KSueY4KDOL/oAamxBghMspBQorOQOkfHwsk1ajXS8J7j
kF7JBNbbug4fmpOoPCf53mvoVq/H/JJQb/uCGR5W2k7ywulBQBqVgxZVZlQDmZGQ
fwtQ3/pvyxc+NY4TpZIigM0fD5DL8eQFpzslePuOjKyYUsvLMCWWqVygDXgKevci
8XXIZ68UVyQoQyPKhedb6SB0ku8OmKfbBrTGPdED5OkwdXf1P8PEAyAlD2uV2y3F
Piwwspy+YlEDHksNix35i7S6Dq2LZwLva7XC9JaO3B6rZLdbcmv3qzKccz7K/W2t
PZgHkR5DVGb3aAcs9x8kb6O+uSIIwfAVEID+XCkej8VPWod+vc9uua0oes+0Vk8J
vw17vQJYpId9FsHvGYEq
=bfkV
-----END PGP SIGNATURE-----
--=-=-=--
