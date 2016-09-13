From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 1/8] ARM: dts: bcm283x: Define standard pinctrl groups in the gpio node.
Date: Mon, 12 Sep 2016 23:09:30 -0700
Message-ID: <87bmzse3fp.fsf@eliezer.anholt.net>
References: <1473244289-20728-1-git-send-email-kraxel@redhat.com> <1473244289-20728-2-git-send-email-kraxel@redhat.com> <1628308726.55593.220fafc0-57d9-4317-a72d-0875dfb2d658.open-xchange@email.1und1.de> <1473411924.6698.85.camel@redhat.com> <8737l893d2.fsf@eliezer.anholt.net> <7f432ebf-78d9-9089-f79d-d0584de89887@destevenson.freeserve.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7f432ebf-78d9-9089-f79d-d0584de89887@destevenson.freeserve.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Stevenson <linux-rpi-kernel@destevenson.freeserve.co.uk>, Gerd Hoffmann <kraxel@redhat.com>, Stefan Wahren <stefan.wahren@i2se.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Dave Stevenson <linux-rpi-kernel@destevenson.freeserve.co.uk> writes:

> On 09/09/16 22:20, Eric Anholt wrote:
>> e<#secure method=3Dpgpmime mode=3Dsign>
>> Gerd Hoffmann <kraxel@redhat.com> writes:
>>
>>>    Hi,
>>>
>>>> According to this page [1] the pinctrl group for parallel display inte=
rface is
>>>> missing. Is it intended?
>>>>
>>>> [1] - http://elinux.org/RPi_BCM2835_GPIOs
>>> Just an oversight I guess.  Eric?
>>>
>>> Does this look correct?
>>>
>>> +                       dpi_gpio4: dpi_gpio4 {
>>> +                               brcm,pins =3D <4 5 6 7 8 9 10 11 12 13
>>> +                                            14 15 16 17 18 19 20 21
>>> +                                            22 23 24 25 26 27>;
>>> +                               brcm,function =3D <BCM2835_FSEL_ALT2>;
>>> +                       };
>> For DPI, you also need pins 0-3 in there for clock and syncs.
>>
>> That set of data pins would be for a 24-bit mode, which is what we
>> should be using for the Adafruit kippah + 7" panel combo.
> The Kippah is only 18bit, RGB666.
> https://www.adafruit.com/products/2454
> "The pins used are GPIO 2 through 21 inclusive. That means you don't get=
=20
> the UART RX/TX pins (no console cable) and you don't get the standard=20
> user I2C pins, the EEPROM I2C pins, or hardware SPI pins. You do get to=20
> use pins #22, #23, #24, #25, #26 and #27, and the USB ports are fine to=20
> use too."

I was confused because my pinctrl was set up for 18, but the panel
driver for it is set up for 24.  It looks like 18 is right, so I should
probably correct the panel driver.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJX15gaAAoJELXWKTbR/J7otZMP/05pwgw3YPwXMHLbUupm/zuA
9y27V4auuxd5UXzYOkMB8imZhSlxm8BhSBSBtz2wVTVZpYPcw5RWUCwbb3XV/x7g
1Cyi7eCh7c38o2SwE8QvedIG6hGqihM18lLVsS0piMwLSY6lMSbeLaHJNW0Qw1/l
XIGUxR86F3pvYJvfDIfQVWlpcTDJsN/37C7KrdHPswhTuEghsP6CfB9beohwDS6Y
w3YAutkR4fZ6WW0MeSlPvH3Zhb0mUtNPx3jWw+oQQ6QceIJlSlLGpM/1EzqqvzdT
YnA2YJwYqP73dXakZWZ7d1vEeLLyBAJ74cyLg6+u/69F8zqeHapUe4Yi5dV/Mz3S
fDoj03fprj0FKOPKg/gyThCNBsWheeSA8al4fgllbboor48XOKyvmqAhabg1R8no
uJR8UTMnS31zr/DU1QI/fjWNKLqL6ZKrC3EMhuxnKHPt9MjcU57OUo6eNN+6pTVI
DRpY/J7k5bPNnKJQJN+Wy3q6qvPrbu5eUYEDK1AnUMvPG91otVq5cLSl9atzVsWm
9WqarA6+YCAKbVXmURFxiIGRBm0x8jGrtJrqN0nxHVsUdsx3u+Inww0qJRwCvjkH
csp3g/nCXVJEYI2NrZbs7+Rqz64ZLH9V0nib0GK3KanyN+NLjou5G8N6WKuroL5X
3mo1FdfN8rz2b6kC6QgB
=j95d
-----END PGP SIGNATURE-----
--=-=-=--
