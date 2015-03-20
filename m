From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 3/4 v4] mailbox: Enable BCM2835 mailbox support
Date: Fri, 20 Mar 2015 10:24:20 -0700
Message-ID: <87wq2bk2ez.fsf@eliezer.anholt.net>
References: <1426213936-4139-1-git-send-email-eric@anholt.net> <1426213936-4139-3-git-send-email-eric@anholt.net> <5507A095.5090805@wwwdotorg.org> <87619xq414.fsf@eliezer.anholt.net> <550BA6B4.3030604@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <550BA6B4.3030604-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:

> On 03/18/2015 05:28 PM, Eric Anholt wrote:
>> Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:
>>=20
>>> On 03/12/2015 08:32 PM, Eric Anholt wrote:
>>>> diff --git a/drivers/mailbox/bcm2835-mailbox.c
>>>> b/drivers/mailbox/bcm2835-mailbox.c
>>>=20
>>>> +#define MBOX_MSG(chan, data28)		(((data28) & ~0xf) | ((chan) &
>>>> 0xf)) +#define MBOX_CHAN(msg)			((msg) & 0xf) +#define
>>>> MBOX_DATA28(msg)		((msg) & ~0xf)
>>>=20
>>> Even the concept of storing channel IDs in the LSBs feels like it
>>> might be RPi-firmware-specific rather than HW-specific?
>>=20
>> I guess?  If we found another firmware protocol, we could have
>> that device's dt just specify a different compatible string.  But
>> in the absence of another firmware to talk to, I'm not sure what
>> you want here.
>
> I would expect the mailbox driver to expose a single channel that just
> transports 32-bit values, since the HW doesn't impose any kind of
> structure on the values it transports AFAIK. Clients of the mailbox
> driver would formulate the messages they send through the mailox using
> the macros above.
>
> I'm not sure whether the mailbox core allows multiple clients for the
> same mailbox channel though? This HW appears to require it.

Yeah, that's the problem.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVDFfFAAoJELXWKTbR/J7oE9oP/3gypjBB1Pwne6KjrSgI+HJf
U8aC/KS/Ppmv9LS+DB9Vzhe26fAd8FviVTrVz+gFrWT1HEkdZhDk9D156CsqRSjL
v/CCKgYurkCOUUT3cmUcdoNhkfBwUrqT8E4lrWxvU4OojCtE5vaCBvCV0wJai6OO
9HMccTqcF20PgCoMJiyLHOjnyzls0w31ErNc4tUgPVmUzr8yQS7jLUwAU1DC6WyA
moErjCVSIWw8dxYEa/uz0DqM4WQSAQoZ8tS3IWxu98Yw2byJRwrCUkzKlb2N095f
8i1Z79h7nhfjPFnzZuVeG1Sb8WZP20f5JY6Cgv8nB7oHefOm0Yl/fknCdi/PG6P1
tkDvffdBW0mqhsMiVffL7gN14OYVs2+orL9fuYlNWVm19EEK0oHs8DNqnPxNpUQ4
sIQrSrwrZW2+TRvEbzl4mXndOgWZrgqxfZkyWKq/gTM0epx3MR8lz1FzsjQZQA5g
KkPv4HxVQfmjoS0Ci1n67zO/+hlNjl+Gr2OfQz6OGBPnxvdxdk93buTA3cvSAGyW
vDQVAvXFhzfxpfHb0Q2vHprjxkYXFBkAPbzGbUsf41qoSWG4jYdiXJUjVJp0vbCk
TFNweQCdlKfkzTT0C3OAhSY8r6UZh+eMuLJYcq44952rxoZBl7MQ8OhUF11jwjOk
088LSK88OtBkxMG20yR1
=TyIz
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
