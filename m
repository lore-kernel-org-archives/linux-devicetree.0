From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v2 2/4] irqchip: bcm2835: If a parent interrupt is registered, chain from it.
Date: Wed, 22 Jul 2015 11:17:20 -0700
Message-ID: <87bnf4giq7.fsf@eliezer.anholt.net>
References: <1436837718-956-1-git-send-email-eric@anholt.net> <1436837718-956-3-git-send-email-eric@anholt.net> <55AEFB1D.6090108@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55AEFB1D.6090108@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stephen Warren <swarren@wwwdotorg.org> writes:

> On 07/13/2015 07:35 PM, Eric Anholt wrote:
>> The BCM2836 (Raspberry Pi 2) uses two levels of interrupt handling
>> with the CPU-local interrupts being the root, so we need to register
>> ours as chained off of the CPU's local interrupt.
>
> Sorry for the slow review; laziness after vacation!
>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm=
,bcm2835-armctrl-ic.txt b/Documentation/devicetree/bindings/interrupt-contr=
oller/brcm,bcm2835-armctrl-ic.txt
>
>> +The BCM2836 contains the same interrupt controller with the same
>> +interrupts, but the per-CPU interrupt controller is the root, and an
>> +interrupt there indicates that the ARMCTRL has an interrupt to handle.
>> +
>>  Required properties:
>>=20=20
>>  - compatible : should be "brcm,bcm2835-armctrl-ic"
>
> Since there are some differences between the bcm2835 and bcm2836 HW
> blocks, I'd expect the compatible value to be different for each. In
> particular...

Well, there are actually no differences within this block of the HW (HDL
is unmodified), it's just where the output interrupt line gets consumed.
But it's not much extra to add a new compatible value, so sure.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVr94wAAoJELXWKTbR/J7okMMP/ROhC6tVFG+0muGe49YHDR/0
wcueUIsl8794I7BKyCqU0aHpNa83J5AFZHLQ+P3MuzGposghc/kv6OxIX8WLIIFo
3tPUb4NhtUc+4Ie4frYgjhGixmUPIquxZZEL//cVJomFD90f9Od4amqC08sqAkPb
/X5UvuFXEPa3TrbSyORzOKU//2TrIM8CrWUUSIxboqVKDFskGwgVr0QmPgL+BucY
CqHodGjiXr8Bu9A/VxJeigfvcWLiJmpnpbayP8qZrBuXGvW6C3fcz26KilgiOwTB
MNkguBDyiOGnvQ9nfJmGRJUJbZ/5KYOGgRnszhOeLommiTI/mzh8xjmAD0fctkU4
2ZUCybzvTyAdOskGzHYfL5fgUKGEG3uIc6k7UpaJcDWoIl+AKCQYdN4HSWdZC0bk
uaoBi0PnFPE3ECfWozLS7IbdLqx5M2xmNW0+TflwGUM9JK3/qg59+HDbVzQsUpJ8
hbijvBz84f0PVONG7RmqaSFSi9jT8PdHxzW2CUjOIdAPvJZNf6gI5FQJXp56nMRB
+lYNKzKRL/CXXeRlxo8jHJeGAWECDjdxXOyapDk97ESzmZd2LxtaBraqCHk5u5BB
z41Wq/17i+HIWx56WOjO0KkroYCWKddPp4FDgB3XrLN/99eFmfMEIBQW9mOLiCKL
SlYcbFtyLW0OY1EVeXle
=spQE
-----END PGP SIGNATURE-----
--=-=-=--
