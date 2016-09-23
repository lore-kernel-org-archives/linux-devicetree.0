From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH V3 RFT 3/5] ARM64: dts: bcm283x: Use dtsi for USB host mode
Date: Fri, 23 Sep 2016 14:55:28 +0300
Message-ID: <87vaxm96fj.fsf@eliezer.anholt.net>
References: <1471792204-21908-1-git-send-email-stefan.wahren@i2se.com> <1471792204-21908-4-git-send-email-stefan.wahren@i2se.com> <bb073ea3-2f89-4fc5-e3af-2e27c54f221e@i2se.com> <1473245956.28663.50.camel@redhat.com> <18641a83-ddd7-1689-535a-c5a15b8a54f9@i2se.com> <1473257837.28663.80.camel@redhat.com> <aeba1434-3903-3ec4-1a94-e5c8229f4e5f@i2se.com> <87zimz821m.fsf@eliezer.anholt.net> <4cda98b0-03a6-f43d-0eee-29b7702eac8c@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4cda98b0-03a6-f43d-0eee-29b7702eac8c-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:

> Am 23.09.2016 um 10:15 schrieb Eric Anholt:
>> Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:
>>
>>> Am 07.09.2016 um 16:17 schrieb Gerd Hoffmann:
>>>>   Hi,
>>>>
>>>>> ARM: dts: Remove use of skeleton.dtsi from bcm283x.dtsi
>>>>> ARM64: dts: bcm: Use a symlink to R-Pi dtsi files from arch=3Darm
>>>> Picked them up.
>>>>
>>>>> In case of a multiplatform config with following settings the driver
>>>>> isn't able to "detect" the role:
>>>>>
>>>>> CONFIG_USB=3Dy
>>>>> CONFIG_USB_OTG=3Dy
>>>>> CONFIG_USB_DWC2=3Dy
>>>>> CONFIG_USB_DWC2_DUAL_ROLE=3Dy
>>>>> CONFIG_USB_PHY=3Dy
>>>>> CONFIG_NOP_USB_XCEIV=3Dy
>>>>> CONFIG_USB_GADGET=3Dy
>>>>> CONFIG_USB_ZERO=3Dy
>>>> Configured my kernel that way so the test actually tests something ;)
>>>>
>>>> And ... everything looks fine.  usb ethernet works, and so does the usb
>>>> keyboard.  /proc/device-tree/soc/usb@7e980000/dr_mode exists and
>>>> contains "host".
>>>>
>>>> Tested-by: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>>>
>>> This patch hasn't been merged yet. Is there something wrong?
>> I hadn't bumped it back to todo from RFT.  Also, is this a priority
>> patch, since submitting merges is a pain?=20
> No
>> Does USB break in some way
>> without it?
>
> No. I only want know if this is still in queue and does someone care
> about this patch.

It's in my queue now.  Sorry for missing it!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJX5RgwAAoJELXWKTbR/J7o1zkP/jW4/m3V6RcfUIJ7p0Q5Y9TM
u61hXB6M2gGbbnXmklspuKmOabt0nHYTH4HICRXpOvyDbh4JGgAsgaEXRfNo+0gM
Rdwl7DKM/e4mOgIvYXN8OM7EISL5qMZC9P6cDlf2CYx/2W/C1w8p3rwtHc6xviDm
7yQR0JEZnx8s/rKZAfFuxEcELjZnIi3KpkhyywFA786VIs67cLlcjsY3Q1vNc9al
+dQzJUkvbSZ8x9R2PB1qFYr4ivQOXza7sHOXKeMPhnfitHG/OnoGSzBQgof690Hl
KR/um3LLwWPAHvQ4h8ECjjGejQewih2crQMlB3vQXL8/rzBuJyh5b+kVHwVmQSZk
jk8J2Fqkp9w3NZa3i47VCBBzqYuSv0tSZ/Ow3NJK+NPrC1ucOWHWlAMSmHdEYKVG
xz0lHuuVdOtvaUljTziVSuQQy/LBi31t2NfpCsPDnSQkOsLteo48vtBmGw2JvTfF
ISSfPJ8dTSazHSlAZljR2FLNo5HFLYvZc3wQnw9Jb7Npl2WU326hY0snI8kn60lY
9wHVoxpmv62Ume6KwAy3L4TJvJQWySq4En+Z1binKIYTKqambcgCM3Qc++/NCzrL
QiIFS4gGl1HSlkTkAYW6AgzNfs9nQ/gcZtba8VOtkNDkZZrxgmcZ4eMhXl2xezJF
+motGtN9zx/gNfLSPCIF
=opoB
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
