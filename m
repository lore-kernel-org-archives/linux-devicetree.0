From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 02/10] mailbox: Enable BCM2835 mailbox support
Date: Wed, 04 Mar 2015 10:28:00 -0800
Message-ID: <871tl48vnz.fsf@eliezer.anholt.net>
References: <1425329684-23968-1-git-send-email-eric@anholt.net> <1425329684-23968-3-git-send-email-eric@anholt.net> <54F675F1.60205@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54F675F1.60205-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:

> On 03/02/2015 01:54 PM, Eric Anholt wrote:
>> From: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
>>=20
>> Implement BCM2835 mailbox support as a device registered with the
>> general purpose mailbox framework. Implementation based on commits by
>> Lubomir Rintel [1], Suman Anna and Jassi Brar [2] on which to base the
>> implementation.
>
>> diff --git a/drivers/mailbox/bcm2835-mailbox.c b/drivers/mailbox/bcm2835=
-mailbox.c
>
>> +/* Mailboxes */
>> +#define ARM_0_MAIL0	0x00
>> +#define ARM_0_MAIL1	0x20
>> +
>> +/*
>> + * Mailbox registers. We basically only support mailbox 0 & 1. We
>> + * deliver to the VC in mailbox 1, it delivers to us in mailbox 0. See
>> + * BCM2835-ARM-Peripherals.pdf section 1.3 for an explanation about
>> + * the placement of memory barriers.
>> + */
>> +#define MAIL0_RD	(ARM_0_MAIL0 + 0x00)
>> +#define MAIL0_POL	(ARM_0_MAIL0 + 0x10)
>> +#define MAIL0_STA	(ARM_0_MAIL0 + 0x18)
>> +#define MAIL0_CNF	(ARM_0_MAIL0 + 0x1C)
>> +#define MAIL1_WRT	(ARM_0_MAIL1 + 0x00)
>
> That implies there are more mailboxes. I wonder if we should
> parameterize which to use via some DT properties? I guess we can defer
> that though; we can default to the current values and add properties
> later if we want to use something else.

BCM2835-ARM-Peripherals.pdf:

"Default the interrupts from doorbell 0,1 and mailbox 0 go to the ARM
this means that these resources should be written by the GPU and read by
the ARM. The opposite holds for doorbells 2, 3 and mailbox 1."

I don't see any references to more mailboxes than 0 and 1.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJU906xAAoJELXWKTbR/J7oqK8QALjEgTv8+juoVHSINBCcMs9e
9M/pgaRNtYpsPafkcsluHiN0LdaU3LnPOJUVn3X85sW0ebN/VrK756gLKOEfTfMK
jPznpQ8QRioAVwCJEl/aKsGOe8XJU3CA96mAHpAIT79WITaq+bzpaf8Mf707bUXQ
OMjAqw5peYAF5V5zcl1GAO1x0MrG6yVINAvMh66BoT7Xj4gSyHNRxmtmHu7zQilV
ngSGGnXkWbE1th5EE6uzfQCYPd+J77Nztd0s8MZnhHeH1iqWLnVDeTqb0FgpJ9NS
36dUCAluTGpERzcMFwBo3zg26A1iolHwD61hiTfL6dtQGdh2sYHNW0MpTMXWRB3Q
bz8zlmn3dLLQBDgShJEzGpilN7f8jchteH2gsxCM8zK0yzR66/oxl05YhHFH57kV
heaW6TBiJQYLAMdZu2zuHX12STOfDSir3isBoCVTkHtc6p2BLocpT8pcdGc+g0A7
gIy0dryqVyi7BtK/dQDAjYOLtmml+VyUl9if85X/OTcYfblRuYbEoZv1lXOu5LGQ
Tjt0548hIO8PD9SIM97WuHXABl6NZ4ydqVykXLbvAVfVZ8eQX3YJdQWDcZTTtb33
jk+vuMnsdl9DVHs1dHfnWx1lYWBA8E02t/fC/8jJGOGUclrDLmIm8oB/DYfDK34V
zPI9nS3T5KeOohHOCgjQ
=RQrI
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
