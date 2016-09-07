From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 1/8] ARM: dts: bcm283x: Define standard pinctrl groups in the gpio node.
Date: Wed, 07 Sep 2016 11:50:59 -0700
Message-ID: <87bmzzr1bg.fsf@eliezer.anholt.net>
References: <1473244289-20728-1-git-send-email-kraxel@redhat.com> <1473244289-20728-2-git-send-email-kraxel@redhat.com> <1564766913.23457.026b1e4b-e35d-48e6-9394-7eeea0ff9add.open-xchange@email.1und1.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564766913.23457.026b1e4b-e35d-48e6-9394-7eeea0ff9add.open-xchange@email.1und1.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>, Gerd Hoffmann <kraxel@redhat.com>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, swarren@wwwdotorg.org, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stefan Wahren <stefan.wahren@i2se.com> writes:

> Hi Gerd,
>
>> Gerd Hoffmann <kraxel@redhat.com> hat am 7. September 2016 um 12:31
>> geschrieben:
>>=20
>>=20
>> From: Eric Anholt <eric@anholt.net>
>>=20
>> The BCM2835-ARM-Peripherals.pdf documentation specifies what the
>> function selects do for the pins, and there are a bunch of obvious
>> groupings to be made.  With these created, we'll be able to replace
>> bcm2835-rpi.dtsi's main "set all of these pins to alt0" with
>> references to specific groups we want enabled.
>
> on IMX/MXS platform it's unwanted to add all possible muxes in the dtsi f=
ile. So
> i would suggest to add only the actually used muxes. That makes it easier=
 to
> maintain.

On the other hand, I find that having to go back to the docs for
determining the fsels is worse than just verifying and defining them
here all at once.  Maintaining has also gotten harder because our DTs
are split across 32 and 64-bit ARM, so rpi3 changes that require adding
one of these pinmux definitions back to the dtsi would require painful
cross-branch merges.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJX0GGUAAoJELXWKTbR/J7o/RgP/17SLiVvQ67rhs6pRNN3LelF
xwabJnNPQSZDSJKZJDiq6ne45xQPu/Lrr4RucWYPWMZus7KrHeIPe7ZqmyYZwj+M
K+f2LbZx4+Q2eMQBvqUjZsvydc7+90m9m8nfpwgorZT5tptKIESm6KQ97nkiOrHT
sGODF/AK4H+Ot+m8SZlGO8AxFwCOYTemcuJn+KiVugwTJRzKqnoV6M39VDcxWyv2
17eJUMB6aqKymELJgE7sOqrCP0yzYKvdG6vfsjMZtSabXQ9ZBrIMnxAKgqw3GIUP
lEjt7pH2B6N3kAFGt/1CA5NAPe1sUX4fC9JbYgyITbaMgu5nhQrZLx4gTEAl7TBM
P1wn6Bc1P984wKXpaSz1rYotnj2Uy0epsSxQr1ZBQRjbc/2plSsJlUap+M5JTSI9
kVfQe/u5knt6Ludl8U4Ags94UAhRlJhKO5fumKOgICaflie2vD9ZBut0Js/3sJll
dy24wmnrN54hUjSa2a6TU9cvsehl0QKpsXBJ8xkTD+8MEFGQpfjdbYLwkXrR8qV6
uQcHUWLPJT8piC6Rg6slkcj4cWQfNtKpYQc7JaeXqj7r7UZnaZRwK4T26jS8hUyD
0LeNjx+Or928AsPdeYM742e5oXh+3X/hECC8KiB2oSihj7WU6yb7eHhdr6LNJdzh
ShEXuYMu3r3tsQt13Yd0
=TWXO
-----END PGP SIGNATURE-----
--=-=-=--
