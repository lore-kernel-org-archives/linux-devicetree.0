From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH linux-next v9 2/3] mfd: devicetree: add bindings for Atmel
 Flexcom
Date: Wed, 9 Sep 2015 19:06:19 -0500
Message-ID: <55F0C97B.80404@kernel.org>
References: <cover.1441118159.git.cyrille.pitchen@atmel.com>
 <90fa2e0ded92567a29c996658153d833aaa5e411.1441118159.git.cyrille.pitchen@atmel.com>
 <55EF7209.8060407@kernel.org> <55F0540F.6000102@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55F0540F.6000102@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com, alexandre.belloni@free-electrons.com, sameo@linux.intel.com, lee.jones@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/09/2015 10:45 AM, Cyrille Pitchen wrote:
> Hi Rob,
>=20
> Le 09/09/2015 01:40, Rob Herring a =E9crit :
>> On 09/01/2015 09:46 AM, Cyrille Pitchen wrote:
>>> This patch documents the DT bindings for the Atmel Flexcom which wi=
ll be
>>> introduced by sama5d2x SoCs. These bindings will be used by the act=
ual
>>> Flexcom driver to be sent in another patch.
>>>
>>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>>> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>>> Acked-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
>>
>> A few comments, but in general looks fine.
>>
>>> ---
>>>  .../devicetree/bindings/mfd/atmel-flexcom.txt      | 67 ++++++++++=
++++++++++++
>>>  1 file changed, 67 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/mfd/atmel-fle=
xcom.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/mfd/atmel-flexcom.tx=
t b/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
>>> new file mode 100644
>>> index 000000000000..fc3511e41542
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
>>> @@ -0,0 +1,67 @@
>>> +* Device tree bindings for Atmel Flexcom (Flexible Serial Communic=
ation Unit)
>>> +
>>> +The Atmel Flexcom is just a wrapper which embeds a SPI controller,=
 an I2C
>>> +controller and an USART. Only one function can be used at a time a=
nd is chosen
>>> +at boot time according to the device tree.
>>
>> Doesn't the board design choose (unless pins go to a header)?
>>
>=20
> The function may be chosen once for all by the board design but if we=
 take the
> sama5d2 xplained board as an example, most Flexcoms output their pins=
 to
> headers.
>=20
>>> +
>>> +Required properties:
>>> +- compatible:		Should be "atmel,sama5d2-flexcom"
>>> +- reg:			Should be the offset/length value for Flexcom dedicated
>>> +			I/O registers (without USART, TWI or SPI registers).
>>> +- clocks:		Should be the Flexcom peripheral clock from PMC.
>>> +- #address-cells:	Should be <1>
>>> +- #size-cells:		Should be <1>
>>> +- ranges:		Should be one range for the full I/O register region
>>> +			(including USART, TWI and SPI registers).
>>> +- atmel,flexcom-mode:	Should be one of the 3 following macros as d=
efined in
>>> +			include/dt-bindings/mfd/atmel-flexcom.h:
>>> +			- ATMEL_FLEXCOM_MODE_USART for USART
>>> +			- ATMEL_FLEXCOM_MODE_SPI for SPI
>>> +			- ATMEL_FLEXCOM_MODE_TWI for I2C
>>> +
>>> +Required child:
>>> +a single child device of type matching the "atmel,flexcom-mode" pr=
operty.
>>
>> Okay, but why not allow all children and use "status"?
>>
>=20
> That is exactly what was proposed in v6 of this series: allow more th=
an one
> child so possibly all children but only one "available" child (status=
 =3D=20
> "okay").
>=20
> The Flexocm driver still needs to find out the type of device of this
> available child to know which function is to be enabled (USART, I2C o=
r SPI).
> So the "compatible" attribute was parsed using strstr() to search on =
of the
> patterns "usart", "spi" or "i2c".
>=20
> However the use of strstr() was discussed to know whether the driver =
should
> looks for a partial or an exact match of the "compatible" string.
> An exact match would require to keep the Flexcom driver synchonized w=
ith the
> 3 other drivers every time one of them introduces a new compatibility=
 string,
> which whould have made every driver more difficult to maintain by cre=
ating a
> useless dependency.
> So this implementation relying on the "compatible" attribute was aban=
doned.
>=20
> To sum up, no other reliable (and simple) means to guess/extact the d=
evice
> type from its DT node was found so we got back to the "atmel,flexcom-=
mode"
> property.

I wasn't thinking removing this property. If the mode is configured by
the bootloader, then you want to make updates to the configuration as
simple as possible. Updating atmel,flexcom-mode and status for the
children would be much more simple than creating the whole child node.
If that's not a valid usecase, then never mind.

Rob
