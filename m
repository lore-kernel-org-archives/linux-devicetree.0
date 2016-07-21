From: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v8 3/3] arm64: dts: rockchip: add usb2-phy support for
 rk3399
Date: Thu, 21 Jul 2016 18:17:48 +0800
Message-ID: <1ada0c16-9fd8-75b2-6357-1398073ac462@rock-chips.com>
References: <1468913311-23977-1-git-send-email-frank.wang@rock-chips.com>
 <CAD=FV=Wc0RdgpfzWhEVsrQhj5Pjf4RF3a81mZKaZfpZS41ce5g@mail.gmail.com>
 <d01e6b5c-8e7a-bcba-477b-cfe3a9088964@rock-chips.com>
 <3513562.kdo4J8AU27@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3513562.kdo4J8AU27@diego>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Guenter Roeck <groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Ziyuan Xu <xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?UTF-8?B?5ZC06Imv5bOw?= <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On 2016/7/21 17:26, Heiko St=C3=BCbner wrote:
> Hi Frank,
>
> Am Donnerstag, 21. Juli 2016, 10:49:53 schrieb Frank Wang:
>>>> @@ -69,6 +69,15 @@
>>>>
>>>>                   regulator-max-microvolt =3D <3300000>;
>>>>          =20
>>>>           };
>>>>
>>>> +       vbus_host: vbus-host-regulator {
>>>> +               compatible =3D "regulator-fixed";
>>>> +               enable-active-high;
>>>> +               gpio =3D <&gpio4 25 GPIO_ACTIVE_HIGH>;
>>>> +               pinctrl-names =3D "default";
>>>> +               pinctrl-0 =3D <&host_vbus_drv>;
>>>> +               regulator-name =3D "vbus_host";
>>>> +       };
>>>> +
>>> To match my schematics, this would probably be "vcc5v0_host".
>>> Technically there are two regulators but since they are the same
>>> voltage and enabled by the same GPIO it seems like modeling it as o=
ne
>>> regulator is fine.
>> Yep, you are right, I will rename it.
>>
>>> If you really wanted to model things you could also include the inp=
ut
>>> supply (VCC5V0_SYS).  Not sure how much you care to model in EVB.
>> Actually, from
>> "Documentation/devicetree/bindings/regulator/fixed-regulator.txt" sh=
ow,
>> input supply name is just optional property, and it seems that only =
do
>> assign "vin" value for input_supply (the second member of struct
>> fixed_voltage_config) if "vin-supply" is specified.
>>
>> So is input supply name  (VCC5V0_SYS) required here? Would you like =
to
>> give more comments please?
> While vin-supply is optional, I think that is meant for real top-leve=
l
> regulators (our vcc_sys or whatever) that really don't have a parent
> regulator.
>
> It is always nicer to model the whole power-tree [in a sane way], as =
it makes
> following the schematics a lot easier. If you mount a debugfs these d=
ays you
> can even get a nice tree graph of the regulator infrastructure ... wh=
ere the
> parent-relationship is also needed to create something meaningful.
>

Got it, many thanks for your explanation, I will add vin-supply next=20
version.


BR.
=46rank

> Heiko
>
>
>


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
