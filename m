From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH v8 1/2] mfd: devicetree: add bindings for Atmel Flexcom
Date: Tue, 25 Aug 2015 13:42:21 +0200
Message-ID: <55DC549D.7060307@atmel.com>
References: <cover.1437731428.git.cyrille.pitchen@atmel.com> <738a001f14a5fa4fa8e5f90ad859a318cba0de42.1437731428.git.cyrille.pitchen@atmel.com> <20150724150854.GI3436@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150724150854.GI3436@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com, alexandre.belloni@free-electrons.com, sameo@linux.intel.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi all,

any feedback on this kind of DT bindings?
Is it a proper way of using the "ranges" property?

Best regards,

Cyrille

Le 24/07/2015 17:08, Lee Jones a =C3=A9crit :
> DT chaps,
>=20
> Please can you take a look at this binding.
>=20
> In particular the use of the 'ranges' property to store device 'mode'=
=2E
>=20
>> This patch documents the DT bindings for the Atmel Flexcom which wil=
l be
>> introduced by sama5d2x SoCs. These bindings will be used by the actu=
al
>> Flexcom driver to be sent in another patch.
>>
>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>> Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>
>> ---
>>  .../devicetree/bindings/mfd/atmel-flexcom.txt      | 68 +++++++++++=
+++++++++++
>>  1 file changed, 68 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mfd/atmel-flex=
com.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt=
 b/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
>> new file mode 100644
>> index 000000000000..588d527dbfa7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
>> @@ -0,0 +1,68 @@
>> +* Device tree bindings for Atmel Flexcom (Flexible Serial Communica=
tion Unit)
>> +
>> +The Atmel Flexcom is just a wrapper which embeds a SPI controller, =
an I2C
>> +controller and an USART. Only one function can be used at a time an=
d is chosen
>> +at boot time according to the device tree.
>> +
>> +Required properties:
>> +- compatible:		Should be "atmel,sama5d2-flexcom"
>> +- reg:			Should be the pair (offset, size) for the Flexcom
>> +			dedicated I/O registers (without USART, TWI or SPI
>> +			registers).
>> +- clocks:		Should be the Flexcom peripheral clock from PMC.
>> +- #address-cells:	Should be <2>
>> +- #size-cells:		Should be <1>
>> +- ranges:		Should be a list of ranges.
>> +			One range per peripheral wrapped by the Flexcom. So each
>> +			range is a triplet (child_addr, parent_addr, size). The
>> +			first u32 of "child_addr" is the value to be set in the
>> +			Operating Mode bitfield of the Flexcom Mode Register.
>> +			Then "parent_addr" stores the base address of the
>> +			corresponding peripheral in the system memory. Finally,
>> +			"size" if the size of the memory region of this
>> +			peripheral.
>> +
>> +Required child:
>> +A single available child for the serial controller to enable.
>> +
>> +Required properties of this child:
>> +- reg:			Should be a pair (child_addr, size) with child_addr
>> +			matching one of the parent ranges.
>> +- clocks:		Should be the very same phandle as for the parent's one.
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
>> +	#address-cells =3D <2>;
>> +	#size-cells =3D <1>;
>> +	ranges =3D <1 0 0xf8034200 0x200		/* opmode 1: USART */
>> +		  2 0 0xf8034400 0x200		/* opmode 2: SPI */
>> +		  3 0 0xf8034600 0x200>;	/* opmode 3: I2C */
>> +
>> +	spi@2,0 {
>> +		compatible =3D "atmel,at91rm9200-spi";
>> +		reg =3D <2 0 0x200>;
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
>=20
