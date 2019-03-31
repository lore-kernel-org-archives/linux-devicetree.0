Return-Path: <jic23@kernel.org>
Date: Sun, 31 Mar 2019 10:46:46 +0100
From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v5 0/6] iio: gyro: add fxas21002c driver
Message-ID: <20190331104646.2c064ced@archlinux>
In-Reply-To: <20190326101651.25056-1-rui.silva@linaro.org>
References: <20190326101651.25056-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, 26 Mar 2019 10:16:45 +0000
Rui Miguel Silva <rui.silva@linaro.org> wrote:

> Hi,
> This series introduce a NXP fxas21002c tri axis gyroscope driver [0]
> It add a core implementaiton plus an i2c and spi.
> 
> This device can be found in the warp7 board [1], where it was tested.
> 
> ---
> Cheers,
>    Rui
> 
> v4->v5:
> Jonathan Cameron:
>   - remove init ret
>   - change handle of iio register, buffer and trigger in probe and
>    remove (I think this is what you mean, Jonathan)
You kind of ended up with both versions when it was an either or.
I'll have a go at tidying it up whilst applying. Please check the
result.

> 
> v3->v4:
> Tomasz Duszynski:
>   - mention irq flags in bindings
>   - add reference to drive-open-drain in bindings
>   - fix headers files
>   - drop comas in of_device_id sentinel
>   - drop of_match_ptr
>   - use probe_new
> 
> Jonathan Cameron:
>   - disable vdd regulator in case of vddio fail
>   - use devm_add_action_or_reset
>   - simpler functions returns
>   - remove noisy dev_info
>   - remove EAGAIN from runtime_suspend
> 
> v2->v3:
> Jonathan Cameron:
>   - cacheline aligned (DMA safe buffer)
>      Great presentation [2] and links in the presentation, thanks
>   - global renaming, including filenames, fxas2100x->fxas21002c
>   - provide spi info in dts bidings
>   - Remove SPI_MASTER in Kconfig i2c patch and move it to right patch
>   - remove extra blank line in comment
>   - add break range_value_from_fs after found
>   - in range_value_from_fs use local variable
>   - remove mode check at mode_set
>   - combine two if statements in mode_set
>   - in scale_get return 0 and let caller to set IIO_VAL_FRACTIONAL
>   - remove dev_err from vdd_io regulator get
>   - handle regulator error path
>   - devm_add_action
>   - check unwind order
>   - simplify data in _suspend and alike
>   - disable regulators at suspend
>   - error handling at _resume
>   - return -EAGAIN at runtime_resume
> 
> Rob Herring:
>    - Set label as gyroscope
> 
> - add interrupt to bindings
> - add entry to maintainers
> 
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
> [0]: https://www.nxp.com/docs/en/data-sheet/FXAS21002.pdf
> [1]: https://www.element14.com/community/community/designcenter/single-board-computers/warp7/overview
> [2]: https://events.linuxfoundation.org/wp-content/uploads/2017/12/20181023-Wolfram-Sang-ELCE18-safe_dma_buffers.pdf
> 
> Rui Miguel Silva (6):
>   iio: gyro: add DT bindings to fxas21002c
>   iio: gyro: add core driver for fxas21002c
>   iio: gyro: fxas21002c: add i2c driver
>   iio: gyro: fxas21002c: add spi driver
>   ARM: dts: imx7s-warp: add fxas21002c gyroscope
>   MAINTAINERS: add entry for fxas21002c gyro driver
> 
>  .../bindings/iio/gyroscope/nxp,fxas21002c.txt |   31 +
>  MAINTAINERS                                   |   10 +
>  arch/arm/boot/dts/imx7s-warp.dts              |    7 +
>  drivers/iio/gyro/Kconfig                      |   22 +
>  drivers/iio/gyro/Makefile                     |    3 +
>  drivers/iio/gyro/fxas21002c.h                 |  151 +++
>  drivers/iio/gyro/fxas21002c_core.c            | 1006 +++++++++++++++++
>  drivers/iio/gyro/fxas21002c_i2c.c             |   69 ++
>  drivers/iio/gyro/fxas21002c_spi.c             |   70 ++
>  9 files changed, 1369 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/gyroscope/nxp,fxas21002c.txt
>  create mode 100644 drivers/iio/gyro/fxas21002c.h
>  create mode 100644 drivers/iio/gyro/fxas21002c_core.c
>  create mode 100644 drivers/iio/gyro/fxas21002c_i2c.c
>  create mode 100644 drivers/iio/gyro/fxas21002c_spi.c
> 
