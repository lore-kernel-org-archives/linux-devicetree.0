From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v4 0/3] iio: imu: st_lsm6dsx: Add support for LSM9DS1
Date: Sun, 18 Aug 2019 20:10:41 +0100
Message-ID: <20190818201041.6b0bb698@archlinux>
References: <20190813073533.8007-1-martin.kepplinger@puri.sm>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190813073533.8007-1-martin.kepplinger@puri.sm>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Kepplinger <martin.kepplinger@puri.sm>
Cc: lorenzo.bianconi83@gmail.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 13 Aug 2019 09:35:30 +0200
Martin Kepplinger <martin.kepplinger@puri.sm> wrote:

> Add basic functionality for LSM9DS1. This has become a trivial addition
> by now.
> 

To me these look fine, but I'd ideally like an Ack or reviewed-by from
Lorenzo.

Thanks,

Jonathan


> revision history
> ----------------
> v4: rebase on top of today's iio testing branch with Lorenzo's recent work
> v3: rebase and add Lorenzo's patches in order to apply to the iio testing brach
> v2: further simplifications based on Lorenzo's feedback
> v1: initial change for adding lsm9ds1 support
> 
> 
> Martin Kepplinger (3):
>   iio: imu: st_lsm6sdx: move register definitions to sensor_settings
>     struct
>   iio: imu: st_lsm6dsx: add support for accel/gyro unit of lsm9sd1
>   dt-bindings: iio: imu: st_lsm6dsx: add lsm9ds1 device bindings
> 
>  .../bindings/iio/imu/st_lsm6dsx.txt           |   1 +
>  drivers/iio/imu/st_lsm6dsx/Kconfig            |   2 +-
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h       |   8 ++
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c  | 118 ++++++++++++++++--
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c   |   5 +
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c   |   5 +
>  6 files changed, 129 insertions(+), 10 deletions(-)
> 
