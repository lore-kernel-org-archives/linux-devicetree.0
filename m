From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 0/9] iio mount matrix - revitalize missing bindings
 documentation and provide code for bmc150, bmg160, bma180, itg3200, hmc584x
Date: Wed, 20 Feb 2019 18:13:03 +0200
Message-ID: <20190220161303.GY9224@smile.fi.intel.com>
References: <cover.1550671256.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1550671256.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Song Qiang <songqiang1304521@gmail.com>, letux-kernel@openphoenux.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 20, 2019 at 03:00:47PM +0100, H. Nikolaus Schaller wrote:
> This patch series adds the mount-matrix to several iio sensor drivers
> used in handheld devices.
> 
> The mount-matrix translates the quite arbitrary orientation of the sensor
> on some printed circuit board to user-tangible orientation in handheld
> devices that relates to typical screen orientation.
> 
> There was a bindings documentation by Linus Walleij but the patch
> did not make it into mainline. Therefore I resend it here.
> 
> Next I have added some clarifications (at least I hope it clarifies)
> in a second patch.
> 
> Finally, the patch set implements the hooks for the mount matrix
> in several iio drivers: bmc150, bma180, bmg160, itg3200, hmc5843.
> This includes also one patch for the bma180 to convert it to devm API.
> 
> We use them in different variants of the omap3-gta04 so a separate
> patch set will provide device tree additions for them.

Thanks for the patch, overall good stuff there.
Couple of things, though:
- address my comments (consider them against entire series)
- check my patch I sent today to support this from ACPI

I wouldn't like to spread more drivers use specific of_foo_bar stuff where it's
easily to support everything (note: device_property_* calls supports software
fw nodes as well).

Perhaps, you may incorporate my patch into your nice series.

> 
> 
> H. Nikolaus Schaller (8):
>   iio: bindings: clarifications for mount-matrix bindings
>   iio: accel: bmc150: add mount matrix support
>   iio: accel: bma180: add mount matrix support
>   iio: accel: bma180: convert to devm
>   iio: gyro: bmg160: add mount matrix support
>   iio: gyro: itg3200: add mount matrix support
>   iio: magnetometer: bmc150: add mount matrix support
>   iio: magnetometer: hmc5843: add mount matrix support
> 
> Linus Walleij (1):
>   iio: document bindings for mounting matrices
> 
>  .../devicetree/bindings/iio/mount-matrix.txt  | 162 ++++++++++++++++++
>  drivers/iio/accel/bma180.c                    |  70 ++++----
>  drivers/iio/accel/bmc150-accel-core.c         |  19 ++
>  drivers/iio/gyro/bmg160_core.c                |  19 ++
>  drivers/iio/gyro/itg3200_core.c               |  18 ++
>  drivers/iio/magnetometer/bmc150_magn.c        |  19 ++
>  drivers/iio/magnetometer/hmc5843.h            |   1 +
>  drivers/iio/magnetometer/hmc5843_core.c       |  14 ++
>  include/linux/iio/gyro/itg3200.h              |   1 +
>  9 files changed, 288 insertions(+), 35 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/iio/mount-matrix.txt
> 
> -- 
> 2.19.1
> 

-- 
With Best Regards,
Andy Shevchenko
