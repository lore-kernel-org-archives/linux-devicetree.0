From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: BCM2836 (Raspberry Pi 2) port
Date: Wed, 06 May 2015 11:51:33 -0700
Message-ID: <87a8xh1qve.fsf@eliezer.anholt.net>
References: <1429639796-2169-1-git-send-email-eric@anholt.net> <5540443C.8070604@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5540443C.8070604-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:

> On 04/21/2015 12:09 PM, Eric Anholt wrote:
>> This is my first submission of a Raspberry Pi 2 port.  It can be found
>> at https://github.com/anholt/linux/tree/bcm2836
>>=20
>> I'm using the 2835 interrupt controller support, without adding the
>> checks for ARM local interrupts first.  That means no support for IPIs
>> (and thus no SMP), no PMU events, and no local timer (I'm using the
>> same 2835 peripheral one).
>>=20
>> It supports a similar featureset to Pi 1 at this point.  Serial and SD
>> cards work.  Just one CPU supported.  USB (ethernet) works if you use
>> U-Boot, or my mailbox series
>> (https://github.com/anholt/linux/tree/bcm2836-mbox).
>
> Tested-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>
> I applied the patches on top of korg's linux-rpi.git for-rpi-next,
> resolved the io_map conflicts, and tested without U-Boot.
>
> I'll try to work out why it doesn't work with U-Boot. I can't
> immediately see anything in /proc/device-tree that indicates the RPi
> firmware is modifying the DT that's passed to the kernel to exclude any
> CPU1..3 spin tables, so either the kernel isn't hitting those purely by
> luck, or I'm guessing wrong re: the issue with U-Boot.

2836 SMP is now booting on my branch.  Big thanks to Andrea Merello for
doing most of the work on it.  Not-cleaned-up series is available at:

https://github.com/anholt/linux/tree/bcm2836-smp

There's a bunch of stuff in here I'm not sure about:

How do we like the way I'm inheriting 2835 stuff with the includes now?
(It's been a lot less merging work than my initial post had been, but
the /delete-node/ lines for 2386's changes are gross).

How do people feel about putting the 2386 local IRQ handling in the 2835
irqchip code?  Do we like the code sharing for GPU IRQs, or would we
rather have a separate driver?  Could we separate the 2836 local irqs
From=202835, and have it just call into 2835 for GPU IRQ handling?

Where do people think the arch timer frequency initialization should go
(commit "ARM: BCM2835: Set up the local timer frequency on 2836.")?  On
2709 it's in init_time(), but I hear we've been trying to move away from
these hooks.

Is there a sensible way to share our mapping of the local regs between
the driver and platform bits that need to access them?  (see
arch/arm/mach-bcm/bcm2836_platsmp.c for what we're doing currently)

Is there anything we would want to merge before getting a full working
implementation ready to merge?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVSmK1AAoJELXWKTbR/J7oZGsP+gNV+4VzQm+0qm46l3O+f42D
aVig+z98mGMBS3BQTgzC2lRh4wX1QFxOkCi5DsXrJaC+q4bqJtZjqMBBVGgefNSj
KGxv9Z6mt5S+Qg+2s2FwLgHJ37kf/afVix52tC8ZZG1xquaIUsVFxFug1Tzt0LLm
VCPqEZib1pHWbc0jU5qlqmXiZ/+g0yL8lx3gPf1oVyEOy9xwPCmC2ZaYCc7+FyG4
UkZ2XkEilIZPm/YAOf2WzjuYu+ftmzMe6O4BItRnRGcGYKwjYf84DAAJjqc0dNhw
g1W/o9YXy5jYAw21nr24VGxeZAFNzop1RhUNCoTAkTzgwHIdH1GoLgtBjxnwlh1T
Ej6pmU9+BqUihbMIPh50FMGvmAyRsI7bwXFJjnQ7Ukikjkw4M2coptGQbfU9tQKp
eVaXzP+IORdqK+J8cEdArSrx6sdG6WDUh9ri0FkwuD6M1yyeP2IeLxwaXVN0xE0g
poXWeU3KDEUkDo3B+/v6R1TGTrX4XXzViQoSDJuK5wU+Bc7TymdwYpRYdIZuHIhg
Ye697feFgcWub4SJq2V1s6k1c6zGk15F/3U6pyflfPZPlCkYtgMr9OuzsHDeq8H9
j47D1v7V19uIXTBx4Xysdm1wY8/ZbvxGQObUM20tHvd38ZX5SMuk6rkQCEQ+3bKM
Dru2bhpidxcwpDPGCYVO
=JahZ
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
