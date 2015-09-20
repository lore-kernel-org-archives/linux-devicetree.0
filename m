From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH linux-next v9 0/3] mfd: flexcom: add a driver for Flexcom
Date: Sun, 20 Sep 2015 05:19:12 +0100
Message-ID: <20150920041912.GS3039@x1>
References: <cover.1441118159.git.cyrille.pitchen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1441118159.git.cyrille.pitchen@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com, alexandre.belloni@free-electrons.com, sameo@linux.intel.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Patch set description?

Once Rob is satisfied, please re-submit this set with Nicolas' Acks
and I will re-review.

> ChangeLog
>=20
> v9:
> - go back to v5 (use the new "atmel,flexcom-mode" DT property).
> - fix the name of the spi node in the DT example: from spi@f8034400 t=
o
>   spi@400
> - align the fields of the struct platform_driver atmel_flexcom_driver=
 as
>   suggested by Lee Jones.
>=20
> v8:
> - fix the name of the spi node in the DT example: from spi@f8034400 t=
o
>   spi@2,0
> - use the return code of op_property_read_u32_index() instead of -EIN=
VAL
>   to report error.
> - add Acked-by from Nicolas Ferre
>=20
> v7:
> - read the operating mode from the very first u32 of the reg property=
 from
>   the first available child node (should be unique).
> - update the DT bindings documentation accordingly.
>=20
> v6:
> - select the operating mode according to the "compatible" DT property=
 of
>   the first available child node (should be unique).
> - remove the "atmel,flexcom-mode" DT property so the need of a header=
 file
>   defining macros for the possible values of this deprecated property=
=2E
>=20
> v5:
> - create a header file containing macros used by DT bindings
> - use numeric constants instead of strings to select the Flexcom mode
> - change the license to "GPL v2"
> - update the DT binding documentation to make it more readable and ad=
d
>   references to USART, SPI and I2C DT binding documentations. remove =
the
>   useless label in the Example section.
> - change the register prefix from FX_ to FLEX_ to match the Flexcom
>   programmer datasheet.
> - rename some variables to make them more understandable.
>=20
> v4:
> - check clk_prepare_enable() return code in atmel_flexcom_probe()
> - add a commit message to the DT binding patch
>=20
> v3:
> - remove MODULE_ALIAS()
> - add Acked-by from Boris Brezillon and Alexandre Belloni
>=20
> v2:
> - enhance the documentation of DT bindings and change the way the "ra=
nges"
>   property is used.
> - replace __raw_readl() and __raw_writel() by readl() and writel().
> - change the module license to "GPL" for v2 or later
> - print the selected flexcom mode after the hardware version
>=20
> v1:
> This series of patches a support to the Atmel Flexcom, a wrapper whic=
h
> integrates an USART, a SPI controller and a TWI controller. Only one
> peripheral can be used at a time. The active function is selected tho=
ugh
> the Flexcom Mode Register.
>=20
> Cyrille Pitchen (3):
>   mfd: atmel-flexcom: create include file with macros used by DT
>     bindings
>   mfd: devicetree: add bindings for Atmel Flexcom
>   mfd: atmel-flexcom: add a driver for Atmel Flexible Serial
>     Communication Unit
>=20
>  .../devicetree/bindings/mfd/atmel-flexcom.txt      |  67 +++++++++++=
++
>  drivers/mfd/Kconfig                                |  11 +++
>  drivers/mfd/Makefile                               |   1 +
>  drivers/mfd/atmel-flexcom.c                        | 104 +++++++++++=
++++++++++
>  include/dt-bindings/mfd/atmel-flexcom.h            |  16 ++++
>  5 files changed, 199 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/atmel-flexc=
om.txt
>  create mode 100644 drivers/mfd/atmel-flexcom.c
>  create mode 100644 include/dt-bindings/mfd/atmel-flexcom.h
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
