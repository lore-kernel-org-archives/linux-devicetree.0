From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [RFC] rpi: add support to enable usb power domain
Date: Thu, 29 Oct 2015 12:02:24 -0700
Message-ID: <87a8r1pkfz.fsf@eliezer.anholt.net>
References: <1446064810-5064-1-git-send-email-alex.aring@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446064810-5064-1-git-send-email-alex.aring-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Alexander Aring <alex.aring-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Alexander Aring <alex.aring-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> This patch adds support for RPi several Power Domains and enable support
> to enable the USB Power Domain when it's not enabled before.
>
> This patch based on Eric Anholt's patch to support Power Domains. He had
> an issue about -EPROBE_DEFER inside the power domain subsystem, this
> issue was solved by commit <311fa6a> ("PM / Domains: Return -EPROBE_DEFER
> if we fail to init or turn-on domain").
>
> It was tested with barebox and the following scripts before booting
> linux:
>
> /env/a_off:
>
>  # cat /env/a_off
>  #turn off which are enabled by default
>  regulator -n bcm2835_mci0 -s disable
>  regulator -n uart0-pl0110 -s disable
>
> /env/a_on:
>
>  # cat /env/a_on
>  #turn off which are enabled by default
>  regulator -n bcm2835_mci0 -s disable
>  regulator -n uart0-pl0110 -s disable
>
>  regulator -n bcm2835_mci0 -s enable
>  regulator -n uart0-pl0110 -s enable
>  regulator -n uart0-pl0111 -s enable
>  regulator -n bcm2835_usb -s enable
>  regulator -n bcm2835_i2c0 -s enable
>  regulator -n bcm2835_i2c1 -s enable
>  regulator -n bcm2835_i2c2 -s enable
>  regulator -n bcm2835_spi -s enable
>  regulator -n bcm2835_ccp2tx -s enable
>  regulator -n bcm2835_dsi -s enable
>
> /env/b:
>
>  # cat /env/b
>  sh /env/a_on
>
>  regulator -n bcm2835_mci0 -s disable
>  regulator -n uart0-pl0110 -s disable
>  regulator -n uart0-pl0111 -s disable
>  regulator -n bcm2835_usb -s disable
>  regulator -n bcm2835_i2c0 -s disable
>  regulator -n bcm2835_i2c1 -s disable
>  regulator -n bcm2835_i2c2 -s disable
>  regulator -n bcm2835_spi -s disable
>  regulator -n bcm2835_ccp2tx -s disable
>  regulator -n bcm2835_dsi -s disable
>
> /env/c:
>
>  # cat /env/c
>  sh ./env/b
>
>  regulator -n bcm2835_mci0 -s enable
>  regulator -n uart0-pl0110 -s enable
>  regulator -n uart0-pl0111 -s enable
>  regulator -n bcm2835_usb -s enable
>  regulator -n bcm2835_i2c0 -s enable
>  regulator -n bcm2835_i2c1 -s enable
>  regulator -n bcm2835_i2c2 -s enable
>  regulator -n bcm2835_spi -s enable
>  regulator -n bcm2835_ccp2tx -s enable
>  regulator -n bcm2835_dsi -s enable
>
> These scripts enables/disable all regulators inside the bootloader. It
> was running with a "hard" and "soft" reset without any issues. These
> testcases should fit to Stephen Warren suggestions:
>
> "(a) before having explicitly turned the power domain on or off at all (b)
> after having turned it on (c) after having turned it off, and for all
> power domains."
>
> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> Cc: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> Cc: Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
> Cc: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Alexander Aring <alex.aring-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> First:
> I cc'ed Andy Whitcroft and Joe Perches here, because this patch will
> generate a false positive for checkpatch and checkpatch told me to
> cc checkpatch maintainers if this occurs:
>
> ERROR: Macros with complex values should be enclosed in parentheses
> #191: FILE: drivers/firmware/raspberrypi.c:26:
> +#define RPI_POWER_DOMAIN(_domain, _name)			\
> +	[_domain] =						\
> +	{							\
> ...
>
> Second:
> This patch based on linus/master and requires the rpi-firmware patch.
>
> Third:
> The barebox regulator doesn't support right now to enable/disable
> regulators at runtime but I want to bring this mainline in the next
> days. So you can't check yourself if the above scripts working right
> now. I describe it here to show you what exactly I tested.
>
> changes since Eric Anholts "power domain" patch:
>  - add for me all known power domains of the RPi, it contains the domains
>    0 - 9.

Note: None of the power domain enums other than the ones I'd had in my
patch are actually connected to anything in the firmware.  I don't think
we should be adding them, given that.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWMm1BAAoJELXWKTbR/J7o0YcP/04Xm/q+bJ3PnUmpSTRLVm8G
9KDuKipd1+oItmll5IIrm1wnbRsuZqFolpt5MK6WodYg9ugQiR7ZpJMKhV0xn8kr
MtTwP8LxtSUTOrJQ26vrE5m1G+sFcyhNwMxi6yWjjHuA1neLs1/HbBDZTgOxMgxq
/WbQLKqhAb7fwK2i+3lxGpifqm7V5XLwWYhLkArz3G64Z/xCKhQl2r8LkrlBXW5v
JGspJnUZqr7SIZlzEqO+JvUJbAiWw+UqtuzBkMFU8FDR+HGCSSczZLtVu9atM8xW
vYotcB+JKrjHezzG1Vcjdmuo6NV5S5i10DgojITLstuiVUxiAHcs9yroVbidvY34
B1bLEd/1x+sjgaGrosJO1/+Y1k22p44jCFvGkaFtYQuqLmXPrSYrtyiDQ5XPNG80
pdpHnHi9+RRojmid0ehsZFQUdaXxabcl6XMbsQBA1OUkv9oRKZ+E1jk8JDd9kg4L
LUbnWYCLRFPhD4lfnQQQJZVaKjWAhPh/kuxTXEJvMgpPa1sSpdc5Z41ulb8OfOwd
XwhCZJ0eqOGbPcKDYr/NjhMfby4X7ZJfZrs9PNZ0VXDxjDik5Df5aqxNPLL3U1JC
130gvvUCPwkxsPKbiTkWFrf/RwpcWQt0fdz9/RbNZ3s22JO1i4UJ6Yqu93TuvqeT
kX/mHkcNyDOR3XwGFUnw
=9a+V
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
