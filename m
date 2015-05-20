From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/1] ARM: mvebu: dts: Add dts file for DLink DNS-327L
Date: Wed, 20 May 2015 13:00:05 +0200
Message-ID: <555C6935.4000405@gmail.com>
References: <1432069858-10958-1-git-send-email-andrew@ncrmnt.org> <1432069858-10958-2-git-send-email-andrew@ncrmnt.org> <555C4E48.6020707@gmail.com> <699cee8678f6e671bd1457aa06180ccf@mail.ncrmnt.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <699cee8678f6e671bd1457aa06180ccf-IcawJbj+vY1vZ+LtbKW8tg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew <andrew-g16cbSVCqPUdnm+yROfE0A@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 20.05.2015 12:20, Andrew wrote:
> Sebastian Hesselbarth =D0=BF=D0=B8=D1=81=D0=B0=D0=BB 20.05.2015 12:05=
:
>> On 19.05.2015 23:10, Andrew Andrianov wrote:
>>> DNS-327L is a 2-bay NAS with the following specs:
>> [...]
>>> Signed-off-by: Andrew Andrianov <andrew-g16cbSVCqPUdnm+yROfE0A@public.gmane.org>
>>> ---
>>>   arch/arm/boot/dts/Makefile                     |   1 +
>>>   arch/arm/boot/dts/armada-370-dlink-dns327l.dts | 356
>>> +++++++++++++++++++++++++
>>>   2 files changed, 357 insertions(+)
>>>   create mode 100644 arch/arm/boot/dts/armada-370-dlink-dns327l.dts
>> [...]
>>> diff --git a/arch/arm/boot/dts/armada-370-dlink-dns327l.dts
>>> b/arch/arm/boot/dts/armada-370-dlink-dns327l.dts
>>> new file mode 100644
>>> index 0000000..0f4555c4
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/armada-370-dlink-dns327l.dts
>>> @@ -0,0 +1,356 @@
>> [...]
>>> +    regulators {
>>> +        compatible =3D "simple-bus";
>>> +        #address-cells =3D <1>;
>>> +        #size-cells =3D <0>;
>>> +        pinctrl-0 =3D <&xhci_pwr_pin
>>> +            &sata_l_pwr_pin
>>> +            &sata_r_pwr_pin>;
>>> +
>>> +        pinctrl-names =3D "default";
>>
>> I doubt pinctrl will not work as you expected. For regulators, unlik=
e
>> gpio-keys/leds above, this node just describes the "bus" of regulato=
rs.
>
> Are you sure about this moment? FYI: I've taken
> armada-370-synology-ds213j.dts
> as the reference which happens to list regulator pinctrl (As of 4.1-r=
c1)
> just the same way:
>
>      compatible =3D "simple-bus";
>          #address-cells =3D <1>;
>          #size-cells =3D <0>;
>          pinctrl-0 =3D <&sata1_pwr_pin &sata2_pwr_pin>;
>          pinctrl-names =3D "default";
>                  ...

Well, even if it works the pinctrl should be claimed by the device that
actually depends on it, i.e. the regulator itself.

> If that's erroneous we should fix armada-370-synology-ds213j.dts as w=
ell.

Most likely nobody ever noticed if that didn't work because (a) usually
gpio functions are setup by the bootloader or (b) gpio is default reset
value of the pinctrl registers anyway.

I'd say move the pinctrl properties to regulator nodes for dns-327l now
and we move the properties for ds213j in a separate patch.

Sebastian

>>> +
>>> +        usb_power: regulator@1 {
>>> +            compatible =3D "regulator-fixed";
>>> +            reg =3D <1>;
>>> +            regulator-name =3D "USB3.0 Port Power";
>>> +            regulator-min-microvolt =3D <5000000>;
>>> +            regulator-max-microvolt =3D <5000000>;
>>> +            enable-active-high;
>>> +            regulator-boot-on;
>>> +            regulator-always-on;
>>> +            gpio =3D <&gpio0 13 GPIO_ACTIVE_HIGH>;
>>
>> Instead you'll have to put the corresponding pinctrl-0/names propert=
ies
>> in each of the regulator nodes, i.e.
>>
>>         pinctrl-0 =3D <&xhci_pwr_pin>
>>         pinctrl-names =3D "default";
>>
>> here and similar for the other regulator nodes.
>>
>>> +        };
>>> +
>>> +        sata_r_power: regulator@2 {
>>> +            compatible =3D "regulator-fixed";
>>> +            reg =3D <2>;
>>> +            regulator-name =3D "SATA-R Power";
>>> +            regulator-min-microvolt =3D <5000000>;
>>> +            regulator-max-microvolt =3D <5000000>;
>>> +            startup-delay-us =3D <2000000>;
>>> +            enable-active-high;
>>> +            regulator-always-on;
>>> +            regulator-boot-on;
>>> +            gpio =3D <&gpio1 22 GPIO_ACTIVE_HIGH>;
>>> +        };
>>> +
>>> +        sata_l_power: regulator@3 {
>>> +            compatible =3D "regulator-fixed";
>>> +            reg =3D <3>;
>>> +            regulator-name =3D "SATA-L Power";
>>> +            regulator-min-microvolt =3D <5000000>;
>>> +            regulator-max-microvolt =3D <5000000>;
>>> +            startup-delay-us =3D <4000000>;
>>> +            enable-active-high;
>>> +            regulator-always-on;
>>> +            regulator-boot-on;
>>> +            gpio =3D <&gpio1 24 GPIO_ACTIVE_HIGH>;
>>> +        };
>>> +    };
>>> +};


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
