From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: sun8i: h3: add SY8113B regulator
 on Banana Pi M2 Zero board
Date: Wed, 11 Jul 2018 22:18:44 +0800
Message-ID: <9C53E8F0-C5F9-4730-AD72-1E6FA8793E4A@aosc.io>
References: <20180711134450.43148-1-icenowy@aosc.io> <CAGb2v65C=gQtkNUX4pV5wudWUPf3hLNnGuxgB48xq=d7nH9qxA@mail.gmail.com>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB25DTDNAKGQEYKYLARY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v65C=gQtkNUX4pV5wudWUPf3hLNnGuxgB48xq=d7nH9qxA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: wens-jdAy2FN1RRM@public.gmane.orgChen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B47=E6=9C=8811=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=8810=
:15:41, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> =E5=86=99=E5=88=B0:
>Hi,
>
>On Wed, Jul 11, 2018 at 9:44 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>> Banana Pi M2 Zero board has a SY8113B regulator, which is controlled
>via
>> GPIO and capable of outputing 1.1V when the PL1 GPIO is set to output
>0
>> or 1.1V when the PL6 GPIO is set to input or output 1, and the output
>is
>> the power supply of the ARM cores in H3 SoC.
>>
>> Add the device tree node of this regulator and set the cpu's
>cpu-supply
>> property to it.
>>
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>>  .../dts/sun8i-h2-plus-bananapi-m2-zero.dts    | 21
>+++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
>b/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
>> index eb61dcf32797..abc8dc750f4b 100644
>> --- a/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
>> +++ b/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
>> @@ -59,6 +59,23 @@
>>                 };
>>         };
>>
>> +       reg_vdd_cpux: vdd-cpux-regulator {
>> +               compatible =3D "regulator-gpio";
>> +               regulator-name =3D "vdd-cpux";
>> +               regulator-type =3D "voltage";
>> +               regulator-boot-on;
>> +               regulator-always-on;
>> +               regulator-min-microvolt =3D <1100000>;
>> +               regulator-max-microvolt =3D <1300000>;
>> +               regulator-ramp-delay =3D <50>; /* 4ms */
>> +
>> +               gpios =3D <&r_pio 0 1 GPIO_ACTIVE_HIGH>; /* PL1 */
>> +               enable-active-high;
>> +               gpios-states =3D <0x1>;
>> +               states =3D <1100000 0x0
>
>So looking at the schematics with the resistor values, this calculates
>to roughly 1.108475 (0.6 * (1 + 10 / 11.8)) ...
>
>> +                         1300000 0x1>;
>
>and this to 1.308475.

But I think it cannot reach such accuracy, because of the
error of component values and the error of the power voltage.

In addition, set it to a too accurate value may break the
common opp table.

>
>ChenYu
>
>> +       };
>> +
>>         wifi_pwrseq: wifi_pwrseq {
>>                 compatible =3D "mmc-pwrseq-simple";
>>                 pinctrl-names =3D "default";
>> @@ -66,6 +83,10 @@
>>         };
>>  };
>>
>> +&cpu0 {
>> +       cpu-supply =3D <&reg_vdd_cpux>;
>> +};
>> +
>>  &de {
>>         status =3D "okay";
>>  };
>> --
>> 2.17.1
>>
>> --
>> You received this message because you are subscribed to the Google
>Groups "linux-sunxi" group.
>> To unsubscribe from this group and stop receiving emails from it,
>send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
>> For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
