From: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: rockchip: Add input voltage supply regulators
 in pmic for Marsboard
Date: Tue, 2 Dec 2014 19:38:28 +0100
Message-ID: <CABgxDo+kGe5L9FPeuqW77GFKNhqr1P16UxTF2AJpppLv9kX9fA@mail.gmail.com>
References: <1417459046-13725-1-git-send-email-romain.perier@gmail.com>
	<3330015.f3st3aFmak@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3330015.f3st3aFmak@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Oh yeah sorry about that. I thought that it was clear enough... It's
noted for next patches.

Romain

2014-12-02 18:01 GMT+01:00 Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>:
> Am Montag, 1. Dezember 2014, 18:37:26 schrieb Romain Perier:
>> Signed-off-by: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> applied to my dts branch, after adding a oneline commit message.
> It's always nice to provide some sort of commit message instead of le=
aving it
> empty.
>
>
>> ---
>>  arch/arm/boot/dts/rk3066a-marsboard.dts | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/rk3066a-marsboard.dts
>> b/arch/arm/boot/dts/rk3066a-marsboard.dts index f766024..5999708 100=
644
>> --- a/arch/arm/boot/dts/rk3066a-marsboard.dts
>> +++ b/arch/arm/boot/dts/rk3066a-marsboard.dts
>> @@ -60,6 +60,14 @@
>>               startup-delay-us =3D <100000>;
>>               vin-supply =3D <&vcc_io>;
>>       };
>> +
>> +     vsys: vsys-regulator {
>> +             compatible =3D "regulator-fixed";
>> +             regulator-name =3D "vsys";
>> +             regulator-min-microvolt =3D <5000000>;
>> +             regulator-max-microvolt =3D <5000000>;
>> +             regulator-boot-on;
>> +     };
>>  };
>>
>>  &i2c1 {
>> @@ -72,8 +80,14 @@
>>               interrupt-parent =3D <&gpio6>;
>>               interrupts =3D <4 IRQ_TYPE_LEVEL_LOW>;
>>
>> +             vcc1-supply =3D <&vsys>;
>> +             vcc2-supply =3D <&vsys>;
>> +             vcc3-supply =3D <&vsys>;
>> +             vcc4-supply =3D <&vsys>;
>>               vcc5-supply =3D <&vcc_io>;
>>               vcc6-supply =3D <&vcc_io>;
>> +             vcc7-supply =3D <&vsys>;
>> +             vccio-supply =3D <&vsys>;
>>
>>               regulators {
>>                       vcc_rtc: regulator@0 {
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
