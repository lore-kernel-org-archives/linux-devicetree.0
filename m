From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 27/32] gpio: Add support for the FXL6408 GPIO expander.
Date: Thu, 09 Jun 2016 10:22:27 -0700
Message-ID: <878tyexooc.fsf@eliezer.anholt.net>
References: <1464817421-8519-1-git-send-email-kraxel@redhat.com> <1464817421-8519-28-git-send-email-kraxel@redhat.com> <CACRpkdax3AmnprT48zL7J92ddMvLYeRXi9OrQK_JrBT8_zZQoA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdax3AmnprT48zL7J92ddMvLYeRXi9OrQK_JrBT8_zZQoA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-rpi-kernel <linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:GPIO SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> writes:

> On Wed, Jun 1, 2016 at 11:43 PM, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>
>> +#define FXL6408_OUTPUT                 0x05
>> +/* Bits here make the output High-Z, instead of the OUTPUT value. */
>> +#define FXL6408_OUTPUT_HIGH_Z          0x07
> (...)
>> +       /* Disable High-Z of outputs, so that our OUTPUT updates
>> +        * actually take effect.
>> +        */
>> +       i2c_smbus_write_byte_data(client, FXL6408_OUTPUT_HIGH_Z, 0);
>
> High-Z is probably the same as open drain right? And if not open drain,
> it is push-pull.
>
> So you want to implement .set_single_ended() for configuring the lines in
> "high-z", i.e. open drain output mode.

I'll keep this in mind for whenever I end up writing my next GPIO
driver, but this one is dead for now (not actually usable because of the
closed firmware).

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJXWaXUAAoJELXWKTbR/J7oXlIP/28c/qu7DAusjvxWdu43Lil3
N0vb72w2v/VIIMm30+NM0iuEQfm/zHigSsaMCiNm4rhA/wcKU3kdEjT28WBVlP9E
BnfSdbk3jwqFezkG/tB0BFUpTwQQG86AbZ9svKJYPL2AxJFnzA+wa+SkmlXLeVku
vHr/l6h4pqDoXggcfmPMBG3Waev7QVsqI9JRGil4C5z4Hiqp/wEyoLeZ2jnwdpQY
1SVxWDkfJU+yVq5Z4FKUk7YvRxzfekhTC0zxmqkKBueIHflZ6XP/9mb2N+sTTJbR
3nY7fwDzXDYZQUfarXN5xrAzAKpTC7sMURPLe4f8GkR3RGnpaL2cSp9xeSVN2rlt
dlajNq1mHf6oWjGkC4JPGk/MFuRygdvyvZMHMF6CdS7l3LW7uKQzWIfjMxQ6I3wb
/gwZV1QFz5FDLxUuDxbIZlzQ3nFsBK8RYZyfrkIrU6eU7+KH9CCeImgggXIPFOhG
bhxWO0OYN1G7C5UIkQ5yyIrUZwbcbSt8TfmZGWAcA0w53Sb6bCk+Edt16mP9ANbh
F9HK4rdL5pzx5FouQv1yQsKqeUQqyZOtpV+oCBgYvnulMBPAVVE6Rs7Q4BnCBJcI
e7vtjp1nDfwFDUtraCShQh/oN8kWxovw8T7ewaWpruXKyRNIIsDNKCgfg7zYy0lB
JxuFqUIXHPVKmSi+BZEU
=PAcr
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
