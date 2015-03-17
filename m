From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: BCM2835: Add a function for doing an rmb() between device reads.
Date: Tue, 17 Mar 2015 12:06:02 -0700
Message-ID: <87wq2fla05.fsf@eliezer.anholt.net>
References: <1426213936-4139-1-git-send-email-eric@anholt.net> <55079E79.6030303@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55079E79.6030303-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:

> On 03/12/2015 08:32 PM, Eric Anholt wrote:
>> Stephen Warren was concerned that the rmb() present in the new mailbox
>> driver was unnecessary, and after seeing the docs, that it was just so
>> surprising that somebody would come along and remove it later.  The
>> explanation for the need for the rmb() is long enough that we won't
>> want to place it at every callsite.  Make a wrapper with the whole
>> explanation in it, so that anyone wondering what's going on sees the
>> docs right there.
>
>> diff --git a/include/soc/bcm2835/peripheral-workaround.h b/include/soc/bcm2835/peripheral-workaround.h
>
>> +static inline void bcm2835_peripheral_read_workaround(void)
>> +{
>> +#ifdef CONFIG_ARCH_BCM2835
>
> Would this header be included if that wasn't defined? Perhaps that'll be
> answered by a later patch...

Well, we may find we need workaround rmb()s in, say, dwc2.  I don't
think we'd want to have them unconditional on other architectures when
bcm2835 isn't included in the build.

>> +	/*
>> +	 * The BCM2835 bus is unusual in that it doesn't guarantee
>> +	 * ordering between reads from different peripherals (where
>> +	 * peripherals roughly correspond to Linux devices).  From
>> +	 * BCM2835 ARM Peripherals.pdf, page 7:
>
> Many buses don't guarantee ordering; that's quite common. The issue is
> that the CPU then doesn't match up the correct read request and
> response, thus causing it to swap the results of read requests. That's
> the unusual part. It would be useful to spell that out more explicitly
> in this introduction, even though it is called out in the example below.
>
> BTW, the ARM mailing list is linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org not
> linux-arm-kernel-u79uwXL29TaiAVqoAR/hOA@public.gmane.org

Fixed in my send-email script, thanks!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVCHsaAAoJELXWKTbR/J7ofZUP/A+F35TWyzDwFoJ0E5OCRX2r
NXc9D4R5eZSx3QubpQp1fLXxf+JLwm7yp47M1ygSpr9Cq4YLTtXL6KnC9M9iUiA9
M74Fj/Y4ZtRCSyUt/joEfvRiYe3SZcqft7k703mhoA1NGrtfi+nchYtyuC+BPuS4
GPLpLOwYcDEwuc8mxvjmeGTg28nHcHUAzVb8dPxT/ysWnyGoTdmLUlNO2RdTYlmB
VkAQzomaU0vD7p66HwhSQD+B4h4An8UVMUoz4CpNsTFkC0/Op5Zy8wnSakDUfXJx
HbYppwth+d032Kixw64xPjnMorWlPrrDNCE4dC7z+zHZxoA6XwyKWStpSxvGqUeJ
Y/7cfQViKg60s2PleLhEySMqCTuLp6t7BcccGhntpXWvkblQDIVTrjji/0egA25s
rTKrrpXOgXM7XqRrPGIk5tYA/ocrtvlJlrH+VCmXYCL74bJ1aaQ6lrNkYOOJlFf0
QyA7f3VM0eeEUoFD/dvS/YR5Sq4/+pKQm0sID475LHAJgkWK4sPisVF2fP/hBYU3
YbMSHjnMMJRaAN+/ECKhxnms3TIQJpHWnYT6R4bWdupR2cJT7LS/VmB0hDJCV+UC
354JiGBK6KDtUoTX1YFCnMl3tY7qlCnZhPuGtnEyZ2iTN9K3AVa1hn8dC7eLxbuX
ysO1dpz53fDpIPgVlFCG
=HhAm
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
