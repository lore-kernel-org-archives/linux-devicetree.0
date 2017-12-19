From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 0/3] irqchip: irq-bcm2836: add support for DT interrupt polarity
Date: Tue, 19 Dec 2017 10:41:11 -0800
Message-ID: <8737461ry0.fsf@anholt.net>
References: <1513024752-11246-1-git-send-email-stefan.wahren@i2se.com> <d0c81267-8379-d4a1-ec56-fec3492c1df6@i2se.com> <a7939fae-31d1-c743-5957-d88be98a0c63@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a7939fae-31d1-c743-5957-d88be98a0c63-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> writes:

> On 19/12/17 07:02, Stefan Wahren wrote:
>> Hi Marc,
>>=20
>> Am 11.12.2017 um 21:39 schrieb Stefan Wahren:
>>> This patch series implements DT polarity support for the 1st level inte=
rrupt
>>> controller.
>>>
>>> Stefan Wahren (3):
>>>    dt-bindings: bcm2836-l1-intc: add interrupt polarity support
>>>    irqchip: irq-bcm2836: add support for DT interrupt polarity
>>>    ARM: dts: bcm283x: Define polarity of per-cpu interrupts
>>>
>>>   .../interrupt-controller/brcm,bcm2836-l1-intc.txt  |  4 +-
>>>   arch/arm/boot/dts/bcm2836.dtsi                     | 14 +++----
>>>   arch/arm/boot/dts/bcm2837.dtsi                     | 12 +++---
>>>   arch/arm/boot/dts/bcm283x.dtsi                     |  1 +
>>>   drivers/irqchip/irq-bcm2836.c                      | 46 +++++++++++++=
---------
>>>   5 files changed, 44 insertions(+), 33 deletions(-)
>>>
>>=20
>> is this series okay?
>
> Yes, it does look good. I'll queue that for 4.16.

Are you grabbing all 3, or should I be grabbing the DT one?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlo5XUgACgkQtdYpNtH8
nugSVw//Yp1DBCJspy1ZnfvKBDi67mY7wqR0LN9vDo29QIs2UslH+7s0H0YIZdLu
Ns2iN4FDt3P1AX7+oY3fYbqxI3UB+zKMfaVaJSGfgfUKRW4wIkImsR1jIfvfwsEk
SrNtRheVEh3uOcjwhcVe9TjOML43ua4ryB4tZiO4mmAsSPVVNF1RjechcmNUAxID
PdSP3cXm1qR786IuymsD5KWh7SHfzjIwFF+TNbKfb6rBvQ+TiuLoqIbUhcWrma+Z
B3T4ihgVlN7f5h8nxrBY+kKK+aB4qrACXyhhCDRBMUr4kPBcBNljTiYonJsSBpb3
RPA16mD4jli7Tg/A8EueDSvFj3ftdYpw0SYyTR8YJkKR1Ua/GzuCP8rrqeS4FRnx
XRMGtM6pXUWaBLYjeGokZJAXSmMcADM0o6rikKq2x+9tIrOg4+42k7FrN+rvB0/8
a8Y8Pq/lu+tt9XiKdq4RS8lalGnyKSahneLcRV/99ccy8X1OT2Cozhyi/CjltsoV
ZHqOOJVasvRwoifEjyhjwRp2EXoSWUaY8MosMNLvoNH8rO/eux/OInCeFKRaCLqt
YGUgCS9tABT1WB/CWrGHoaUfCBVhDeclkOjcaseMF+cwDoFv50zXDmkyye5rJyhr
c0sOxbrd3UK19kMX4qxnavlbKifNaDXnb/2/AhKCfrDjUVkkW6o=
=fudz
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
