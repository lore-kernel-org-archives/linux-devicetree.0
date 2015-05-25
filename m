From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH v4 1/1] ARM: mvebu: dts: Add dts file for DLink DNS-327L
Date: Mon, 25 May 2015 13:17:37 +0200
Message-ID: <556304D1.4000907@free-electrons.com>
References: <1432069858-10958-1-git-send-email-andrew@ncrmnt.org> <1432069858-10958-2-git-send-email-andrew@ncrmnt.org> <555C4E48.6020707@gmail.com> <699cee8678f6e671bd1457aa06180ccf@mail.ncrmnt.org> <555C6935.4000405@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <555C6935.4000405@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew <andrew@ncrmnt.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On 20/05/2015 13:00, Sebastian Hesselbarth wrote:
> On 20.05.2015 12:20, Andrew wrote:
>> Sebastian Hesselbarth =D0=BF=D0=B8=D1=81=D0=B0=D0=BB 20.05.2015 12:0=
5:
>>> On 19.05.2015 23:10, Andrew Andrianov wrote:
>>>> DNS-327L is a 2-bay NAS with the following specs:
>>> [...]
>>>> Signed-off-by: Andrew Andrianov <andrew@ncrmnt.org>
>>>> ---
>>>>   arch/arm/boot/dts/Makefile                     |   1 +
>>>>   arch/arm/boot/dts/armada-370-dlink-dns327l.dts | 356
>>>> +++++++++++++++++++++++++
>>>>   2 files changed, 357 insertions(+)
>>>>   create mode 100644 arch/arm/boot/dts/armada-370-dlink-dns327l.dt=
s
>>> [...]
>>>> diff --git a/arch/arm/boot/dts/armada-370-dlink-dns327l.dts
>>>> b/arch/arm/boot/dts/armada-370-dlink-dns327l.dts
>>>> new file mode 100644
>>>> index 0000000..0f4555c4
>>>> --- /dev/null
>>>> +++ b/arch/arm/boot/dts/armada-370-dlink-dns327l.dts
>>>> @@ -0,0 +1,356 @@
>>> [...]
>>>> +    regulators {
>>>> +        compatible =3D "simple-bus";
>>>> +        #address-cells =3D <1>;
>>>> +        #size-cells =3D <0>;
>>>> +        pinctrl-0 =3D <&xhci_pwr_pin
>>>> +            &sata_l_pwr_pin
>>>> +            &sata_r_pwr_pin>;
>>>> +
>>>> +        pinctrl-names =3D "default";
>>>
>>> I doubt pinctrl will not work as you expected. For regulators, unli=
ke
>>> gpio-keys/leds above, this node just describes the "bus" of regulat=
ors.
>>
>> Are you sure about this moment? FYI: I've taken
>> armada-370-synology-ds213j.dts
>> as the reference which happens to list regulator pinctrl (As of 4.1-=
rc1)
>> just the same way:
>>
>>      compatible =3D "simple-bus";
>>          #address-cells =3D <1>;
>>          #size-cells =3D <0>;
>>          pinctrl-0 =3D <&sata1_pwr_pin &sata2_pwr_pin>;
>>          pinctrl-names =3D "default";
>>                  ...
>=20
> Well, even if it works the pinctrl should be claimed by the device th=
at
> actually depends on it, i.e. the regulator itself.
>=20
>> If that's erroneous we should fix armada-370-synology-ds213j.dts as =
well.
>=20
> Most likely nobody ever noticed if that didn't work because (a) usual=
ly
> gpio functions are setup by the bootloader or (b) gpio is default res=
et
> value of the pinctrl registers anyway.
>=20
> I'd say move the pinctrl properties to regulator nodes for dns-327l n=
ow
> and we move the properties for ds213j in a separate patch.

Usually the merge windows for arm-soc is closed when the rc6 is release=
d which should
happen at the end of this week. If you manged to send a new version thi=
s week, then I
will apply it on mvebu/dt and it should be part of our next pull reques=
t.

Thanks,

Gregory



>=20
> Sebastian
>=20
>>>> +
>>>> +        usb_power: regulator@1 {
>>>> +            compatible =3D "regulator-fixed";
>>>> +            reg =3D <1>;
>>>> +            regulator-name =3D "USB3.0 Port Power";
>>>> +            regulator-min-microvolt =3D <5000000>;
>>>> +            regulator-max-microvolt =3D <5000000>;
>>>> +            enable-active-high;
>>>> +            regulator-boot-on;
>>>> +            regulator-always-on;
>>>> +            gpio =3D <&gpio0 13 GPIO_ACTIVE_HIGH>;
>>>
>>> Instead you'll have to put the corresponding pinctrl-0/names proper=
ties
>>> in each of the regulator nodes, i.e.
>>>
>>>         pinctrl-0 =3D <&xhci_pwr_pin>
>>>         pinctrl-names =3D "default";
>>>
>>> here and similar for the other regulator nodes.
>>>
>>>> +        };
>>>> +
>>>> +        sata_r_power: regulator@2 {
>>>> +            compatible =3D "regulator-fixed";
>>>> +            reg =3D <2>;
>>>> +            regulator-name =3D "SATA-R Power";
>>>> +            regulator-min-microvolt =3D <5000000>;
>>>> +            regulator-max-microvolt =3D <5000000>;
>>>> +            startup-delay-us =3D <2000000>;
>>>> +            enable-active-high;
>>>> +            regulator-always-on;
>>>> +            regulator-boot-on;
>>>> +            gpio =3D <&gpio1 22 GPIO_ACTIVE_HIGH>;
>>>> +        };
>>>> +
>>>> +        sata_l_power: regulator@3 {
>>>> +            compatible =3D "regulator-fixed";
>>>> +            reg =3D <3>;
>>>> +            regulator-name =3D "SATA-L Power";
>>>> +            regulator-min-microvolt =3D <5000000>;
>>>> +            regulator-max-microvolt =3D <5000000>;
>>>> +            startup-delay-us =3D <4000000>;
>>>> +            enable-active-high;
>>>> +            regulator-always-on;
>>>> +            regulator-boot-on;
>>>> +            gpio =3D <&gpio1 24 GPIO_ACTIVE_HIGH>;
>>>> +        };
>>>> +    };
>>>> +};
>=20
>=20


--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
