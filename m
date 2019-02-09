Return-Path: <jic23@kernel.org>
Date: Sat, 9 Feb 2019 16:14:08 +0000
From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 0/5] iio: gyro: add fxas2100x driver
Message-ID: <20190209161408.70563782@archlinux>
In-Reply-To: <20190205174333.17672-1-rui.silva@linaro.org>
References: <20190205174333.17672-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, Afonso Bordado <afonsobordado@az8.co>
List-ID: <devicetree@vger.kernel.org>

On Tue,  5 Feb 2019 17:43:28 +0000
Rui Miguel Silva <rui.silva@linaro.org> wrote:

> Hi,
> This series introduce a NXP fxas2100x family tri axis gyroscope driver [0]
> It add a core implementaiton plus an i2c and spi.
> 
> This device can be found in the warp7 board [1], where it was tested.
Firstly no wild cards anywhere in the naming please, that includes
the filenames.  It goes wrong far too often when a new part comes up that
matches the wild cards but has a totally different interface.

Secondly, this is the second driver proposed for this part... Not sure what
happened to the previous driver? +CC Afonso.

https://lore.kernel.org/lkml/201809121715.5Babt1QC%25fengguang.wu@intel.com/T/

At least worth checking for any feature differences.

I'll review this without checking back to that driver though.

thanks,

Jonathan

 
> 
> ---
> Cheers,
>    Rui
> 
> v1->v2:
> Peter Meerwal-Stadler:
>   - changed (c) to current year
>   - add regmap include file in .h
>   - fix comments s/cuttof/cutoff/
>   - add more info in mutex comment
>   - check value in range_fs_from_value
>   - ret not checked in range_value_from_fs
>   - move mode to enum type
>   - remove line between value get and validation of value in all file
>   - pre-write, regmap_field_write, post_write refactoring
>   - check val2 and val == 0 in write raw
>   - check in_anglvel_scale: 7.8125?
>   - trigger_handler: 2 => sizeof(s16)
>   - check buffer size
>   - print %02% to output chip id
>   - remove !! as state is bool
>   - trigger probe return devm_iio_trigger_register
>   - remove error msg in case of devm_iio_device_register
> Fabio Estebam:
>   - rename FXAS2100X to FXAS21002
>   - change compatible nxp,fxas2100x to the exact support
>   - add VDD and VDDIO regulators in bindings and driver
> 
> 
> [0]: https://www.nxp.com/docs/en/data-sheet/FXAS21002.pdf
> [1]: https://www.element14.com/community/community/designcenter/single-board-computers/warp7/overview
> 
> Rui Miguel Silva (5):
>   iio: gyro: add DT bindings to fxas21002
>   iio: gyro: fxas2100x: add core driver for fxas2100x gyroscope
>   iio: gyro: fxas2100x: add i2c driver
>   iio: gyro: fxas2100x: add spi driver
>   ARM: dts: imx7s-warp: add fxas21002 gyroscope
> 
>  .../bindings/iio/gyroscope/fxas2100x.txt      |  18 +
>  arch/arm/boot/dts/imx7s-warp.dts              |   7 +
>  drivers/iio/gyro/Kconfig                      |  22 +
>  drivers/iio/gyro/Makefile                     |   3 +
>  drivers/iio/gyro/fxas2100x.h                  | 151 +++
>  drivers/iio/gyro/fxas2100x_core.c             | 931 ++++++++++++++++++
>  drivers/iio/gyro/fxas2100x_i2c.c              |  73 ++
>  drivers/iio/gyro/fxas2100x_spi.c              |  70 ++
>  8 files changed, 1275 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/gyroscope/fxas2100x.txt
>  create mode 100644 drivers/iio/gyro/fxas2100x.h
>  create mode 100644 drivers/iio/gyro/fxas2100x_core.c
>  create mode 100644 drivers/iio/gyro/fxas2100x_i2c.c
>  create mode 100644 drivers/iio/gyro/fxas2100x_spi.c
> 
