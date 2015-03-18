From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 3/4 v4] mailbox: Enable BCM2835 mailbox support
Date: Wed, 18 Mar 2015 15:39:57 -0700
Message-ID: <87bnjqorpe.fsf@eliezer.anholt.net>
References: <1426213936-4139-1-git-send-email-eric@anholt.net> <1426213936-4139-3-git-send-email-eric@anholt.net> <20150318084255.GJ3318@x1>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150318084255.GJ3318@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--==-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:

> On Thu, 12 Mar 2015, Eric Anholt wrote:
>
>> From: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
>>=20
>> Implement BCM2835 mailbox support as a device registered with the
>> general purpose mailbox framework. Implementation based on commits by
>> Lubomir Rintel [1], Suman Anna and Jassi Brar [2] on which to base the
>> implementation.
>>=20
>> [1] http://lists.infradead.org/pipermail/linux-rpi-kernel/2013-April/000=
528.html
>> [2] http://lists.infradead.org/pipermail/linux-rpi-kernel/2013-May/00054=
6.html
>>=20
>> Signed-off-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
>> Signed-off-by: Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>
>> Signed-off-by: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
>> Signed-off-by: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
>> Cc: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>=20
>>=20
>> v2: Squashed Craig's work for review, carried over to new version of
>>     Mailbox framework (changes by Lubomir)
>>=20
>> v3: Fix multi-line comment style.  Refer to the documentation by
>>     filename.  Only declare one MODULE_AUTHOR.  Alphabetize includes.
>>     Drop some excessive dev_dbg()s (changes by anholt).
>>=20
>> v4: Use the new bcm2835_peripheral_read_workaround(), drop the
>
> Can you explain to me why this is required (and don't just point me in
> the direction of the other patch ;) ).  You appear to be using the
> non-relaxed variants of readl and writel, which already do memory
> barriers, so I'm a little perplexed as to how the problem can arise.

Hmm.

A shorter restatement of the architecture requirement would be, I think,
"Don't let there be two outstanding reads of different peripherals on
the AXI bus, or the CPU might mis-assign the read results.  Use rmb() to
wait for the previous bus reads when you need to prevent this"

arch/arm/include/asm/io.h's readl() does __iormb() after each
__raw_readl().  Imagine taking an interrupt for a new peripheral between
the driver's __raw_readl() and the following __iormb(): Now you've got
two __raw_readl()s in between iormb()s and you can theoretically get
unordered reads.

We could hope that the architecture IRQ handler would happen to do an
incidental rmb(), resolving the need to protect from interrupt handling
inside of device drivers.  The interrupt controller's presence at
0x7e00b200 sounds like it's an AXI peripheral, so it would need to be
ensuring ordering of reads.  However, it's doing readl_relaxed()s.  So
my rmb() at the start of my irq handler is silly -- if somebody got
interrupted between readl and rmb, we've already had a chance to get the
wrong result inside of the IRQ chip's status read.

My new idea for handling this would be to:

1) Assume drivers don't exit with reads outstanding.  This means they
don't do a readl_relaxed() from an AXI peripheral at the end of a path
without doing something with the result.

2) Make bcm2835_handle_irq() do this rmb() at the top, with the big
explanation, to avoid a race against the interrupted code device being
inside a readl() before the __iormb().  We don't worry about the 1-2
readl_relaxed()s inside of bcm2835_handle_irq(), because their return
values get waited on before continuing on to calling the device driver,
so the device driver knows its IRQ handler is being entered with no AXI
reads outstanding.

--==-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVCf69AAoJELXWKTbR/J7oYvMP/2+MJGBtAFjsLEMXv/eS2sdh
yd9EgyhVuN5YhYIiU43McCf1dJEn00xBUWl1e6fftB4cIRkHtw4ADNO0v++T7iFi
f0HVpOgP9r/sjrE3BH+I4Mo6/zWjkS1JPqopSk1bXz+A07mUJRKHDPIWRWwycOu0
5af43OyVRhzfxpqPd6AMC7Oupq0IlIrcoHwMbQM8rJIN9YV0C0xgLkgA94v1rpPk
zRzujriaQcIfuCkoSRS1XWg0er8E9HWnuhZnuBAIyaJMT+KUyA4rnifkcSln2KzS
rl7fQUVmTRMIqjYVWrrKVVy37HmVAVGlfUZsrMK1ZAmnnnt/95W9XN2v4k9vYeHb
Wa4TodryOvTu+Du4v1LhuN/adY4uOKi3djKrRBrLOwCz0fKn+HZtTX3e5ISYVBlJ
0r77KCozO6JVf1A7e56Qzls+X5b5JzHW8oKkQ3+X5aHqZWFP4/RPopMzv8EmPg3a
cepKzevUQ0X6+k2lB3oH0vmGoAKbgwozVdJQshkyVJvEfsLOzn3Fqz2wWvIaTtDH
VSzOYPsgkLHF35VNwcfqK8fN1QqvxgsOL1zE9DgaRhXP4oGn6rdJD3yfpRxPW5sL
FAs7omsiAImR2jneS3smc6sR5zAQqLANmXBYw7J5pft5yH/kl/fNT1KQBqTno1hO
l04Jy16fMpireU9FzrKz
=cN89
-----END PGP SIGNATURE-----
--==-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
