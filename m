From: Aditya Xavier <adityaxavier@gmail.com>
Subject: Re: [PATCH V2] ARM: dts: BCM5301X: Add missing Netgear R8000 LEDs and
 Keys
Date: Mon, 30 Jan 2017 14:38:33 +0530
Message-ID: <A0233283-B547-42E5-BBBF-3B75E592D858@gmail.com>
References: <20170128143749.5897-1-adityaxavier@gmail.com>
 <CACna6rzaEw+_tgMtG5ASRX+AZSbg-yA=pnpaD9uE1AK8ZGKJ1Q@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3263\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACna6rzaEw+_tgMtG5ASRX+AZSbg-yA=pnpaD9uE1AK8ZGKJ1Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>
List-Id: devicetree@vger.kernel.org

Would you require me to send the revised Patch ?

Or would this do ?

And thanks for guiding me through this process :)


> On 29-Jan-2017, at 2:45 AM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:
>=20
> On 28 January 2017 at 15:37, AdityaXavier <adityaxavier@gmail.com> =
wrote:
>> From: Aditya Xavier <adityaxavier@gmail.com>
>>=20
>> Added two WAN status LEDs and a GPIO Key for Brightness which were =
missing.
>> V2: Updated subject, Power LED names, and WAN labels.
>=20
> Changelog (V2 ... part) should go into that /comments/ section (see =
below).
> Florian: can you drop that line when applying this patch? Otherwise it
> looks OK to me.
>=20
>=20
>> Signed-off-by: Aditya Xavier <adityaxavier@gmail.com>
>=20
> Acked-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> Thanks for the patch!
>=20
>=20
>> ---
>=20
> Right here, below these 3 dashes is a place where you can add extra
> comments (they won't go into log when doing "git am").
>=20
>> arch/arm/boot/dts/bcm4709-netgear-r8000.dts | 22 =
++++++++++++++++++++--
>> 1 file changed, 20 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/arch/arm/boot/dts/bcm4709-netgear-r8000.dts =
b/arch/arm/boot/dts/bcm4709-netgear-r8000.dts
>> index 92f8a72..90d4420 100644
>> --- a/arch/arm/boot/dts/bcm4709-netgear-r8000.dts
>> +++ b/arch/arm/boot/dts/bcm4709-netgear-r8000.dts
>> @@ -27,18 +27,30 @@
>>        leds {
>>                compatible =3D "gpio-leds";
>>=20
>> -               power0 {
>> +               power-white {
>>                        label =3D "bcm53xx:white:power";
>>                        gpios =3D <&chipcommon 2 GPIO_ACTIVE_LOW>;
>>                        linux,default-trigger =3D "default-on";
>>                };
>>=20
>> -               power1 {
>> +               power-amber {
>>                        label =3D "bcm53xx:amber:power";
>>                        gpios =3D <&chipcommon 3 GPIO_ACTIVE_LOW>;
>>                        linux,default-trigger =3D "default-off";
>>                };
>>=20
>> +               wan-white {
>> +                       label =3D "bcm53xx:white:wan";
>> +                       gpios =3D <&chipcommon 8 GPIO_ACTIVE_LOW>;
>> +                       linux,default-trigger =3D "default-on";
>> +               };
>> +
>> +               wan-amber {
>> +                       label =3D "bcm53xx:amber:wan";
>> +                       gpios =3D <&chipcommon 9 GPIO_ACTIVE_HIGH>;
>> +                       linux,default-trigger =3D "default-off";
>> +               };
>> +
>>                5ghz-1 {
>>                        label =3D "bcm53xx:white:5ghz-1";
>>                        gpios =3D <&chipcommon 12 GPIO_ACTIVE_LOW>;
>> @@ -104,6 +116,12 @@
>>                        linux,code =3D <KEY_RESTART>;
>>                        gpios =3D <&chipcommon 6 GPIO_ACTIVE_LOW>;
>>                };
>> +
>> +               brightness {
>> +                       label =3D "Backlight";
>> +                       linux,code =3D <KEY_BRIGHTNESS_ZERO>;
>> +                       gpios =3D <&chipcommon 19 GPIO_ACTIVE_LOW>;
>> +               };
>>        };
>> };
>>=20
>> --
>> 2.9.3
>>=20
>=20
>=20
>=20
> --=20
> Rafa=C5=82
