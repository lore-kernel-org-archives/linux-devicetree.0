From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] iio:imu:mpu6050 add explicit mpu9250 support
Date: Thu, 30 Mar 2017 18:18:46 -0500
Message-ID: <20170330231846.j45psrzast3pjc5b@rob-hp-laptop>
References: <20170326111100.2571-1-jic23@kernel.org>
 <20170326111100.2571-3-jic23@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170326111100.2571-3-jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark.Rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Mar 26, 2017 at 12:11:00PM +0100, Jonathan Cameron wrote:
> The mpu9250 is a SIP containing an mpu6500 and an ak8975.  If this was all
> there was too it there would be no need for explicit handling in the driver.
> Arguably the bindings would also only reflect the presence of an mpu6500 with
> the ak8975 hanging off it, as the kernel doesn't care that they are in one
> package.
> 
> However, the WHOAMI value changes as well so best to add explicit support.
> 
> Signed-off-by: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/iio/imu/inv_mpu6050.txt | 2 +-
>  drivers/iio/imu/inv_mpu6050/inv_mpu_core.c                | 6 ++++++
>  drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c                 | 5 +++++
>  drivers/iio/imu/inv_mpu6050/inv_mpu_iio.h                 | 2 ++
>  drivers/iio/imu/inv_mpu6050/inv_mpu_spi.c                 | 1 +
>  5 files changed, 15 insertions(+), 1 deletion(-)

Same one per line comment, but

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
