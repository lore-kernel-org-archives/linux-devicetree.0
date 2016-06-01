From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 09/32] bcm2837-rpi-3-b.dts for 32bit arm
Date: Wed, 01 Jun 2016 15:30:35 -0700
Message-ID: <87zir4leyc.fsf@eliezer.anholt.net>
References: <1464817421-8519-1-git-send-email-kraxel@redhat.com> <1464817421-8519-10-git-send-email-kraxel@redhat.com> <7065434.SNfT8zjcK3@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7065434.SNfT8zjcK3@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> writes:

> On Wednesday, June 1, 2016 11:43:18 PM CEST Gerd Hoffmann wrote:
>> diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts b/arch/arm/boot/dts/b=
cm2837-rpi-3-b.dts
>> new file mode 100644
>> index 0000000..36178a6
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
>> @@ -0,0 +1 @@
>> +#include "../../../arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts"
>> --=20
>> 1.8.3.1
>>=20
>
> What does this gain you?

Many Raspberry Pi users use a small set of SD cards that they swap
between various versions of the hardware.  It would be good to have
their 32-bit OS images work on the Pi3 as well.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJXT2IMAAoJELXWKTbR/J7oTC8P/1q961uyhPMRUHUA8BgOHXS9
STU9QiTgpO//aWrLLnuH/kq5mm2cSzc3TTZjCwT5VweXtR64SvXF+oUXUXUFsUJX
H/BFb9frsBA5BwPeJa6SAyGiwykgqsrpeD1AuU7OD9vTQN2gVITdPSN7lRc+vaI/
L3Sg0KVmmlmIXRvcB+eBLkeiAfp197YsQBcoh9OTJFLE4lN+/upQdX9pzlL+HXv+
ZfTi5TSRJykyO6tNQzRdIL7w9EdzZ0WV+P+IHeVP9sTgl8vks7JLkxQLMBchMh4+
achaCOmdx5EwJ3ntajrM50v34lR/1APD5HnPIZw4/0vkaVhgm4Kdj0W1/2RO2t2X
24EXYfyaYUF15KlwcYZgfreiOpnpFpeFgc0Zljx/eSczSjXkMEduCdzs410cKFu1
jXuWBOor035IOccwzIUL68KEqrRuW9Yz+MthKxAwiF3SiwqlpBA1Idskd4S31hcD
QLtQZUrIMkH6W41ax/+p30lECAX/wQn6Z1mCr+Awej8C64lzTwqHUKfspfBUxZTZ
fLo6+2FX1TbiQt2mn88E9Li+FY90snm8F5htM9Xl29bn2Msfzpa43nddf+Rkofy6
ZOCUYK1vcPqw1yO8veqbgxDNZ247Nt/TnQJJUhO7WMSERlgC7jkNIA5oV321KHWF
vVg8T/fLbUHmT7zWZTJl
=N09K
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
