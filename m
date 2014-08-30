From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v6 2/2] dt-bindings: document Rockchip saradc
Date: Sat, 30 Aug 2014 21:08:16 +0100
Message-ID: <54022F30.8070001@kernel.org>
References: <1984475.34C1XMW1q3@diego> <8132020.MqcOnlblHg@diego> <53E38A18.5090203@kernel.org> <1737237.SiLPTrUivB@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1737237.SiLPTrUivB@diego>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, =?UTF-8?B?ImVkZGllKOiUoeaeqyki?= <cf@rock-chips.com>, huangtao@rock-chips.com
List-Id: devicetree@vger.kernel.org

On 30/08/14 13:41, Heiko St=C3=BCbner wrote:
> Am Donnerstag, 7. August 2014, 15:15:52 schrieb Jonathan Cameron:
>> On 23/07/14 22:24, Heiko St=C3=BCbner wrote:
>>> This add the necessary binding documentation for the saradc found i=
n all
>>> recent processors from Rockchip.
>>>
>>> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>>
>> Applied to the togreg branch of iio.git.
>> I have exercised a small amount of discretion wrt to the standard 3 =
weeks
>> as there really is very little different in here from previous versi=
ons
>> and no one has raised any comments on them.
>=20
> Did the binding patch make it into any tree? Because when I grep for =
saradc in=20
> either linux-next or the iio tree I only get patch 1/2 (the driver it=
self) but=20
> the binding document is somehow missing.
Good spot.  Interestingly I had the file in my local tree but not the c=
ommit.
Odd, but now applied to the togreg branch of iio.git and pushed out.

Sorry about that!

Jonathan
>=20
>=20
> Thanks
> Heiko
>=20
>=20
>>
>> It's nearly 3 weeks anyway!
>>
>> J
>>
>>> ---
>>> changes since v5:
>>> - remove clock-frquency property as described in patch 1/2
>>>
>>>  .../bindings/iio/adc/rockchip-saradc.txt           | 24
>>>  ++++++++++++++++++++++ 1 file changed, 24 insertions(+)
>>>  create mode 100644
>>>  Documentation/devicetree/bindings/iio/adc/rockchip-saradc.txt>=20
>>> diff --git a/Documentation/devicetree/bindings/iio/adc/rockchip-sar=
adc.txt
>>> b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.txt new=
 file
>>> mode 100644
>>> index 0000000..5d3ec1d
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.txt
>>> @@ -0,0 +1,24 @@
>>> +Rockchip Successive Approximation Register (SAR) A/D Converter bin=
dings
>>> +
>>> +Required properties:
>>> +- compatible: Should be "rockchip,saradc"
>>> +- reg: physical base address of the controller and length of memor=
y
>>> mapped
>>> +       region.
>>> +- interrupts: The interrupt number to the cpu. The interrupt speci=
fier
>>> format +              depends on the interrupt controller.
>>> +- clocks: Must contain an entry for each entry in clock-names.
>>> +- clock-names: Shall be "saradc" for the converter-clock, and "apb=
_pclk"
>>> for +               the peripheral clock.
>>> +- vref-supply: The regulator supply ADC reference voltage.
>>> +- #io-channel-cells: Should be 1, see ../iio-bindings.txt
>>> +
>>> +Example:
>>> +	saradc: saradc@2006c000 {
>>> +		compatible =3D "rockchip,saradc";
>>> +		reg =3D <0x2006c000 0x100>;
>>> +		interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
>>> +		clocks =3D <&cru SCLK_SARADC>, <&cru PCLK_SARADC>;
>>> +		clock-names =3D "saradc", "apb_pclk";
>>> +		#io-channel-cells =3D <1>;
>>> +		vref-supply =3D <&vcc18>;
>>> +	};
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
