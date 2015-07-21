From: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/2] mfd: devicetree: add bindings for Atmel Flexcom
Date: Tue, 21 Jul 2015 16:15:14 +0200
Message-ID: <55AE53F2.5080904@atmel.com>
References: <cover.1434967670.git.cyrille.pitchen@atmel.com> <337ab4936bd6ec2f24c42e2f8f363df21f491a02.1434967670.git.cyrille.pitchen@atmel.com> <20150721090910.GG3061@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150721090910.GG3061@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lee,

Le 21/07/2015 11:09, Lee Jones a =C3=A9crit :
> On Mon, 22 Jun 2015, Cyrille Pitchen wrote:
=2E..
>> +- atmel,flexcom-mode: shall be a string among { "spi", "usart", "i2=
c", "twi" }.
>> +  "i2c" and "twi" are synonymous.
>=20
> Please use a numerical value instead.  You can then define it in
> include/dt-bindings/*
>=20
> This is only required if you supply more than one child node.  Is tha=
t
> the plan?  I ask because you only have one child node in the example
> below.
>=20
The "atmel,flexcom-mode" property is always required. The reset value o=
f the
Operating Mode bit field inside the Flexcom Mode Register is 0 for "no =
serial
device". So none of the 3 embedded serial devices is clocked and all of=
 their
registers are inaccessible (read as zero).
Before using any of the 3 serial devices, the Operating Mode must be se=
t
accordingly by updating the Mode Register. Once done, only the selected=
 serial
device is clocked. Also the external I/O lines of the Flexcom are muxed=
 to
reach the selected serial device.

The muxing is given by the following table:

=46lexcom pin    USART pin    SPI pin    I2C pin
        IO0          TXD       MOSI        TWD
        IO1          RXD       MISO       TWCK
        IO2          SCK       SPCK          -
        IO3          CTS      NPCS0          -=20
        IO4          RTS      NPCS1          -


Bus conflicting configuration:
 ______________________________________
|               Flexcom                |
|  _____         _____         _____   |
| |     |__CLK__| SPI |__I/O__|     |  |    ___________       _________=
__
| |     |       |_____|       |     |  |   | SPI Slave |     | I2C Slav=
e |
| | CLK |                     | I/O |  |   |___________|     |_________=
__|
|_| MUX |        _____        | MUX |__|_________|________________|
| |     |__CLK__| I2C |__I/O__|     |  |             shared bus
| |_____|       |_____|       |_____|  |
|______________________________________|


=46or instance, it is very unlikely to connect both I2C and SPI slaves =
to
the very same Flexcom because I/O lines are shared. The operating mode =
is
selected once for all during the boot and will never change during runt=
ime.
That's why the Flexcom DT node should have exactly one child.

>> +Example:
>> +
>> +flx0: flexcom@f8034000 {
>=20
> What references this node?  If nothing, then you can remove the label=
=2E
OK, I will remove the label in the next series.
>=20
>> +	compatible =3D "atmel,sama5d2-flexcom";
>> +	reg =3D <0xf8034000 0x200>;
>> +	clocks =3D <&flx0_clk>;
>> +	#address-cells =3D <1>;
>> +	#size-cells =3D <1>;
>> +	ranges =3D <0x0 0xf8034000 0x800>;
>> +	atmel,flexcom-mode =3D "spi";
>> +
>> +	spi@f8034400 {
>> +		compatible =3D "atmel,at91rm9200-spi";
>> +		reg =3D <0x400 0x200>;
>> +		interrupts =3D <19 IRQ_TYPE_LEVEL_HIGH 7>;
>> +		pinctrl-names =3D "default";
>> +		pinctrl-0 =3D <&pinctrl_flx0_ioset1>;
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <0>;
>> +		clocks =3D <&flx0_clk>;
>> +		clock-names =3D "spi_clk";
>> +		atmel,fifo-size =3D <32>;
>> +
>> +		mtd_dataflash@0 {
>> +			compatible =3D "atmel,at25f512b";
>> +			reg =3D <0>;
>> +			spi-max-frequency =3D <20000000>;
>> +		};
>> +	};
>> +};
>=20

Thanks for your review :)

Best Regards,

Cyrille
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
