From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 0/3] irqchip: irq-bcm2836: add support for DT interrupt polarity
Date: Tue, 19 Dec 2017 16:12:42 -0800
Message-ID: <87wp1i1clh.fsf@anholt.net>
References: <1513024752-11246-1-git-send-email-stefan.wahren@i2se.com> <d0c81267-8379-d4a1-ec56-fec3492c1df6@i2se.com> <a7939fae-31d1-c743-5957-d88be98a0c63@arm.com> <8737461ry0.fsf@anholt.net> <97a68b71-2e62-13ba-72ac-575c3b68617a@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <97a68b71-2e62-13ba-72ac-575c3b68617a-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> writes:

> On 19/12/17 18:41, Eric Anholt wrote:
>> Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> writes:
>>=20
>>> On 19/12/17 07:02, Stefan Wahren wrote:
>>>> Hi Marc,
>>>>
>>>> Am 11.12.2017 um 21:39 schrieb Stefan Wahren:
>>>>> This patch series implements DT polarity support for the 1st level in=
terrupt
>>>>> controller.
>>>>>
>>>>> Stefan Wahren (3):
>>>>>    dt-bindings: bcm2836-l1-intc: add interrupt polarity support
>>>>>    irqchip: irq-bcm2836: add support for DT interrupt polarity
>>>>>    ARM: dts: bcm283x: Define polarity of per-cpu interrupts
>>>>>
>>>>>   .../interrupt-controller/brcm,bcm2836-l1-intc.txt  |  4 +-
>>>>>   arch/arm/boot/dts/bcm2836.dtsi                     | 14 +++----
>>>>>   arch/arm/boot/dts/bcm2837.dtsi                     | 12 +++---
>>>>>   arch/arm/boot/dts/bcm283x.dtsi                     |  1 +
>>>>>   drivers/irqchip/irq-bcm2836.c                      | 46 +++++++++++=
++---------
>>>>>   5 files changed, 44 insertions(+), 33 deletions(-)
>>>>>
>>>>
>>>> is this series okay?
>>>
>>> Yes, it does look good. I'll queue that for 4.16.
>>=20
>> Are you grabbing all 3, or should I be grabbing the DT one?
>
> All 3, if that's OK with you.

Go for it.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlo5qvoACgkQtdYpNtH8
nujlYA/+LRGumNgz9WnljXEFbGP0vDeRKKdKTtaVjluZl8tEUyG4ceFQkOtT2Wvt
6PF3xBnyYEuqJ+hWe+RmQ9j99wgPzPJZJRlJ0N6/BGe5JUwaDLNShEEdQaBzSneK
DFE9tDX/q14/NqZQEWnKOg7dcGQQtvucGqkWRcj8LA4K2RU+1gWd8j5DhUD7qMMH
wSNDrt5G+0CLYeisjLHYSVGlj+zm/JtUsFdOM4VX5u596ZnXKf2jDPALcNEb4qF3
6ql9mbRC4Z0nqJsZL+cpvqtRBCK6hiW12czpy7SmPMtlulQ6cxZPZtObZjLORjwD
+KNTVoAxwBsLDkn0SMiLbAGZuO5E+O7V2sUz8xTm24gduIWkEWNx3cwMdCgcMl1a
sDfmt8CRGzVR2bi/h0Az6hlEIP9a/QnhmBlrV0jmm6IEnSAC866x5pN/pnwTEM/W
+dcycIOVihO0WxIN8PWxYj25OAb2NOSvczpDPlSgC359lez6wZbOcn1OI3RaCt9h
3FlyHE+8XT5LBM3QKm12TLBpVydLP4fbzrzPrXhyUpOhIA2zl5V+KNQNSiD1WdQv
WpftvhxEa7UZodGon5O2S1l5gp+mR6UyJXkZ5NgYkkm6kXeqUVHB385ALL63h9rD
6KhJ4VJmYIs5w8o4zvNvreko1Zy8IMebHpDPu3rqlclSuq5I6jM=
=azOp
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
