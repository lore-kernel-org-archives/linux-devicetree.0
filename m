From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/5] ARM: BCM5301X: Specify USB controllers in DT
Date: Tue, 6 Dec 2016 18:31:52 +0100
Message-ID: <CACna6rw4iY_xhEUyWkGrchs0SOn3nLBKYMuA7qa0UHAbxpGN0A@mail.gmail.com>
References: <20161206171714.22738-1-zajec5@gmail.com> <20161206171714.22738-2-zajec5@gmail.com>
 <c721c71c-117f-185d-0544-954981dbcf04@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c721c71c-117f-185d-0544-954981dbcf04-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 6 December 2016 at 18:28, Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> On 12/6/2016 9:17 AM, Rafa=C5=82 Mi=C5=82ecki wrote:
>> From: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>>
>> There are 3 separated controllers, one per USB /standard/. With PHY
>> drivers in place they can be simply supported with generic drivers.
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/bcm5301x.dtsi | 33 ++++++++++++++++++++++++++++++++-
>>  1 file changed, 32 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/bcm5301x.dtsi b/arch/arm/boot/dts/bcm5301=
x.dtsi
>> index f09a2bb..bfc98d19 100644
>> --- a/arch/arm/boot/dts/bcm5301x.dtsi
>> +++ b/arch/arm/boot/dts/bcm5301x.dtsi
>> @@ -248,8 +248,26 @@
>>
>>                       #address-cells =3D <1>;
>>                       #size-cells =3D <1>;
>> +                     ranges;
>>
>> -                     phys =3D <&usb2_phy>;
>> +                     interrupt-parent =3D <&gic>;
>> +
>> +                     ohci: ohci@21000 {
>> +                             #usb-cells =3D <0>;
>> +
>> +                             compatible =3D "generic-ohci";
>> +                             reg =3D <0x00022000 0x1000>;
>
> Your label ohci@21000 does not match the 'reg' at 0x22000.
>
>> +                             interrupts =3D <GIC_SPI 79 IRQ_TYPE_LEVEL_=
HIGH>;
>> +                     };
>> +
>> +                     ehci: ehci@22000 {
>> +                             #usb-cells =3D <0>;
>> +
>> +                             compatible =3D "generic-ehci";
>> +                             reg =3D <0x00021000 0x1000>;
>
> Looks like you got the label of ohci and ehci reversed?

Nice catch, thanks! I'll fix it in V2 (just let me wait a day to see
if there will be other comments).

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
