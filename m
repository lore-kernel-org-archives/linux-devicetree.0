From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH linux-next v9 2/3] mfd: devicetree: add bindings for Atmel
 Flexcom
Date: Wed, 9 Sep 2015 17:45:19 +0200
Message-ID: <55F0540F.6000102@atmel.com>
References: <cover.1441118159.git.cyrille.pitchen@atmel.com>
 <90fa2e0ded92567a29c996658153d833aaa5e411.1441118159.git.cyrille.pitchen@atmel.com>
 <55EF7209.8060407@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55EF7209.8060407@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com, alexandre.belloni@free-electrons.com, sameo@linux.intel.com, lee.jones@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

Le 09/09/2015 01:40, Rob Herring a =E9crit :
> On 09/01/2015 09:46 AM, Cyrille Pitchen wrote:
>> This patch documents the DT bindings for the Atmel Flexcom which wil=
l be
>> introduced by sama5d2x SoCs. These bindings will be used by the actu=
al
>> Flexcom driver to be sent in another patch.
>>
>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>> Acked-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
>=20
> A few comments, but in general looks fine.
>=20
>> ---
>>  .../devicetree/bindings/mfd/atmel-flexcom.txt      | 67 +++++++++++=
+++++++++++
>>  1 file changed, 67 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mfd/atmel-flex=
com.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt=
 b/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
>> new file mode 100644
>> index 000000000000..fc3511e41542
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
>> @@ -0,0 +1,67 @@
>> +* Device tree bindings for Atmel Flexcom (Flexible Serial Communica=
tion Unit)
>> +
>> +The Atmel Flexcom is just a wrapper which embeds a SPI controller, =
an I2C
>> +controller and an USART. Only one function can be used at a time an=
d is chosen
>> +at boot time according to the device tree.
>=20
> Doesn't the board design choose (unless pins go to a header)?
>=20

The function may be chosen once for all by the board design but if we t=
ake the
sama5d2 xplained board as an example, most Flexcoms output their pins t=
o
headers.

>> +
>> +Required properties:
>> +- compatible:		Should be "atmel,sama5d2-flexcom"
>> +- reg:			Should be the offset/length value for Flexcom dedicated
>> +			I/O registers (without USART, TWI or SPI registers).
>> +- clocks:		Should be the Flexcom peripheral clock from PMC.
>> +- #address-cells:	Should be <1>
>> +- #size-cells:		Should be <1>
>> +- ranges:		Should be one range for the full I/O register region
>> +			(including USART, TWI and SPI registers).
>> +- atmel,flexcom-mode:	Should be one of the 3 following macros as de=
fined in
>> +			include/dt-bindings/mfd/atmel-flexcom.h:
>> +			- ATMEL_FLEXCOM_MODE_USART for USART
>> +			- ATMEL_FLEXCOM_MODE_SPI for SPI
>> +			- ATMEL_FLEXCOM_MODE_TWI for I2C
>> +
>> +Required child:
>> +a single child device of type matching the "atmel,flexcom-mode" pro=
perty.
>=20
> Okay, but why not allow all children and use "status"?
>=20

That is exactly what was proposed in v6 of this series: allow more than=
 one
child so possibly all children but only one "available" child (status =3D=
=20
"okay").

The Flexocm driver still needs to find out the type of device of this
available child to know which function is to be enabled (USART, I2C or =
SPI).
So the "compatible" attribute was parsed using strstr() to search on of=
 the
patterns "usart", "spi" or "i2c".

However the use of strstr() was discussed to know whether the driver sh=
ould
looks for a partial or an exact match of the "compatible" string.
An exact match would require to keep the Flexcom driver synchonized wit=
h the
3 other drivers every time one of them introduces a new compatibility s=
tring,
which whould have made every driver more difficult to maintain by creat=
ing a
useless dependency.
So this implementation relying on the "compatible" attribute was abando=
ned.

To sum up, no other reliable (and simple) means to guess/extact the dev=
ice
type from its DT node was found so we got back to the "atmel,flexcom-mo=
de"
property.

>> +
>> +The reg property of this child should be:
>> +- <0x200 0x200> for USART
>> +- <0x400 0x200> for SPI
>> +- <0x600 0x200> for I2C
>> +
>> +The phandle provided by the clocks property of the child is the sam=
e as one for
>> +the Flexcom parent.
>> +
>> +Other properties remain unchanged. See documentation of the respect=
ive device:
>> +- ../serial/atmel-usart.txt
>> +- ../spi/spi_atmel.txt
>> +- ../i2c/i2c-at91.txt
>> +
>> +Example:
>> +
>> +flexcom@f8034000 {
>> +	compatible =3D "atmel,sama5d2-flexcom";
>> +	reg =3D <0xf8034000 0x200>;
>> +	clocks =3D <&flx0_clk>;
>> +	#address-cells =3D <1>;
>> +	#size-cells =3D <1>;
>> +	ranges =3D <0x0 0xf8034000 0x800>;
>> +	atmel,flexcom-mode =3D <ATMEL_FLEXCOM_MODE_SPI>;
>> +
>> +	spi@400 {
>> +		compatible =3D "atmel,at91rm9200-spi";
>> +		reg =3D <0x400 0x200>;
>> +		interrupts =3D <19 IRQ_TYPE_LEVEL_HIGH 7>;
>> +		pinctrl-names =3D "default";
>> +		pinctrl-0 =3D <&pinctrl_flx0_default>;
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
>>
>=20

Best Regards,

Cyrille
