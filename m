From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 3/4 v4] mailbox: Enable BCM2835 mailbox support
Date: Wed, 18 Mar 2015 16:28:23 -0700
Message-ID: <87619xq414.fsf@eliezer.anholt.net>
References: <1426213936-4139-1-git-send-email-eric@anholt.net> <1426213936-4139-3-git-send-email-eric@anholt.net> <5507A095.5090805@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5507A095.5090805-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--==-=-=
Content-Type: text/plain

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:

> On 03/12/2015 08:32 PM, Eric Anholt wrote:
>> diff --git a/drivers/mailbox/bcm2835-mailbox.c b/drivers/mailbox/bcm2835-mailbox.c
>
>> +#define MBOX_MSG(chan, data28)		(((data28) & ~0xf) | ((chan) & 0xf))
>> +#define MBOX_CHAN(msg)			((msg) & 0xf)
>> +#define MBOX_DATA28(msg)		((msg) & ~0xf)
>
> Even the concept of storing channel IDs in the LSBs feels like it might
> be RPi-firmware-specific rather than HW-specific?

I guess?  If we found another firmware protocol, we could have that
device's dt just specify a different compatible string.  But in the
absence of another firmware to talk to, I'm not sure what you want here.

Note that Roku's kernel code dump doesn't even communicate through the
mailbox.  vcio.c exists, but is disconnected from the build.

--==-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVCgoYAAoJELXWKTbR/J7oBFwQALfRLQ9ywxXQV9s56zlzNvEg
eRjHFTkWFlLIrdRiwtduagKseoFRVdMPCYvW0NzHbprF7DROKYtV/GJwvkbqhs3k
6Iujpplt1QowTo2rPVVF47dlDvKb8eYiUAJLKNi6qDtm+W1wPipY2QZbXjPlTZOe
GlYMKpwSDEjceD8Mi6a8z1vle3hbOyrx3I+f/pk6XIjfcyC1kbVSr5+dhuA4oa0G
bSAJVNaFw5hxNHhTgQNu457WOCnDd8J1qGYjtaTdVsdibtmnPseOHUZavLKwoOr2
Mlk3BXYUudUGVW6RR4jIzWV5w0xChF1GjbMRL9xq83YYaT9BPf0q/a9Att8ruMkI
7Gymes8efX4RXczCIpDAgFDintzQKK1A74xxufTIC9APXJYzn/f9SjLczzzsilY3
m+Lg1bxp79Bkq2/aH+p1FCQq2xJ2eVngnETp2/XvRL324Mj7TJttwAnm11M42mb2
00AWYniUg0hoHgMyFcDGNQ815fDymHnGGET9krFv5eOPd+eRxtcE+YjjjTW5l28y
3DGT+Jy/Svr+D+EZhxYo/4kZVmCd0rcS+wLthw58ma3FmNjlmX7w6Z8EKLFxbKDU
l8rHCQP/zjgSNZRJM+YvWCGOmbIRzfb4zzglv1HLCCoLsaivExM+ZY3zzJzX1wsQ
6pvJFStWYYU8Q8kJC5Hs
=gIBK
-----END PGP SIGNATURE-----
--==-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
