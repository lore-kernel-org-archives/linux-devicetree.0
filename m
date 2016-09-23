From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH V3 RFT 3/5] ARM64: dts: bcm283x: Use dtsi for USB host mode
Date: Fri, 23 Sep 2016 11:15:33 +0300
Message-ID: <87zimz821m.fsf@eliezer.anholt.net>
References: <1471792204-21908-1-git-send-email-stefan.wahren@i2se.com> <1471792204-21908-4-git-send-email-stefan.wahren@i2se.com> <bb073ea3-2f89-4fc5-e3af-2e27c54f221e@i2se.com> <1473245956.28663.50.camel@redhat.com> <18641a83-ddd7-1689-535a-c5a15b8a54f9@i2se.com> <1473257837.28663.80.camel@redhat.com> <aeba1434-3903-3ec4-1a94-e5c8229f4e5f@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <aeba1434-3903-3ec4-1a94-e5c8229f4e5f-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:

> Am 07.09.2016 um 16:17 schrieb Gerd Hoffmann:
>>   Hi,
>>
>>> ARM: dts: Remove use of skeleton.dtsi from bcm283x.dtsi
>>> ARM64: dts: bcm: Use a symlink to R-Pi dtsi files from arch=arm
>> Picked them up.
>>
>>> In case of a multiplatform config with following settings the driver
>>> isn't able to "detect" the role:
>>>
>>> CONFIG_USB=y
>>> CONFIG_USB_OTG=y
>>> CONFIG_USB_DWC2=y
>>> CONFIG_USB_DWC2_DUAL_ROLE=y
>>> CONFIG_USB_PHY=y
>>> CONFIG_NOP_USB_XCEIV=y
>>> CONFIG_USB_GADGET=y
>>> CONFIG_USB_ZERO=y
>> Configured my kernel that way so the test actually tests something ;)
>>
>> And ... everything looks fine.  usb ethernet works, and so does the usb
>> keyboard.  /proc/device-tree/soc/usb@7e980000/dr_mode exists and
>> contains "host".
>>
>> Tested-by: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>
>
> This patch hasn't been merged yet. Is there something wrong?

I hadn't bumped it back to todo from RFT.  Also, is this a priority
patch, since submitting merges is a pain?  Does USB break in some way
without it?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJX5OSmAAoJELXWKTbR/J7oIYAQALMalEKwFGI92YbtxKJSsXtZ
mFDw6aSGp7n1/cvrj8Yitfzr/8YO2v3xhGIvIDHFVt/ENFC+0GwRelI+cz3R5FQb
TEcGkx1W46iljua6FQqWfOZCAUbilKJflERQSZj7WqoBvI1rYFwctwRCbQ58R/zh
hR4zUi5POULmXsYy/fD/bpcFPIovHWO8RN0+IDM+Mjw7WsoaTU7ReKTNN0EPWyQf
M1vhyTgIIZMuw++iinoQYAPslYfDGas3JCljHn3bi+VQ+gT9aRD2EPULHH+41LLX
+Urwg6dMSG+f4+jwRdXsPM4uH6jEeIyIOCEvD62OcRt2Agdnu5M13gskwxw5EeLq
fuURgBx3uVC3VKXAKxtQ0LChaCjuVGj9Pg825x+h04uC1+BXZ4J8EyqaqUayMqOa
F/ZhFG3kIQJqwZN6r4pXMLyVmMNP++ep8pGOxn5B5+Oa5L6xPycovBJteIVL+oGH
T0cY4iRmPRTGgGmOvq52yGilVo6GR8RYWRb6eKzS1ODAP/KeSBqUuNTcGr66Ovzl
XL7rEJN0bHjScxv5O12s34nUJj0Ma6BPUvhwevmiu8CQ4JCtPiwB5EVcQD1DCbHu
IQUcT2xrFHhvjJdTu5O1kzotUFfedAMZMjNQPxij88m4ZxTrYRD1HBMEh4m5KngO
wLWA+RJ28Jau773Mj+W2
=k45w
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
