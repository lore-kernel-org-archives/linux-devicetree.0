From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH linux-next v9 0/3] mfd: flexcom: add a driver for Flexcom
Date: Wed, 23 Sep 2015 12:29:36 +0200
Message-ID: <56027F10.1060804@atmel.com>
References: <cover.1441118159.git.cyrille.pitchen@atmel.com>
 <20150920041912.GS3039@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150920041912.GS3039@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, robh+dt@kernel.org
Cc: boris.brezillon@free-electrons.com, alexandre.belloni@free-electrons.com, sameo@linux.intel.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Le 20/09/2015 06:19, Lee Jones a =C3=A9crit :
> Patch set description?

Cyrille actually placed it as the v1 changelog below...

> Once Rob is satisfied, please re-submit this set with Nicolas' Acks

I think that Rob was okay with the DT binding: "A few comments, but in
general looks fine." and it may not be important to tack Rob for
addition of his formal tag...

Or maybe this message can act as a "ping" for Rob...

> and I will re-review.

We wait one or two days before Cyrille re-send the series. We are
looking forward to using this driver in Linux-next soon.

Bye,


>> ChangeLog
>>
>> v9:
>> - go back to v5 (use the new "atmel,flexcom-mode" DT property).
>> - fix the name of the spi node in the DT example: from spi@f8034400 =
to
>>   spi@400
>> - align the fields of the struct platform_driver atmel_flexcom_drive=
r as
>>   suggested by Lee Jones.
>>
>> v8:
>> - fix the name of the spi node in the DT example: from spi@f8034400 =
to
>>   spi@2,0
>> - use the return code of op_property_read_u32_index() instead of -EI=
NVAL
>>   to report error.
>> - add Acked-by from Nicolas Ferre
>>
>> v7:
>> - read the operating mode from the very first u32 of the reg propert=
y from
>>   the first available child node (should be unique).
>> - update the DT bindings documentation accordingly.
>>
>> v6:
>> - select the operating mode according to the "compatible" DT propert=
y of
>>   the first available child node (should be unique).
>> - remove the "atmel,flexcom-mode" DT property so the need of a heade=
r file
>>   defining macros for the possible values of this deprecated propert=
y.
>>
>> v5:
>> - create a header file containing macros used by DT bindings
>> - use numeric constants instead of strings to select the Flexcom mod=
e
>> - change the license to "GPL v2"
>> - update the DT binding documentation to make it more readable and a=
dd
>>   references to USART, SPI and I2C DT binding documentations. remove=
 the
>>   useless label in the Example section.
>> - change the register prefix from FX_ to FLEX_ to match the Flexcom
>>   programmer datasheet.
>> - rename some variables to make them more understandable.
>>
>> v4:
>> - check clk_prepare_enable() return code in atmel_flexcom_probe()
>> - add a commit message to the DT binding patch
>>
>> v3:
>> - remove MODULE_ALIAS()
>> - add Acked-by from Boris Brezillon and Alexandre Belloni
>>
>> v2:
>> - enhance the documentation of DT bindings and change the way the "r=
anges"
>>   property is used.
>> - replace __raw_readl() and __raw_writel() by readl() and writel().
>> - change the module license to "GPL" for v2 or later
>> - print the selected flexcom mode after the hardware version
>>
>> v1:
>> This series of patches a support to the Atmel Flexcom, a wrapper whi=
ch
>> integrates an USART, a SPI controller and a TWI controller. Only one
>> peripheral can be used at a time. The active function is selected th=
ough
>> the Flexcom Mode Register.
>>
>> Cyrille Pitchen (3):
>>   mfd: atmel-flexcom: create include file with macros used by DT
>>     bindings
>>   mfd: devicetree: add bindings for Atmel Flexcom
>>   mfd: atmel-flexcom: add a driver for Atmel Flexible Serial
>>     Communication Unit
>>
>>  .../devicetree/bindings/mfd/atmel-flexcom.txt      |  67 ++++++++++=
+++
>>  drivers/mfd/Kconfig                                |  11 +++
>>  drivers/mfd/Makefile                               |   1 +
>>  drivers/mfd/atmel-flexcom.c                        | 104 ++++++++++=
+++++++++++
>>  include/dt-bindings/mfd/atmel-flexcom.h            |  16 ++++
>>  5 files changed, 199 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mfd/atmel-flex=
com.txt
>>  create mode 100644 drivers/mfd/atmel-flexcom.c
>>  create mode 100644 include/dt-bindings/mfd/atmel-flexcom.h
>>
>=20


--=20
Nicolas Ferre
