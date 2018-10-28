Return-Path: <jic23@kernel.org>
Date: Sun, 28 Oct 2018 18:51:25 +0000
From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 3/4] iio:magnetometer: st_magn: add BDU settings
Message-ID: <20181028185125.2bd8c031@archlinux>
In-Reply-To: <20181026023812.29720-3-martin@martingkelly.com>
References: <20181026023812.29720-1-martin@martingkelly.com>
	<20181026023812.29720-3-martin@martingkelly.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Martin Kelly <martin@martingkelly.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Denis Ciocca <denis.ciocca@st.com>, Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, 25 Oct 2018 19:38:11 -0700
Martin Kelly <martin@martingkelly.com> wrote:

> From: Martin Kelly <martin@martingkelly.com>
> 
> LIS3MDL and LSM9DS1 are missing BDU settings in their register maps, so add
> them. I don't have a LIS3MDL sensor to test, but this works correctly on
> the LSM9DS1, which has the same register map.
> 
> Signed-off-by: Martin Kelly <martin@martingkelly.com>
Applied thanks,

Jonathan

> ---
>  drivers/iio/magnetometer/st_magn_core.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/iio/magnetometer/st_magn_core.c b/drivers/iio/magnetometer/st_magn_core.c
> index a186b844d664..370b93db528d 100644
> --- a/drivers/iio/magnetometer/st_magn_core.c
> +++ b/drivers/iio/magnetometer/st_magn_core.c
> @@ -316,6 +316,10 @@ static const struct st_sensor_settings st_magn_sensors_settings[] = {
>  				},
>  			},
>  		},
> +		.bdu = {
> +			.addr = 0x24,
> +			.mask = 0x40,
> +		},
>  		.drdy_irq = {
>  			/* drdy line is routed drdy pin */
>  			.stat_drdy = {
