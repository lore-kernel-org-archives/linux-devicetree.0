From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: BCM2836 (Raspberry Pi 2) port
Date: Fri, 24 Apr 2015 11:41:38 -0700
Message-ID: <87pp6tweql.fsf@eliezer.anholt.net>
References: <1429639796-2169-1-git-send-email-eric@anholt.net> <5539C5A4.5070409@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5539C5A4.5070409-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
> I can't quite get this to work. I think what's happening is that U-Boot
> is over-writing the location of the code/data that the CPU1..3 pin loop
> uses. Do you know what that address is so I can confirm that?
>
> I suspect this because when I load the kernel/DT in U-Boot, or when I
> jump to the kernel to boot it, I see lots of extra duplicated characters
> on the UART, like all 4 CPUs are booting Linux. For example:

Oops, I was just extrapolating that U-Boot would work.  I've quit using
it because of the extra configuration work (particularly the compiled
text files for the boot scripts).

I haven't looked into how SMP works, because I don't have the interrupt
support necessary yet (bcm2836-irq branch for hacks in that direction).

And in further testing, the USB is actually not working and I'm not sure
what gave me the idea that it was.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVOo5iAAoJELXWKTbR/J7oKNMP/3r55opxy/4zajESxXUChWT/
Gfy76wK29wDsChDDFhwW0Seo0vwLq8J1+K3DtTUzFEUaxoDopL+t+M7CGxGBt9ZZ
ji1lBpfVHlyQ0TUtEnW2Q1M4PY+vUgQCZfCNtyL5GZOWM7JH6X5XUkaM18ZCLJz6
4ptA2MNr16lZEotkJ9xfyaYWRVtXe7vZ0wtDYBPztKi1Y3KelDpbqcjPyTvRAcGW
wrfGMG5mngFDUwQOtSJPATYdsQJ48aLWSRdjueTaV40y2KRlmvwvgH03d2zIB9YK
JqbjGtZY00l1DfN/iGPX/7A0Ckw6dfD1xWN1YtQKO1GOsyGEsvwnLwQy6c0fkHKB
RzgqOcp7hg5lAtdWMhXHMetzcCFJWd485n6F/3ATbig+Ho9FmJp9tKjvGQD8WOfY
WjoASH/w9KY+Ej+1XNa6v+wWkONLvCv2YDMMMx5NRfiZ+r8/uMARXquycCao/jJA
twh2vHJBKUo3GpX6XHnFENvpWOxrv7sP692MfGSJmYNJn8CJJ6OjPw8wnhybxbuI
UXM9JojxGQsqwKT+4wWHfS4J1sGeJ9vTGQh/N5LyoYZHbkzTPIYG6ivheOXrTQVc
ubef53oIrIbaOKLqZ5AZjma1FdhrjBuqf/qPQ4siYfPgjl0+1hOnAy92Ka5BfqcN
i29u3Xf5MvIHFrNfjBtX
=152N
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
