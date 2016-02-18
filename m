From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] ARM: bcm2835: dt: Add Raspberry Pi Zero
Date: Wed, 17 Feb 2016 19:02:21 -0800
Message-ID: <878u2iyb42.fsf@eliezer.anholt.net>
References: <1454571546-25481-1-git-send-email-lkundrak@v3.sk> <841429508.164723.e944b9b3-11a0-4dc4-8c6d-62cb30e79b12.open-xchange@email.1und1.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <841429508.164723.e944b9b3-11a0-4dc4-8c6d-62cb30e79b12.open-xchange-7tX72C7vayboQLBSYMtkGA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:

> Hi Lubomir,
>
>> Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org> hat am 4. Februar 2016 um 08:39 geschrieben:
>>
>>
>> Notable difference from the other Raspberry Pi boards is the lack of PWR LED.
>>
>> Signed-off-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
>> ---
>> arch/arm/boot/dts/Makefile | 3 ++-
>> arch/arm/boot/dts/bcm2835-rpi-zero.dts | 24 ++++++++++++++++++++++++
>> 2 files changed, 26 insertions(+), 1 deletion(-)
>> create mode 100644 arch/arm/boot/dts/bcm2835-rpi-zero.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index d000814..5d38b88 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -64,7 +64,8 @@ dtb-$(CONFIG_ARCH_BCM2835) += \
>> bcm2835-rpi-b-rev2.dtb \
>> bcm2835-rpi-b-plus.dtb \
>> bcm2835-rpi-a-plus.dtb \
>> - bcm2836-rpi-2-b.dtb
>> + bcm2836-rpi-2-b.dtb \
>> + bcm2835-rpi-zero.dtb
>> dtb-$(CONFIG_ARCH_BCM_5301X) += \
>> bcm4708-asus-rt-ac56u.dtb \
>> bcm4708-asus-rt-ac68u.dtb \
>> diff --git a/arch/arm/boot/dts/bcm2835-rpi-zero.dts
>> b/arch/arm/boot/dts/bcm2835-rpi-zero.dts
>> new file mode 100644
>> index 0000000..f9afc1a
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/bcm2835-rpi-zero.dts
>> @@ -0,0 +1,24 @@
>> +/dts-v1/;
>> +#include "bcm2835.dtsi"
>> +#include "bcm2835-rpi.dtsi"
>> +
>> +/ {
>> + compatible = "raspberrypi,model-zero", "brcm,bcm2835";
>
> please add this to
>
> Documentation/devicetree/bindings/arm/bcm/brcm,bcm2835.txt

If we can get this little bit fixed, I'd be happy to pull the patch.
The discussion of the LED behavior seemed like this was a reasonable way
to go.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWxTQ+AAoJELXWKTbR/J7ogFYP/2E8YFbNFte8urz/DZMARigN
M+fqRazXh/FtE5jqE03jO+U65t7djHeRstwTuKb2KJPt18f9IpEOLE0QJlHYXT0Z
sMRPhR9U1siKJk4W2tQLmF69tkoxOL1hSXgsxeVWo6f1rf0N6TPFuzjuRJsEb6OC
4GYgq3bk5m4NU16/7Hmvfq9+OCH1BB6C0aLg315dUGpI3TJ73zPkah46XgbJdyYX
Fp0HK688s9tIbg7P310rw3ww2d5lRF0vr0nBWemQp9/CtKWHoeOdYA6yTOH22RNr
ndGl31IMe0ifAz+rboqmfOqERe+RUfbi/NVqEwQS+LzYdT17Y+yp0fNGk1pdvcWm
+Air4wqvfeCk5fIUUKPa1ZFtsQYBnrtL3IzmeMmz0CS3XdB81echaGOfyqRfbbGj
B2Tq1SFuAiviewD+GrZkRY0uY/APmFID+PwsqxGpo3/qfQooMRjDmssYjyfaLtuP
vDFl0bGPIFG8CJFZENehlWG6Db9V3Q3e2EvorO9NfVGzSexr6Ky6+9/6dXx0fUP5
XbbUtYs04ZgKyEkbrzdmnx0IACMpAeaq+rGONSckpUDjSs188frKvuFOYZmt3Sqs
eJPHB8gKK1htad2lPFz4P1xXyof9W9TD9h6hpHm7haKMhVy+XxBletytRNVLY2su
iN4fFjo79/TAZIwEvLqP
=4i5A
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
