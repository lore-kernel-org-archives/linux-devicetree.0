From: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/2] mfd: devicetree: add bindings for Atmel Flexcom
Date: Wed, 22 Jul 2015 12:23:11 +0200
Message-ID: <55AF6F0F.30100@atmel.com>
References: <cover.1434967670.git.cyrille.pitchen@atmel.com> <337ab4936bd6ec2f24c42e2f8f363df21f491a02.1434967670.git.cyrille.pitchen@atmel.com> <20150721090910.GG3061@x1> <55AE53F2.5080904@atmel.com> <20150721151035.GK3061@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150721151035.GK3061@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 21/07/2015 17:10, Lee Jones a =C3=A9crit :
> On Tue, 21 Jul 2015, Cyrille Pitchen wrote:
>=20
>> Hi Lee,
>>
>> Le 21/07/2015 11:09, Lee Jones a =C3=A9crit :
>>> On Mon, 22 Jun 2015, Cyrille Pitchen wrote:
>> ...
>>>> +- atmel,flexcom-mode: shall be a string among { "spi", "usart", "=
i2c", "twi" }.
>>>> +  "i2c" and "twi" are synonymous.
>>>
>>> Please use a numerical value instead.  You can then define it in
>>> include/dt-bindings/*
>>>
>>> This is only required if you supply more than one child node.  Is t=
hat
>>> the plan?  I ask because you only have one child node in the exampl=
e
>>> below.
>>>
>> The "atmel,flexcom-mode" property is always required. The reset valu=
e of the
>> Operating Mode bit field inside the Flexcom Mode Register is 0 for "=
no serial
>> device". So none of the 3 embedded serial devices is clocked and all=
 of their
>> registers are inaccessible (read as zero).
>> Before using any of the 3 serial devices, the Operating Mode must be=
 set
>> accordingly by updating the Mode Register. Once done, only the selec=
ted serial
>> device is clocked. Also the external I/O lines of the Flexcom are mu=
xed to
>> reach the selected serial device.
>>
>> The muxing is given by the following table:
>>
>> Flexcom pin    USART pin    SPI pin    I2C pin
>>         IO0          TXD       MOSI        TWD
>>         IO1          RXD       MISO       TWCK
>>         IO2          SCK       SPCK          -
>>         IO3          CTS      NPCS0          -=20
>>         IO4          RTS      NPCS1          -
>>
>>
>> Bus conflicting configuration:
>>  ______________________________________
>> |               Flexcom                |
>> |  _____         _____         _____   |
>> | |     |__CLK__| SPI |__I/O__|     |  |    ___________       ______=
_____
>> | |     |       |_____|       |     |  |   | SPI Slave |     | I2C S=
lave |
>> | | CLK |                     | I/O |  |   |___________|     |______=
_____|
>> |_| MUX |        _____        | MUX |__|_________|________________|
>> | |     |__CLK__| I2C |__I/O__|     |  |             shared bus
>> | |_____|       |_____|       |_____|  |
>> |______________________________________|
>>
>>
>> For instance, it is very unlikely to connect both I2C and SPI slaves=
 to
>> the very same Flexcom because I/O lines are shared. The operating mo=
de is
>> selected once for all during the boot and will never change during r=
untime.
>> That's why the Flexcom DT node should have exactly one child.
>=20
> You have contradicted your self here.  Firstly you say that the
> "atmel,flexcom-mode" property is always required, then you say that
> the DT node should only ever have one child.  If the latter is true,
> then you can infer which mode Flexcom needs to be in by which node is
> present.
>=20
OK, you're right. So on the next series (v6), I will simply remove the
"atmel,flexcom-mode" property from the DT bindings. Then, the driver wi=
ll
look for the first available child node which "compatible" property con=
tains
one of the substrings "-usart", "-spi" or "-i2c", setting the Flexcom o=
perating
mode accordingly. This child node should be unique.

>>>> +Example:
>>>> +
>>>> +flx0: flexcom@f8034000 {
>>>
>>> What references this node?  If nothing, then you can remove the lab=
el.
>> OK, I will remove the label in the next series.
>>>
>>>> +	compatible =3D "atmel,sama5d2-flexcom";
>>>> +	reg =3D <0xf8034000 0x200>;
>>>> +	clocks =3D <&flx0_clk>;
>>>> +	#address-cells =3D <1>;
>>>> +	#size-cells =3D <1>;
>>>> +	ranges =3D <0x0 0xf8034000 0x800>;
>>>> +	atmel,flexcom-mode =3D "spi";
>>>> +
>>>> +	spi@f8034400 {
>>>> +		compatible =3D "atmel,at91rm9200-spi";
>>>> +		reg =3D <0x400 0x200>;
>>>> +		interrupts =3D <19 IRQ_TYPE_LEVEL_HIGH 7>;
>>>> +		pinctrl-names =3D "default";
>>>> +		pinctrl-0 =3D <&pinctrl_flx0_ioset1>;
>>>> +		#address-cells =3D <1>;
>>>> +		#size-cells =3D <0>;
>>>> +		clocks =3D <&flx0_clk>;
>>>> +		clock-names =3D "spi_clk";
>>>> +		atmel,fifo-size =3D <32>;
>>>> +
>>>> +		mtd_dataflash@0 {
>>>> +			compatible =3D "atmel,at25f512b";
>>>> +			reg =3D <0>;
>>>> +			spi-max-frequency =3D <20000000>;
>>>> +		};
>>>> +	};
>>>> +};
>>>
>>
>> Thanks for your review :)
>>
>> Best Regards,
>>
>> Cyrille
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
