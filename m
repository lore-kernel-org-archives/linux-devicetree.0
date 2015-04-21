From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 5/9] ARM: BCM2836: Add io map initialization for bcm2836.
Date: Tue, 21 Apr 2015 16:02:19 -0700
Message-ID: <87bnihhypw.fsf@eliezer.anholt.net>
References: <1429639796-2169-1-git-send-email-eric@anholt.net> <6559239.zHhRM8VZWD@wuerfel> <87oamh9q12.fsf@eliezer.anholt.net> <60195891.q3RtUhgfkn@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <60195891.q3RtUhgfkn@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> writes:

> On Tuesday 21 April 2015 13:37:13 Eric Anholt wrote:
>> Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> writes:
>>=20
>> > On Tuesday 21 April 2015 11:09:52 Eric Anholt wrote:
>> >> +static struct map_desc bcm2836_io_map __initdata =3D {
>> >> +       .virtual =3D BCM2835_PERIPH_VIRT,
>> >> +       .pfn =3D __phys_to_pfn(BCM2836_PERIPH_PHYS),
>> >> +       .length =3D BCM2835_PERIPH_SIZE,
>> >> +       .type =3D MT_DEVICE
>> >> +};
>> >> +
>> >>  static void __init bcm2835_map_io(void)
>> >>  {
>> >> -       iotable_init(&io_map, 1);
>> >> +       iotable_init(&bcm2835_io_map, 1);
>> >> +}
>> >> +
>> >> +static void __init bcm2836_map_io(void)
>> >> +{
>> >> +       iotable_init(&bcm2836_io_map, 1);
>> >>  }
>> >>=20
>> >
>> > Can you explain what this is needed for? Most platform ports don't
>> > do this any more.
>>=20
>> Nope, I can't!  I'm not sure what the bcm2835 side of it does, and I was
>> just replicating that for 2836.
>>=20
>> Should it be removed from 2835, too?
>>=20
>
> Hard to know. Does anything reference BCM2835_PERIPH_VIRT? Does it work
> if you remove it?

Well, that's clear enough. It dies early with:

Uncompressing Linux... done, booting the kernel.
[    0.000000] Booting Linux on physical CPU 0xf00
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Initializing cgroup subsys cpuacct
[    0.000000] Linux version 4.0.0-rc1-v7+ (anholt@eliezer) (gcc version 4.=
9.2 ( 4.9.2-10) ) #487 SMP PREEMPT Tue Apr 21 15:58:29 PDT 2015
[    0.000000] CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=3D10c=
5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instr=
uction cache
[    0.000000] Machine model: Raspberry Pi 2 Model B+
[    0.000000] bootconsole [earlycon0] enabled
[    0.000000] cma: Reserved 64 MiB at 0x37000000
[    0.000000] Memory policy: Data cache writealloc

(hung)

The only thing I see using this 0xf0000000 range is DEBUG_BCM2836's
serial stuff, though.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVNtb7AAoJELXWKTbR/J7o7hIQALv0Iiii9xBM76Vu+Lxmy1rn
QcJPIUV1o+iOqI77vQhwZlKQqqWcTmJERml6Hi5sfUK2M47+hvRU+AS3gaYXodBG
ZgFLX7ru5dfu8MxE2wMUGIeTj7hGUJqOq6QmzJ7op921r1c04GzOghZwQAycdfkl
T8Jz4jyPHDavOl3wl547e+yNmmoSlBYJanjhAfjXvTvxlOm+DGhu43wPkyMfCepL
8PseppBPf7HP42bPFRFm3vz5WSE6lAlWaYHgz0jwQL31EfVR1l/co9UafNImBtqL
/d6mYQPLeJ9Hj+mnvKzSN4aj8yMGmB0G1sZer4e+/ndd/vwKiIKayIbcgH8+GDtP
hwoiUDWI5FY1jRYXWjShM4u+YBcpzGiXvNziDaY13uGsyWDgXto4+/Czt7Zgcwih
wNP/hjehJaNVs7F7U39WpbmnOfiG4BH8PA83EmJtxrzuuvR9MjfkfnMhCC/eSIB+
92LR3RvVOOQKSTu2dxdBzrUEcg4sYpxfc0Wv5U9G0dmPNgQPyRAsH2i2jjgjufCS
lUjf4wq04BczEvl8qI0bOSk0Hs5RZ/0mSywRGR9aA2yumRdXDMuBgTuCw2PuKMVQ
SrkPYG/D3y+3FTkdJByFoQNx/QwmbjIP4Epytqj0KdJNp6PDE0MWsqp6S3QUvnjl
7SkwyEvCOBcFTxLdfczX
=dpKd
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
