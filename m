Return-Path: <jic23@kernel.org>
Date: Sat, 2 Feb 2019 09:46:41 +0000
From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3 0/6] iio:bmi160: add drdy interrupt support
Message-ID: <20190202094641.6dad8095@archlinux>
In-Reply-To: <20190127203911.8696-1-martin@martingkelly.com>
References: <20190127203911.8696-1-martin@martingkelly.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Martin Kelly <martin@martingkelly.com>
Cc: linux-iio@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Daniel Baluta <daniel.baluta@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Sun, 27 Jan 2019 12:39:05 -0800
Martin Kelly <martin@martingkelly.com> wrote:

> From: Martin Kelly <martin@martingkelly.com>
> 
> This patch series adds drdy interrupt support to the BMI160 IMU. It also updates
> the relevant DT bindings and does a little bit of related cleanup.
> 
> v2:
> - Drop "BOTH" interrupt setting.
> - Change to "if (ret)" instead of "if (ret < 0)".
> - Stylistic changes suggested by Jonathan Cameron.
> - Fix bogus return check after iio_trigger_get.
> 
> v3:
> - More cleanup changes.
> - Directly get INT1/INT2 by name instead of using I2C/SPI IRQs. Move this code
>   to the probe function.
> - Fix EDGE/LEVEL #define naming. The code was correct but the names were wrong.
> 
> Martin Kelly (6):
>   iio:bmi160: add SPDX identifiers
>   iio:bmi160: add drdy interrupt support
>   dt-bindings: fix incorrect bmi160 IRQ note
>   dt-bindings: document open-drain property
>   iio:bmi160: use iio_pollfunc_store_time
>   iio:bmi160: use if (ret) instead of if (ret < 0)
> 
>  .../devicetree/bindings/iio/imu/bmi160.txt         |   6 +-
>  drivers/iio/imu/bmi160/bmi160.h                    |  11 +
>  drivers/iio/imu/bmi160/bmi160_core.c               | 317 +++++++++++++++++++--
>  drivers/iio/imu/bmi160/bmi160_i2c.c                |   5 +-
>  drivers/iio/imu/bmi160/bmi160_spi.c                |   4 +-
>  5 files changed, 304 insertions(+), 39 deletions(-)
Other than addressing Rob's comments I think this is looking good.
Will take one last look at v4 of course!

Thanks,

Jonathan

> 
> --
> 2.11.0
> 
